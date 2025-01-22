From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 22 Jan 2025 12:14:37 +0530
Subject: [PATCH v2 10/13] lib: utils: Populate MPXY channel attributes from RPMI channel attributes
In-Reply-To: <20250122064441.272115-1-apatel@ventanamicro.com>
References: <20250122064441.272115-1-apatel@ventanamicro.com>
Message-ID: <20250122064441.272115-11-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the RPMI mailbox channel attributes to populate MPXY channel
attributes instead of hard coding them.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h |   3 -
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 101 +++++++++++++-------
 2 files changed, 65 insertions(+), 39 deletions(-)

diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
index 373b077a..068a1a55 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
@@ -16,9 +16,6 @@
 #include <sbi_utils/mailbox/rpmi_msgprot.h>
 #include <sbi_utils/mpxy/fdt_mpxy.h>
 
-#define MPXY_RPMI_MAJOR_VER		(1)
-#define MPXY_RPMI_MINOR_VER		(0)
-
 /** Convert the mpxy attribute ID to attribute array index */
 #define attr_id2index(attr_id)	(attr_id - SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
 
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
index f8de91a5..48dfe476 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -212,14 +212,14 @@ static int mpxy_mbox_send_message_withoutresp(struct sbi_mpxy_channel *channel,
 
 int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
+	u32 channel_id, servicegrp_ver, pro_ver, max_data_len, tx_tout, rx_tout;
 	const struct mpxy_rpmi_mbox_data *data = match->data;
 	struct mpxy_rpmi_mbox *rmb;
 	struct mbox_chan *chan;
 	const fdt32_t *val;
-	u32 channel_id;
 	int rc, len;
 
-	/* Allocate context for RPXY mbox client */
+	/* Allocate context for MPXY mbox client */
 	rmb = sbi_zalloc(sizeof(*rmb));
 	if (!rmb)
 		return SBI_ENOMEM;
@@ -230,29 +230,57 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	 */
 	rc = fdt_mailbox_request_chan(fdt, nodeoff, 0, &chan);
 	if (rc) {
-		sbi_free(rmb);
-		return SBI_ENODEV;
+		rc = SBI_ENODEV;
+		goto fail_free_client;
 	}
 
 	/* Match channel service group id */
 	if (data->servicegrp_id != chan->chan_args[0]) {
-		mbox_controller_free_chan(chan);
-		sbi_free(rmb);
-		return SBI_EINVAL;
+		rc = SBI_EINVAL;
+		goto fail_free_chan;
 	}
 
+	/* Get channel protocol version */
+	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_PROTOCOL_VERSION,
+				     &pro_ver);
+	if (rc)
+		goto fail_free_chan;
+
+	/* Get channel maximum data length */
+	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_MAX_DATA_LEN,
+				     &max_data_len);
+	if (rc)
+		goto fail_free_chan;
+
+	/* Get channel Tx timeout */
+	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_TX_TIMEOUT,
+				     &tx_tout);
+	if (rc)
+		goto fail_free_chan;
+
+	/* Get channel Rx timeout */
+	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_RX_TIMEOUT,
+				     &rx_tout);
+	if (rc)
+		goto fail_free_chan;
+
+	/* Get channel service group version */
+	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_SERVICEGROUP_VERSION,
+				     &servicegrp_ver);
+	if (rc)
+		goto fail_free_chan;
+
 	/*
 	 * The "riscv,sbi-mpxy-channel-id" DT property is mandatory
 	 * for MPXY RPMI mailbox client driver so if this is not
 	 * present then try other drivers.
 	 */
 	val = fdt_getprop(fdt, nodeoff, "riscv,sbi-mpxy-channel-id", &len);
-	if (len > 0 && val)
+	if (len > 0 && val) {
 		channel_id = fdt32_to_cpu(*val);
-	else {
-		mbox_controller_free_chan(chan);
-		sbi_free(rmb);
-		return SBI_ENODEV;
+	} else {
+		rc = SBI_ENODEV;
+		goto fail_free_chan;
 	}
 
 	/* Setup MPXY mbox client */
@@ -271,23 +299,23 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	/* RPMI Message Protocol ID */
 	rmb->channel.attrs.msg_proto_id = SBI_MPXY_MSGPROTO_RPMI_ID;
 	/* RPMI Message Protocol Version */
-	rmb->channel.attrs.msg_proto_version =
-		SBI_MPXY_MSGPROTO_VERSION(MPXY_RPMI_MAJOR_VER, MPXY_RPMI_MINOR_VER);
-
-	/* RPMI supported max message data length(bytes), same for
-	 * all service groups */
-	rmb->channel.attrs.msg_data_maxlen =
-					RPMI_MSG_DATA_SIZE(RPMI_SLOT_SIZE_MIN);
-	/* RPMI message send timeout(milliseconds)
-	 * same for all service groups */
-	rmb->channel.attrs.msg_send_timeout = RPMI_DEF_TX_TIMEOUT;
-	rmb->channel.attrs.msg_completion_timeout =
-				RPMI_DEF_TX_TIMEOUT + RPMI_DEF_RX_TIMEOUT;
-
-	/* RPMI message protocol attributes */
+	rmb->channel.attrs.msg_proto_version = pro_ver;
+
+	/*
+	 * RPMI supported max message data length(bytes), same for
+	 * all service groups
+	 */
+	rmb->channel.attrs.msg_data_maxlen = max_data_len;
+	/*
+	 * RPMI message send timeout(milliseconds)
+	 * same for all service groups
+	 */
+	rmb->channel.attrs.msg_send_timeout = tx_tout;
+	rmb->channel.attrs.msg_completion_timeout = tx_tout + rx_tout;
+
+	/* RPMI service group attributes */
 	rmb->msgprot_attrs.servicegrp_id = data->servicegrp_id;
-	rmb->msgprot_attrs.servicegrp_ver =
-			SBI_MPXY_MSGPROTO_VERSION(MPXY_RPMI_MAJOR_VER, MPXY_RPMI_MINOR_VER);
+	rmb->msgprot_attrs.servicegrp_ver = servicegrp_ver;
 
 	rmb->mbox_data = data;
 	rmb->chan = chan;
@@ -295,11 +323,8 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	/* Setup RPMI service group context */
 	if (data->setup_group) {
 		rc = data->setup_group(&rmb->group_context, chan, data);
-		if (rc) {
-			mbox_controller_free_chan(chan);
-			sbi_free(rmb);
-			return rc;
-		}
+		if (rc)
+			goto fail_free_chan;
 	}
 
 	/* Register RPMI service group */
@@ -307,10 +332,14 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	if (rc) {
 		if (data->cleanup_group)
 			data->cleanup_group(rmb->group_context);
-		mbox_controller_free_chan(chan);
-		sbi_free(rmb);
-		return rc;
+		goto fail_free_chan;
 	}
 
 	return SBI_OK;
+
+fail_free_chan:
+	mbox_controller_free_chan(chan);
+fail_free_client:
+	sbi_free(rmb);
+	return rc;
 }
-- 
2.43.0


