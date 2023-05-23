From: guoren@kernel.org <guoren@kernel.org>
Date: Tue, 23 May 2023 05:46:48 -0400
Subject: [RFC PATCH 1/2] lib: reset: thead: Remove unnecessary fence operations
In-Reply-To: <20230523094649.4100554-1-guoren@kernel.org>
References: <20230523094649.4100554-1-guoren@kernel.org>
Message-ID: <20230523094649.4100554-2-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

There are no load/store operations to fence at the reset point.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 lib/utils/reset/fdt_reset_thead.c     | 1 -
 lib/utils/reset/fdt_reset_thead_asm.S | 2 --
 2 files changed, 3 deletions(-)

diff --git a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
index e1d6885debae..ff7d2981b42f 100644
--- a/lib/utils/reset/fdt_reset_thead.c
+++ b/lib/utils/reset/fdt_reset_thead.c
@@ -27,7 +27,6 @@ static void clone_csrs(int cnt)
 
 		/* Mask csr BIT[31 - 20] */
 		*(u32 *)&__fdt_reset_thead_csrr &= BIT(20) - 1;
-		smp_mb();
 
 		/* Write csr BIT[31 - 20] to __fdt_reset_thead_csrr */
 		*(u32 *)&__fdt_reset_thead_csrr |= custom_csr[i].index << 20;
diff --git a/lib/utils/reset/fdt_reset_thead_asm.S b/lib/utils/reset/fdt_reset_thead_asm.S
index 8237951fd82d..650f8585cdd2 100644
--- a/lib/utils/reset/fdt_reset_thead_asm.S
+++ b/lib/utils/reset/fdt_reset_thead_asm.S
@@ -27,7 +27,6 @@ __thead_pre_start_warm:
 	 */
 	li	t1, 0x70013
 	csrw	0x7c2, t1
-	fence rw,rw
 
 	lla	t1, custom_csr
 
@@ -43,5 +42,4 @@ __reset_thead_csr_stub:
 	 */
 	li	t1, 0x70013
 	csrw	0x7c2, t1
-	fence rw,rw
 	j _start_warm
-- 
2.36.1


