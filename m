From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 13 Sep 2024 08:59:15 +0200
Subject: [PATCH 5/5] lib: sbi: add Smdbltrp ISA extension support
In-Reply-To: <dc333a64-2ed9-40f8-a11a-96b09c7da017@sifive.com>
References: <20240912121052.2959596-1-cleger@rivosinc.com>
 <20240912121052.2959596-6-cleger@rivosinc.com>
 <dc333a64-2ed9-40f8-a11a-96b09c7da017@sifive.com>
Message-ID: <733e5a38-f50c-48b1-a3b3-84b530517288@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 13/09/2024 01:50, Samuel Holland wrote:
> Hi Cl?ment,
> 
> On 2024-09-12 7:10 AM, Cl?ment L?ger wrote:
>> Add support for the Smdbltrp[1] ISA extension. First thing to do is
>> clearing MDT on entry after setting the first MTVEC (since MDT is
>> reset to 1). Additionally, during trap handling, clear MDT once all
>> critical CSRs have been saved and in return path, restore MSTATUS before
>> restoring MEPC to avoid taking another trap which would clobber it.
>>
>> Link: https://github.com/riscv/riscv-double-trap/releases/download/v0.56/riscv-double-trap.pdf [1]
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>>  firmware/fw_base.S           | 29 ++++++++++++++++++++++++++---
>>  include/sbi/riscv_encoding.h |  2 ++
>>  2 files changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
>> index b950c0b..01d5f51 100644
>> --- a/firmware/fw_base.S
>> +++ b/firmware/fw_base.S
>> @@ -31,6 +31,16 @@
>>  	add	\__d4, \__s4, zero
>>  .endm
>>  
>> +.macro CLEAR_MDT tmp, have_mstatush
>> +	.if \have_mstatush
>> +	li 	\tmp, MSTATUSH_MDT
>> +	csrc	CSR_MSTATUSH, \tmp
>> +	.else
>> +	li 	\tmp, MSTATUS_MDT
>> +	csrc	CSR_MSTATUS, \tmp
>> +	.endif
> 
> Why not put the __riscv_xlen check inside the macro? Then it doesn't need the
> have_mstatush parameter.

The rationale is that this macro is used in a place were have_mstatush
has already been computed. It seems easier than adding yet another level
of nesting in that function, but I can use __riscv_xlen if you prefer.

Thanks,

Cl?ment

> 
>> +.endm
>> +
>>  	.section .entry, "ax", %progbits
>>  	.align 3
>>  	.globl _start
>> @@ -91,6 +101,13 @@ _bss_zero:
>>  	lla	s4, _start_hang
>>  	csrw	CSR_MTVEC, s4
>>  
>> +	/* We are now ready to take a trap, clear MDT */
>> +#if __riscv_xlen > 32
>> +	CLEAR_MDT t0, 0
>> +#else
>> +	CLEAR_MDT t0, 1
>> +#endif
> 
> I don't think we're really ready to take a trap here; the stack pointer is not
> even set yet. Also this needs to go after _start_warm so it gets run on all
> harts. So I think this should go after the other write to CSR_MTVEC, near the
> call to sbi_init().
> 
> Regards,
> Samuel
> 
>> +
>>  	/* Setup temporary stack */
>>  	lla	s4, _fw_end
>>  	li	s5, (SBI_SCRATCH_SIZE * 2)
>> @@ -557,6 +574,9 @@ memcmp:
>>  	li	t0, 0
>>  .endif
>>  	REG_S	t0, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(gva))(sp)
>> +
>> +	/* We are ready to take another trap, clear MDT */
>> +	CLEAR_MDT t0, \have_mstatush
>>  .endm
>>  
>>  .macro	TRAP_CALL_C_ROUTINE
>> @@ -599,15 +619,18 @@ memcmp:
>>  .endm
>>  
>>  .macro	TRAP_RESTORE_MEPC_MSTATUS have_mstatush
>> -	/* Restore MEPC and MSTATUS CSRs */
>> -	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
>> -	csrw	CSR_MEPC, t0
>> +	/*
>> +	 * Restore MSTATUS and MEPC CSRs starting with MSTATUS to set MDT
>> +	 * flags since we can not take a trap now or MEPC would be cloberred
>> +	 */
>>  	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(a0)
>>  	csrw	CSR_MSTATUS, t0
>>  	.if \have_mstatush
>>  	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatusH)(a0)
>>  	csrw	CSR_MSTATUSH, t0
>>  	.endif
>> +	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
>> +	csrw	CSR_MEPC, t0
>>  .endm
>>  
>>  .macro TRAP_RESTORE_A0_T0
>> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
>> index 1d83434..c0e459c 100644
>> --- a/include/sbi/riscv_encoding.h
>> +++ b/include/sbi/riscv_encoding.h
>> @@ -41,12 +41,14 @@
>>  #define MSTATUS_GVA			_ULL(0x0000004000000000)
>>  #define MSTATUS_GVA_SHIFT		38
>>  #define MSTATUS_MPV			_ULL(0x0000008000000000)
>> +#define MSTATUS_MDT			_ULL(0x0000040000000000)
>>  #else
>>  #define MSTATUSH_SBE			_UL(0x00000010)
>>  #define MSTATUSH_MBE			_UL(0x00000020)
>>  #define MSTATUSH_GVA			_UL(0x00000040)
>>  #define MSTATUSH_GVA_SHIFT		6
>>  #define MSTATUSH_MPV			_UL(0x00000080)
>> +#define MSTATUSH_MDT			_UL(0x00000400)
>>  #endif
>>  #define MSTATUS32_SD			_UL(0x80000000)
>>  #define MSTATUS64_SD			_ULL(0x8000000000000000)
> 


