From: Heiko Stuebner <heiko@sntech.de>
Date: Wed, 17 Aug 2022 13:20:00 +0200
Subject: [PATCH v2 1/5] lib: sbi_platform: pass extension bitmap pointer to extension_init
In-Reply-To: <20220817112004.745776-1-heiko@sntech.de>
References: <20220817112004.745776-1-heiko@sntech.de>
Message-ID: <20220817112004.745776-2-heiko@sntech.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The platform extension_init callback is called once per hart and
if it's meant to handle platform-specific extensions it should have
access to the extension bitmap to update it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/sbi/sbi_platform.h | 7 ++++---
 lib/sbi/sbi_hart.c         | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 87024db..1829e2e 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -90,7 +90,7 @@ struct sbi_platform_operations {
 	int (*misa_get_xlen)(void);
 
 	/** Initialize (or populate) HART extensions for the platform */
-	int (*extensions_init)(void);
+	int (*extensions_init)(unsigned long *extensions);
 
 	/** Initialize (or populate) domains for the platform */
 	int (*domains_init)(void);
@@ -464,10 +464,11 @@ static inline int sbi_platform_misa_xlen(const struct sbi_platform *plat)
  * @return 0 on success and negative error code on failure
  */
 static inline int sbi_platform_extensions_init(
-					const struct sbi_platform *plat)
+					const struct sbi_platform *plat,
+					unsigned long *extensions)
 {
 	if (plat && sbi_platform_ops(plat)->extensions_init)
-		return sbi_platform_ops(plat)->extensions_init();
+		return sbi_platform_ops(plat)->extensions_init(extensions);
 	return 0;
 }
 
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index de86fee..50e5907 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -682,7 +682,8 @@ __mhpm_skip:
 	}
 
 	/* Let platform populate extensions */
-	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr());
+	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
+					  &hfeatures->extensions);
 	if (rc)
 		return rc;
 
-- 
2.35.1


