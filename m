From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 18 Feb 2022 08:56:41 -0800
Subject: [PATCH] lib: sbi: Enable M-mode external interrupt only for AIA
Message-ID: <20220218165641.1811334-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some platforms may inject spurious M-mode external interrupt if
the external interrupt bit is enabled in mie. We really don't
need to enable M-mode external interrupts for platforms without
AIA. This issue is observed in HiFive unmatched.

Keep the M-mode external interrupt disabled for non-AIA platforms.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 lib/sbi/sbi_init.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 6876eb2f0f22..76b7c5d953ec 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -276,7 +276,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 			   __func__, rc);
 		sbi_hart_hang();
 	}
-	csr_set(CSR_MIE, MIP_MEIP);
+	/**
+	 * HiFive unmatched platform generates spurious interrupt if external
+	 * interrupt is enabled in mie. Enable it only if AIA is present.
+	 */
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_AIA))
+		csr_set(CSR_MIE, MIP_MEIP);
 
 	rc = sbi_ipi_init(scratch, TRUE);
 	if (rc) {
@@ -377,7 +382,12 @@ static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
 	rc = sbi_platform_irqchip_init(plat, FALSE);
 	if (rc)
 		sbi_hart_hang();
-	csr_set(CSR_MIE, MIP_MEIP);
+	/**
+	 * HiFive unmatched platform generates spurious interrupt if external
+	 * interrupt is enabled in mie. Enable it only if AIA is present.
+	 */
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_AIA))
+		csr_set(CSR_MIE, MIP_MEIP);
 
 	rc = sbi_ipi_init(scratch, FALSE);
 	if (rc)
-- 
2.30.2


