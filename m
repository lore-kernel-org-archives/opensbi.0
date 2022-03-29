From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Mar 2022 21:22:18 +0530
Subject: [PATCH 4/4] lib: sbi: Enable Svpbmt extension in the menvcfg CSR
In-Reply-To: <20220329155218.118580-1-apatel@ventanamicro.com>
References: <20220329155218.118580-1-apatel@ventanamicro.com>
Message-ID: <20220329155218.118580-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The menvcfg.PBMTE bit is read-only zero when Svpbmt extension is not
available so we try to enable menvcfg.PBMTE bit irrespective whether
Svpbmt is available or not.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d2c7aba..6be9286 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -114,6 +114,16 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		 */
 		menvcfg_val |= ENVCFG_CBIE_INV << ENVCFG_CBIE_SHIFT;
 
+		/*
+		 * Set menvcfg.PBMTE == 1 for RV64 or RV128
+		 *
+		 * If Svpbmt extension is not available then menvcfg.PBMTE
+		 * will be read-only zero.
+		 */
+#if __riscv_xlen > 32
+		menvcfg_val |= ENVCFG_PBMTE;
+#endif
+
 		csr_write(CSR_MENVCFG, menvcfg_val);
 	}
 
-- 
2.25.1


