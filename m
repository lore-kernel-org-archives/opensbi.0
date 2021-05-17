From: Daniel Schaefer <daniel.schaefer@hpe.com>
Date: Mon, 17 May 2021 19:33:19 +0800
Subject: [PATCH v1 3/3] lib: utils: Replace strcmp with strcmp
In-Reply-To: <20210517113319.25855-1-daniel.schaefer@hpe.com>
References: <20210517113319.25855-1-daniel.schaefer@hpe.com>
Message-ID: <20210517113319.25855-4-daniel.schaefer@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Cc: Abner Chang <abner.chang@hpe.com>
Cc: Anup Patel <Anup.Patel@wdc.com>
Signed-off-by: Daniel Schaefer <daniel.schaefer@hpe.com>
---
 lib/utils/fdt/fdt_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index c1f6a8c8a10b..a9ebbdca3c52 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -96,7 +96,7 @@ static int __fixup_find_domain_offset(void *fdt, int doff, void *p)
 {
 	struct __fixup_find_domain_offset_info *fdo = p;
 
-	if (!strcmp(fdo->name, fdt_get_name(fdt, doff, NULL)))
+	if (!strncmp(fdo->name, fdt_get_name(fdt, doff, NULL), strlen(fdo->name)))
 		*fdo->doffset = doff;
 
 	return 0;
-- 
2.30.1


