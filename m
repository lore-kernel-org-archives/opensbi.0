From: Björn Töpel <bjorn@kernel.org>
Date: Thu, 9 Nov 2023 01:02:51 +0100
Subject: [PATCH] lib: sbi_illegal_insn: Emulate 'MZ'/c.li s4,-13 instruction
In-Reply-To: <874jhvc3ll.fsf@igel.home>
References: <20231108191310.49950-1-bjorn@kernel.org> <874jhvc3ll.fsf@igel.home>
Message-ID: <CAJ+HfNgzOErURt34Orzn+8RafgsvHRpptPsJ+F6zx-6mufDSGQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andreas!

On Wed, 8 Nov 2023 at 22:55, Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Nov 08 2023, Bj?rn T?pel wrote:
>
> > +static int compressed_insn(ulong insn, struct sbi_trap_regs *regs)
> > +{
> > +     /* Only handle 'MZ'/c.li s4,-13/0x5a3d */
> > +     if (!misa_extension('C') && (insn & 0xffff) == 0x5a4d) {
> > +             regs->s4 = -13;
> > +             regs->mepc += 4;
>
> By skipping 4 bytes execution will resume in the middle of the next insn
> (the jump around the header).

This is in a non-C environment -- "!misa_extension('C')", so we're not
jumping into the middle of the next insn.

Note that the Linux kernel needs the change pointed out in this patch,
to build w/o C.


Bj?rn

