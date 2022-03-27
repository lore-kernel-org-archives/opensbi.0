From: Xiang W <wxjstz@126.com>
Date: Sun, 27 Mar 2022 16:33:59 +0800
Subject: [PATCH V3] include: Add check for offset of sbi_scratch
Message-ID: <20220327083359.67711-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add static detection to prevent the modification of struct sbi_scratch
from forgetting the modification of SBI_SCRATCH_xxx_OFFSET

Signed-off-by: Xiang W <wxjstz@126.com>
---
V3 change:
* reword commit message
* change comment style

 include/sbi/sbi_scratch.h | 59 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 0c27307..b08cdea 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -72,6 +72,65 @@ struct sbi_scratch {
 	/** Options for OpenSBI library */
 	unsigned long options;
 };
+/**
+ * Prevent modification of struct sbi_scratch from affecting
+ * SBI_SCRATCH_xxx_OFFSET 
+ */
+_Static_assert(
+	offsetof(struct sbi_scratch, fw_start)
+		== SBI_SCRATCH_FW_START_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_FW_START_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, fw_size)
+		== SBI_SCRATCH_FW_SIZE_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_FW_SIZE_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, next_arg1)
+		== SBI_SCRATCH_NEXT_ARG1_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_NEXT_ARG1_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, next_addr)
+		== SBI_SCRATCH_NEXT_ADDR_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_NEXT_ADDR_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, next_mode)
+		== SBI_SCRATCH_NEXT_MODE_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_NEXT_MODE_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, warmboot_addr)
+		== SBI_SCRATCH_WARMBOOT_ADDR_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_WARMBOOT_ADDR_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, platform_addr)
+		== SBI_SCRATCH_PLATFORM_ADDR_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_PLATFORM_ADDR_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, hartid_to_scratch)
+		== SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, trap_exit)
+		== SBI_SCRATCH_TRAP_EXIT_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_TRAP_EXIT_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, tmp0)
+		== SBI_SCRATCH_TMP0_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_TMP0_OFFSET");
+_Static_assert(
+	offsetof(struct sbi_scratch, options)
+		== SBI_SCRATCH_OPTIONS_OFFSET,
+	"struct sbi_scratch definition has changed, please redefine "
+	"SBI_SCRATCH_OPTIONS_OFFSET");
 
 /** Possible options for OpenSBI library */
 enum sbi_scratch_options {
-- 
2.30.2


