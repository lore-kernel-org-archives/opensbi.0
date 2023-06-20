From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 20 Jun 2023 20:02:07 +0530
Subject: [PATCH 1/6] include: sbi: Add macro definitions for mseccfg CSR
In-Reply-To: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
References: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
Message-ID: <20230620143212.2701598-2-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Add macros for Machine Security Configuration (mseccfg) CSR
- Add macros to access/manipulate bits in msecfg CSR

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/sbi/riscv_encoding.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 4ebed97..50071ad 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -663,6 +663,18 @@
 #define CSR_MHPMEVENT30H		0x73e
 #define CSR_MHPMEVENT31H		0x73f
 
+/* Machine Security Configuration CSR (mseccfg) */
+#define CSR_MSECCFG_LOWER		0x747
+#define CSR_MSECCFG_UPPER		0x757
+#define CSR_MSECCFG			(CSR_MSECCFG_LOWER)
+
+#define MSECCFG_MML_SHIFT		(0)
+#define MSECCFG_MML			(_UL(1) << MSECCFG_MML_SHIFT)
+#define MSECCFG_MMWP_SHIFT		(1)
+#define MSECCFG_MMWP			(_UL(1) << MSECCFG_MMWP_SHIFT)
+#define MSECCFG_RLB_SHIFT		(2)
+#define MSECCFG_RLB			(_UL(1) << MSECCFG_RLB_SHIFT)
+
 /* Counter Overflow CSR */
 #define CSR_SCOUNTOVF			0xda0
 
-- 
2.34.1


