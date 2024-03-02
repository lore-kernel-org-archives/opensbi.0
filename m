From: Xiang W <wxjstz@126.com>
Date: Sat,  2 Mar 2024 15:42:23 +0800
Subject: [PATCH v5 4/8] firmware: fw_dynamic.S: Remove _bad_dynamic_info
In-Reply-To: <20240302074235.12643-1-wxjstz@126.com>
References: <20240302074235.12643-1-wxjstz@126.com>
Message-ID: <20240302074235.12643-5-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

_bad_dynamic_info is same as _start_hang, so remove it.

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 firmware/fw_dynamic.S | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
index 7ff1c6a..5ee2883 100644
--- a/firmware/fw_dynamic.S
+++ b/firmware/fw_dynamic.S
@@ -11,12 +11,6 @@
 
 #include "fw_base.S"
 
-	.section .entry, "ax", %progbits
-	.align 3
-_bad_dynamic_info:
-	wfi
-	j	_bad_dynamic_info
-
 	.section .entry, "ax", %progbits
 	.align 3
 	.global fw_boot_hart
@@ -30,10 +24,10 @@ fw_boot_hart:
 	/* Sanity checks */
 	li	a1, FW_DYNAMIC_INFO_MAGIC_VALUE
 	REG_L	a0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
-	bne	a0, a1, _bad_dynamic_info
+	bne	a0, a1, _start_hang
 	li	a1, FW_DYNAMIC_INFO_VERSION_MAX
 	REG_L	a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
-	bgt	a0, a1, _bad_dynamic_info
+	bgt	a0, a1, _start_hang
 
 	/* Read boot HART id */
 	li	a1, FW_DYNAMIC_INFO_VERSION_2
-- 
2.43.0


