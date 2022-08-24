From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Wed, 24 Aug 2022 20:24:37 +0530
Subject: [PATCH] include: Remove sideleg and sedeleg
Message-ID: <20220824145437.400746-1-rpathak@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

sideleg and sedeleg csrs are not part of riscv isa spec
anymore, these csrs were part of N extension which
is removed from the riscv isa specification.

These commits removed all traces of these csrs from
riscv spec (https://github.com/riscv/riscv-isa-manual) -

commit f8d27f805b65 ("Remove or downgrade more references to N extension (#674)")
commit b6cade07034d ("Remove N extension chapter for now")

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/riscv_encoding.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 8884301..b0f08c8 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -312,8 +312,6 @@
 
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS			0x100
-#define CSR_SEDELEG			0x102
-#define CSR_SIDELEG			0x103
 #define CSR_SIE				0x104
 #define CSR_STVEC			0x105
 #define CSR_SCOUNTEREN			0x106
-- 
2.34.1


