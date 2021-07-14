From: Xiang W <wxjstz@126.com>
Date: Wed, 14 Jul 2021 15:14:39 +0800
Subject: [PATCH] firmware: use _fw_start for load address
Message-ID: <20210714071439.38674-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The previous code uses _start as the load address, this default .entry is
the first segment, using _fw_start does not need to make this assumption.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S   | 6 +++---
 firmware/fw_base.ldS | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 928ca91..63408d1 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -65,14 +65,14 @@ _try_lottery:
 
 	/* Save load address */
 	lla	t0, _load_start
-	lla	t1, _start
+	lla	t1, _fw_start
 	REG_S	t1, 0(t0)
 
 #ifdef FW_PIC
 	/* relocate the global table content */
 	lla	t0, _link_start
 	REG_L	t0, 0(t0)
-	/* t1 shall has the address of _start */
+	/* t1 shall has the address of _fw_start */
 	sub	t2, t1, t0
 	lla	t3, _runtime_offset
 	REG_S	t2, (t3)
@@ -172,7 +172,7 @@ _relocate_copy_to_upper_loop:
 	blt	t0, t1, _relocate_copy_to_upper_loop
 	jr	t4
 _wait_relocate_copy_done:
-	lla	t0, _start
+	lla	t0, _fw_start
 	lla	t1, _link_start
 	REG_L	t1, 0(t1)
 	beq	t0, t1, _wait_for_boot_hart
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 0d222da..0738767 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -8,7 +8,7 @@
  */
 
 	. = FW_TEXT_START;
-
+	/* don't add any section between FW_TEXT_START and _fw_start */
 	PROVIDE(_fw_start = .);
 
 	. = ALIGN(0x1000); /* Need this to create proper sections */
-- 
2.30.2


