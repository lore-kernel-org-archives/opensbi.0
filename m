From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 25 Nov 2020 10:46:42 +0530
Subject: [PATCH v3 0/5] Implement System Reset (SRST) SBI extension
Message-ID: <20201125051647.295472-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds SBI SRST extension support available in latest SBI
v0.3-draft specification.

Changes since v2:
 - Rebased on latest OpenSBI
 - Updated implementation as-per final accepted SBI SRST extension

Changes since v1:
 - Updated patch as-per latest SBI SRST extension draft spec where
   we have only one SBI call with "reset_type" parameter

Anup Patel (5):
  include: sbi: Add SBI SRST extension related defines
  include: sbi: Remove opensbi specific reset type defines
  platform: Remove dummy system reset functions
  lib: sbi: Improve system reset platform operations
  lib: sbi: Implement System Reset (SRST) SBI extension

 include/sbi/sbi_ecall.h                      |  1 +
 include/sbi/sbi_ecall_interface.h            | 12 ++++
 include/sbi/sbi_platform.h                   | 39 +++++++++----
 include/sbi/sbi_system.h                     |  4 +-
 include/sbi_utils/reset/fdt_reset.h          |  7 ++-
 include/sbi_utils/sys/htif.h                 |  4 +-
 include/sbi_utils/sys/sifive_test.h          |  4 +-
 lib/sbi/sbi_ecall.c                          |  3 +
 lib/sbi/sbi_ecall_legacy.c                   |  3 +-
 lib/sbi/sbi_ecall_replace.c                  | 60 ++++++++++++++++++++
 lib/sbi/sbi_system.c                         | 13 ++++-
 lib/utils/reset/fdt_reset.c                  | 13 ++++-
 lib/utils/reset/fdt_reset_htif.c             |  1 +
 lib/utils/reset/fdt_reset_sifive.c           |  1 +
 lib/utils/sys/htif.c                         |  7 ++-
 lib/utils/sys/sifive_test.c                  | 29 +++++++---
 platform/andes/ae350/platform.c              | 10 ----
 platform/fpga/ariane/platform.c              | 11 ----
 platform/fpga/openpiton/platform.c           | 11 ----
 platform/generic/include/platform_override.h |  5 +-
 platform/generic/platform.c                  | 23 ++++++--
 platform/kendryte/k210/platform.c            | 10 ----
 platform/nuclei/ux600/platform.c             |  9 ++-
 platform/sifive/fu540/platform.c             |  7 ---
 platform/template/platform.c                 | 12 +++-
 platform/thead/c910/platform.c               |  9 ++-
 26 files changed, 217 insertions(+), 91 deletions(-)

-- 
2.25.1


