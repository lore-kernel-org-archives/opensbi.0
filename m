From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Apr 2022 21:21:40 +0530
Subject: [PATCH 00/11] HART Feature Improvements
Message-ID: <20220429155151.314788-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does following improvements to OpenSBI hart features:
1) Add per-HART priv spec version
2) Remove redundant per-HART features
3) Convert HART features into HART extensions
4) Platform callback to populate HART extensions

These patches can also be found in the hart_feat_v1 brach at:
https://github.com/avpatel/opensbi.git

Anup Patel (11):
  lib: sbi: Detect and print privileged spec version
  lib: sbi: Remove 's' and 'u' from misa_string() output
  lib: sbi: Update the name of ISA string printed at boot time
  lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart features
  lib: sbi: Remove MCOUNTINHIBT hart feature
  lib: sbi: Remove MENVCFG hart feature
  lib: sbi: Fix AIA feature detection
  lib: sbi: Convert hart features into hart extensions
  lib: sbi: Detect hart features only once for each hart
  lib: sbi: Add sbi_hart_update_extension() function
  lib: sbi_platform: Add callback to populate HART extensions

 include/sbi/sbi_hart.h     |  61 ++++----
 include/sbi/sbi_platform.h |  18 +++
 lib/sbi/riscv_asm.c        |   2 +-
 lib/sbi/sbi_emulate_csr.c  |   4 +-
 lib/sbi/sbi_hart.c         | 288 +++++++++++++++++++++----------------
 lib/sbi/sbi_init.c         |   8 +-
 lib/sbi/sbi_pmu.c          |  19 +--
 lib/sbi/sbi_timer.c        |   6 +-
 lib/sbi/sbi_trap.c         |   4 +-
 lib/utils/fdt/fdt_pmu.c    |   2 +-
 10 files changed, 246 insertions(+), 166 deletions(-)

-- 
2.34.1


