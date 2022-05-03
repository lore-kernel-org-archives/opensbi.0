From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:58 +0530
Subject: [PATCH 10/11] platform: generic: Generate platform override module
 list at compile-time
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-11-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having platform override module list hard-coded in the C source,
we generate it using carray.sh at compile-time.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 platform/generic/objects.mk                       |  5 +++++
 platform/generic/platform.c                       | 14 +++++---------
 platform/generic/platform_override_modules.carray |  3 +++
 3 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 platform/generic/platform_override_modules.carray

diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index cb15a18..6f63e69 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -8,5 +8,10 @@
 #
 
 platform-objs-y += platform.o
+platform-objs-y += platform_override_modules.o
+
+carray-platform_override_modules-y += sifive_fu540
 platform-objs-y += sifive_fu540.o
+
+carray-platform_override_modules-y += sifive_fu740
 platform-objs-y += sifive_fu740.o
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 8a4fb70..35c5ee4 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -24,13 +24,9 @@
 #include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/reset/fdt_reset.h>
 
-extern const struct platform_override sifive_fu540;
-extern const struct platform_override sifive_fu740;
-
-static const struct platform_override *special_platforms[] = {
-	&sifive_fu540,
-	&sifive_fu740,
-};
+/* List of platform override modules generated at compile time */
+extern const struct platform_override *platform_override_modules[];
+extern unsigned long platform_override_modules_size;
 
 static const struct platform_override *generic_plat = NULL;
 static const struct fdt_match *generic_plat_match = NULL;
@@ -41,8 +37,8 @@ static void fw_platform_lookup_special(void *fdt, int root_offset)
 	const struct platform_override *plat;
 	const struct fdt_match *match;
 
-	for (pos = 0; pos < array_size(special_platforms); pos++) {
-		plat = special_platforms[pos];
+	for (pos = 0; pos < platform_override_modules_size; pos++) {
+		plat = platform_override_modules[pos];
 		if (!plat->match_table)
 			continue;
 
diff --git a/platform/generic/platform_override_modules.carray b/platform/generic/platform_override_modules.carray
new file mode 100644
index 0000000..ab9d47f
--- /dev/null
+++ b/platform/generic/platform_override_modules.carray
@@ -0,0 +1,3 @@
+HEADER: platform_override.h
+TYPE: const struct platform_override
+NAME: platform_override_modules
-- 
2.34.1


