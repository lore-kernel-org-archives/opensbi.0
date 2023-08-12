From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat, 12 Aug 2023 13:05:39 +0800
Subject: [PATCH 0/2 RESEND] fix T-HEAD c9xx cpu softlock
Message-ID: <IA1PR20MB4953955F17C7517BE21B0E7CBB11A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "haijiao.liu@sophgo.com" <haijiao.liu@sophgo.com>

Sorry for resending these patches, there is a mistake made by our staff
that sent the wrong email.

These patches fix the system hang issue caused by using perf tool on
T-HEAD c9xx related platforms.

When detecting features of PMU, MHPMCOUNTER3 is changed to 0xffffffffffffffff
in the function hart_mhpm_get_allowed_bits. Enabling the counter directly
would cause an overflow interrupt. The correct procedure is to initialize
the counter's initial value before enabling the counter to count.

###########

haijiao.liu at sophgo.com (2):
  lib: sbi_pmu: ensure update hpm counter before starting counting
  platform: generic: allwinner: fix OV process for T-HEAD c9xx pmu

 lib/sbi/sbi_pmu.c                      | 11 +++++++----
 platform/generic/allwinner/sun20i-d1.c | 11 ++++++++++-
 2 files changed, 17 insertions(+), 5 deletions(-)

--
2.34.1


