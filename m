From: Xiang W <wxjstz@126.com>
Date: Sat,  2 Mar 2024 15:42:24 +0800
Subject: [PATCH v5 5/8] firmware: fw_base.S: Remove _relocate_lottery
In-Reply-To: <20240302074235.12643-1-wxjstz@126.com>
References: <20240302074235.12643-1-wxjstz@126.com>
Message-ID: <20240302074235.12643-6-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove _relocate_lottery and use _boot_status instead

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index f0dd0da..6f40d82 100644
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
@@ -47,9 +48,9 @@ _start:
 	bne	a0, a6, _wait_for_boot_hart
 _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
-	lla	a6, _relocate_lottery
-	li	a7, 1
-	amoadd.w a6, a7, (a6)
+	lla	a6, _boot_status
+	li	a7, BOOT_STATUS_LOTTERY_DONE
+	amoswap.w a6, a7, (a6)
 	bnez	a6, _wait_for_boot_hart
 
 	/* relocate the global table content */
@@ -380,8 +381,6 @@ _skip_trap_handler_rv32_hyp:
 
 	.data
 	.align 3
-_relocate_lottery:
-	RISCV_PTR	0
 _boot_status:
 	RISCV_PTR	0
 
-- 
2.43.0


