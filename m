From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  4 Aug 2022 17:34:29 +0530
Subject: [PATCH v6 17/17] Makefile: Fix typo related to object.mk
In-Reply-To: <20220804120429.59444-1-apatel@ventanamicro.com>
References: <20220804120429.59444-1-apatel@ventanamicro.com>
Message-ID: <20220804120429.59444-18-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The "object.mk" name referred in top-level makefile should be
"objects.mk".

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a5d6854..5adce4e 100644
--- a/Makefile
+++ b/Makefile
@@ -231,7 +231,7 @@ include $(KCONFIG_CONFIG)
 include $(KCONFIG_AUTOCMD)
 endif
 
-# Include all object.mk files
+# Include all objects.mk files
 ifdef PLATFORM
 include $(platform-object-mks)
 endif
-- 
2.34.1


