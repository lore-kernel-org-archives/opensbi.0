From: Xiang W <wxjstz@126.com>
Date: Sun, 27 Mar 2022 16:29:43 +0800
Subject: [PATCH V5] include: Add check for offset of fw_dynamic_info
Message-ID: <20220327082943.66976-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add static detection to prevent the modification of struct fw_dynamic_info
from forgetting the modification of FW_DYNAMIC_INFO_xxx_OFFSET

Signed-off-by: Xiang W <wxjstz@126.com>
---
V5 change:
* reword commit message

I'm sorry for my careless, change to much

 include/sbi/fw_dynamic.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/sbi/fw_dynamic.h b/include/sbi/fw_dynamic.h
index dea207b..d007b05 100644
--- a/include/sbi/fw_dynamic.h
+++ b/include/sbi/fw_dynamic.h
@@ -74,6 +74,40 @@ struct fw_dynamic_info {
 	 */
 	unsigned long boot_hart;
 } __packed;
+/**
+ * Prevent modification of struct fw_dynamic_info from affecting
+ * FW_DYNAMIC_INFO_xxx_OFFSET
+ */
+_Static_assert(
+	offsetof(struct fw_dynamic_info, magic)
+		== FW_DYNAMIC_INFO_MAGIC_OFFSET,
+	"struct fw_dynamic_info definition has changed, please redefine "
+	"FW_DYNAMIC_INFO_MAGIC_OFFSET");
+_Static_assert(
+	offsetof(struct fw_dynamic_info, version)
+		== FW_DYNAMIC_INFO_VERSION_OFFSET,
+	"struct fw_dynamic_info definition has changed, please redefine "
+	"FW_DYNAMIC_INFO_VERSION_OFFSET");
+_Static_assert(
+	offsetof(struct fw_dynamic_info, next_addr)
+		== FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET,
+	"struct fw_dynamic_info definition has changed, please redefine "
+	"FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET");
+_Static_assert(
+	offsetof(struct fw_dynamic_info, next_mode)
+		== FW_DYNAMIC_INFO_NEXT_MODE_OFFSET,
+	"struct fw_dynamic_info definition has changed, please redefine "
+	"FW_DYNAMIC_INFO_NEXT_MODE_OFFSET");
+_Static_assert(
+	offsetof(struct fw_dynamic_info, options)
+		== FW_DYNAMIC_INFO_OPTIONS_OFFSET,
+	"struct fw_dynamic_info definition has changed, please redefine "
+	"FW_DYNAMIC_INFO_OPTIONS_OFFSET");
+_Static_assert(
+	offsetof(struct fw_dynamic_info, boot_hart)
+		== FW_DYNAMIC_INFO_BOOT_HART_OFFSET,
+	"struct fw_dynamic_info definition has changed, please redefine "
+	"FW_DYNAMIC_INFO_BOOT_HART_OFFSET");
 
 #endif
 
-- 
2.30.2


