From: Conor Dooley <conor@kernel.org>
Date: Thu, 15 Jun 2023 17:46:28 +0100
Subject: [RFC PATCH 2/2] lib: reset: thead: Correct the naming convention
 of dts
In-Reply-To: <CAJF2gTQHXrEsf=auwSU0bTesin9rXExTD3hgDpsMQPCxMYp4-A@mail.gmail.com>
References: <CAJF2gTRgE2ceqZ7Ddi6NwT++qFGEzK-YZ4gg9mYPwTSUKiTwRw@mail.gmail.com>
 <B31C373E-7DDF-43A5-B855-DB664C940C7B@kernel.org>
 <CAJF2gTT-PkUUceDR8d3GXq4v40daJuNQ6rFHzLTAkLA_=ie=cA@mail.gmail.com>
 <CAJF2gTQNXncSUcDh0SfbRwb2GrKn7DeoQ_pgOfERXbLZ9yS_jg@mail.gmail.com>
 <20230612-graveness-uncloak-5f3634a45339@spud>
 <CAJF2gTSV-+cGj-1R6VumTqHmUt0PKJSEjrCoq5hMnBsLrg4jcw@mail.gmail.com>
 <20230613-define-constrict-7608d966e0e8@spud>
 <CAJF2gTSzD5EF0zWOzR0U2eJSR9aBzc+JjzUi04-Ce5oWgb=n9w@mail.gmail.com>
 <20230614-coauthor-altitude-5f5fcb23c75c@wendy>
 <CAJF2gTQHXrEsf=auwSU0bTesin9rXExTD3hgDpsMQPCxMYp4-A@mail.gmail.com>
Message-ID: <20230615-dice-overstuff-f1dfb456a20c@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 15, 2023 at 11:54:38PM +0800, Guo Ren wrote:
> On Wed, Jun 14, 2023 at 2:56?PM Conor Dooley <conor.dooley@microchip.com> wrote:
> >
> > On Wed, Jun 14, 2023 at 09:11:01AM +0800, Guo Ren wrote:
> > > On Wed, Jun 14, 2023 at 3:36?AM Conor Dooley <conor@kernel.org> wrote:
> > > > On Tue, Jun 13, 2023 at 10:31:40AM +0800, Guo Ren wrote:
> > > > > On Mon, Jun 12, 2023 at 11:39?PM Conor Dooley <conor@kernel.org> wrote:
> > > > > > On Mon, Jun 12, 2023 at 08:57:36AM +0800, Guo Ren wrote:
> > > > > > > Jisheng Zhang would update the Linux yaml patch, here is the final dts
> > > > > > > format of the reset controller:
> >
> > @Jisheng, iirc this was the only real outstanding thing for your Linux
> > patchset, if you re-submit without the reset controller this week it
> > should still be in time for v6.5.
> I also agree let others go head first, thx Conor.
> 
> >
> > > > > > >                reset-controller at ffff019050 {
> > > > > > >                        compatible = "thead,cpu-reset";
> > > >
> > > > Also, please just add the soc-specific compatibles even if the driver
> > > > will bind against the most common form of it.
> > > >
> > > > > > >                        reg = <0xff 0xff019050 0x0 0x4>, <0xff
> > > > > > > 0xff015004 0x0 0x0>;
> > > > > > >                        reset-ctrl = <0x1c>;
> > > > > > >                        clone-csrs = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3
> > > > > > > 0x7c5 0x7cc 0x7ce>;
> > > >
> > > > To be honest, I don't actually understand why "clone-csrs" is even part
> > > > of this "cpu-reset" node. It seems to serve a different purpose to
> > > > something that could take various parts of the SoC out of reset.
> > > > IMO, the "clone-csrs" stuff is something that should be done based on
> > > > the soc-level compatible, and not related to the "cpu-reset" node at
> > > > all, which (given the below) sounds more and more like a regular reset
> > > > controller.
> >
> > > We need to put clone-csrs' execution entry into the reset entry (the
> > > first reg address).
> >
> > So, take the first reg out too then, with the clone-csrs bits?
> >
> > That'd leave you with a "regular" reset controller for bits that reset
> > various parts of the SoC & the clone-csrs stuff can be its own thing.
> >
> > What am I missing?
> 
> +               tmp = (ulong)&__thead_pre_start_warm;
> +               writel(tmp, (char *)(ulong)reg_addr + (i * 8));
> +               tmp = (u64)(ulong)&__thead_pre_start_warm >> 32;
> +               writel(tmp, (char *)(ulong)reg_addr + (i * 8) + 4);
> We write __thead_pre_start_warm into entry-reg, and the
> __thead_pre_start_warm is:
>         .align 3
>         .global __thead_pre_start_warm
> __thead_pre_start_warm:
> ...
>         .global __reset_thead_csr_stub
> __reset_thead_csr_stub:
> .rept   MAX_CUSTOM_CSR
>         REG_L   t2, 8(t1)
>         CSR_STUB
>         addi    t1, t1, 16
> .endr
> ...
> 
> The CSR_STUB array contains all clone-csrs array. We modify it during
> the early boot.

I don't see how this answers my question. That all seems to be about
what you originally called "entry-reg", "entry-cnt" & "csr-copy".
That does not seem like it has almost nothing to do with what were
originally called "control-reg" & "control-val".

Per your descriptions, there appears to be a normal reset controller
(the "control-" bits) and the CSR/hart entry point stuff crammed into
one DT node. I am asking why you do not split what seems to be a regular
reset controller away from the CSR/entry point stuff.

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230615/5c41acc6/attachment.sig>
