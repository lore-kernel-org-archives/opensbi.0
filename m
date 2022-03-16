From: Xiang W <wxjstz@126.com>
Date: Wed, 16 Mar 2022 09:45:25 +0800
Subject: [PATCH] sbi: Prevent modification of struct sbi_platform from
 affecting SBI_PLATFORM_xxx_OFFSET
Message-ID: <20220316014525.57326-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add static detection to prevent the modification of struct sbi_platform
from forgetting the modification of SBI_PLATFORM_xxx_OFFSET

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_platform.h | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 0b5ae4b..87b582e 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -175,6 +175,54 @@ struct sbi_platform {
 	const u32 *hart_index2id;
 };
 
+/** Prevent modification of struct sbi_platform from affecting
+ * SBI_PLATFORM_xxx_OFFSET */
+_Static_assert(
+	offsetof(struct sbi_platform, opensbi_version)
+		== SBI_PLATFORM_OPENSBI_VERSION_OFFSET,
+	"struct sbi_platform definition has changed, please redefine "
+	"SBI_PLATFORM_OPENSBI_VERSION_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_platform, platform_version)
+		== SBI_PLATFORM_VERSION_OFFSET,
+	"struct sbi_platform definition has changed, please redefine "
+	"SBI_PLATFORM_VERSION_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_platform, name)
+		== SBI_PLATFORM_NAME_OFFSET,
+	"struct sbi_platform definition has changed, please redefine "
+	"SBI_PLATFORM_NAME_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_platform, features)
+		== SBI_PLATFORM_FEATURES_OFFSET,
+	"struct sbi_platform definition has changed, please redefine "
+	"SBI_PLATFORM_FEATURES_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_platform, hart_count)
+		== SBI_PLATFORM_HART_COUNT_OFFSET,
+	"struct sbi_platform definition has changed, please redefine "
+	"SBI_PLATFORM_HART_COUNT_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_platform, hart_stack_size)
+		== SBI_PLATFORM_HART_STACK_SIZE_OFFSET,
+	"struct sbi_platform definition has changed, please redefine "
+	"SBI_PLATFORM_HART_STACK_SIZE_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_platform, platform_ops_addr)
+		== SBI_PLATFORM_OPS_OFFSET,
+	"struct sbi_platform definition has changed, please redefine "
+	"SBI_PLATFORM_OPS_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_platform, firmware_context)
+		== SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET,
+	"struct sbi_platform definition has changed, please redefine "
+	"SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_platform, hart_index2id)
+		== SBI_PLATFORM_HART_INDEX2ID_OFFSET,
+	"struct sbi_platform definition has changed, please redefine "
+	"SBI_PLATFORM_HART_INDEX2ID_OFFSET");
+
 /** Get pointer to sbi_platform for sbi_scratch pointer */
 #define sbi_platform_ptr(__s) \
 	((const struct sbi_platform *)((__s)->platform_addr))
-- 
2.30.2


