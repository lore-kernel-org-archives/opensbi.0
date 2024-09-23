From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 23 Sep 2024 17:26:57 +0530
Subject: [PATCH 6/9] include: sbi: Remove cyclic include in sbi_domain_context.h
In-Reply-To: <20240923115700.381916-1-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
Message-ID: <20240923115700.381916-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_domain_context.h includes sbi_domain.h and the sbi_domain.h
also includes sbi_domain_context.h. Remove this cyclic include in
sbi_domain_context.h.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_domain_context.h | 3 ++-
 lib/sbi/sbi_domain_context.c     | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
index 0d25884a..3f43b622 100755
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
index 1432e3a8..29e2d280 100755
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -13,7 +13,7 @@
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
-#include <sbi/sbi_domain_context.h>
+#include <sbi/sbi_domain.h>
 
 /**
  * Switches the HART context from the current domain to the target domain.
-- 
2.43.0


