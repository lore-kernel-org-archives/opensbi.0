From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 13 Feb 2023 10:48:05 +0530
Subject: [PATCH 2/2] include: sbi: Remove extid parameter from vendor_ext_provider() callback
In-Reply-To: <20230213051805.603113-1-apatel@ventanamicro.com>
References: <20230213051805.603113-1-apatel@ventanamicro.com>
Message-ID: <20230213051805.603113-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The extid parameter of vendor_ext_provider() is redundant so let us
remove it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_platform.h                   | 9 ++++-----
 lib/sbi/sbi_ecall_vendor.c                   | 2 +-
 platform/generic/include/platform_override.h | 2 +-
 platform/generic/platform.c                  | 4 ++--
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 3a629a6..546c0a6 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -129,7 +129,7 @@ struct sbi_platform_operations {
 	/** Check if SBI vendor extension is implemented or not */
 	bool (*vendor_ext_check)(void);
 	/** platform specific SBI extension implementation provider */
-	int (*vendor_ext_provider)(long extid, long funcid,
+	int (*vendor_ext_provider)(long funcid,
 				   const struct sbi_trap_regs *regs,
 				   unsigned long *out_value,
 				   struct sbi_trap_info *out_trap);
@@ -655,7 +655,6 @@ static inline bool sbi_platform_vendor_ext_check(
  * Invoke platform specific vendor SBI extension implementation.
  *
  * @param plat pointer to struct sbi_platform
- * @param extid	vendor SBI extension id
  * @param funcid SBI function id within the extension id
  * @param regs pointer to trap registers passed by the caller
  * @param out_value output value that can be filled by the callee
@@ -665,14 +664,14 @@ static inline bool sbi_platform_vendor_ext_check(
  */
 static inline int sbi_platform_vendor_ext_provider(
 					const struct sbi_platform *plat,
-					long extid, long funcid,
+					long funcid,
 					const struct sbi_trap_regs *regs,
 					unsigned long *out_value,
 					struct sbi_trap_info *out_trap)
 {
 	if (plat && sbi_platform_ops(plat)->vendor_ext_provider) {
-		return sbi_platform_ops(plat)->vendor_ext_provider(extid,
-								funcid, regs,
+		return sbi_platform_ops(plat)->vendor_ext_provider(funcid,
+								regs,
 								out_value,
 								out_trap);
 	}
diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
index 9ea5156..8b8dab0 100644
--- a/lib/sbi/sbi_ecall_vendor.c
+++ b/lib/sbi/sbi_ecall_vendor.c
@@ -43,7 +43,7 @@ static int sbi_ecall_vendor_handler(unsigned long extid, unsigned long funcid,
 		return SBI_ERR_NOT_SUPPORTED;
 
 	return sbi_platform_vendor_ext_provider(sbi_platform_thishart_ptr(),
-						extid, funcid, regs,
+						funcid, regs,
 						out_val, out_trap);
 }
 
diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 350c381..0d9e5ee 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -27,7 +27,7 @@ struct platform_override {
 	int (*extensions_init)(const struct fdt_match *match,
 			       struct sbi_hart_features *hfeatures);
 	void (*fw_init)(void *fdt, const struct fdt_match *match);
-	int (*vendor_ext_provider)(long extid, long funcid,
+	int (*vendor_ext_provider)(long funcid,
 				   const struct sbi_trap_regs *regs,
 				   unsigned long *out_value,
 				   struct sbi_trap_info *out_trap,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 88c3ec7..0b90fd7 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -186,12 +186,12 @@ static bool generic_vendor_ext_check(void)
 		true : false;
 }
 
-static int generic_vendor_ext_provider(long extid, long funcid,
+static int generic_vendor_ext_provider(long funcid,
 				       const struct sbi_trap_regs *regs,
 				       unsigned long *out_value,
 				       struct sbi_trap_info *out_trap)
 {
-	return generic_plat->vendor_ext_provider(extid, funcid, regs,
+	return generic_plat->vendor_ext_provider(funcid, regs,
 						 out_value, out_trap,
 						 generic_plat_match);
 }
-- 
2.34.1


