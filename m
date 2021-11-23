From: Anup Patel <anup.patel@wdc.com>
Date: Tue, 23 Nov 2021 17:53:09 +0530
Subject: [PATCH] lib: sbi: Fix spelling of "address" in sbi_domain.c
Message-ID: <20211123122309.607757-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Vagrant Cascadian <vagrant@debian.org>

Fix a spelling typo in error print.

Signed-off-by: Vagrant Cascadian <vagrant@debian.org>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 33d7ad5..b60915c 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -295,7 +295,7 @@ static int sanitize_domain(const struct sbi_platform *plat,
 	/* Check next address and next mode*/
 	if (!sbi_domain_check_addr(dom, dom->next_addr, dom->next_mode,
 				   SBI_DOMAIN_EXECUTE)) {
-		sbi_printf("%s: %s next booting stage addres 0x%lx can't "
+		sbi_printf("%s: %s next booting stage address 0x%lx can't "
 			   "execute\n", __func__, dom->name, dom->next_addr);
 		return SBI_EINVAL;
 	}
-- 
2.25.1


