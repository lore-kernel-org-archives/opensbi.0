From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 25 Sep 2023 20:24:26 +0800
Subject: [PATCH] lib: utils/serial: Ensure proper allocation of PMP entries for uart8250
Message-ID: <20230925122426.1667314-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The added memory region should start from the base address.
Otherwise, the range will be shifted by reg_offset and not
able to merge consecutive NAPOT regions in the root domain,
resulting in wasted PMP entries.

Fixes: e8bc1621 ("lib: utils/serial: Add shared regions for
serial drivers")

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 lib/utils/serial/uart8250.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 4d158d3..1fe053f 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -135,8 +135,7 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
 
 	sbi_console_set_device(&uart8250_console);
 
-	return sbi_domain_root_add_memrange(base + reg_offset, PAGE_SIZE,
-					    PAGE_SIZE,
+	return sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
 					    (SBI_DOMAIN_MEMREGION_MMIO |
 					    SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 }
-- 
2.34.1


