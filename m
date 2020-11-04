From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  4 Nov 2020 15:35:54 +0530
Subject: [PATCH] lib: sbi: Improve boot prints in cold boot sequence
Message-ID: <20201104100554.3044339-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, we have all boot prints at the end of cold boot sequence
which means if there is any failure in cold boot sequence before
boot prints then we don't get any print.

This patch improves boot prints in cold boot sequence as follows:
1. We divide the boot prints into multiple parts and print it
   from different locations after sbi_console_init()
2. We throw an error print if there is any failure in cold boot
   sequence after sbi_console_init()

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/sbi/sbi_init.c | 90 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 69 insertions(+), 21 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 15ae9da..253bcfb 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -35,12 +35,10 @@
 	"        | |\n"                                     \
 	"        |_|\n\n"
 
-static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
+static void sbi_boot_print_banner(struct sbi_scratch *scratch)
 {
-	int xlen;
-	char str[128];
-	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
+		return;
 
 #ifdef OPENSBI_VERSION_GIT
 	sbi_printf("\nOpenSBI %s\n", OPENSBI_VERSION_GIT);
@@ -50,13 +48,15 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
 #endif
 
 	sbi_printf(BANNER);
+}
 
-	/* Determine MISA XLEN and MISA string */
-	xlen = misa_xlen();
-	if (xlen < 1) {
-		sbi_printf("Error %d getting MISA XLEN\n", xlen);
-		sbi_hart_hang();
-	}
+static void sbi_boot_print_general(struct sbi_scratch *scratch)
+{
+	char str[128];
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+
+	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
+		return;
 
 	/* Platform details */
 	sbi_printf("Platform Name             : %s\n",
@@ -75,9 +75,32 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Runtime SBI Version       : %d.%d\n",
 		   sbi_ecall_version_major(), sbi_ecall_version_minor());
 	sbi_printf("\n");
+}
+
+static void sbi_boot_print_domains(struct sbi_scratch *scratch)
+{
+	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
+		return;
 
 	/* Domain details */
 	sbi_domain_dump_all("      ");
+}
+
+static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
+{
+	int xlen;
+	char str[128];
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+
+	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
+		return;
+
+	/* Determine MISA XLEN and MISA string */
+	xlen = misa_xlen();
+	if (xlen < 1) {
+		sbi_printf("Error %d getting MISA XLEN\n", xlen);
+		sbi_hart_hang();
+	}
 
 	/* Boot HART details */
 	sbi_printf("Boot HART ID              : %u\n", hartid);
@@ -208,25 +231,40 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	sbi_boot_print_banner(scratch);
+
 	rc = sbi_platform_irqchip_init(plat, TRUE);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: platorm irqchip init failed (error %d)\n",
+			   __func__, rc);
 		sbi_hart_hang();
+	}
 
 	rc = sbi_ipi_init(scratch, TRUE);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: ipi init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
+	}
 
 	rc = sbi_tlb_init(scratch, TRUE);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: tlb init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
+	}
 
 	rc = sbi_timer_init(scratch, TRUE);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: timer init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
+	}
 
 	rc = sbi_ecall_init();
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: ecall init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
+	}
+
+	sbi_boot_print_general(scratch);
 
 	/*
 	 * Note: Finalize domains after HSM initialization so that we
@@ -235,23 +273,33 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * that we use correct domain for configuring PMP.
 	 */
 	rc = sbi_domain_finalize(scratch, hartid);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: domain finalize failed (error %d)\n",
+			   __func__, rc);
 		sbi_hart_hang();
+	}
+
+	sbi_boot_print_domains(scratch);
 
 	rc = sbi_hart_pmp_configure(scratch);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: PMP configure failed (error %d)\n",
+			   __func__, rc);
 		sbi_hart_hang();
+	}
 
 	/*
 	 * Note: Platform final initialization should be last so that
 	 * it sees correct domain assignment and PMP configuration.
 	 */
 	rc = sbi_platform_final_init(plat, TRUE);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: platform final init failed (error %d)\n",
+			   __func__, rc);
 		sbi_hart_hang();
+	}
 
-	if (!(scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS))
-		sbi_boot_prints(scratch, hartid);
+	sbi_boot_print_hart(scratch, hartid);
 
 	wake_coldboot_harts(scratch, hartid);
 
-- 
2.25.1


