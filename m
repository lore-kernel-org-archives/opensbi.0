From: dramforever <dramforever@live.com>
Date: Thu, 4 Aug 2022 17:23:58 +0800
Subject: [PATCH 3/5] lib: sbi: Set gva when creating sbi_trap_info
In-Reply-To: <20220804082519.runmhxr47pli3erv@kamzik>
References: <TYYP286MB1439C5C64BCF8E9DB7883772C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20220804031706.2197187-1-dramforever@live.com>
 <TYYP286MB1439B12D2AB5AFF091EC5E53C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20220804072416.4uyqziy6aeavz6l2@kamzik>
 <20220804082519.runmhxr47pli3erv@kamzik>
Message-ID: <TYYP286MB14395776E020A40818836C31C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/4/22 16:25, Andrew Jones wrote:
> On Thu, Aug 04, 2022 at 09:24:16AM +0200, Andrew Jones wrote:
>> On Thu, Aug 04, 2022 at 11:17:04AM +0800, Vivian Wang wrote:
>>> In some cases the sbi_trap_info argument passed to sbi_trap_redirect is
>>> created from scratch by filling its fields. Since we previously added a
>>> gva field to struct sbi_trap_info, initialize gva in these cases also.
>>>
>>> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
>>> Signed-off-by: Vivian Wang <dramforever@live.com>
>>> ---
>>>  lib/sbi/sbi_illegal_insn.c    | 1 +
>>>  lib/sbi/sbi_misaligned_ldst.c | 2 ++
>>>  lib/sbi/sbi_trap.c            | 7 +++++++
>>>  3 files changed, 10 insertions(+)
>>>
>>> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
>>> index 84c04f8..ecd3508 100644
>>> --- a/lib/sbi/sbi_illegal_insn.c
>>> +++ b/lib/sbi/sbi_illegal_insn.c
>>> @@ -30,6 +30,7 @@ static int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
>>>  	trap.tval = insn;
>>>  	trap.tval2 = 0;
>>>  	trap.tinst = 0;
>>> +	trap.gva   = 0;
>>>  
>>>  	return sbi_trap_redirect(regs, &trap);
>>>  }
>>> diff --git a/lib/sbi/sbi_misaligned_ldst.c b/lib/sbi/sbi_misaligned_ldst.c
>>> index fd11798..92a2393 100644
>>> --- a/lib/sbi/sbi_misaligned_ldst.c
>>> +++ b/lib/sbi/sbi_misaligned_ldst.c
>>> @@ -129,6 +129,7 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
>>>  		uptrap.tval = addr;
>>>  		uptrap.tval2 = tval2;
>>>  		uptrap.tinst = tinst;
>>> +		uptrap.gva   = 0;
>>>  		return sbi_trap_redirect(regs, &uptrap);
>>>  	}
>>>  
>>> @@ -244,6 +245,7 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
>>>  		uptrap.tval = addr;
>>>  		uptrap.tval2 = tval2;
>>>  		uptrap.tinst = tinst;
>>> +		uptrap.gva   = 0;
>>>  		return sbi_trap_redirect(regs, &uptrap);
>>>  	}
>>>  
>>> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
>>> index ee3e4e9..f782fbf 100644
>>> --- a/lib/sbi/sbi_trap.c
>>> +++ b/lib/sbi/sbi_trap.c
>>> @@ -311,6 +311,13 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>>>  		trap.tval = mtval;
>>>  		trap.tval2 = mtval2;
>>>  		trap.tinst = mtinst;
>>> +
>>> +#if __riscv_xlen == 32
>>> +		trap.gva = (regs->mstatusH & MSTATUSH_GVA) ? 1 : 0;
>>> +#else
>>> +		trap.gva = (regs->mstatus & MSTATUS_GVA) ? 1 : 0;
>>> +#endif
>> We need to put this in the if (misa_extension('H')) block at the top of
>> the function. Something like

This does not seem to be necessary. GVA defaults to zero anyway in case
the hypervisor extension is not available.

For mstatus, the mstatus.GVA field is WPRI without the hypervisor
extension, and for WPRI fields the privileged spec already says that
they default to zero. "For forward compatibility, implementations that
do not furnish these fields must make them read-only zero."

For mstatush, the CSR is defined in privileged spec version 1.12, so it
might not exist, but in that case the macro TRAP_SAVE_MEPC_MSTATUS in
firmware/fw_base.S? initializes it to all zero. Note that we are using
regs->mstatusH, not csr_read. Even if mstatush does exist, mstatush.GVA
would read as zero if there's no hypervisor extension.

I can add a comment in the next version explaining this, if it's confusing.

dram

>> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
>> index ee3e4e9f3f0b..684438e3f150 100644
>> --- a/lib/sbi/sbi_trap.c
>> +++ b/lib/sbi/sbi_trap.c
>> @@ -260,12 +260,17 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>>         int rc = SBI_ENOTSUPP;
>>         const char *msg = "trap handler failed";
>>         ulong mcause = csr_read(CSR_MCAUSE);
>> -       ulong mtval = csr_read(CSR_MTVAL), mtval2 = 0, mtinst = 0;
>> +       ulong mtval = csr_read(CSR_MTVAL), mtval2 = 0, mtinst = 0, gva = 0;
>>         struct sbi_trap_info trap;
>>
>>         if (misa_extension('H')) {
>>                 mtval2 = csr_read(CSR_MTVAL2);
>>                 mtinst = csr_read(CSR_MTINST);
>> +#if __riscv_xlen == 32
>> +               trap.gva = (regs->mstatusH & MSTATUSH_GVA) ? 1 : 0;
>> +#else
>> +               trap.gva = (regs->mstatus & MSTATUS_GVA) ? 1 : 0;
> Eh, not trap.gva here, but gva.
>
> Thanks,
> drew
>
>> +#endif
>>         }
>>
>>         if (mcause & (1UL << (__riscv_xlen - 1))) {
>> @@ -311,6 +316,7 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>>                 trap.tval = mtval;
>>                 trap.tval2 = mtval2;
>>                 trap.tinst = mtinst;
>> +               trap.gva = gva;
>>                 rc = sbi_trap_redirect(regs, &trap);
>>                 break;
>>         };
>>
>>
>> Thanks,
>> drew

