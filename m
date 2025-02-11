From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 11 Feb 2025 21:30:11 +0530
Subject: [PATCH] lib: sbi: Fix non-root domain startup
Message-ID: <20250211160011.476434-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the sbi_sse_init() in cold boot path is called after
sbi_domain_finalize() so boot HART of non-root domains will start
before SSE cold boot init which can cause warm boot of such HARTs
to crash in sbi_sse_init().

To address the above issue, factor-out the non-root domain startup
from sbi_domain_finalize() function as a separate sbi_domain_startup()
function  which can be called after sbi_sse_init() in cold boot path.

Fixes: 93f7d819fdeb ("lib: sbi: sse: allow adding new events")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_domain.h |  7 +++++--
 lib/sbi/sbi_domain.c     | 33 ++++++++++++++++++++++++---------
 lib/sbi/sbi_init.c       | 17 ++++++++++++++---
 3 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 8a2b123d..e9cff0b1 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -307,8 +307,11 @@ int sbi_domain_register(struct sbi_domain *dom,
 int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 			   unsigned long align, unsigned long region_flags);
 
-/** Finalize domain tables and startup non-root domains */
-int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid);
+/** Startup non-root domains */
+int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid);
+
+/** Finalize domain tables */
+int sbi_domain_finalize(struct sbi_scratch *scratch);
 
 /** Initialize domains */
 int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid);
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 1cf7e2d8..51c82a75 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -685,20 +685,15 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 	return 0;
 }
 
-int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
+int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid)
 {
 	int rc;
 	u32 dhart;
 	struct sbi_domain *dom;
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
-	/* Initialize and populate domains for the platform */
-	rc = sbi_platform_domains_init(plat);
-	if (rc) {
-		sbi_printf("%s: platform domains_init() failed (error %d)\n",
-			   __func__, rc);
-		return rc;
-	}
+	/* Sanity checks */
+	if (!domain_finalized)
+		return SBI_EINVAL;
 
 	/* Startup boot HART of domains */
 	sbi_domain_for_each(dom) {
@@ -744,6 +739,26 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 		}
 	}
 
+	return 0;
+}
+
+int sbi_domain_finalize(struct sbi_scratch *scratch)
+{
+	int rc;
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+
+	/* Sanity checks */
+	if (domain_finalized)
+		return SBI_EINVAL;
+
+	/* Initialize and populate domains for the platform */
+	rc = sbi_platform_domains_init(plat);
+	if (rc) {
+		sbi_printf("%s: platform domains_init() failed (error %d)\n",
+			   __func__, rc);
+		return rc;
+	}
+
 	/*
 	 * Set the finalized flag so that the root domain
 	 * regions can't be changed.
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 3f654c80..880c1644 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -318,13 +318,13 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
 	}
+
 	/*
-	 * Note: Finalize domains after HSM initialization so that we
-	 * can startup non-root domains.
+	 * Note: Finalize domains after HSM initialization
 	 * Note: Finalize domains before HART PMP configuration so
 	 * that we use correct domain for configuring PMP.
 	 */
-	rc = sbi_domain_finalize(scratch, hartid);
+	rc = sbi_domain_finalize(scratch);
 	if (rc) {
 		sbi_printf("%s: domain finalize failed (error %d)\n",
 			   __func__, rc);
@@ -372,6 +372,17 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	run_all_tests();
 
+	/*
+	 * Note: Startup domains after all initialization are done
+	 * otherwise boot HART of non-root domain can crash.
+	 */
+	rc = sbi_domain_startup(scratch, hartid);
+	if (rc) {
+		sbi_printf("%s: domain startup failed (error %d)\n",
+			   __func__, rc);
+		sbi_hart_hang();
+	}
+
 	/*
 	 * Configure PMP at last because if SMEPMP is detected,
 	 * M-mode access to the S/U space will be rescinded.
-- 
2.43.0


