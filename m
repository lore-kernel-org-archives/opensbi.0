From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 22 Dec 2024 11:33:27 +0530
Subject: [PATCH 1/2] lib: sbi: Print list of available SBI extensions at boot-time
Message-ID: <20241222060328.469014-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add boot-time prints for list of available standard and experimental
SBI extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ecall.h    |  6 ++++++
 lib/sbi/sbi_ecall.c        | 24 ++++++++++++++++++++++++
 lib/sbi/sbi_ecall_base.c   |  1 +
 lib/sbi/sbi_ecall_cppc.c   |  1 +
 lib/sbi/sbi_ecall_dbcn.c   |  1 +
 lib/sbi/sbi_ecall_dbtr.c   | 10 ++++++----
 lib/sbi/sbi_ecall_fwft.c   | 10 ++++++----
 lib/sbi/sbi_ecall_hsm.c    |  1 +
 lib/sbi/sbi_ecall_ipi.c    |  1 +
 lib/sbi/sbi_ecall_legacy.c |  1 +
 lib/sbi/sbi_ecall_mpxy.c   |  2 ++
 lib/sbi/sbi_ecall_pmu.c    |  1 +
 lib/sbi/sbi_ecall_rfence.c |  1 +
 lib/sbi/sbi_ecall_srst.c   |  1 +
 lib/sbi/sbi_ecall_sse.c    |  2 ++
 lib/sbi/sbi_ecall_susp.c   |  1 +
 lib/sbi/sbi_ecall_time.c   |  1 +
 lib/sbi/sbi_ecall_vendor.c |  1 +
 lib/sbi/sbi_init.c         |  6 +++++-
 19 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index 0b35eff7..88a69bb3 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -30,6 +30,8 @@ struct sbi_ecall_return {
 struct sbi_ecall_extension {
 	/* head is used by the extension list */
 	struct sbi_dlist head;
+	/* short name of the extension */
+	char name[8];
 	/*
 	 * extid_start and extid_end specify the range for this extension. As
 	 * the initial range may be wider than the valid runtime range, the
@@ -38,6 +40,8 @@ struct sbi_ecall_extension {
 	 */
 	unsigned long extid_start;
 	unsigned long extid_end;
+	/* flag showing whether given extension is experimental or not */
+	bool experimental;
 	/*
 	 * register_extensions
 	 *
@@ -83,6 +87,8 @@ void sbi_ecall_set_impid(unsigned long impid);
 
 struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid);
 
+void sbi_ecall_get_extensions_str(char *exts_str, int exts_str_size, bool experimental);
+
 int sbi_ecall_register_extension(struct sbi_ecall_extension *ext);
 
 void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext);
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index be0b67e1..3fa3a9e8 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
 
 extern struct sbi_ecall_extension *const sbi_ecall_exts[];
@@ -53,6 +54,29 @@ struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid)
 	return ret;
 }
 
+void sbi_ecall_get_extensions_str(char *exts_str, int exts_str_size, bool experimental)
+{
+	struct sbi_ecall_extension *t;
+	int offset = 0;
+
+	if (!exts_str || exts_str_size <= 0)
+		return;
+	sbi_memset(exts_str, 0, exts_str_size);
+
+	sbi_list_for_each_entry(t, &ecall_exts_list, head) {
+		if (experimental != t->experimental)
+			continue;
+		sbi_snprintf(exts_str + offset, exts_str_size - offset,
+			     "%s,", t->name);
+		offset = offset + sbi_strlen(t->name) + 1;
+	}
+
+	if (offset)
+		exts_str[offset - 1] = '\0';
+	else
+		sbi_strncpy(exts_str, "none", exts_str_size);
+}
+
 int sbi_ecall_register_extension(struct sbi_ecall_extension *ext)
 {
 	struct sbi_ecall_extension *t;
diff --git a/lib/sbi/sbi_ecall_base.c b/lib/sbi/sbi_ecall_base.c
index b7178ea8..d125cedc 100644
--- a/lib/sbi/sbi_ecall_base.c
+++ b/lib/sbi/sbi_ecall_base.c
@@ -79,6 +79,7 @@ static int sbi_ecall_base_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_base = {
+	.name			= "base",
 	.extid_start		= SBI_EXT_BASE,
 	.extid_end		= SBI_EXT_BASE,
 	.register_extensions	= sbi_ecall_base_register_extensions,
diff --git a/lib/sbi/sbi_ecall_cppc.c b/lib/sbi/sbi_ecall_cppc.c
index dab78299..4840c908 100644
--- a/lib/sbi/sbi_ecall_cppc.c
+++ b/lib/sbi/sbi_ecall_cppc.c
@@ -65,6 +65,7 @@ static int sbi_ecall_cppc_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_cppc = {
+	.name			= "cppc",
 	.extid_start		= SBI_EXT_CPPC,
 	.extid_end		= SBI_EXT_CPPC,
 	.register_extensions	= sbi_ecall_cppc_register_extensions,
diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index 49a7713f..1b0aebdc 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -74,6 +74,7 @@ static int sbi_ecall_dbcn_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_dbcn = {
+	.name			= "dbcn",
 	.extid_start		= SBI_EXT_DBCN,
 	.extid_end		= SBI_EXT_DBCN,
 	.register_extensions	= sbi_ecall_dbcn_register_extensions,
diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
index 6a7dfe67..d28fd396 100644
--- a/lib/sbi/sbi_ecall_dbtr.c
+++ b/lib/sbi/sbi_ecall_dbtr.c
@@ -66,8 +66,10 @@ static int sbi_ecall_dbtr_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_dbtr = {
-	.extid_start = SBI_EXT_DBTR,
-	.extid_end = SBI_EXT_DBTR,
-	.handle = sbi_ecall_dbtr_handler,
-	.register_extensions = sbi_ecall_dbtr_register_extensions,
+	.name			= "dbtr",
+	.extid_start		= SBI_EXT_DBTR,
+	.extid_end		= SBI_EXT_DBTR,
+	.experimental		= true,
+	.handle			= sbi_ecall_dbtr_handler,
+	.register_extensions	= sbi_ecall_dbtr_register_extensions,
 };
diff --git a/lib/sbi/sbi_ecall_fwft.c b/lib/sbi/sbi_ecall_fwft.c
index 267cbab2..3519285e 100644
--- a/lib/sbi/sbi_ecall_fwft.c
+++ b/lib/sbi/sbi_ecall_fwft.c
@@ -42,8 +42,10 @@ static int sbi_ecall_fwft_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_fwft = {
-	.extid_start = SBI_EXT_FWFT,
-	.extid_end = SBI_EXT_FWFT,
-	.register_extensions = sbi_ecall_fwft_register_extensions,
-	.handle = sbi_ecall_fwft_handler,
+	.name			= "fwft",
+	.extid_start		= SBI_EXT_FWFT,
+	.extid_end		= SBI_EXT_FWFT,
+	.experimental		= true,
+	.register_extensions	= sbi_ecall_fwft_register_extensions,
+	.handle			= sbi_ecall_fwft_handler,
 };
diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index 93170b09..a6e83b05 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -61,6 +61,7 @@ static int sbi_ecall_hsm_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_hsm = {
+	.name			= "hsm",
 	.extid_start		= SBI_EXT_HSM,
 	.extid_end		= SBI_EXT_HSM,
 	.register_extensions	= sbi_ecall_hsm_register_extensions,
diff --git a/lib/sbi/sbi_ecall_ipi.c b/lib/sbi/sbi_ecall_ipi.c
index 50ef41dc..ec579ce0 100644
--- a/lib/sbi/sbi_ecall_ipi.c
+++ b/lib/sbi/sbi_ecall_ipi.c
@@ -36,6 +36,7 @@ static int sbi_ecall_ipi_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_ipi = {
+	.name			= "ipi",
 	.extid_start		= SBI_EXT_IPI,
 	.extid_end		= SBI_EXT_IPI,
 	.register_extensions	= sbi_ecall_ipi_register_extensions,
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 25e9a1e8..50a7660d 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -131,6 +131,7 @@ static int sbi_ecall_legacy_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_legacy = {
+	.name			= "legacy",
 	.extid_start		= SBI_EXT_0_1_SET_TIMER,
 	.extid_end		= SBI_EXT_0_1_SHUTDOWN,
 	.register_extensions	= sbi_ecall_legacy_register_extensions,
diff --git a/lib/sbi/sbi_ecall_mpxy.c b/lib/sbi/sbi_ecall_mpxy.c
index 5f717b76..09705cce 100644
--- a/lib/sbi/sbi_ecall_mpxy.c
+++ b/lib/sbi/sbi_ecall_mpxy.c
@@ -61,8 +61,10 @@ static int sbi_ecall_mpxy_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_mpxy = {
+	.name			= "mpxy",
 	.extid_start		= SBI_EXT_MPXY,
 	.extid_end		= SBI_EXT_MPXY,
+	.experimental		= true,
 	.register_extensions	= sbi_ecall_mpxy_register_extensions,
 	.handle			= sbi_ecall_mpxy_handler,
 };
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index ae7aeca9..868e8665 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -93,6 +93,7 @@ static int sbi_ecall_pmu_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_pmu = {
+	.name			= "pmu",
 	.extid_start		= SBI_EXT_PMU,
 	.extid_end		= SBI_EXT_PMU,
 	.register_extensions	= sbi_ecall_pmu_register_extensions,
diff --git a/lib/sbi/sbi_ecall_rfence.c b/lib/sbi/sbi_ecall_rfence.c
index ded16c26..903adfbf 100644
--- a/lib/sbi/sbi_ecall_rfence.c
+++ b/lib/sbi/sbi_ecall_rfence.c
@@ -84,6 +84,7 @@ static int sbi_ecall_rfence_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_rfence = {
+	.name			= "rfnc",
 	.extid_start		= SBI_EXT_RFENCE,
 	.extid_end		= SBI_EXT_RFENCE,
 	.register_extensions	= sbi_ecall_rfence_register_extensions,
diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
index 46cfaca4..721d7216 100644
--- a/lib/sbi/sbi_ecall_srst.c
+++ b/lib/sbi/sbi_ecall_srst.c
@@ -75,6 +75,7 @@ static int sbi_ecall_srst_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_srst = {
+	.name			= "srst",
 	.extid_start		= SBI_EXT_SRST,
 	.extid_end		= SBI_EXT_SRST,
 	.register_extensions	= sbi_ecall_srst_register_extensions,
diff --git a/lib/sbi/sbi_ecall_sse.c b/lib/sbi/sbi_ecall_sse.c
index beddc2cd..303c0f2d 100644
--- a/lib/sbi/sbi_ecall_sse.c
+++ b/lib/sbi/sbi_ecall_sse.c
@@ -56,8 +56,10 @@ static int sbi_ecall_sse_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_sse = {
+	.name			= "sse",
 	.extid_start		= SBI_EXT_SSE,
 	.extid_end		= SBI_EXT_SSE,
+	.experimental		= true,
 	.register_extensions	= sbi_ecall_sse_register_extensions,
 	.handle			= sbi_ecall_sse_handler,
 };
diff --git a/lib/sbi/sbi_ecall_susp.c b/lib/sbi/sbi_ecall_susp.c
index 7b66bfcd..5afbf3fa 100644
--- a/lib/sbi/sbi_ecall_susp.c
+++ b/lib/sbi/sbi_ecall_susp.c
@@ -49,6 +49,7 @@ static int sbi_ecall_susp_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_susp = {
+	.name			= "susp",
 	.extid_start		= SBI_EXT_SUSP,
 	.extid_end		= SBI_EXT_SUSP,
 	.register_extensions	= sbi_ecall_susp_register_extensions,
diff --git a/lib/sbi/sbi_ecall_time.c b/lib/sbi/sbi_ecall_time.c
index 5a2316eb..6ea6f054 100644
--- a/lib/sbi/sbi_ecall_time.c
+++ b/lib/sbi/sbi_ecall_time.c
@@ -40,6 +40,7 @@ static int sbi_ecall_time_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_time = {
+	.name			= "time",
 	.extid_start		= SBI_EXT_TIME,
 	.extid_end		= SBI_EXT_TIME,
 	.register_extensions	= sbi_ecall_time_register_extensions,
diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
index ebebc586..5fdfb314 100644
--- a/lib/sbi/sbi_ecall_vendor.c
+++ b/lib/sbi/sbi_ecall_vendor.c
@@ -46,6 +46,7 @@ static int sbi_ecall_vendor_register_extensions(void)
 }
 
 struct sbi_ecall_extension ecall_vendor = {
+	.name			= "vendor",
 	.extid_start		= SBI_EXT_VENDOR_START,
 	.extid_end		= SBI_EXT_VENDOR_END,
 	.register_extensions	= sbi_ecall_vendor_register_extensions,
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 0736345d..cef658a2 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -139,8 +139,12 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 		   (u32)(SBI_SCRATCH_SIZE - sbi_scratch_used_space()));
 
 	/* SBI details */
-	sbi_printf("Runtime SBI Version       : %d.%d\n",
+	sbi_printf("Runtime SBI Version         : %d.%d\n",
 		   sbi_ecall_version_major(), sbi_ecall_version_minor());
+	sbi_ecall_get_extensions_str(str, sizeof(str), false);
+	sbi_printf("Standard SBI Extensions     : %s\n", str);
+	sbi_ecall_get_extensions_str(str, sizeof(str), true);
+	sbi_printf("Experimental SBI Extensions : %s\n", str);
 	sbi_printf("\n");
 }
 
-- 
2.43.0


