From: Xiang W <wxjstz@126.com>
Date: Tue, 20 Jun 2023 20:32:01 +0800
Subject: [PATCH] lib: sbi: Try to make each domain have boot hart
Message-ID: <20230620123201.1784745-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

domain register will move the hart from the old domain to the
new domain, and should not move the boot hart to prevent the
old domain from losing the boot hart.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 38a5902..46a4aef 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -543,9 +543,23 @@ int sbi_domain_register(struct sbi_domain *dom,
 			continue;
 
 		tdom = sbi_hartid_to_domain(i);
-		if (tdom)
+		if (tdom) {
+			if (i == tdom->boot_hartid) {
+				/* Newly registered domain should not
+				 * take up the boot hart of the older domain */
+				if (i == dom->boot_hartid)
+					sbi_printf("%s: failed assign Hart%d to %s, "
+						"conflict with %s\n",
+						__func__, i, dom->name, tdom->name);
+				else
+					sbi_printf("%s: skip assign Hart%d to %s, "
+						"because Hart%d is boot hart of %s\n",
+						__func__, i, dom->name, i, tdom->name);
+				continue;
+			}
 			sbi_hartmask_clear_hart(i,
 					&tdom->assigned_harts);
+		}
 		update_hartid_to_domain(i, dom);
 		sbi_hartmask_set_hart(i, &dom->assigned_harts);
 
-- 
2.39.2


