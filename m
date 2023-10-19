From: guoren@kernel.org <guoren@kernel.org>
Date: Thu, 19 Oct 2023 05:27:34 -0400
Subject: [PATCH] fw_base.S: Fix boot hart status synchronization
Message-ID: <20231019092734.2554798-1-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

It's wrong to put the fence after setting the boot status flag because
all relocation operations must be finished before setting the status
flag. So, this fence must be put before the setting status flag, and
there is no use in putting a fence between _start_warm and setting
status flag.

Also, nop can't delay other harts too much, so use div instead, just
like Linux cpu_relax. Current opensbi force enables ?M? Standard
Extension, and mul instructions have been used in the fw_base.S.

After the above two fixes, the boot hart index param of the
fw_dynamic_info could be guaranteed properly for all platforms.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 firmware/fw_base.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 42b03fe890f0..f7763f4d9e56 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -399,8 +399,8 @@ _fdt_reloc_done:
 	/* mark boot hart done */
 	li	t0, BOOT_STATUS_BOOT_HART_DONE
 	lla	t1, _boot_status
-	REG_S	t0, 0(t1)
 	fence	rw, rw
+	REG_S	t0, 0(t1)
 	j	_start_warm
 
 	/* waiting for boot hart to be done (_boot_status == 2) */
@@ -409,9 +409,9 @@ _wait_for_boot_hart:
 	lla	t1, _boot_status
 	REG_L	t1, 0(t1)
 	/* Reduce the bus traffic so that boot hart may proceed faster */
-	nop
-	nop
-	nop
+	div	t2, t2, zero
+	div	t2, t2, zero
+	div	t2, t2, zero
 	bne	t0, t1, _wait_for_boot_hart
 
 _start_warm:
-- 
2.36.1


