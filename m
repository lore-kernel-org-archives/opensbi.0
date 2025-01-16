From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 16 Jan 2025 21:26:43 +0530
Subject: [PATCH 04/12] lib: sbi: Fix capability bit assignment in MPXY framework
In-Reply-To: <20250116155651.103782-1-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
Message-ID: <20250116155651.103782-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The capability bit assignment in MPXY framework does not match the
SBI MPXY extension in latest SBI specification so update it.

Fixes: 7939bf1329eb ("lib: sbi: Add SBI Message Proxy (MPXY) framework")
Signed-off-by: Anup patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_mpxy.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 639478bf..91b212a6 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -43,17 +43,17 @@ static SBI_LIST_HEAD(mpxy_channel_list);
 #define CAP_EVENTSSTATE_POS	2
 #define CAP_EVENTSSTATE_MASK	(1U << CAP_EVENTSSTATE_POS)
 
-/** Channel Capability - Get Notification function support */
-#define CAP_GET_NOTIFICATIONS_POS	3
-#define CAP_GET_NOTIFICATIONS_MASK	(1U << CAP_GET_NOTIFICATIONS_POS)
+/** Channel Capability - Send Message With Response function support */
+#define CAP_SEND_MSG_WITH_RESP_POS	3
+#define CAP_SEND_MSG_WITH_RESP_MASK	(1U << CAP_SEND_MSG_WITH_RESP_POS)
 
 /** Channel Capability - Send Message Without Response function support */
 #define CAP_SEND_MSG_WITHOUT_RESP_POS	4
 #define CAP_SEND_MSG_WITHOUT_RESP_MASK	(1U << CAP_SEND_MSG_WITHOUT_RESP_POS)
 
-/** Channel Capability - Send Message With Response function support */
-#define CAP_SEND_MSG_WITH_RESP_POS	5
-#define CAP_SEND_MSG_WITH_RESP_MASK	(1U << CAP_SEND_MSG_WITH_RESP_POS)
+/** Channel Capability - Get Notification function support */
+#define CAP_GET_NOTIFICATIONS_POS	5
+#define CAP_GET_NOTIFICATIONS_MASK	(1U << CAP_GET_NOTIFICATIONS_POS)
 
 /** Helpers to enable/disable channel capability bits
  * _c: capability variable
-- 
2.43.0


