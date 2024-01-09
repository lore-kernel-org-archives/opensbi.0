From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue,  9 Jan 2024 22:30:13 +0530
Subject: [PATCH v3 1/8] include: sbi: Introduce common endianess conversion macro
In-Reply-To: <20240109170020.1731282-1-hchauhan@ventanamicro.com>
References: <20240109170020.1731282-1-hchauhan@ventanamicro.com>
Message-ID: <20240109170020.1731282-2-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce cpu_to_lle and lle_to_cpu macros which invoke
correct word length cpu_to_le<64/32> conversion based on
__riscv_xlen.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_byteorder.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/sbi/sbi_byteorder.h b/include/sbi/sbi_byteorder.h
index 15107e1..db6eb2b 100644
--- a/include/sbi/sbi_byteorder.h
+++ b/include/sbi/sbi_byteorder.h
@@ -58,4 +58,14 @@
 #define le64_to_cpu(x)		((uint64_t)BSWAP64(x))
 #endif
 
+#if __riscv_xlen == 64
+#define cpu_to_lle		cpu_to_le64
+#define lle_to_cpu		le64_to_cpu
+#elif __riscv_xlen == 32
+#define cpu_to_lle		cpu_to_le32
+#define lle_to_cpu		le32_to_cpu
+#else
+#error "Unknown __riscv_xlen"
+#endif
+
 #endif /* __SBI_BYTEORDER_H__ */
-- 
2.34.1


