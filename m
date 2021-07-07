From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed,  7 Jul 2021 16:22:41 +0800
Subject: [PATCH] firmware: Define a macro for version of struct fw_dynamic_info
Message-ID: <20210707082241.2587-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Avoid using a magic number, instead use a macro for the version of
struct fw_dynamic_info.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 firmware/fw_dynamic.S    | 4 ++--
 include/sbi/fw_dynamic.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
index 0705e63..2b7ec3b 100644
--- a/firmware/fw_dynamic.S
+++ b/firmware/fw_dynamic.S
@@ -36,7 +36,7 @@ fw_boot_hart:
 	bgt	a0, a1, _bad_dynamic_info
 
 	/* Read boot HART id */
-	li	a1, 0x2
+	li	a1, FW_DYNAMIC_INFO_VERSION_2
 	blt	a0, a1, 2f
 	REG_L	a0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
 	ret
@@ -77,7 +77,7 @@ fw_save_info:
 	REG_S	a3, (a4)
 
 	/* Save version == 0x2 fields */
-	li	a4, 0x2
+	li	a4, FW_DYNAMIC_INFO_VERSION_2
 	REG_L	a3, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
 	blt	a3, a4, 2f
 	lla	a4, _dynamic_boot_hart
diff --git a/include/sbi/fw_dynamic.h b/include/sbi/fw_dynamic.h
index 25c0eb8..a07266e 100644
--- a/include/sbi/fw_dynamic.h
+++ b/include/sbi/fw_dynamic.h
@@ -31,7 +31,8 @@
 #define FW_DYNAMIC_INFO_MAGIC_VALUE		0x4942534f
 
 /** Maximum supported info version */
-#define FW_DYNAMIC_INFO_VERSION_MAX		0x2
+#define FW_DYNAMIC_INFO_VERSION_2		0x2
+#define FW_DYNAMIC_INFO_VERSION_MAX		FW_DYNAMIC_INFO_VERSION_2
 
 /** Possible next mode values */
 #define FW_DYNAMIC_INFO_NEXT_MODE_U		0x0
-- 
2.25.1


