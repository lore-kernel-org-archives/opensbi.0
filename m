From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 19 Mar 2021 09:41:09 +0000
Subject: [PATCH v3 2/2] firmware: Support position independent execution
In-Reply-To: <DM6PR04MB6201BAF34B62A45EAE0F69FD8D6A9@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <1615943798-14296-1-git-send-email-vincent.chen@sifive.com>
 <1615943798-14296-3-git-send-email-vincent.chen@sifive.com>
 <DM6PR04MB6201BAF34B62A45EAE0F69FD8D6A9@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <DM6PR04MB620123B015322CA8F68E8D838D689@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 17 March 2021 17:17
> To: Vincent Chen <vincent.chen@sifive.com>; opensbi at lists.infradead.org
> Subject: RE: [PATCH v3 2/2] firmware: Support position independent
> execution
> 
> 
> 
> > -----Original Message-----
> > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> > Vincent Chen
> > Sent: 17 March 2021 06:47
> > To: opensbi at lists.infradead.org
> > Cc: Vincent Chen <vincent.chen@sifive.com>
> > Subject: [PATCH v3 2/2] firmware: Support position independent
> > execution
> >
> > Enable OpenSBI to support position independent execution. Because the
> > position independent code will cause an additional GOT reference when
> > accessing the global variables, it will reduce performance a bit.
> > Therefore, the position independent execution is disabled by default.
> > Users can through specifying "FW_PIC=y" on the make command to enable
> this feature.
> >
> > In theory, after enabling position-independent execution, the OpenSBI
> > can run at arbitrary address with appropriate alignment. Therefore,
> > the original relocation mechanism will be skipped. In other words,
> > OpenSBI will directly run at the load address without any code movement.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> 

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> 
> > ---
> >  Makefile                |  2 +-
> >  firmware/fw_base.S      | 62
> > ++++++++++++++++++++++++++++++++++++++++++++++++-
> >  firmware/fw_base.ldS    | 13 +++++++++++
> >  firmware/objects.mk     |  7 ++++++
> >  include/sbi/riscv_elf.h | 14 +++++++++++
> >  5 files changed, 96 insertions(+), 2 deletions(-)  create mode 100644
> > include/sbi/riscv_elf.h
> >
> > diff --git a/Makefile b/Makefile
> > index d6f097d..038cc99 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -210,8 +210,8 @@ CFLAGS		+=	-
> > mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> >  CFLAGS		+=	-
> > mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> >  CFLAGS		+=	$(GENFLAGS)
> >  CFLAGS		+=	$(platform-cflags-y)
> > -CFLAGS		+=	$(firmware-cflags-y)
> >  CFLAGS		+=	-fno-pie -no-pie
> > +CFLAGS		+=	$(firmware-cflags-y)
> >
> >  CPPFLAGS	+=	$(GENFLAGS)
> >  CPPFLAGS	+=	$(platform-cppflags-y)
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S index
> > 6cc5f88..2ce3851 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -9,6 +9,7 @@
> >
> >  #include <sbi/riscv_asm.h>
> >  #include <sbi/riscv_encoding.h>
> > +#include <sbi/riscv_elf.h>
> >  #include <sbi/sbi_platform.h>
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi/sbi_trap.h>
> > @@ -67,6 +68,58 @@ _try_lottery:
> >  	lla	t1, _start
> >  	REG_S	t1, 0(t0)
> >
> > +#ifdef FW_PIC
> > +	/* relocate the global table content */
> > +	lla	t0, _link_start
> > +	REG_L	t0, 0(t0)
> > +	/* t1 shall has the address of _start */
> > +	sub	t2, t1, t0
> > +	lla	t3, _runtime_offset
> > +	REG_S	t2, (t3)
> > +	lla	t0, __rel_dyn_start
> > +	lla	t1, __rel_dyn_end
> > +	beq	t0, t1, _relocate_done
> > +	j	5f
> > +2:
> > +	REG_L	t5, -(REGBYTES*2)(t0)	/* t5 <-- relocation info:type */
> > +	li	t3, R_RISCV_RELATIVE	/* reloc type R_RISCV_RELATIVE */
> > +	bne	t5, t3, 3f
> > +	REG_L	t3, -(REGBYTES*3)(t0)
> > +	REG_L	t5, -(REGBYTES)(t0)	/* t5 <-- addend */
> > +	add	t5, t5, t2
> > +	add	t3, t3, t2
> > +	REG_S	t5, 0(t3)		/* store runtime address to the GOT
> > entry */
> > +	j	5f
> > +
> > +3:
> > +	lla	t4, __dyn_sym_start
> > +
> > +4:
> > +	REG_L	t5, -(REGBYTES*2)(t0)	/* t5 <-- relocation info:type */
> > +	srli	t6, t5, SYM_INDEX	/* t6 <--- sym table index */
> > +	andi	t5, t5, 0xFF		/* t5 <--- relocation type */
> > +	li	t3, RELOC_TYPE
> > +	bne	t5, t3, 5f
> > +
> > +	/* address R_RISCV_64 or R_RISCV_32 cases*/
> > +	REG_L	t3, -(REGBYTES*3)(t0)
> > +	li	t5, SYM_SIZE
> > +	mul	t6, t6, t5
> > +	add	s5, t4, t6
> > +	REG_L	t6, -(REGBYTES)(t0)	/* t0 <-- addend */
> > +	REG_L	t5, REGBYTES(s5)
> > +	add	t5, t5, t6
> > +	add	t5, t5, t2		/* t5 <-- location to fix up in RAM */
> > +	add	t3, t3, t2		/* t3 <-- location to fix up in RAM */
> > +	REG_S	t5, 0(t3)		/* store runtime address to the
> > variable */
> > +
> > +5:
> > +	addi	t0, t0, (REGBYTES*3)
> > +	ble	t0, t1, 2b
> > +	j	_relocate_done
> > +_wait_relocate_copy_done:
> > +	j	_wait_for_boot_hart
> > +#else
> >  	/* Relocate if load address != link address */
> >  _relocate:
> >  	lla	t0, _link_start
> > @@ -137,6 +190,7 @@ _wait_relocate_copy_done:
> >  	nop
> >  	bgt     t4, t5, 1b
> >  	jr	t3
> > +#endif
> >  _relocate_done:
> >
> >  	/*
> > @@ -144,12 +198,14 @@ _relocate_done:
> >  	 * Use _boot_status copy relative to the load address
> >  	 */
> >  	lla	t0, _boot_status
> > +#ifndef FW_PIC
> >  	lla	t1, _link_start
> >  	REG_L	t1, 0(t1)
> >  	lla	t2, _load_start
> >  	REG_L	t2, 0(t2)
> >  	sub	t0, t0, t1
> >  	add	t0, t0, t2
> > +#endif
> >  	li	t1, BOOT_STATUS_RELOCATE_DONE
> >  	REG_S	t1, 0(t0)
> >  	fence	rw, rw
> > @@ -446,6 +502,10 @@ _skip_trap_exit_rv32_hyp:
> >  	j	_start_hang
> >
> >  	.align 3
> > +#ifdef FW_PIC
> > +_runtime_offset:
> > +	RISCV_PTR	0
> > +#endif
> >  _relocate_lottery:
> >  	RISCV_PTR	0
> >  _boot_status:
> > @@ -453,7 +513,7 @@ _boot_status:
> >  _load_start:
> >  	RISCV_PTR	_fw_start
> >  _link_start:
> > -	RISCV_PTR	_fw_start
> > +	RISCV_PTR	FW_TEXT_START
> >  _link_end:
> >  	RISCV_PTR	_fw_reloc_end
> >
> > diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS index
> > 0ac75f2..0d222da 100644
> > --- a/firmware/fw_base.ldS
> > +++ b/firmware/fw_base.ldS
> > @@ -61,6 +61,19 @@
> >  		PROVIDE(_data_end = .);
> >  	}
> >
> > +	.dynsym : {
> > +		PROVIDE(__dyn_sym_start = .);
> > +		*(.dynsym)
> > +		PROVIDE(__dyn_sym_end = .);
> > +	}
> > +
> > +	.rela.dyn : {
> > +		PROVIDE(__rel_dyn_start = .);
> > +		*(.rela*)
> > +		. = ALIGN(8);
> > +		PROVIDE(__rel_dyn_end = .);
> > +	}
> > +
> >  	. = ALIGN(0x1000); /* Ensure next section is page aligned */
> >
> >  	.bss :
> > diff --git a/firmware/objects.mk b/firmware/objects.mk index
> > b2ace75..c1f632e 100644
> > --- a/firmware/objects.mk
> > +++ b/firmware/objects.mk
> > @@ -13,6 +13,13 @@ firmware-cflags-y +=  firmware-asflags-y +=
> > firmware-ldflags-y +=
> >
> > +ifeq ($(FW_PIC),y)
> > +firmware-genflags-y +=	-DFW_PIC
> > +firmware-asflags-y  +=	-fpic
> > +firmware-cflags-y   +=	-fPIE -pie
> > +firmware-ldflags-y  +=  -Wl,--no-dynamic-linker endif
> > +
> >  ifdef FW_TEXT_START
> >  firmware-genflags-y += -DFW_TEXT_START=$(FW_TEXT_START)  endif diff
> > -- git a/include/sbi/riscv_elf.h b/include/sbi/riscv_elf.h new file
> > mode 100644 index 0000000..5d6180a
> > --- /dev/null
> > +++ b/include/sbi/riscv_elf.h
> > @@ -0,0 +1,14 @@
> > +#ifndef SBI_RISCV_ELF_H__
> > +#define SBI_RISCV_ELF_H__
> > +
> > +#include <sbi/riscv_asm.h>
> > +
> > +#define R_RISCV_32		1
> > +#define R_RISCV_64		2
> > +#define R_RISCV_RELATIVE	3
> > +
> > +#define RELOC_TYPE		__REG_SEL(R_RISCV_64,
> R_RISCV_32)
> > +#define SYM_INDEX		__REG_SEL(0x20,	0x8)
> > +#define SYM_SIZE		__REG_SEL(0x18,0x10)
> > +
> > +#endif
> > --
> > 2.7.4
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

