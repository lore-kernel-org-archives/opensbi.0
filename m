From: Bin Meng <bmeng@tinylab.org>
Date: Fri, 30 Dec 2022 12:26:11 +0800
Subject: [PATCH] lib: sbi_domain: Avoid overwriting coldboot hart's scratch->arg1
Message-ID: <20221230042611.1966361-1-bmeng@tinylab.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In sbi_domain_finalize(), when locating the coldboot hart's domain,
the coldboot hart's scratch->arg1 will be overwritten by the domain
configuration. scratch->arg1 holds the FDT address of the coldboot
hart, and in later boot process OpenSBI codes still read the FDT
here and there, which leads to a crash.

To fix this, we save the next booting stage arg1 for the coldboot
domain instance for the caller to use later.

Resolves: https://github.com/riscv-software-src/opensbi/issues/281
Fixes: b1678af210dc ("lib: sbi: Add initial domain support")
Reported-by: Marouene Boubakri <marouene.boubakri@nxp.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 include/sbi/sbi_domain.h |  3 ++-
 lib/sbi/sbi_domain.c     | 15 +++++++++++++--
 lib/sbi/sbi_init.c       |  7 ++++++-
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 5553d21..0370d48 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -195,7 +195,8 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 			   unsigned long align, unsigned long region_flags);
 
 /** Finalize domain tables and startup non-root domains */
-int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid);
+int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid,
+			bool *coldboot_domain, unsigned long *next_arg1);
 
 /** Initialize domains */
 int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid);
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 3205595..bdef99f 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -552,12 +552,14 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 	return 0;
 }
 
-int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
+int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid,
+			bool *coldboot_domain, unsigned long *next_arg1)
 {
 	int rc;
 	u32 i, dhart;
 	struct sbi_domain *dom;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	*coldboot_domain = false;
 
 	/* Initialize and populate domains for the platform */
 	rc = sbi_platform_domains_init(plat);
@@ -589,7 +591,16 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 		if (dhart == cold_hartid) {
 			scratch->next_addr = dom->next_addr;
 			scratch->next_mode = dom->next_mode;
-			scratch->next_arg1 = dom->next_arg1;
+			/*
+			 * We cannot overwrite the scratch->next_arg1 here
+			 * as it holds the FDT address for the coldboot hart.
+			 *
+			 * Instead, we save the next booting stage arg1 for
+			 * the coldboot domain instance for the caller to
+			 * use later.
+			 */
+			*coldboot_domain = true;
+			*next_arg1 = dom->next_arg1;
 		} else {
 			rc = sbi_hsm_hart_start(scratch, NULL, dhart,
 						dom->next_addr,
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a8500e5..85d211b 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -240,6 +240,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	int rc;
 	unsigned long *init_count;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	bool coldboot_domain;
+	unsigned long next_arg1;
 
 	/* Note: This has to be first thing in coldboot init sequence */
 	rc = sbi_scratch_init(scratch);
@@ -314,7 +316,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * Note: Finalize domains before HART PMP configuration so
 	 * that we use correct domain for configuring PMP.
 	 */
-	rc = sbi_domain_finalize(scratch, hartid);
+	rc = sbi_domain_finalize(scratch, hartid, &coldboot_domain,
+				 &next_arg1);
 	if (rc) {
 		sbi_printf("%s: domain finalize failed (error %d)\n",
 			   __func__, rc);
@@ -351,6 +354,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	(*init_count)++;
 
 	sbi_hsm_prepare_next_jump(scratch, hartid);
+	if (coldboot_domain)
+		scratch->next_arg1 = next_arg1;
 	sbi_hart_switch_mode(hartid, scratch->next_arg1, scratch->next_addr,
 			     scratch->next_mode, FALSE);
 }
-- 
2.34.1


