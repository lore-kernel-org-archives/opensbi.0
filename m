From: Xiang W <wxjstz@126.com>
Date: Wed, 19 Mar 2025 20:39:13 +0800
Subject: [PATCH] lib: sbi: Simplify structure member offset checking
Message-ID: <20250319123919.505443-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a macro assert_member_offset to perform structure member offset
checking.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/fw_dynamic.h   | 36 ++++----------------
 include/sbi/sbi_platform.h | 56 ++++++------------------------
 include/sbi/sbi_scratch.h  | 70 ++++++++------------------------------
 include/sbi/sbi_types.h    |  7 ++++
 4 files changed, 39 insertions(+), 130 deletions(-)

diff --git a/include/sbi/fw_dynamic.h b/include/sbi/fw_dynamic.h
index 45c4d5f6..2ab4dbab 100644
--- a/include/sbi/fw_dynamic.h
+++ b/include/sbi/fw_dynamic.h
@@ -79,36 +79,12 @@ struct fw_dynamic_info {
  * Prevent modification of struct fw_dynamic_info from affecting
  * FW_DYNAMIC_INFO_xxx_OFFSET
  */
-_Static_assert(
-	offsetof(struct fw_dynamic_info, magic)
-		== FW_DYNAMIC_INFO_MAGIC_OFFSET,
-	"struct fw_dynamic_info definition has changed, please redefine "
-	"FW_DYNAMIC_INFO_MAGIC_OFFSET");
-_Static_assert(
-	offsetof(struct fw_dynamic_info, version)
-		== FW_DYNAMIC_INFO_VERSION_OFFSET,
-	"struct fw_dynamic_info definition has changed, please redefine "
-	"FW_DYNAMIC_INFO_VERSION_OFFSET");
-_Static_assert(
-	offsetof(struct fw_dynamic_info, next_addr)
-		== FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET,
-	"struct fw_dynamic_info definition has changed, please redefine "
-	"FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET");
-_Static_assert(
-	offsetof(struct fw_dynamic_info, next_mode)
-		== FW_DYNAMIC_INFO_NEXT_MODE_OFFSET,
-	"struct fw_dynamic_info definition has changed, please redefine "
-	"FW_DYNAMIC_INFO_NEXT_MODE_OFFSET");
-_Static_assert(
-	offsetof(struct fw_dynamic_info, options)
-		== FW_DYNAMIC_INFO_OPTIONS_OFFSET,
-	"struct fw_dynamic_info definition has changed, please redefine "
-	"FW_DYNAMIC_INFO_OPTIONS_OFFSET");
-_Static_assert(
-	offsetof(struct fw_dynamic_info, boot_hart)
-		== FW_DYNAMIC_INFO_BOOT_HART_OFFSET,
-	"struct fw_dynamic_info definition has changed, please redefine "
-	"FW_DYNAMIC_INFO_BOOT_HART_OFFSET");
+assert_member_offset(struct fw_dynamic_info, magic, FW_DYNAMIC_INFO_MAGIC_OFFSET);
+assert_member_offset(struct fw_dynamic_info, version, FW_DYNAMIC_INFO_VERSION_OFFSET);
+assert_member_offset(struct fw_dynamic_info, next_addr, FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET);
+assert_member_offset(struct fw_dynamic_info, next_mode, FW_DYNAMIC_INFO_NEXT_MODE_OFFSET);
+assert_member_offset(struct fw_dynamic_info, options, FW_DYNAMIC_INFO_OPTIONS_OFFSET);
+assert_member_offset(struct fw_dynamic_info, boot_hart, FW_DYNAMIC_INFO_BOOT_HART_OFFSET);
 
 #endif
 
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 6d5fbc7d..15abc3d0 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -203,51 +203,17 @@ struct sbi_platform {
  * Prevent modification of struct sbi_platform from affecting
  * SBI_PLATFORM_xxx_OFFSET
  */
-_Static_assert(
-	offsetof(struct sbi_platform, opensbi_version)
-		== SBI_PLATFORM_OPENSBI_VERSION_OFFSET,
-	"struct sbi_platform definition has changed, please redefine "
-	"SBI_PLATFORM_OPENSBI_VERSION_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_platform, platform_version)
-		== SBI_PLATFORM_VERSION_OFFSET,
-	"struct sbi_platform definition has changed, please redefine "
-	"SBI_PLATFORM_VERSION_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_platform, name)
-		== SBI_PLATFORM_NAME_OFFSET,
-	"struct sbi_platform definition has changed, please redefine "
-	"SBI_PLATFORM_NAME_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_platform, features)
-		== SBI_PLATFORM_FEATURES_OFFSET,
-	"struct sbi_platform definition has changed, please redefine "
-	"SBI_PLATFORM_FEATURES_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_platform, hart_count)
-		== SBI_PLATFORM_HART_COUNT_OFFSET,
-	"struct sbi_platform definition has changed, please redefine "
-	"SBI_PLATFORM_HART_COUNT_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_platform, hart_stack_size)
-		== SBI_PLATFORM_HART_STACK_SIZE_OFFSET,
-	"struct sbi_platform definition has changed, please redefine "
-	"SBI_PLATFORM_HART_STACK_SIZE_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_platform, platform_ops_addr)
-		== SBI_PLATFORM_OPS_OFFSET,
-	"struct sbi_platform definition has changed, please redefine "
-	"SBI_PLATFORM_OPS_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_platform, firmware_context)
-		== SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET,
-	"struct sbi_platform definition has changed, please redefine "
-	"SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_platform, hart_index2id)
-		== SBI_PLATFORM_HART_INDEX2ID_OFFSET,
-	"struct sbi_platform definition has changed, please redefine "
-	"SBI_PLATFORM_HART_INDEX2ID_OFFSET");
+assert_member_offset(struct sbi_platform, opensbi_version, SBI_PLATFORM_OPENSBI_VERSION_OFFSET);
+assert_member_offset(struct sbi_platform, platform_version, SBI_PLATFORM_VERSION_OFFSET);
+assert_member_offset(struct sbi_platform, name, SBI_PLATFORM_NAME_OFFSET);
+assert_member_offset(struct sbi_platform, features, SBI_PLATFORM_FEATURES_OFFSET);
+assert_member_offset(struct sbi_platform, hart_count, SBI_PLATFORM_HART_COUNT_OFFSET);
+assert_member_offset(struct sbi_platform, hart_stack_size, SBI_PLATFORM_HART_STACK_SIZE_OFFSET);
+assert_member_offset(struct sbi_platform, heap_size, SBI_PLATFORM_HEAP_SIZE_OFFSET);
+assert_member_offset(struct sbi_platform, reserved, SBI_PLATFORM_RESERVED_OFFSET);
+assert_member_offset(struct sbi_platform, platform_ops_addr, SBI_PLATFORM_OPS_OFFSET);
+assert_member_offset(struct sbi_platform, firmware_context, SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET);
+assert_member_offset(struct sbi_platform, hart_index2id, SBI_PLATFORM_HART_INDEX2ID_OFFSET);
 
 /** Get pointer to sbi_platform for sbi_scratch pointer */
 #define sbi_platform_ptr(__s) \
diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 0d188d12..cb83b368 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -93,61 +93,21 @@ struct sbi_scratch {
  * Prevent modification of struct sbi_scratch from affecting
  * SBI_SCRATCH_xxx_OFFSET
  */
-_Static_assert(
-	offsetof(struct sbi_scratch, fw_start)
-		== SBI_SCRATCH_FW_START_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_FW_START_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, fw_size)
-		== SBI_SCRATCH_FW_SIZE_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_FW_SIZE_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, next_arg1)
-		== SBI_SCRATCH_NEXT_ARG1_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_NEXT_ARG1_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, next_addr)
-		== SBI_SCRATCH_NEXT_ADDR_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_NEXT_ADDR_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, next_mode)
-		== SBI_SCRATCH_NEXT_MODE_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_NEXT_MODE_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, warmboot_addr)
-		== SBI_SCRATCH_WARMBOOT_ADDR_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_WARMBOOT_ADDR_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, platform_addr)
-		== SBI_SCRATCH_PLATFORM_ADDR_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_PLATFORM_ADDR_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, hartid_to_scratch)
-		== SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, trap_context)
-		== SBI_SCRATCH_TRAP_CONTEXT_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_TRAP_CONTEXT_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, tmp0)
-		== SBI_SCRATCH_TMP0_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_TMP0_OFFSET");
-_Static_assert(
-	offsetof(struct sbi_scratch, options)
-		== SBI_SCRATCH_OPTIONS_OFFSET,
-	"struct sbi_scratch definition has changed, please redefine "
-	"SBI_SCRATCH_OPTIONS_OFFSET");
+assert_member_offset(struct sbi_scratch, fw_start, SBI_SCRATCH_FW_START_OFFSET);
+assert_member_offset(struct sbi_scratch, fw_size, SBI_SCRATCH_FW_SIZE_OFFSET);
+assert_member_offset(struct sbi_scratch, fw_rw_offset, SBI_SCRATCH_FW_RW_OFFSET);
+assert_member_offset(struct sbi_scratch, fw_heap_offset, SBI_SCRATCH_FW_HEAP_OFFSET);
+assert_member_offset(struct sbi_scratch, fw_heap_size, SBI_SCRATCH_FW_HEAP_SIZE_OFFSET);
+assert_member_offset(struct sbi_scratch, next_arg1, SBI_SCRATCH_NEXT_ARG1_OFFSET);
+assert_member_offset(struct sbi_scratch, next_addr, SBI_SCRATCH_NEXT_ADDR_OFFSET);
+assert_member_offset(struct sbi_scratch, next_mode, SBI_SCRATCH_NEXT_MODE_OFFSET);
+assert_member_offset(struct sbi_scratch, warmboot_addr, SBI_SCRATCH_WARMBOOT_ADDR_OFFSET);
+assert_member_offset(struct sbi_scratch, platform_addr, SBI_SCRATCH_PLATFORM_ADDR_OFFSET);
+assert_member_offset(struct sbi_scratch, hartid_to_scratch, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET);
+assert_member_offset(struct sbi_scratch, trap_context, SBI_SCRATCH_TRAP_CONTEXT_OFFSET);
+assert_member_offset(struct sbi_scratch, tmp0, SBI_SCRATCH_TMP0_OFFSET);
+assert_member_offset(struct sbi_scratch, options, SBI_SCRATCH_OPTIONS_OFFSET);
+assert_member_offset(struct sbi_scratch, hartindex, SBI_SCRATCH_HARTINDEX_OFFSET);
 
 /** Possible options for OpenSBI library */
 enum sbi_scratch_options {
diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index 90b0d458..2637faf7 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -96,6 +96,13 @@ typedef uint64_t		be64_t;
 	const typeof(((type *)0)->member) * __mptr = (ptr);	\
 	(type *)((char *)__mptr - offsetof(type, member)); })
 
+
+#define assert_member_offset(type, member, offset)			\
+	_Static_assert(							\
+		(offsetof(type, member)) == (offset ),			\
+		"The offset " #offset " of " #member " in " #type	\
+		"is not correct, please redefine it.")
+
 #define array_size(x) 	(sizeof(x) / sizeof((x)[0]))
 
 #define MAX(a, b) ((a) > (b) ? (a) : (b))
-- 
2.47.2


