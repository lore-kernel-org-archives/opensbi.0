From: Bo Gan <ganboing@gmail.com>
Date: Mon,  5 Feb 2024 02:49:59 -0800
Subject: [PATCH v2 2/3] include: sbi: rename sbi_misaligned_ldst.h to sbi_trap_ldst.h
In-Reply-To: <1707130200-559404-1-git-send-email-ganboing@gmail.com>
References: <1707130200-559404-1-git-send-email-ganboing@gmail.com>
Message-ID: <1707130200-559404-3-git-send-email-ganboing@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/{sbi_misaligned_ldst.h => sbi_trap_ldst.h} | 0
 lib/sbi/sbi_trap.c                                     | 2 +-
 lib/sbi/sbi_trap_ldst.c                                | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename include/sbi/{sbi_misaligned_ldst.h => sbi_trap_ldst.h} (100%)

diff --git a/include/sbi/sbi_misaligned_ldst.h b/include/sbi/sbi_trap_ldst.h
similarity index 100%
rename from include/sbi/sbi_misaligned_ldst.h
rename to include/sbi/sbi_trap_ldst.h
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index dbf307c..145db4b 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -17,7 +17,7 @@
 #include <sbi/sbi_illegal_insn.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_irqchip.h>
-#include <sbi/sbi_misaligned_ldst.h>
+#include <sbi/sbi_trap_ldst.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_timer.h>
diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
index aa512de..be9a394 100644
--- a/lib/sbi/sbi_trap_ldst.c
+++ b/lib/sbi/sbi_trap_ldst.c
@@ -11,7 +11,7 @@
 #include <sbi/riscv_encoding.h>
 #include <sbi/riscv_fp.h>
 #include <sbi/sbi_error.h>
-#include <sbi/sbi_misaligned_ldst.h>
+#include <sbi/sbi_trap_ldst.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
-- 
2.7.4


