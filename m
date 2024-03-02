From: Xiang W <wxjstz@126.com>
Date: Sat,  2 Mar 2024 15:42:26 +0800
Subject: [PATCH v5 7/8] firmware: Improve fw_boot_hart
In-Reply-To: <20240302074235.12643-1-wxjstz@126.com>
References: <20240302074235.12643-1-wxjstz@126.com>
Message-ID: <20240302074235.12643-8-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Improve fw_boot_hart to reduce parameter saving and restoration.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S    |  7 ++-----
 firmware/fw_dynamic.S | 24 ++++++++++++------------
 firmware/fw_jump.S    |  6 +++---
 firmware/fw_payload.S |  6 +++---
 4 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index a798545..df5f769 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -38,14 +38,11 @@
 	.globl _start_warm
 _start:
 	/* Find preferred boot HART id */
-	MOV_3R	s0, a0, s1, a1, s2, a2
 	call	fw_boot_hart
-	add	a6, a0, zero
-	MOV_3R	a0, s0, a1, s1, a2, s2
 	li	a7, -1
-	beq	a6, a7, _try_lottery
+	beq	t0, a7, _try_lottery
 	/* Jump to relocation wait loop if we are not boot hart */
-	bne	a0, a6, _wait_for_boot_hart
+	bne	a0, t0, _wait_for_boot_hart
 _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
 	lla	a6, _boot_status
diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
index 5ee2883..52ef320 100644
--- a/firmware/fw_dynamic.S
+++ b/firmware/fw_dynamic.S
@@ -17,24 +17,24 @@
 	/*
 	 * This function is called very early even before
 	 * fw_save_info() is called.
-	 * We can only use a0, a1, and a2 registers here.
-	 * The boot HART id should be returned in 'a0'.
+	 * We can only use t0, t1, and t2 registers here.
+	 * The boot HART id should be returned in 't0'.
 	 */
 fw_boot_hart:
 	/* Sanity checks */
-	li	a1, FW_DYNAMIC_INFO_MAGIC_VALUE
-	REG_L	a0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
-	bne	a0, a1, _start_hang
-	li	a1, FW_DYNAMIC_INFO_VERSION_MAX
-	REG_L	a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
-	bgt	a0, a1, _start_hang
+	li	t1, FW_DYNAMIC_INFO_MAGIC_VALUE
+	REG_L	t0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
+	bne	t0, t1, _start_hang
+	li	t1, FW_DYNAMIC_INFO_VERSION_MAX
+	REG_L	t0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
+	bgt	t0, t1, _start_hang
 
 	/* Read boot HART id */
-	li	a1, FW_DYNAMIC_INFO_VERSION_2
-	blt	a0, a1, 2f
-	REG_L	a0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
+	li	t1, FW_DYNAMIC_INFO_VERSION_2
+	blt	t0, t1, 2f
+	REG_L	t0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
 	ret
-2:	li	a0, -1
+2:	li	t0, -1
 	ret
 
 	.section .entry, "ax", %progbits
diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
index ebf297f..ba46697 100644
--- a/firmware/fw_jump.S
+++ b/firmware/fw_jump.S
@@ -15,11 +15,11 @@
 	/*
 	 * This function is called very early even before
 	 * fw_save_info() is called.
-	 * We can only use a0, a1, and a2 registers here.
-	 * The boot HART id should be returned in 'a0'.
+	 * We can only use t0, t1, and t2 registers here.
+	 * The boot HART id should be returned in 't0'.
 	 */
 fw_boot_hart:
-	li	a0, -1
+	li	t0, -1
 	ret
 
 	.section .entry, "ax", %progbits
diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
index 3c8433e..02fd172 100644
--- a/firmware/fw_payload.S
+++ b/firmware/fw_payload.S
@@ -15,11 +15,11 @@
 	/*
 	 * This function is called very early even before
 	 * fw_save_info() is called.
-	 * We can only use a0, a1, and a2 registers here.
-	 * The boot HART id should be returned in 'a0'.
+	 * We can only use t0, t1, and t2 registers here.
+	 * The boot HART id should be returned in 't0'.
 	 */
 fw_boot_hart:
-	li	a0, -1
+	li	t0, -1
 	ret
 
 	.section .entry, "ax", %progbits
-- 
2.43.0


