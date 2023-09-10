From: Anup Patel <anup@brainfault.org>
Date: Sun, 10 Sep 2023 11:16:14 +0530
Subject: [PATCH V2 0/3] fix cpu softlock when using T-HEAD c9xx pmu
In-Reply-To: <7b1019ff-1c54-eb74-9976-4e93aa6f0e26@sholland.org>
References: <IA1PR20MB495351FBE86C63ECBB8764C7BB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <7b1019ff-1c54-eb74-9976-4e93aa6f0e26@sholland.org>
Message-ID: <CAAhSdy3GcY9je7fAqLiK0DO6Nj5VR6LqcLxA=n=qWYQmd2Xazw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 10, 2023 at 5:03?AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 8/15/23 04:39, Inochi Amaoto wrote:
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
> >
> >  lib/sbi/sbi_pmu.c                      | 17 +++++++++++------
> >  platform/generic/allwinner/sun20i-d1.c | 25 +++++++++++++++----------
> >  2 files changed, 26 insertions(+), 16 deletions(-)
>
> For the series:
> Tested-by: Samuel Holland <samuel@sholland.org>

Thanks for testing this series.

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

