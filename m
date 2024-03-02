From: Xiang W <wxjstz@126.com>
Date: Sat,  2 Mar 2024 15:42:25 +0800
Subject: [PATCH v5 6/8] firmware: fw_base.S: fix _reset_regs
In-Reply-To: <20240302074235.12643-1-wxjstz@126.com>
References: <20240302074235.12643-1-wxjstz@126.com>
Message-ID: <20240302074235.12643-7-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

a3 and a4 cannot be reset because used in fw_platform_init.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 6f40d82..a798545 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -77,7 +77,7 @@ _relocate_done:
 
 	/* At this point we are running from link address */
 
-	/* Reset all registers except ra, a0, a1 and a2 for boot HART */
+	/* Reset all registers except ra, a0, a1, a2, a3 and a4 for boot HART */
 	li	ra, 0
 	call	_reset_regs
 
@@ -304,7 +304,7 @@ _wait_for_boot_hart:
 	bne	t0, t1, _wait_for_boot_hart
 
 _start_warm:
-	/* Reset all registers except ra, a0, a1 and a2 for non-boot HARTs */
+	/* Reset all registers except ra, a0, a1, a2, a3 and a4 for non-boot HART */
 	li	ra, 0
 	call	_reset_regs
 
@@ -655,7 +655,7 @@ _reset_regs:
 
 	/* flush the instruction cache */
 	fence.i
-	/* Reset all registers except ra, a0, a1 and a2 */
+	/* Reset all registers except ra, a0, a1, a2, a3 and a4 */
 	li sp, 0
 	li gp, 0
 	li tp, 0
@@ -664,8 +664,6 @@ _reset_regs:
 	li t2, 0
 	li s0, 0
 	li s1, 0
-	li a3, 0
-	li a4, 0
 	li a5, 0
 	li a6, 0
 	li a7, 0
-- 
2.43.0


