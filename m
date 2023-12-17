From: fmrt19zrmin@163.com <fmrt19zrmin@163.com>
Date: Sun, 17 Dec 2023 21:48:36 +0800
Subject: [PATCH] fw_base.S: Fix comment errors
Message-ID: <20231217134836.895-1-fmrt19zrmin@163.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Zhang Runmin <fmrt19zrmin@163.com>

When calling '_reset_regs', it'll reset all registers except some
specific registers (ra, a0, a1, and a2).

Both boot HART and non-boot HARTs will execute the '_start_warm'
function. Therefore, when '_reset_regs' is called in '_start_warm', it
will reset all registers except some specific registers (ra, a0, a1 and
a2) for both boot HART and non-boot HARTs.

Signed-off-by: Zhang Runmin <fmrt19zrmin@163.com>
---
 firmware/fw_base.S | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index f7763f4..ab432ea 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -188,7 +188,7 @@ _relocate_done:
 
 	/* At this point we are running from link address */
 
-	/* Reset all registers for boot HART */
+	/* Reset all registers except ra, a0, a1 and a2 for boot HART */
 	li	ra, 0
 	call	_reset_regs
 
@@ -415,7 +415,10 @@ _wait_for_boot_hart:
 	bne	t0, t1, _wait_for_boot_hart
 
 _start_warm:
-	/* Reset all registers for non-boot HARTs */
+	/*
+     * Reset all registers except ra, a0, a1 and a2 for both boot HART
+     * and non-boot HARTs
+     */
 	li	ra, 0
 	call	_reset_regs
 
-- 
2.25.1


