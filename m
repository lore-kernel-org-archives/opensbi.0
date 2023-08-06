From: Anup Patel <anup@brainfault.org>
Date: Sun, 6 Aug 2023 11:05:39 +0530
Subject: [PATCH] platform: generic: allwinner: correct mhpmevent count
In-Reply-To: <CAJF2gTSsJ6KkZr-s_-bnxbAZnoirSdv=7y=qD1B3ru+ccvY7Ng@mail.gmail.com>
References: <IA1PR20MB495331314E453C7E9822C88ABB08A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAAhSdy07+GW5Oh1WogSFYMD45fwm7G1Ej4Wq2SWZFF_c+ekkzA@mail.gmail.com> <CAJF2gTSsJ6KkZr-s_-bnxbAZnoirSdv=7y=qD1B3ru+ccvY7Ng@mail.gmail.com>
Message-ID: <CAAhSdy1qw4OLujX4vyEVpTFjM6yZ5fkHGT9xY+GPHsfsAW1MUQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 6, 2023 at 11:02?AM Guo Ren <guoren@kernel.org> wrote:
>
> On Sun, Aug 6, 2023 at 1:04?AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Thu, Aug 3, 2023 at 7:20?AM Inochi Amaoto <inochiama@outlook.com> wrote:
> > >
> > > Only the CSR mhpmevent 3-9,13-17 of D1 have valid function, so reduce
> > > the mhpm_count to 15 to avoid invalid usage.
> > >
> > > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > > ---
> > >  platform/generic/allwinner/sun20i-d1.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> > > index 0f0a9f3..94a3a5e 100644
> > > --- a/platform/generic/allwinner/sun20i-d1.c
> > > +++ b/platform/generic/allwinner/sun20i-d1.c
> > > @@ -272,7 +272,8 @@ static int sun20i_d1_extensions_init(const struct fdt_match *match,
> > >         sbi_pmu_set_device(&thead_c9xx_pmu_device);
> > >
> > >         /* auto-detection doesn't work on t-head c9xx cores */
> > > -       hfeatures->mhpm_count = 29;
> > > +       /* D1 has 29 mhpmevent csrs, but only 3-9,13-17 have valid value */
> > > +       hfeatures->mhpm_count = 15;
> >
> > With the latest non-contiguous counter support, we need to set
> > mhpm_mask as well.
> > I have taken care of this at the time of merging this patch.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
> > Applied this patch to the riscv/opensbi repo.
> Sorry for the delayed reply. I think we need more tests on this patch.
> Now my colleagues are cooperating with Inochi to solve the problem.
>
> We are also solving the perf record problem on D1, so I'm unsure about
> the final solution. I recommend you hold this patch for a while. Maybe
> we would adjust it.

Okay, I have dropped it from my queue.

Regards,
Anup

>
> ps:
> Include Heiko email
>
> >
> > Thanks,
> > Anup
> >
> > >         hfeatures->mhpm_bits = 64;
> > >
> > >         return 0;
> > > --
> > > 2.41.0
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
>
>
>
> --
> Best Regards
>  Guo Ren

