From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri,  4 Jun 2021 23:35:45 +0800
Subject: [PATCH v2 4/4] platform: andes/ae350: Drop plicsw_ipi_sync()
In-Reply-To: <20210604153545.18949-1-bmeng.cn@gmail.com>
References: <20210604153545.18949-1-bmeng.cn@gmail.com>
Message-ID: <20210604153545.18949-4-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

plicsw_ipi_sync() is a forward declaration but without the actual
implementation. Drop it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- new patch: Drop plicsw_ipi_sync()

 platform/andes/ae350/plicsw.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/platform/andes/ae350/plicsw.h b/platform/andes/ae350/plicsw.h
index 8be6194..58728f6 100644
--- a/platform/andes/ae350/plicsw.h
+++ b/platform/andes/ae350/plicsw.h
@@ -35,8 +35,6 @@ struct plicsw {
 
 void plicsw_ipi_send(u32 target_hart);
 
-void plicsw_ipi_sync(u32 target_hart);
-
 void plicsw_ipi_clear(u32 target_hart);
 
 int plicsw_warm_ipi_init(void);
-- 
2.25.1


