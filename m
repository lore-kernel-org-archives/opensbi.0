From: Anup Patel <apatel@ventanamicro.com>
Date: Sat,  8 Jan 2022 09:33:34 +0530
Subject: [PATCH 0/2] Misc driver improvements
Message-ID: <20220108040336.14414-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does improvements/fixes to HTIF driver and ACLINT MSWI driver.

These patches can be found in driver_imp_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (2):
  lib: utils/ipi: Fix size check in aclint_mswi_cold_init()
  lib: utils/sys: Extend HTIF library to allow custom base address

 include/sbi_utils/sys/htif.h       |  4 +-
 lib/utils/ipi/aclint_mswi.c        |  2 +-
 lib/utils/reset/fdt_reset_htif.c   |  8 +++-
 lib/utils/serial/fdt_serial_htif.c |  8 +++-
 lib/utils/sys/htif.c               | 74 ++++++++++++++++++++++++++----
 5 files changed, 81 insertions(+), 15 deletions(-)

-- 
2.25.1


