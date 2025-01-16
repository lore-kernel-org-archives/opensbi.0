From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 16 Jan 2025 21:26:45 +0530
Subject: [PATCH 06/12] lib: utils: Drop notifications from MPXY RPMI mailbox client
In-Reply-To: <20250116155651.103782-1-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
Message-ID: <20250116155651.103782-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the common MPXY RPMI mailbox client does not support
notifications so no need for dummy notifications support.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h |  1 -
 lib/utils/mpxy/fdt_mpxy_rpmi_clock.c        |  1 -
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 10 ----------
 3 files changed, 12 deletions(-)

diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
index 08b32a0a..53a8d8bd 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
@@ -77,7 +77,6 @@ struct mpxy_rpmi_service_group_ops {
 struct mpxy_rpmi_mbox_data {
 	u32 servicegrp_id;
 	u32 num_services;
-	u32 notifications_support;
 	struct mpxy_rpmi_service_data *service_data;
 	struct mpxy_rpmi_service_group_ops *group_ops;
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
index 3d275cd8..125539ac 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
@@ -75,7 +75,6 @@ static struct mpxy_rpmi_service_data clock_services[] = {
 static struct mpxy_rpmi_mbox_data clock_data = {
 	.servicegrp_id = RPMI_SRVGRP_CLOCK,
 	.num_services = RPMI_CLOCK_SRV_MAX_COUNT,
-	.notifications_support = 1,
 	.service_data = clock_services,
 	.group_ops = &clock_ops,
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
index 8d892cef..26b9e6a6 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -213,13 +213,6 @@ static int mpxy_mbox_send_message_withoutresp(struct sbi_mpxy_channel *channel,
 				 NULL, 0, NULL);
 }
 
-static int mpxy_mbox_get_notifications(struct sbi_mpxy_channel *channel,
-				       void *eventsbuf, u32 bufsize,
-				       unsigned long *events_len)
-{
-	return SBI_ENOTSUPP;
-}
-
 int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	int rc, len;
@@ -277,9 +270,6 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 					mpxy_mbox_send_message_withresp;
 	rmb->channel.send_message_without_response =
 					mpxy_mbox_send_message_withoutresp;
-	/* Callback to get RPMI notifications */
-	rmb->channel.get_notification_events = mpxy_mbox_get_notifications;
-
 	/* No callback to switch events state data */
 	rmb->channel.switch_eventsstate = NULL;
 
-- 
2.43.0


