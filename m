From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 9 Nov 2023 00:11:19 +0000
Subject: [PATCH] lib: sbi_illegal_insn: Emulate 'MZ'/c.li s4,-13
 instruction
In-Reply-To: <CAJ+HfNgzOErURt34Orzn+8RafgsvHRpptPsJ+F6zx-6mufDSGQ@mail.gmail.com>
References: <20231108191310.49950-1-bjorn@kernel.org>
 <874jhvc3ll.fsf@igel.home>
 <CAJ+HfNgzOErURt34Orzn+8RafgsvHRpptPsJ+F6zx-6mufDSGQ@mail.gmail.com>
Message-ID: <5F1BB663-A00C-4855-95D9-0F0C99E75C5D@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Nov 2023, at 00:02, Bj?rn T?pel <bjorn@kernel.org> wrote:
> 
> Hi Andreas!
> 
> On Wed, 8 Nov 2023 at 22:55, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> 
>> On Nov 08 2023, Bj?rn T?pel wrote:
>> 
>>> +static int compressed_insn(ulong insn, struct sbi_trap_regs *regs)
>>> +{
>>> +     /* Only handle 'MZ'/c.li s4,-13/0x5a3d */
>>> +     if (!misa_extension('C') && (insn & 0xffff) == 0x5a4d) {
>>> +             regs->s4 = -13;
>>> +             regs->mepc += 4;
>> 
>> By skipping 4 bytes execution will resume in the middle of the next insn
>> (the jump around the header).
> 
> This is in a non-C environment -- "!misa_extension('C')", so we're not
> jumping into the middle of the next insn.

But that?s not c.li, is it. That?s bjorn.c.li, a 32-bit instruction
whose first 16-bit parcel is the same as c.li and whose second 16-bit
parcel is ignored. I really do not think this is a good idea.

> Note that the Linux kernel needs the change pointed out in this patch,
> to build w/o C.

That sounds like a Linux problem. Other OSes cope just fine. Fixing in
firmware is not the right approach; fix your software instead. Which
may mean abandoning an image format that isn?t fit for purpose. But the
solution isn?t to hack in whatever random crud Linux wants in firmware,
and other non-firmware SBI implementations like hypervisors.

So this is a resounding NAK from me.

Jess

> Bj?rn
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


