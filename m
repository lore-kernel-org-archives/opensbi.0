From: Bin Meng <bmeng@tinylab.org>
Date: Fri, 24 Feb 2023 12:28:25 +0800
Subject: [PATCH 1/3] lib: sbi/sbi_domain: cosmetic style fixes
Message-ID: <20230224042827.1768931-1-bmeng@tinylab.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Minor updates to the comments for language and style fixes.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 lib/sbi/sbi_domain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index dc825b0..d2f58a2 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -337,7 +337,7 @@ static int sanitize_domain(const struct sbi_platform *plat,
 	/*
 	 * Check next mode
 	 *
-	 * We only allow next mode to be S-mode or U-mode.so that we can
+	 * We only allow next mode to be S-mode or U-mode, so that we can
 	 * protect M-mode context and enforce checks on memory accesses.
 	 */
 	if (dom->next_mode != PRV_S &&
@@ -347,7 +347,7 @@ static int sanitize_domain(const struct sbi_platform *plat,
 		return SBI_EINVAL;
 	}
 
-	/* Check next address and next mode*/
+	/* Check next address and next mode */
 	if (!sbi_domain_check_addr(dom, dom->next_addr, dom->next_mode,
 				   SBI_DOMAIN_EXECUTE)) {
 		sbi_printf("%s: %s next booting stage address 0x%lx can't "
-- 
2.25.1


