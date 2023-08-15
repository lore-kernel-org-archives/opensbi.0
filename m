From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 15 Aug 2023 17:39:31 +0800
Subject: [PATCH V2 0/3] fix cpu softlock when using T-HEAD c9xx pmu
Message-ID: <IA1PR20MB495351FBE86C63ECBB8764C7BB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These patches fix the system hang issue caused by using perf tool on
T-HEAD c9xx related platforms.

These patch solves two issues for T-HEAD c9xx pmu:
When detecting features of PMU, MHPMCOUNTER3 is written to all 1s. This
will cause an unexpected overflow interrupt before starting the PMU in
T-HEAD cores.

Another thing is the T-HEAD c9xx pmu is not a standart pmu, especially
in interrupt process and access delegation. For interrupt process, the
T-HEAD pmu uses MCOUNTERINTEN and MCOUNTEROF to control and identify the
interrupt. For access delegation. It needs to set MCOUNTERWEN to allow
S-mode to access related CSRs.

Changed from V1:
1. fix the hang issue when using perf with high profile frequency.
2. optimze the performance of irq process of T-HEAD c9xx pmu.

Inochi Amaoto (3):
  lib: sbi_pmu: ensure update hpm counter before starting counting
  platform: generic: allwinner: fix OF process for T-HEAD c9xx pmu
  lib: sbi_pmu: keep overflow interrupt of stopped hpm counter disabled

 lib/sbi/sbi_pmu.c                      | 17 +++++++++++------
 platform/generic/allwinner/sun20i-d1.c | 25 +++++++++++++++----------
 2 files changed, 26 insertions(+), 16 deletions(-)

--
2.41.0


