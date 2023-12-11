From: Xiang W <wxjstz@126.com>
Date: Mon, 11 Dec 2023 21:29:50 +0800
Subject: [PATCH] lib: sbi: Simplify the initialization of root_hmask in sbi_domain_init
Message-ID: <20231211133003.1243458-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The original code has multiple conversions between hartid and
hartindex. Can call sbi_hartmask_set_hartindex directly to
avoid conversion.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 88d25de..4e9f742 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -815,8 +815,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 
 	/* Root domain possible and assigned HARTs */
 	for (i = 0; i < plat->hart_count; i++)
-		sbi_hartmask_set_hartid(sbi_hartindex_to_hartid(i),
-					root_hmask);
+		sbi_hartmask_set_hartindex(i, root_hmask);
 
 	/* Finally register the root domain */
 	rc = sbi_domain_register(&root, root_hmask);
-- 
2.42.0


