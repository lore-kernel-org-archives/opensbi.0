From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 25 Nov 2020 10:46:44 +0530
Subject: [PATCH v3 2/5] include: sbi: Remove opensbi specific reset type
 defines
In-Reply-To: <20201125051647.295472-1-anup.patel@wdc.com>
References: <20201125051647.295472-1-anup.patel@wdc.com>
Message-ID: <20201125051647.295472-3-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We can now use the standard SBI SRST extension reset types instead
of the opensbi specific (SBI_PLATFORM_RESET_xyz) reset types hence
remove related opensbi specific defines. The "platform_" prefix of
the reset type parameter of sbi_system_reset() function should also
be removed.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_platform.h  | 4 +---
 include/sbi/sbi_system.h    | 2 +-
 lib/sbi/sbi_ecall_legacy.c  | 2 +-
 lib/sbi/sbi_system.c        | 4 ++--
 lib/utils/sys/sifive_test.c | 6 +++---
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 7a8c113..3f4a733 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -40,6 +40,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_version.h>
@@ -139,9 +140,6 @@ struct sbi_platform_operations {
 	int (*hart_stop)(void);
 
 	/** Reset the platform */
-#define SBI_PLATFORM_RESET_SHUTDOWN	0
-#define SBI_PLATFORM_RESET_COLD		1
-#define SBI_PLATFORM_RESET_WARM		2
 	int (*system_reset)(u32 reset_type);
 
 	/** platform specific SBI extension implementation probe function */
diff --git a/include/sbi/sbi_system.h b/include/sbi/sbi_system.h
index d44ef12..309e263 100644
--- a/include/sbi/sbi_system.h
+++ b/include/sbi/sbi_system.h
@@ -12,6 +12,6 @@
 
 #include <sbi/sbi_types.h>
 
-void __noreturn sbi_system_reset(u32 platform_reset_type);
+void __noreturn sbi_system_reset(u32 reset_type);
 
 #endif
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 909cbe3..683b8dc 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -103,7 +103,7 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 		}
 		break;
 	case SBI_EXT_0_1_SHUTDOWN:
-		sbi_system_reset(SBI_PLATFORM_RESET_SHUTDOWN);
+		sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN);
 		break;
 	default:
 		ret = SBI_ENOTSUPP;
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index 96290b3..2f1b7fb 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -18,7 +18,7 @@
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_init.h>
 
-void __noreturn sbi_system_reset(u32 platform_reset_type)
+void __noreturn sbi_system_reset(u32 reset_type)
 {
 	ulong hbase = 0, hmask;
 	u32 cur_hartid = current_hartid();
@@ -40,7 +40,7 @@ void __noreturn sbi_system_reset(u32 platform_reset_type)
 	/* Platform specific reset if domain allowed system reset */
 	if (dom->system_reset_allowed)
 		sbi_platform_system_reset(sbi_platform_ptr(scratch),
-					  platform_reset_type);
+					  reset_type);
 
 	/* If platform specific reset did not work then do sbi_exit() */
 	sbi_exit(scratch);
diff --git a/lib/utils/sys/sifive_test.c b/lib/utils/sys/sifive_test.c
index 15369da..06fbfb2 100644
--- a/lib/utils/sys/sifive_test.c
+++ b/lib/utils/sys/sifive_test.c
@@ -24,11 +24,11 @@ int sifive_test_system_reset(u32 type)
 	 * was successful so that QEMU exits
 	 */
 	switch (type) {
-	case SBI_PLATFORM_RESET_SHUTDOWN:
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
 		writew(FINISHER_PASS, sifive_test_base);
 		break;
-	case SBI_PLATFORM_RESET_COLD:
-	case SBI_PLATFORM_RESET_WARM:
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
 		writew(FINISHER_RESET, sifive_test_base);
 		break;
 	}
-- 
2.25.1


