From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  8 Aug 2022 09:27:40 +0530
Subject: [PATCH v8 17/17] Makefile: Fix typo related to object.mk
In-Reply-To: <20220808035740.69335-1-apatel@ventanamicro.com>
References: <20220808035740.69335-1-apatel@ventanamicro.com>
Message-ID: <20220808035740.69335-18-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The "object.mk" name referred in top-level makefile should be
"objects.mk".

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Atish Patra <atishp@rivosinc.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e716e8c..0ab9f22 100644
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


