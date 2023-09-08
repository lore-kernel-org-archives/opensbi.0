From: Guo Ren <guoren@kernel.org>
Date: Fri, 8 Sep 2023 10:37:25 +0800
Subject: [PATCH V2 0/3] fix cpu softlock when using T-HEAD c9xx pmu
In-Reply-To: <CAAhSdy152ZnCKbyNZy+NL0BcrprQyp2c_OuEu-J-9y897ZzuOg@mail.gmail.com>
References: <IA1PR20MB495351FBE86C63ECBB8764C7BB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAAhSdy152ZnCKbyNZy+NL0BcrprQyp2c_OuEu-J-9y897ZzuOg@mail.gmail.com>
Message-ID: <CAJF2gTTPnHy+5QM+G9DRe-sL9nWcFY0i7nMSuMf1WxWCmL0WUQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 6, 2023 at 6:59?PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Guo,
>
> On Tue, Aug 15, 2023 at 3:09?PM Inochi Amaoto <inochiama@outlook.com> wrote:
> >
> > These patches fix the system hang issue caused by using perf tool on
> > T-HEAD c9xx related platforms.
> >
> > These patch solves two issues for T-HEAD c9xx pmu:
> > When detecting features of PMU, MHPMCOUNTER3 is written to all 1s. This
> > will cause an unexpected overflow interrupt before starting the PMU in
> > T-HEAD cores.
> >
> > Another thing is the T-HEAD c9xx pmu is not a standart pmu, especially
> > in interrupt process and access delegation. For interrupt process, the
> > T-HEAD pmu uses MCOUNTERINTEN and MCOUNTEROF to control and identify the
> > interrupt. For access delegation. It needs to set MCOUNTERWEN to allow
> > S-mode to access related CSRs.
> >
> > Changed from V1:
> > 1. fix the hang issue when using perf with high profile frequency.
> > 2. optimze the performance of irq process of T-HEAD c9xx pmu.
> >
> > Inochi Amaoto (3):
> >   lib: sbi_pmu: ensure update hpm counter before starting counting
> >   platform: generic: allwinner: fix OF process for T-HEAD c9xx pmu
> >   lib: sbi_pmu: keep overflow interrupt of stopped hpm counter disabled
>
> I intend to merge this series by end-of-week.
>
> Please let me know if you want to hold-off merging this.
This is okay for me, thx for merging.

>
> Regards,
> Anup
>
> >
> >  lib/sbi/sbi_pmu.c                      | 17 +++++++++++------
> >  platform/generic/allwinner/sun20i-d1.c | 25 +++++++++++++++----------
> >  2 files changed, 26 insertions(+), 16 deletions(-)
> >
> > --
> > 2.41.0
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Best Regards
 Guo Ren

