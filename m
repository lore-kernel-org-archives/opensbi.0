From: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
Date: Mon, 12 Jul 2021 10:24:05 +0100
Subject: [PATCH 1/1] firware: use __SIZEOF_LONG__ for field offsets in
 fw_dynamic.h
Message-ID: <20210712092405.6772-1-Alexander.Richardson@cl.cam.ac.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fields are of type unsigned long and are not pointers. While this
happens to be the same for RV32/RV64, it is not correct when compiling
for a CHERI-RISC-V system where pointers are twice the size of long.

Signed-off-by: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
---
 include/sbi/fw_dynamic.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sbi/fw_dynamic.h b/include/sbi/fw_dynamic.h
index a07266e..dea207b 100644
--- a/include/sbi/fw_dynamic.h
+++ b/include/sbi/fw_dynamic.h
@@ -15,17 +15,17 @@
 /* clang-format off */
 
 /** Offset of magic member in fw_dynamic_info */
-#define FW_DYNAMIC_INFO_MAGIC_OFFSET		(0 * __SIZEOF_POINTER__)
+#define FW_DYNAMIC_INFO_MAGIC_OFFSET		(0 * __SIZEOF_LONG__)
 /** Offset of version member in fw_dynamic_info */
-#define FW_DYNAMIC_INFO_VERSION_OFFSET		(1 * __SIZEOF_POINTER__)
+#define FW_DYNAMIC_INFO_VERSION_OFFSET		(1 * __SIZEOF_LONG__)
 /** Offset of next_addr member in fw_dynamic_info (version >= 1) */
-#define FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET	(2 * __SIZEOF_POINTER__)
+#define FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET	(2 * __SIZEOF_LONG__)
 /** Offset of next_mode member in fw_dynamic_info  (version >= 1) */
-#define FW_DYNAMIC_INFO_NEXT_MODE_OFFSET	(3 * __SIZEOF_POINTER__)
+#define FW_DYNAMIC_INFO_NEXT_MODE_OFFSET	(3 * __SIZEOF_LONG__)
 /** Offset of options member in fw_dynamic_info  (version >= 1) */
-#define FW_DYNAMIC_INFO_OPTIONS_OFFSET		(4 * __SIZEOF_POINTER__)
+#define FW_DYNAMIC_INFO_OPTIONS_OFFSET		(4 * __SIZEOF_LONG__)
 /** Offset of boot_hart member in fw_dynamic_info  (version >= 2) */
-#define FW_DYNAMIC_INFO_BOOT_HART_OFFSET	(5 * __SIZEOF_POINTER__)
+#define FW_DYNAMIC_INFO_BOOT_HART_OFFSET	(5 * __SIZEOF_LONG__)
 
 /** Expected value of info magic ('OSBI' ascii string in hex) */
 #define FW_DYNAMIC_INFO_MAGIC_VALUE		0x4942534f
-- 
2.32.0


