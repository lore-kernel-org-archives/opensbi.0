From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Sat, 25 Mar 2023 22:20:47 +0530
Subject: [PATCH] lib: sbi_hart: clear mip csr during hart init
Message-ID: <20230325165047.3107856-1-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If mip.SEIP bit is not cleared then on HiFive Unmatched board it causes
spurious external interrupts. This breaks the boot up of HiFive Unmatched
board. Hence it is required to bring the mip CSR to a known state during
hart init and avoid spurious interrupts.

Fixes: d9e7368 ("firmware: Not to clear all the MIP")
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 firmware/fw_base.S | 7 -------
 lib/sbi/sbi_hart.c | 6 ++++++
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index ceef44f..5a3e894 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -430,13 +430,6 @@ _start_warm:
 
 	/* Disable all interrupts */
 	csrw	CSR_MIE, zero
-	/*
-	 * Only clear the MIP_SSIP and MIP_STIP. For the platform like QEMU,
-	 * If we clear other interrupts like MIP_SEIP and the pendings of
-	 * PLIC still exist, the QEMU may not set it back immediately.
-	 */
-	li	t0, (MIP_SSIP | MIP_STIP)
-	csrc	CSR_MIP, t0
 
 	/* Find HART count and HART stack size */
 	lla	a4, platform
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 5e06918..6e52cbd 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -733,6 +733,12 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int rc;
 
+	/*
+	 * Clear mip CSR before proceeding with init to avoid any spurious
+	 * external interrupts in S-mode.
+	 */
+	csr_write(CSR_MIP, 0);
+
 	if (cold_boot) {
 		if (misa_extension('H'))
 			sbi_hart_expected_trap = &__sbi_expected_trap_hext;
-- 
2.34.1


