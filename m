From: Xiang W <wxjstz@126.com>
Date: Mon, 12 Feb 2024 00:11:29 +0800
Subject: [PATCH v4 5/8] firmware: fw_base.S: Remove _relocate_lottery
In-Reply-To: <20240211161138.2538981-1-wxjstz@126.com>
References: <20240211161138.2538981-1-wxjstz@126.com>
Message-ID: <20240211161138.2538981-6-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove _relocate_lottery and use _boot_status instead

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index f0dd0da..10fee4f 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -14,7 +14,8 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_trap.h>
 
-#define BOOT_STATUS_BOOT_HART_DONE	1
+#define BOOT_STATUS_LOTTERY_DONE	1
+#define BOOT_STATUS_BOOT_HART_DONE	2
 
 .macro	MOV_3R __d0, __s0, __d1, __s1, __d2, __s2
 	add	\__d0, \__s0, zero
@@ -47,8 +48,8 @@ _start:
 	bne	a0, a6, _wait_for_boot_hart
 _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
-	lla	a6, _relocate_lottery
-	li	a7, 1
+	lla	a6, _boot_status
+	li	a7, BOOT_STATUS_LOTTERY_DONE
 	amoadd.w a6, a7, (a6)
 	bnez	a6, _wait_for_boot_hart
 
@@ -380,8 +381,6 @@ _skip_trap_handler_rv32_hyp:
 
 	.data
 	.align 3
-_relocate_lottery:
-	RISCV_PTR	0
 _boot_status:
 	RISCV_PTR	0
 
-- 
2.43.0


