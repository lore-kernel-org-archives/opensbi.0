From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu, 19 Jan 2023 09:59:50 +0530
Subject: [PATCH 3/5] firmware: Add RW section offset in scratch
In-Reply-To: <2AEE45E0-861E-462D-B54A-D9779F2AE0B8@jrtc27.com>
References: <20230109084049.31828-1-hchauhan@ventanamicro.com>
 <20230109084049.31828-4-hchauhan@ventanamicro.com>
 <2AEE45E0-861E-462D-B54A-D9779F2AE0B8@jrtc27.com>
Message-ID: <20230119042950.gl6ltcljbqepeixh@arcolinux>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 18, 2023 at 04:23:06PM +0000, Jessica Clarke wrote:
> On 9 Jan 2023, at 08:40, Himanshu Chauhan <hchauhan@ventanamicro.com> wrote:
> > 
> > Add the RW section offset, provided by _fw_rw_offset symbol,
> > to the scratch structure. This will be used to program
> > separate pmp entry for RW section.
> > 
> > Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> > ---
> > firmware/fw_base.S        |  5 +++++
> > include/sbi/sbi_scratch.h | 24 ++++++++++++++----------
> > 2 files changed, 19 insertions(+), 10 deletions(-)
> > 
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> > index 3f622b3..ce1f782 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -298,6 +298,11 @@ _scratch_init:
> > 	sub	a5, t3, a4
> > 	REG_S	a4, SBI_SCRATCH_FW_START_OFFSET(tp)
> > 	REG_S	a5, SBI_SCRATCH_FW_SIZE_OFFSET(tp)
> > +
> > +	/* Store R/W section's offset in scratch space */
> > +	lla	a4, _fw_rw_offset
> > +	REG_S	a4, SBI_SCRATCH_FW_RW_OFFSET(tp)
> > +
> 
> You can?t use LLA for an absolute symbol, especially one whose value
> isn?t guaranteed to be within 2^31 of the LLA?s address. Use the GOT,
> use a constant pool (for compatibility with older assemblers) or do the
> subtraction in the code instead of the linker script.
>
This code segment is executed after the relocation. The _fw_rw_offset
symbol also gets relocated. Thus the symbol will always be in 2Gig range
unless the text and RO-data go beyond that size. IMHO, I don't see a need
to go via GOT.

Regards
Himanshu

> Jess
> 
> > 	/* Store next arg1 in scratch space */
> > 	MOV_3R	s0, a0, s1, a1, s2, a2
> > 	call	fw_next_arg1
> > diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> > index 40a3bc9..2966188 100644
> > --- a/include/sbi/sbi_scratch.h
> > +++ b/include/sbi/sbi_scratch.h
> > @@ -18,26 +18,28 @@
> > #define SBI_SCRATCH_FW_START_OFFSET		(0 * __SIZEOF_POINTER__)
> > /** Offset of fw_size member in sbi_scratch */
> > #define SBI_SCRATCH_FW_SIZE_OFFSET		(1 * __SIZEOF_POINTER__)
> > +/** Offset (in sbi_scratch) of the R/W Offset */
> > +#define SBI_SCRATCH_FW_RW_OFFSET		(2 * __SIZEOF_POINTER__)
> > /** Offset of next_arg1 member in sbi_scratch */
> > -#define SBI_SCRATCH_NEXT_ARG1_OFFSET		(2 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_NEXT_ARG1_OFFSET		(3 * __SIZEOF_POINTER__)
> > /** Offset of next_addr member in sbi_scratch */
> > -#define SBI_SCRATCH_NEXT_ADDR_OFFSET		(3 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_NEXT_ADDR_OFFSET		(4 * __SIZEOF_POINTER__)
> > /** Offset of next_mode member in sbi_scratch */
> > -#define SBI_SCRATCH_NEXT_MODE_OFFSET		(4 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_NEXT_MODE_OFFSET		(5 * __SIZEOF_POINTER__)
> > /** Offset of warmboot_addr member in sbi_scratch */
> > -#define SBI_SCRATCH_WARMBOOT_ADDR_OFFSET	(5 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_WARMBOOT_ADDR_OFFSET	(6 * __SIZEOF_POINTER__)
> > /** Offset of platform_addr member in sbi_scratch */
> > -#define SBI_SCRATCH_PLATFORM_ADDR_OFFSET	(6 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_PLATFORM_ADDR_OFFSET	(7 * __SIZEOF_POINTER__)
> > /** Offset of hartid_to_scratch member in sbi_scratch */
> > -#define SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET	(7 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET	(8 * __SIZEOF_POINTER__)
> > /** Offset of trap_exit member in sbi_scratch */
> > -#define SBI_SCRATCH_TRAP_EXIT_OFFSET		(8 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_TRAP_EXIT_OFFSET		(9 * __SIZEOF_POINTER__)
> > /** Offset of tmp0 member in sbi_scratch */
> > -#define SBI_SCRATCH_TMP0_OFFSET			(9 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_TMP0_OFFSET			(10 * __SIZEOF_POINTER__)
> > /** Offset of options member in sbi_scratch */
> > -#define SBI_SCRATCH_OPTIONS_OFFSET		(10 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_OPTIONS_OFFSET		(11 * __SIZEOF_POINTER__)
> > /** Offset of extra space in sbi_scratch */
> > -#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(11 * __SIZEOF_POINTER__)
> > +#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(12 * __SIZEOF_POINTER__)
> > /** Maximum size of sbi_scratch (4KB) */
> > #define SBI_SCRATCH_SIZE			(0x1000)
> > 
> > @@ -53,6 +55,8 @@ struct sbi_scratch {
> > 	unsigned long fw_start;
> > 	/** Size (in bytes) of firmware linked to OpenSBI library */
> > 	unsigned long fw_size;
> > +	/** Offset (in bytes) of the R/W section */
> > +	unsigned long fw_rw_offset;
> > 	/** Arg1 (or 'a1' register) of next booting stage for this HART */
> > 	unsigned long next_arg1;
> > 	/** Address of next booting stage for this HART */
> > -- 
> > 2.39.0
> > 
> > 
> > -- 
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 

