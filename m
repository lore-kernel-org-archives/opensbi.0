From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 13 Sep 2024 13:01:58 -0500
Subject: [PATCH 5/5] lib: sbi: add Smdbltrp ISA extension support
In-Reply-To: <f63745a1-d3a3-4728-9745-29ba28d29ff1@rivosinc.com>
References: <20240912121052.2959596-1-cleger@rivosinc.com>
 <20240912121052.2959596-6-cleger@rivosinc.com>
 <dc333a64-2ed9-40f8-a11a-96b09c7da017@sifive.com>
 <f63745a1-d3a3-4728-9745-29ba28d29ff1@rivosinc.com>
Message-ID: <56971174-5711-4281-bba3-2eb227b5f1c5@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Cl?ment,

On 2024-09-13 4:52 AM, Cl?ment L?ger wrote:
> On 13/09/2024 01:50, Samuel Holland wrote:
>> On 2024-09-12 7:10 AM, Cl?ment L?ger wrote:
>>> Add support for the Smdbltrp[1] ISA extension. First thing to do is
>>> clearing MDT on entry after setting the first MTVEC (since MDT is
>>> reset to 1). Additionally, during trap handling, clear MDT once all
>>> critical CSRs have been saved and in return path, restore MSTATUS before
>>> restoring MEPC to avoid taking another trap which would clobber it.
>>>
>>> Link: https://github.com/riscv/riscv-double-trap/releases/download/v0.56/riscv-double-trap.pdf [1]
>>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>>> ---
>>>  firmware/fw_base.S           | 29 ++++++++++++++++++++++++++---
>>>  include/sbi/riscv_encoding.h |  2 ++
>>>  2 files changed, 28 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
>>> index b950c0b..01d5f51 100644
>>> --- a/firmware/fw_base.S
>>> +++ b/firmware/fw_base.S
>>> @@ -31,6 +31,16 @@
>>>  	add	\__d4, \__s4, zero
>>>  .endm
>>>  
>>> +.macro CLEAR_MDT tmp, have_mstatush
>>> +	.if \have_mstatush
>>> +	li 	\tmp, MSTATUSH_MDT
>>> +	csrc	CSR_MSTATUSH, \tmp
>>> +	.else
>>> +	li 	\tmp, MSTATUS_MDT
>>> +	csrc	CSR_MSTATUS, \tmp
>>> +	.endif
>>
>> Why not put the __riscv_xlen check inside the macro? Then it doesn't need the
>> have_mstatush parameter.
>>
>>> +.endm
>>> +
>>>  	.section .entry, "ax", %progbits
>>>  	.align 3
>>>  	.globl _start
>>> @@ -91,6 +101,13 @@ _bss_zero:
>>>  	lla	s4, _start_hang
>>>  	csrw	CSR_MTVEC, s4
>>>  
>>> +	/* We are now ready to take a trap, clear MDT */
>>> +#if __riscv_xlen > 32
>>> +	CLEAR_MDT t0, 0
>>> +#else
>>> +	CLEAR_MDT t0, 1
>>> +#endif
>>
>> I don't think we're really ready to take a trap here; the stack pointer is not
>> even set yet. Also this needs to go after _start_warm so it gets run on all
>> harts. So I think this should go after the other write to CSR_MTVEC, near the
>> call to sbi_init().
> 
> Actually, if we don't clear MDT, if a trap happens, it will trigger a
> M-mode double trap. Since a temporary trap handler is set, we can let
> the trap happen without generating a M-mode double trap (which would end
> up in either a cpu_abort() (at least in qemu) or a NMI interrupt. I'm
> not sure which one is better though (either hang in the temporary trap
> handler or cpu abort.

Ah, you're right, the temporary trap handler doesn't use the stack, so this is
OK for the boot hart. There is still a problem for other harts, or the boot hart
after non-retentive suspend, which would jump to _start_warm and miss this code.

Regards,
Samuel


