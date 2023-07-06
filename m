From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  6 Jul 2023 09:45:38 +0530
Subject: [PATCH v2 0/4] Misc OpenSBI HART ISA extension improvements
Message-ID: <20230706041542.1069059-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does assorted improvements to OpenSBI HART ISA extensions.

These patches can also be found in zicntr_zihpm_v2 branch at:
https://github.com/avpatel/opensbi.git

Changes since v1:
 - Updated PATCH2 to set set SBI_HART_EXT_ZIHPM in hart_detect_features()
   after calling sbi_platform_extensions_init().

Anup Patel (4):
  lib: sbi: Add Zicntr as a HART ISA extension
  lib: sbi: Add Zihpm as a HART ISA extension
  lib: sbi: Alphabetically sort HART ISA extensions
  lib: sbi: Rename hart_pmu_get_allowed_bits() function

 include/sbi/sbi_hart.h | 12 +++++++-----
 lib/sbi/sbi_hart.c     | 30 +++++++++++++++++++-----------
 lib/sbi/sbi_timer.c    |  2 +-
 3 files changed, 27 insertions(+), 17 deletions(-)

-- 
2.34.1


