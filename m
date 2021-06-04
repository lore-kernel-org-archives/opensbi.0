From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri,  4 Jun 2021 23:35:44 +0800
Subject: [PATCH v2 3/4] platform: andes/ae350: Drop plicsw_get_pending()
In-Reply-To: <20210604153545.18949-1-bmeng.cn@gmail.com>
References: <20210604153545.18949-1-bmeng.cn@gmail.com>
Message-ID: <20210604153545.18949-3-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is not used anywhere. Drop it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- new patch: Drop plicsw_get_pending()

 platform/andes/ae350/plicsw.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/platform/andes/ae350/plicsw.c b/platform/andes/ae350/plicsw.c
index 4df7317..edbbb11 100644
--- a/platform/andes/ae350/plicsw.c
+++ b/platform/andes/ae350/plicsw.c
@@ -33,12 +33,6 @@ static inline void plicsw_complete(void)
 	writel(source, plicsw_dev[source_hart].plicsw_claim);
 }
 
-static inline u32 plicsw_get_pending(u32 source_hart, u32 target_hart)
-{
-	return readl(plicsw_dev[source_hart].plicsw_pending)
-	       & (PLICSW_HART_MASK >> target_hart);
-}
-
 static inline void plic_sw_pending(u32 target_hart)
 {
 	/*
-- 
2.25.1


