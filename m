From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 19 Dec 2023 16:58:51 +0530
Subject: [PATCH v1 2/7] include: sbi: Add TINFO debug trigger CSR
In-Reply-To: <20231219112856.3865827-1-hchauhan@ventanamicro.com>
References: <20231219112856.3865827-1-hchauhan@ventanamicro.com>
Message-ID: <20231219112856.3865827-3-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the missing TINFO debug trigger CSR.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/sbi/riscv_encoding.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 0996d64..9501207 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -691,6 +691,7 @@
 #define CSR_TDATA1			0x7a1
 #define CSR_TDATA2			0x7a2
 #define CSR_TDATA3			0x7a3
+#define CSR_TINFO			0x7a4
 
 /* Debug Mode Registers */
 #define CSR_DCSR			0x7b0
-- 
2.34.1


