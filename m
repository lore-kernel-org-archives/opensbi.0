From: Xiang W <wxjstz@126.com>
Date: Thu, 09 Nov 2023 12:04:20 +0800
Subject: [PATCH] lib: sbi_illegal_insn: Emulate 'MZ'/c.li s4,-13
 instruction
In-Reply-To: <CAJ+HfNh_bYn6rCdCyveZybyQFDa7CU3nPCZzBKW-rvf4J7ft6g@mail.gmail.com>
References: <20231108191310.49950-1-bjorn@kernel.org>
	 <874jhvc3ll.fsf@igel.home>
	 <CAJ+HfNgzOErURt34Orzn+8RafgsvHRpptPsJ+F6zx-6mufDSGQ@mail.gmail.com>
	 <5F1BB663-A00C-4855-95D9-0F0C99E75C5D@jrtc27.com>
	 <CAJ+HfNh_bYn6rCdCyveZybyQFDa7CU3nPCZzBKW-rvf4J7ft6g@mail.gmail.com>
Message-ID: <9411269e9975e9ececae2755eaf74271de45b8c0.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-11-09???? 01:22 +0100?Bj?rn T?pel???
> On Thu, 9 Nov 2023 at 01:11, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> > 
> > On 9 Nov 2023, at 00:02, Bj?rn T?pel <bjorn@kernel.org> wrote:
> > > 
> > > Hi Andreas!
> > > 
> > > On Wed, 8 Nov 2023 at 22:55, Andreas Schwab <schwab@linux-m68k.org> wrote:
> > > > 
> > > > On Nov 08 2023, Bj?rn T?pel wrote:
> > > > 
> > > > > +static int compressed_insn(ulong insn, struct sbi_trap_regs *regs)
> > > > > +{
> > > > > +???? /* Only handle 'MZ'/c.li s4,-13/0x5a3d */
> > > > > +???? if (!misa_extension('C') && (insn & 0xffff) == 0x5a4d) {
> > > > > +???????????? regs->s4 = -13;
> > > > > +???????????? regs->mepc += 4;
> > > > 
> > > > By skipping 4 bytes execution will resume in the middle of the next insn
> > > > (the jump around the header).
> > > 
> > > This is in a non-C environment -- "!misa_extension('C')", so we're not
> > > jumping into the middle of the next insn.
> > 
> > But that?s not c.li, is it. That?s bjorn.c.li, a 32-bit instruction
> ???????????????????????????????????????????????? ^^^^ My very own! :-D
> 
> > whose first 16-bit parcel is the same as c.li and whose second 16-bit
> > parcel is ignored. I really do not think this is a good idea.
> > 
> > > Note that the Linux kernel needs the change pointed out in this patch,
> > > to build w/o C.
> > 
> > That sounds like a Linux problem. Other OSes cope just fine. Fixing in
> > firmware is not the right approach; fix your software instead. Which
> > may mean abandoning an image format that isn?t fit for purpose. But the
> > solution isn?t to hack in whatever random crud Linux wants in firmware,
> > and other non-firmware SBI implementations like hypervisors.
> 
> There are other kernels that people care about?
> 
> > So this is a resounding NAK from me.
> 
> Jokes aside; Fair enough! I'll go back to the drawing board.

The kernel cannot handle this problem because the kernel has not initialized
stvec at this time. And the MZ cannot be changed because it is part of the PE
header. The best way is to skip the MZ of the PE header through the upper
bootloader. Therefore, when the kernel is used as the payload of opensbi,
skipped operations also need to be added. sbi_hart_switch_mode needs to add
some code to detect whether the current core supports C extension, whether
there is 0x5a4d5a4d at next_addr, and modify next_addr.

Regards,
Xiang W
> 
> Thank you for the input!
> 
> 
> Bj?rn
> 


