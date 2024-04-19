From: Ben Zong-You Xie <ben717@andestech.com>
Date: Fri, 19 Apr 2024 11:58:22 +0800
Subject: [0/2] Rename andes45 to andes to make the framework more generic
Message-ID: <20240419035824.280137-1-ben717@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since Andes has three kinds of CPUs(25/45/65), not only has 45-series.
For a more generic framework, rename andes45 to andes.

Ben Zong-You Xie (2):
  platform: andes: Rename files with the prefix andes45
  platform: andes: Change all occurrences of andes45 to andes

 platform/generic/Kconfig                      |  2 +-
 platform/generic/andes/Kconfig                |  2 +-
 platform/generic/andes/ae350.c                |  7 +-
 .../andes/{andes45-pma.c => andes_pma.c}      | 80 +++++++++----------
 platform/generic/andes/andes_pmu.c            |  2 +-
 platform/generic/andes/andes_sbi.c            | 12 +--
 platform/generic/andes/objects.mk             |  2 +-
 platform/generic/andes/sleep.S                |  2 +-
 .../include/andes/{andes45.h => andes.h}      | 29 ++++---
 .../andes/{andes45_pma.h => andes_pma.h}      | 20 ++---
 platform/generic/renesas/rzfive/rzfive.c      | 12 +--
 11 files changed, 86 insertions(+), 84 deletions(-)
 rename platform/generic/andes/{andes45-pma.c => andes_pma.c} (77%)
 rename platform/generic/include/andes/{andes45.h => andes.h} (62%)
 rename platform/generic/include/andes/{andes45_pma.h => andes_pma.h} (70%)

-- 
2.34.1


