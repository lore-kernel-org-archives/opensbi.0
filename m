From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu,  9 Nov 2023 19:20:58 +0800
Subject: [PATCH] lib: sbi_illegal_insn: Emulate c.li
In-Reply-To: <ab3b8e8cb1c2bef8f75bf0becfd7effffd372b2b.camel@126.com>
References: <ab3b8e8cb1c2bef8f75bf0becfd7effffd372b2b.camel@126.com>
Message-ID: <IA1PR20MB495332C748AA9B8063D47F6BBBAFA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>? 2023-11-09???? 17:35 +0800?Inochi Amaoto???
>>> The Linux kernel RISC-V image format allows that UEFI Images can also
>>> be booted by non-UEFI firmware. However for that to work, the PE/Image
>>> combo requires that 'MZ' is a valid instruction. On RISC-V, 'MZ' is
>>> only a valid instruction if the hardware is C capable [1]. So add
>>> Emulate c.li
>>>
>>> Signed-off-by: Bj?rn T?pel <bjorn@rivosinc.com>
>>> Signed-off-by: Xiang W <wxjstz@126.com>
>>> ---
>>> lib/sbi/sbi_illegal_insn.c | 18 +++++++++++++++++-
>>> 1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
>>> index 2be4757..4ab10f4 100644
>>> --- a/lib/sbi/sbi_illegal_insn.c
>>> +++ b/lib/sbi/sbi_illegal_insn.c
>>> @@ -102,6 +102,22 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>>> 	return 0;
>>> }
>>>
>>> +static int compressed_insn(ulong insn, struct sbi_trap_regs *regs) {
>>> +	unsigned long imm, rd;
>>> +	unsigned long *regs_p = (unsigned long *)regs;
>>> +
>>> +	if ((insn & 0xe003) == 0x4001) { /* c.li */
>>> +		imm = (insn >> 2) & 0x1f;
>>> +		imm |= ((insn >> 12) & 1) ? -32 : 0;
>>> +		rd = (insn >> 7) & 0x1f;
>>> +		if (rd)
>>> +			regs_p[rd] = imm;
>>> +		return 0;
>>> +	}
>>> +
>>> +	return truly_illegal_insn(insn, regs);
>>> +}
>>> +
>>> static const illegal_insn_func illegal_insn_table[32] = {
>>> 	truly_illegal_insn, /* 0 */
>>> 	truly_illegal_insn, /* 1 */
>>> @@ -160,7 +176,7 @@ int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
>>> 			return sbi_trap_redirect(regs, &uptrap);
>>> 		}
>>> 		if ((insn & 3) != 3)
>>> -			return truly_illegal_insn(insn, regs);
>>> +			return compressed_insn(insn, regs);
>>> 	}
>>>
>>> 	return illegal_insn_table[(insn & 0x7c) >> 2](insn, regs);
>>> --
>>> 2.42.0
>>>
>>
>> I think this patch may be unnecessary.
>>
>> After searching the boot flow of UEFI, I only found two implementations:
>>
>> For QEMU RISC-V virt platform and SG2042 platform:
>> SBI -> (SEC -> PEI -> DXE) -> bootloader -> OS
>>                UEFI
>>
>> For SiFive U540 platform:
>> (SEC -> OpenSBI -> PEI -> DXE) -> bootloader -> OS
>>              UEFI
>>
>> Both invoke SBI at a very early stage and use raw vaild address, and
>> handling the UEFI header is more like bootloader's job. I have no idea
>> about why this should be handled by SBI. FYI, Bj?rn T?pel.
>This patch is used to solve the problem of non-UEFI firmware booting the
>kernel. The UEFI boot kernel should parse the PE file header, so this
>patch is not needed. But non-UEFI probably treats the kernel as a
>binary image.

This is not a vaild scenario for UEFI binary. IIRC, even the aarch64 arch
does not support using UEFI binary in this way. I agree with Jessica about
the fact that they are different. If you insist, I suggest using a custom
bootloader to handle this.

>
>Regards,
>Xiang W
>
>

