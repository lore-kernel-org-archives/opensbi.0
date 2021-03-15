From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 15 Mar 2021 17:41:04 +0800
Subject: [PATCH v2 2/2] firmware: Support position independent execution
In-Reply-To: <CAAhSdy2tzZwMweDtUw2pdO=rt38wKKcWHfb8_EX1FsTW1ojdqA@mail.gmail.com>
References: <1614935014-18600-1-git-send-email-vincent.chen@sifive.com>
 <1614935014-18600-3-git-send-email-vincent.chen@sifive.com>
 <CAAhSdy2tzZwMweDtUw2pdO=rt38wKKcWHfb8_EX1FsTW1ojdqA@mail.gmail.com>
Message-ID: <CABvJ_xiWxKxv-mcQUARGcnpEjVhSN+NoE6cxNJxypFOjiJw4Xg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 13, 2021 at 12:13 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Mar 5, 2021 at 2:35 PM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > Enable OpenSBI to support position independent execution. Because the
> > position independent code will cause an additional GOT reference when
> > accessing the global variables, it will reduce performance a bit. Therefore,
> > the position independent execution is disabled by default. Users can
> > through specifying "FW_PIC=y" on the make command to enable this feature.
> >
> > In theory, after enabling position-independent execution, the OpenSBI
> > can run at arbitrary address with appropriate alignment. Therefore, the
> > original relocation mechanism will be skipped. In other words, OpenSBI will
> > directly run at the load address without any code movement.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  Makefile                |  2 +-
> >  firmware/fw_base.S      | 59 ++++++++++++++++++++++++++++++++++++++++++++++++-
> >  firmware/fw_base.ldS    | 13 +++++++++++
> >  firmware/fw_jump.S      | 10 +++++++++
> >  firmware/fw_payload.S   |  6 +++++
> >  firmware/objects.mk     |  7 ++++++
> >  include/sbi/riscv_elf.h |  9 ++++++++
> >  7 files changed, 104 insertions(+), 2 deletions(-)
> >  create mode 100644 include/sbi/riscv_elf.h
> >
> > diff --git a/Makefile b/Makefile
> > index d6f097d..038cc99 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -210,8 +210,8 @@ CFLAGS              +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> >  CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> >  CFLAGS         +=      $(GENFLAGS)
> >  CFLAGS         +=      $(platform-cflags-y)
> > -CFLAGS         +=      $(firmware-cflags-y)
> >  CFLAGS         +=      -fno-pie -no-pie
> > +CFLAGS         +=      $(firmware-cflags-y)
> >
> >  CPPFLAGS       +=      $(GENFLAGS)
> >  CPPFLAGS       +=      $(platform-cppflags-y)
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> > index 6cc5f88..5f49c88 100644
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
> > @@ -67,6 +68,57 @@ _try_lottery:
> >         lla     t1, _start
> >         REG_S   t1, 0(t0)
> >
> > +#ifdef FW_PIC
> > +       /* relocate the global table content */
> > +       lla     t0, _link_start
> > +       REG_L   t0, 0(t0)
>
> The next instruction assumes that "t1" has address of _start.
>
> I would suggest to have explicit "lla t1, _start" here OR we have
> to document this assumption here.
>
"lla t1, _start" was executed before the 4 instructions of "sub t2,
t1, t0", so I think it may be OK to assume that "t1" has the address
of _start.

> > +       sub     t2, t1, t0
> > +       lla     t3, _runtime_offset
> > +       REG_S   t2, (t3)
> > +       lla     t0, __rel_dyn_start
> > +       lla     t1, __rel_dyn_end
> > +       beq     t0, t1, _relocate_done
> > +       j       5f
> > +2:
> > +       REG_L   t5, -(REGBYTES*2)(t0)   /* t5 <-- relocation info:type */
> > +       li      t3, R_RISCV_RELATIVE    /* reloc type R_RISCV_RELATIVE */
> > +       bne     t5, t3, 3f
> > +       REG_L   t3, -(REGBYTES*3)(t0)
> > +       REG_L   t5, -(REGBYTES)(t0)     /* t5 <-- addend */
> > +       add     t5, t5, t2
> > +       add     t3, t3, t2
> > +       REG_S   t5, 0(t3)               /* store runtime address to the GOT entry */
> > +       j       5f
> > +
> > +3:
> > +       lla     t4, __dyn_sym_start
> > +
> > +4:
> > +       REG_L   t5, -(REGBYTES*2)(t0)   /* t5 <-- relocation info:type */
> > +       srli    t6, t5, SYM_INDEX       /* t6 <--- sym table index */
> > +       andi    t5, t5, 0xFF            /* t5 <--- relocation type */
> > +       li      t3, RELOC_TYPE
> > +       bne     t5, t3, 5f
> > +
> > +       /* address R_RISCV_64 or R_RISCV_32 cases*/
> > +       REG_L   t3, -(REGBYTES*3)(t0)
> > +       li      t5, SYM_SIZE
> > +       mul     t6, t6, t5
> > +       add     s5, t4, t6
> > +       REG_L   t6, -(REGBYTES)(t0)     /* t0 <-- addend */
> > +       REG_L   t5, REGBYTES(s5)
> > +       add     t5, t5, t6
> > +       add     t5, t5, t2              /* t5 <-- location to fix up in RAM */
> > +       add     t3, t3, t2              /* t3 <-- location to fix up in RAM */
> > +       REG_S   t5, 0(t3)               /* store runtime address to the variable */
> > +
> > +5:
> > +       addi    t0, t0, (REGBYTES*3)
> > +       ble     t0, t1, 2b
> > +       j       _relocate_done
> > +_wait_relocate_copy_done:
> > +       j       _wait_for_boot_hart
> > +#else
> >         /* Relocate if load address != link address */
> >  _relocate:
> >         lla     t0, _link_start
> > @@ -137,6 +189,7 @@ _wait_relocate_copy_done:
> >         nop
> >         bgt     t4, t5, 1b
> >         jr      t3
> > +#endif
> >  _relocate_done:
> >
> >         /*
> > @@ -144,12 +197,14 @@ _relocate_done:
> >          * Use _boot_status copy relative to the load address
> >          */
> >         lla     t0, _boot_status
> > +#ifndef FW_PIC
> >         lla     t1, _link_start
> >         REG_L   t1, 0(t1)
> >         lla     t2, _load_start
> >         REG_L   t2, 0(t2)
> >         sub     t0, t0, t1
> >         add     t0, t0, t2
> > +#endif
> >         li      t1, BOOT_STATUS_RELOCATE_DONE
> >         REG_S   t1, 0(t0)
> >         fence   rw, rw
> > @@ -446,6 +501,8 @@ _skip_trap_exit_rv32_hyp:
> >         j       _start_hang
> >
> >         .align 3
> > +_runtime_offset:
> > +       RISCV_PTR       0
>
> Please add "#ifdef" around _runtime_offset
>

OK, thanks for the reminder.

> >  _relocate_lottery:
> >         RISCV_PTR       0
> >  _boot_status:
> > @@ -453,7 +510,7 @@ _boot_status:
> >  _load_start:
> >         RISCV_PTR       _fw_start
> >  _link_start:
> > -       RISCV_PTR       _fw_start
> > +       RISCV_PTR       FW_TEXT_START
>
> Why do we need this changes ?
>
The _fw_start is a global variable. When we use -fPIE to compile the
code, the linker does not know the exact address at runtime.
Therefore, the linker will fill 0 here and create a relocation entry
at the ".rela.dyn" section to let the dynamic loader resolve it at
runtime.

_load_start:
        RISCV_PTR       _fw_start
_link_start:
        RISCV_PTR       _fw_start

1. objdump -D fw_payload.elf
0000000080000400 <_link_start>:
        ...

0000000080000408 <_link_end>:
        ...

0000000080000410 <_hartid_to_scratch>:

2. readelf -a fw_payload.elf
Relocation section '.rela.dyn' at offset 0x12f38 contains 175 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
0000800003f8  000000000003 R_RISCV_RELATIVE                     80000000
000080000400  000000000003 R_RISCV_RELATIVE                     80000000
000080000408  000000000003 R_RISCV_RELATIVE                     81ae3e08

However, from the code, I deduce that the variable _link_start is used
to store the starting address of the image at compile time. Therefore,
I change the _fw_start to FW_TEXT_START to ensure the value of
_link_start is the exact start address of the image at the
compile-time. The dynamic loader can use _link_start to calculate the
offset between run time and compile-time as well.

> >  _link_end:
> >         RISCV_PTR       _fw_reloc_end
> >
> > diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> > index 0ac75f2..3904959 100644
> > --- a/firmware/fw_base.ldS
> > +++ b/firmware/fw_base.ldS
> > @@ -61,6 +61,19 @@
> >                 PROVIDE(_data_end = .);
> >         }
> >
> > +       .dynsym : {
> > +               PROVIDE(__dyn_sym_start = .);
> > +               *(.dynsym)
> > +               PROVIDE(__dyn_sym_end = .);
>
> Only use tabs for indentation here.
>
OK
> > +       }
> > +
> > +       .rela.dyn : {
> > +               PROVIDE(__rel_dyn_start = .);
> > +               *(.rela*)
> > +               . = ALIGN(8);
> > +               PROVIDE(__rel_dyn_end = .);
>
> Only use tabs for indentation here.
>
OK
> > +       }
> > +
> >         . = ALIGN(0x1000); /* Ensure next section is page aligned */
> >
> >         .bss :
> > diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
> > index 5b24f8b..4fb3e0c 100644
> > --- a/firmware/fw_jump.S
> > +++ b/firmware/fw_jump.S
> > @@ -46,6 +46,11 @@ fw_save_info:
> >  fw_next_arg1:
> >  #ifdef FW_JUMP_FDT_ADDR
> >         li      a0, FW_JUMP_FDT_ADDR
> > +#ifdef FW_PIC
> > +       lla     a1, _runtime_offset
> > +       REG_L   a1, (a1)
> > +       add     a0, a0, a1
> > +#endif
> >  #else
> >         add     a0, a1, zero
> >  #endif
> > @@ -61,6 +66,11 @@ fw_next_arg1:
> >  fw_next_addr:
> >         lla     a0, _jump_addr
> >         REG_L   a0, (a0)
> > +#ifdef FW_PIC
> > +       lla     a1, _runtime_offset
> > +       REG_L   a1, (a1)
> > +       add     a0, a0, a1
> > +#endif
> >         ret
>
> The changes in fw_next_addr() breaks the FW_JUMP when
> FW_PIC=y because FW_JUMP assumes a compile-time
> fixed address of next booting stage specified by FW_JUMP_ADDR.
>
> Similarly, when FW_JUMP_FDT_ADDR is defined FW_JUMP
> will assume compile-time fixed address of FDT passed to
> next booting stage.
>
> Please drop all changes from fw_jump.S
>
OK, I will drop it.
> >
> >         .section .entry, "ax", %progbits
> > diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
> > index c53a3bb..00c7cb7 100644
> > --- a/firmware/fw_payload.S
> > +++ b/firmware/fw_payload.S
> > @@ -46,6 +46,12 @@ fw_save_info:
> >  fw_next_arg1:
> >  #ifdef FW_PAYLOAD_FDT_ADDR
> >         li      a0, FW_PAYLOAD_FDT_ADDR
> > +#ifdef FW_PIC
> > +       lla     a1, _runtime_offset
> > +       REG_L   a1, (a1)
> > +       add     a0, a0, a1
> > +#endif
> > +
>
> Same as above.
>
> The changes in fw_next_arg1() breaks FW_PAYLOAD when
> FW_PIC=y because FW_PAYLOAD assumes a compile-time
> fixed address of FDT passed to next booting-stage when
> FW_PAYLOAD_FDT_ADDR is defined.
>
> Please drop all changes in fw_payload.S
>
OK
> >  #else
> >         add     a0, a1, zero
> >  #endif
> > diff --git a/firmware/objects.mk b/firmware/objects.mk
> > index b2ace75..c1f632e 100644
> > --- a/firmware/objects.mk
> > +++ b/firmware/objects.mk
> > @@ -13,6 +13,13 @@ firmware-cflags-y +=
> >  firmware-asflags-y +=
> >  firmware-ldflags-y +=
> >
> > +ifeq ($(FW_PIC),y)
> > +firmware-genflags-y += -DFW_PIC
> > +firmware-asflags-y  += -fpic
> > +firmware-cflags-y   += -fPIE -pie
> > +firmware-ldflags-y  +=  -Wl,--no-dynamic-linker
> > +endif
> > +
> >  ifdef FW_TEXT_START
> >  firmware-genflags-y += -DFW_TEXT_START=$(FW_TEXT_START)
> >  endif
> > diff --git a/include/sbi/riscv_elf.h b/include/sbi/riscv_elf.h
> > new file mode 100644
> > index 0000000..cf211ac
> > --- /dev/null
> > +++ b/include/sbi/riscv_elf.h
> > @@ -0,0 +1,9 @@
>
> Please "#ifndef" and "#define" pair here to protect
> multiple header inclusions
>
OK, thank you for your reminder.
> > +#include <sbi/riscv_asm.h>
> > +
> > +#define R_RISCV_32             1
> > +#define R_RISCV_64             2
> > +#define R_RISCV_RELATIVE       3
> > +
> > +#define RELOC_TYPE             __REG_SEL(R_RISCV_64, R_RISCV_32)
> > +#define SYM_INDEX              __REG_SEL(0x20, 0x8)
> > +#define SYM_SIZE               __REG_SEL(0x18,0x10)
>
> Add "#endif" here.
>
> > --
> > 2.7.4
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
> Regards,
> Anup

