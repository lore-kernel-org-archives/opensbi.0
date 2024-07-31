From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:57 -0700
Subject: [PATCH 16/16] lib: utils/fdt: Add fdt_get_address_rw() helper
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-17-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Help tracking the lifecycle of the FDT blob by indicating which parts of
the firmware modify it, and thus invalidate any previously-obtained
offsets or pointers to data inside the blob.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/fdt/fdt_helper.h | 7 ++++++-
 platform/fpga/ariane/platform.c    | 2 +-
 platform/fpga/openpiton/platform.c | 4 ++--
 platform/generic/platform.c        | 4 ++--
 platform/kendryte/k210/platform.c  | 2 +-
 platform/nuclei/ux600/platform.c   | 2 +-
 6 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 28ae7677..7329b84c 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -114,7 +114,12 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
 int fdt_parse_compat_addr(const void *fdt, uint64_t *addr,
 			  const char *compatible);
 
-static inline void *fdt_get_address(void)
+static inline const void *fdt_get_address(void)
+{
+	return (const void *)root.next_arg1;
+}
+
+static inline void *fdt_get_address_rw(void)
 {
 	return (void *)root.next_arg1;
 }
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 8d46d888..ec0584ab 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -87,7 +87,7 @@ static int ariane_final_init(bool cold_boot)
 	if (!cold_boot)
 		return 0;
 
-	fdt = fdt_get_address();
+	fdt = fdt_get_address_rw();
 	fdt_fixups(fdt);
 
 	return 0;
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index dd74a0c2..81cc48f4 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -70,7 +70,7 @@ static struct aclint_mtimer_data mtimer = {
  */
 static int openpiton_early_init(bool cold_boot)
 {
-	void *fdt;
+	const void *fdt;
 	struct platform_uart_data uart_data = { 0 };
 	struct plic_data plic_data;
 	unsigned long aclint_freq;
@@ -118,7 +118,7 @@ static int openpiton_final_init(bool cold_boot)
 	if (!cold_boot)
 		return 0;
 
-	fdt = fdt_get_address();
+	fdt = fdt_get_address_rw();
 	fdt_fixups(fdt);
 
 	return 0;
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 7c809b00..52dd6e62 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -243,7 +243,7 @@ static int generic_early_init(bool cold_boot)
 
 static int generic_final_init(bool cold_boot)
 {
-	void *fdt = fdt_get_address();
+	void *fdt = fdt_get_address_rw();
 	int rc;
 
 	if (generic_plat && generic_plat->final_init) {
@@ -314,7 +314,7 @@ static int generic_extensions_init(struct sbi_hart_features *hfeatures)
 
 static int generic_domains_init(void)
 {
-	void *fdt = fdt_get_address();
+	const void *fdt = fdt_get_address();
 	int offset, ret;
 
 	ret = fdt_domains_populate(fdt);
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index 531adcd5..2f3f7079 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -124,7 +124,7 @@ static int k210_final_init(bool cold_boot)
 	if (!cold_boot)
 		return 0;
 
-	fdt = fdt_get_address();
+	fdt = fdt_get_address_rw();
 
 	fdt_cpu_fixup(fdt);
 	fdt_fixups(fdt);
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 2289366c..5610e7c7 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -181,7 +181,7 @@ static int ux600_final_init(bool cold_boot)
 	if (!cold_boot)
 		return 0;
 
-	fdt = fdt_get_address();
+	fdt = fdt_get_address_rw();
 	ux600_modify_dt(fdt);
 
 	return 0;
-- 
2.45.1


