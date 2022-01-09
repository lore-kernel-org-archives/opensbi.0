From: Anup Patel <apatel@ventanamicro.com>
Date: Sun,  9 Jan 2022 20:50:34 +0530
Subject: [PATCH v2 0/2] Misc driver improvements
Message-ID: <20220109152036.28666-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does improvements/fixes to HTIF driver and ACLINT MSWI driver.

These patches can be found in driver_imp_v2 branch at:
https://github.com/avpatel/opensbi.git

Changes since v1:
 - Set htif_have_base later in set_custom_base()
 - Further extend set_custom_base() to allow separate custom address for
   both fromhost and tohost registers.

Anup Patel (2):
  lib: utils/ipi: Fix size check in aclint_mswi_cold_init()
  lib: utils/sys: Extend HTIF library to allow custom base address

 include/sbi_utils/sys/htif.h       |  8 ++-
 lib/utils/ipi/aclint_mswi.c        |  2 +-
 lib/utils/reset/fdt_reset_htif.c   | 12 ++++-
 lib/utils/serial/fdt_serial_htif.c | 12 ++++-
 lib/utils/sys/htif.c               | 85 ++++++++++++++++++++++++++----
 5 files changed, 104 insertions(+), 15 deletions(-)

-- 
2.25.1


