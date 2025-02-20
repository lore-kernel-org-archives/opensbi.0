From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 20 Feb 2025 10:42:26 -0800
Subject: [PATCH 0/4] Hart Count Enhancements
Message-ID: <20250220184233.23802-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series aims to improve the efficiency of looking up data based on a
hart index, and improve the readability of iterating over the harts in a
system. Patch 2 is a nice optimization, saving about 400 bytes of code
on a generic GCC firmware build for zero runtime cost.


Samuel Holland (4):
  lib: sbi_scratch: Apply bounds check to platform hart_count
  lib: sbi_scratch: Optimize hartid and scratch lookup
  lib: sbi_scratch: Add sbi_hart_count() and for_each_hartindex()
  lib: sbi: Use sbi_hart_count() and for_each_hartindex()

 include/sbi/sbi_platform.h            | 13 ++++---------
 include/sbi/sbi_scratch.h             | 21 ++++++++++++---------
 lib/sbi/sbi_domain.c                  |  4 +---
 lib/sbi/sbi_hsm.c                     |  3 +--
 lib/sbi/sbi_scratch.c                 | 24 ++++++++++++------------
 lib/utils/irqchip/fdt_irqchip_plic.c  |  5 +----
 lib/utils/irqchip/plic.c              |  8 ++++----
 lib/utils/reset/fdt_reset_atcwdt200.c |  5 +----
 platform/generic/platform.c           |  2 +-
 9 files changed, 37 insertions(+), 48 deletions(-)

-- 
2.47.2


