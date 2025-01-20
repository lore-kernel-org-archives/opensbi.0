From: Xiang W <wxjstz@126.com>
Date: Mon, 20 Jan 2025 11:13:16 +0800
Subject: [PATCH] firmware: fw_base.S: Fix comments for _wait_for_boot_hart
Message-ID: <20250120031329.650013-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Due to some historical issues, the value of BOOT_STATUS_BOOT_HART_DONE
has changed and the comment message needs to be corrected.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index d027e5e2..536bcd26 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -292,7 +292,7 @@ _fdt_reloc_done:
 	REG_S	t0, 0(t1)
 	j	_start_warm
 
-	/* waiting for boot hart to be done (_boot_status == 2) */
+	/* waiting for boot hart to be done (_boot_status == BOOT_STATUS_BOOT_HART_DONE) */
 _wait_for_boot_hart:
 	li	t0, BOOT_STATUS_BOOT_HART_DONE
 	lla	t1, _boot_status
-- 
2.45.2


