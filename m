From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 Nov 2021 21:01:41 +0530
Subject: [PATCH] lib: sbi: Fix PMP address bits detection
In-Reply-To: <e58c790f8f54522f62ab342787d7edae1eb34ddb.camel@126.com>
References: <20211108050646.2895200-1-anup.patel@wdc.com>
 <f0a8a1548d59a730821bdcb628197f0723f564b0.camel@126.com>
 <CAAhSdy0FkP+xtsoEAj2ECcqTKs5RaKTq5o_qPR3jBBXkdQZDmA@mail.gmail.com>
 <e58c790f8f54522f62ab342787d7edae1eb34ddb.camel@126.com>
Message-ID: <CAAhSdy0AhhBrY1q2POt8GfFkZCRVfQtJmOHs63=L2Oujqij+EQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 11, 2021 at 8:48 PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2021-11-11???? 18:38 +0530?Anup Patel???
> > On Mon, Nov 8, 2021 at 2:35 PM Xiang W <wxjstz@126.com> wrote:
> > >
> > > ? 2021-11-08???? 10:36 +0530?Anup Patel???
> > > > From: Vasan VS <vasan.vs@gmail.com>
> > > >
> > > > We should ensure that pmpcfg0.pmp0cfg is set to zero before using
> > > > pmpaddr0 CSR for detecting implemented PMP address bits.
> > > Why? Disable PMP? Prevent the generated PMP from affecting program
> > > execution? If so, I think the PMP configuration should be backed up
> > > first, then tested, and finally restored
> >
> > We don't need to save/restore PMP configuration here because it is
> > very early during HART feature detection.
> >
> > For the rest refer,
> > https://github.com/riscv-software-src/opensbi/issues/225
> >
> > Regards,
> > Anup
>
> This code will be executed after each warm boot, pmpcfg0 may be locked,
> and writing 0 may not work. I suggest to make this code execute once
> through a static variable

No need for a static variable, we can just check "hfeatures->pmp_addr_bits"
to be zero before calling hart_pmp_get_allowed_addr().

Regards,
Anup

>
> Regards,
> Xiang W
> >
> > >
> > > Regards,
> > > Xiang W
> > > >
> > > > Fixes: bf21632860b4 ("lib: sbi: Detect PMP granularity and number
> > > > of address bits")
> > > > Signed-off-by: Vasan VS <vasan.vs@gmail.com>
> > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > ---
> > > >  lib/sbi/sbi_hart.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > > > index 8eb0c38..366066b 100644
> > > > --- a/lib/sbi/sbi_hart.c
> > > > +++ b/lib/sbi/sbi_hart.c
> > > > @@ -339,6 +339,10 @@ static unsigned long
> > > > hart_pmp_get_allowed_addr(void)
> > > >         unsigned long val = 0;
> > > >         struct sbi_trap_info trap = {0};
> > > >
> > > > +       csr_write_allowed(CSR_PMPCFG0, (ulong)&trap, 0);
> > > > +       if (trap.cause)
> > > > +               return 0;
> > > > +
> > > >         csr_write_allowed(CSR_PMPADDR0, (ulong)&trap,
> > > > PMP_ADDR_MASK);
> > > >         if (!trap.cause) {
> > > >                 val = csr_read_allowed(CSR_PMPADDR0,
> > > > (ulong)&trap);
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > >
> > >
>
>

