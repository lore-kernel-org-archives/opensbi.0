From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 22 Jan 2025 12:14:30 +0530
Subject: [PATCH v2 03/13] lib: utils: Introduce optional MPXY RPMI service group operations
In-Reply-To: <20250122064441.272115-1-apatel@ventanamicro.com>
References: <20250122064441.272115-1-apatel@ventanamicro.com>
Message-ID: <20250122064441.272115-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some of the RPMI service groups may need additional context and
special handling when transferring messages via underlying mailbox
channel so introduce optional MPXY RPMI service group operations
for this purpose.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h | 12 +++++++++++
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 24 +++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
index 17b50557..df81a73d 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
@@ -12,6 +12,7 @@
 
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_mpxy.h>
+#include <sbi_utils/mailbox/fdt_mailbox.h>
 #include <sbi_utils/mailbox/rpmi_msgprot.h>
 #include <sbi_utils/mpxy/fdt_mpxy.h>
 
@@ -63,6 +64,17 @@ struct mpxy_rpmi_mbox_data {
 	u32 num_services;
 	u32 notifications_support;
 	struct mpxy_rpmi_service_data *service_data;
+
+	/** Transfer RPMI service group message */
+	int (*xfer_group)(void *context, struct mbox_chan *chan,
+			  struct mbox_xfer *xfer);
+
+	/** Setup RPMI service group context for MPXY */
+	int (*setup_group)(void **context, struct mbox_chan *chan,
+			   const struct mpxy_rpmi_mbox_data *data);
+
+	/** Cleanup RPMI service group context for MPXY */
+	void (*cleanup_group)(void *context);
 };
 
 /** Common probe function for MPXY RPMI drivers */
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
index 7034fb9e..6db750fb 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -13,7 +13,6 @@
 #include <sbi/sbi_heap.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
-#include <sbi_utils/mailbox/fdt_mailbox.h>
 #include <sbi/sbi_console.h>
 
 /**
@@ -25,6 +24,7 @@ struct mpxy_rpmi_mbox {
 	const struct mpxy_rpmi_mbox_data *mbox_data;
 	struct mpxy_rpmi_channel_attrs msgprot_attrs;
 	struct sbi_mpxy_channel channel;
+	void *group_context;
 };
 
 /**
@@ -146,8 +146,9 @@ static int __mpxy_mbox_send_message(struct sbi_mpxy_channel *channel,
 	struct rpmi_message_args args = {0};
 	struct mpxy_rpmi_mbox *rmb =
 		container_of(channel, struct mpxy_rpmi_mbox, channel);
+	const struct mpxy_rpmi_mbox_data *data = rmb->mbox_data;
 	const struct mpxy_rpmi_service_data *srv =
-		mpxy_find_rpmi_srvid(message_id, rmb->mbox_data);
+		mpxy_find_rpmi_srvid(message_id, data);
 
 	if (!srv)
 		return SBI_ENOTSUPP;
@@ -183,7 +184,10 @@ static int __mpxy_mbox_send_message(struct sbi_mpxy_channel *channel,
 				  tx, tx_len, RPMI_DEF_TX_TIMEOUT);
 	}
 
-	ret = mbox_chan_xfer(rmb->chan, &xfer);
+	if (data->xfer_group)
+		ret = data->xfer_group(rmb->group_context, rmb->chan, &xfer);
+	else
+		ret = mbox_chan_xfer(rmb->chan, &xfer);
 	if (ret)
 		return ret;
 
@@ -303,9 +307,21 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	rmb->mbox_data = data;
 	rmb->chan = chan;
 
-	/* Register RPXY service group */
+	/* Setup RPMI service group context */
+	if (data->setup_group) {
+		rc = data->setup_group(&rmb->group_context, chan, data);
+		if (rc) {
+			mbox_controller_free_chan(chan);
+			sbi_free(rmb);
+			return rc;
+		}
+	}
+
+	/* Register RPMI service group */
 	rc = sbi_mpxy_register_channel(&rmb->channel);
 	if (rc) {
+		if (data->cleanup_group)
+			data->cleanup_group(rmb->group_context);
 		mbox_controller_free_chan(chan);
 		sbi_free(rmb);
 		return rc;
-- 
2.43.0


