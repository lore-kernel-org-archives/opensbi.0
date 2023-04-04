From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 4 Apr 2023 16:49:22 +0200
Subject: [PATCH 2/2] lib: sbi: Fix cidx_base check when
 SBI_PMU_CFG_FLAG_SKIP_MATCH is set
In-Reply-To: <CAHVXubhQe4dp4FVmpa7qHjUwxFmWSXRNsW2Ut9TxSQEFjpNyYg@mail.gmail.com>
References: <20230320100958.16831-1-alexghiti@rivosinc.com>
 <20230320100958.16831-2-alexghiti@rivosinc.com> <CAOnJCUKQ6=v-Az19n9v4xrbkgqn=XVGAbKLKzBYzOVfMqDG1Ag@mail.gmail.com>
 <CAHVXubhQe4dp4FVmpa7qHjUwxFmWSXRNsW2Ut9TxSQEFjpNyYg@mail.gmail.com>
Message-ID: <CAHVXubjY_LM3CmpHSr0fJ41gzxjtJOMxy_07s4Wq6FZCL7rnkQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 4, 2023 at 4:47?PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> On Tue, Apr 4, 2023 at 2:44?AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Mon, Mar 20, 2023 at 3:41?PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> > >
> > > When SBI_PMU_CFG_FLAG_SKIP_MATCH is set, cidx_base is used to represent
> > > the counter index to match, so make sure we don't return an error in
> > > this case.
> > >
> >
> > Reading the spec again, it says
> > "the SBI implementation will unconditionally select the first counter
> > from the set of counters specified by the counter_idx_base and
> > counter_idx_mask"
> > Technically, a caller can pass a non-zero valid counter mask with the
> > counter base being really a base. Correct ?
> >
> > so we should check cbase+ sbi_ffs against total_ctrs
> > We also need to choose that value instead of cbase while selecting the ctr_idx.
>
> IIUC, you mean we should not fix opensbi but the caller right? I'll do
> that in the perf driver then, let me know If I'm wrong!

And opensbi to use cbase + mask instead of cidx_base as it does now.

>
> Thanks,
>
> Alex
>
> >
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >  lib/sbi/sbi_pmu.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > > index 2176cc7..ffdbe65 100644
> > > --- a/lib/sbi/sbi_pmu.c
> > > +++ b/lib/sbi/sbi_pmu.c
> > > @@ -722,8 +722,16 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
> > >         u32 event_code, hartid = current_hartid();
> > >         int event_type;
> > >
> > > -       /* Do a basic sanity check of counter base & mask */
> > > -       if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
> > > +       /*
> > > +        * Do a basic sanity check of counter base & mask but not when
> > > +        * flags has the skip match bit set since cidx_base has a
> > > +        * different meaning there.
> > > +        */
> > > +       if ((flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) && cidx_base > total_ctrs)
> > > +               return SBI_EINVAL;
> > > +
> > > +       if (!(flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) &&
> > > +           ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs))
> > >                 return SBI_EINVAL;
> > >
> > >         event_type = pmu_event_validate(event_idx, event_data);
> > > --
> > > 2.37.2
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
> >
> >
> >
> > --
> > Regards,
> > Atish

