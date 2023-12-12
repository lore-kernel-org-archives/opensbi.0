From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 12 Dec 2023 15:29:26 +0530
Subject: [PATCH v2 6/6] lib: sbi: Do not enter OpenSBI with mseccfg.MML == 1
In-Reply-To: <20231212095926.13371-1-apatel@ventanamicro.com>
References: <20231212095926.13371-1-apatel@ventanamicro.com>
Message-ID: <20231212095926.13371-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On platforms with Smepmp, the previous booting stage must enter
OpenSBI with mseccfg.MML == 0. This allows OpenSBI to configure
it's own M-mode only regions without depending on the previous
booting stage.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6acff37..16da38d 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -975,6 +975,16 @@ __pmp_skip:
 	/* Mark hart feature detection done */
 	hfeatures->detected = true;
 
+	/*
+	 * On platforms with Smepmp, the previous booting stage must
+	 * enter OpenSBI with mseccfg.MML == 0. This allows OpenSBI
+	 * to configure it's own M-mode only regions without depending
+	 * on the previous booting stage.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP) &&
+	    (csr_read(CSR_MSECCFG) & MSECCFG_MML))
+		return SBI_EILL;
+
 	return 0;
 }
 
-- 
2.34.1


