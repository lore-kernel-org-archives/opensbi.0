From: Jan Remes <jan.remes@codasip.com>
Date: Tue, 21 Jun 2022 14:07:39 +0200
Subject: [PATCH] lib: irqchip/plic: fix typo in plic_warm_irqchip_init
Message-ID: <20220621120739.422990-1-jan.remes@codasip.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The second invocation of plic_context_init() incorrectly calls the
function with m_cntx_id instead of s_cntx_id. This breaks systems which
only have 1 external interrupt per hart.

Fixes: 8c362e7 ("lib: irqchip/plic: Factor out a context init function")
Signed-off-by: Jan Remes <jan.remes@codasip.com>
---
 lib/utils/irqchip/plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 8c25b9d..73d7788 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -145,7 +145,7 @@ int plic_warm_irqchip_init(const struct plic_data *plic,
 
 	/* By default, disable all IRQs for S-mode of target HART */
 	if (s_cntx_id > -1) {
-		ret = plic_context_init(plic, m_cntx_id, false, 0x7);
+		ret = plic_context_init(plic, s_cntx_id, false, 0x7);
 		if (ret)
 			return ret;
 	}
-- 
2.36.1


