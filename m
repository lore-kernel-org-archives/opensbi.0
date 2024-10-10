From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 10 Oct 2024 14:30:55 +0530
Subject: [PATCH v2 6/9] include: sbi: Remove cyclic include in sbi_domain_context.h
In-Reply-To: <20241010090058.179381-1-apatel@ventanamicro.com>
References: <20241010090058.179381-1-apatel@ventanamicro.com>
Message-ID: <20241010090058.179381-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_domain_context.h includes sbi_domain.h and the sbi_domain.h
also includes sbi_domain_context.h. Remove this cyclic include in
sbi_domain_context.h.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi/sbi_domain_context.h | 3 ++-
 lib/sbi/sbi_domain_context.c     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
index a92f338b..1f5a4f56 100644
--- a/include/sbi/sbi_domain_context.h
+++ b/include/sbi/sbi_domain_context.h
@@ -9,7 +9,8 @@
 
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_trap.h>
-#include <sbi/sbi_domain.h>
+
+struct sbi_domain;
 
 /** Context representation for a hart within a domain */
 struct sbi_context {
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index bafb6c3e..7cad4656 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_domain_context.h>
 
 /**
-- 
2.43.0


