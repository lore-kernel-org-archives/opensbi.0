From: jay1273062855@outlook.com <jay1273062855@outlook.com>
Date: Thu, 28 Sep 2023 16:27:09 +0800
Subject: [PATCH] lib: sbi: Add support for mconfigptr
Message-ID: <TYWP286MB2987DF5FDABB17DF166C2588A5C1A@TYWP286MB2987.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yangjie Zhang <jay1273062855@outlook.com>

RISC-V privileged specification v1.12 introduced the mconfigptr CSR
which will hold the physical address of a configuration data
structure.

Signed-off-by: Yangjie Zhang <jay1273062855@outlook.com>
---
 include/sbi/riscv_encoding.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index d137bf8..d7a000f 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -430,6 +430,7 @@
 #define CSR_MARCHID			0xf12
 #define CSR_MIMPID			0xf13
 #define CSR_MHARTID			0xf14
+#define CSR_MCONFIGPTR		0xf15
 
 /* Machine Trap Setup */
 #define CSR_MSTATUS			0x300
-- 
2.34.1


