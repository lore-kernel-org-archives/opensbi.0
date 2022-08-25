From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Aug 2022 10:21:44 +0530
Subject: [PATCH 7/7] include: sbi: Reduce includes in sbi_pmu.h
In-Reply-To: <20220825045144.752619-1-apatel@ventanamicro.com>
References: <20220825045144.752619-1-apatel@ventanamicro.com>
Message-ID: <20220825045144.752619-8-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_pmu.h should only include minimal required headers whereas
sbi_pmu.c should include all required headers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_pmu.h | 5 ++---
 lib/sbi/sbi_pmu.c     | 2 ++
 lib/sbi/sbi_trap.c    | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index d787575..a2ce42d 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -11,9 +11,8 @@
 #define __SBI_PMU_H__
 
 #include <sbi/sbi_types.h>
-#include <sbi/sbi_hartmask.h>
-#include <sbi/sbi_scratch.h>
-#include <sbi/sbi_ecall_interface.h>
+
+struct sbi_scratch;
 
 /* Event related macros */
 /* Maximum number of hardware events that can mapped by OpenSBI */
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 87e1ff8..214d5e8 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -10,7 +10,9 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 0e30946..4c1339e 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -9,6 +9,7 @@
 
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_encoding.h>
+#include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_error.h>
-- 
2.34.1


