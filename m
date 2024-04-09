From: Cyan Yang <cyan.yang@sifive.com>
Date: Tue,  9 Apr 2024 22:45:47 +0800
Subject: [PATCH] lib: utils/irqchip: Add sanity checks to imsic_warm_irqchip_init()
Message-ID: <20240409144547.87893-1-cyan.yang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add sanity checks for per-HART IMSIC pointer in warm init flow, similar to
what the cold init flow does. This will help prevent any misuse of the
data in scratch space.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 lib/utils/irqchip/imsic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index f2a35c6..e6a3657 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -243,10 +243,15 @@ void imsic_local_irqchip_init(void)
 
 int imsic_warm_irqchip_init(void)
 {
+	int rc;
 	struct imsic_data *imsic = imsic_get_data(current_hartid());
 
 	/* Sanity checks */
-	if (!imsic || !imsic->targets_mmode)
+	rc = imsic_data_check(imsic);
+	if (rc)
+		return rc;
+
+	if (!imsic->targets_mmode)
 		return SBI_EINVAL;
 
 	/* Disable all interrupts */
-- 
2.39.3 (Apple Git-146)


