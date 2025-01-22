From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 22 Jan 2025 12:14:36 +0530
Subject: [PATCH v2 09/13] lib: utils: Implement get_attribute() for the RPMI shared memory mailbox
In-Reply-To: <20250122064441.272115-1-apatel@ventanamicro.com>
References: <20250122064441.272115-1-apatel@ventanamicro.com>
Message-ID: <20250122064441.272115-10-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To allow clients query service group version of a RPMI mailbox channel,
implement get_attribute() callback for the RPMI shared memory mailbox
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h   | 13 +++++++-
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 35 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 9575dc72..17d678a3 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -175,7 +175,7 @@ enum rpmi_error {
 	RPMI_ERR_VENDOR_START	= -128,
 };
 
-/** RPMI Message Arguments */
+/** RPMI Mailbox Message Arguments */
 struct rpmi_message_args {
 	u32 flags;
 #define RPMI_MSG_FLAGS_NO_TX		(1U << 0)
@@ -189,6 +189,17 @@ struct rpmi_message_args {
 	u32 rx_data_len;
 };
 
+/** RPMI Mailbox Channel Attribute IDs */
+enum rpmi_channel_attribute_id {
+	RPMI_CHANNEL_ATTR_PROTOCOL_VERSION = 0,
+	RPMI_CHANNEL_ATTR_MAX_DATA_LEN,
+	RPMI_CHANNEL_ATTR_TX_TIMEOUT,
+	RPMI_CHANNEL_ATTR_RX_TIMEOUT,
+	RPMI_CHANNEL_ATTR_SERVICEGROUP_ID,
+	RPMI_CHANNEL_ATTR_SERVICEGROUP_VERSION,
+	RPMI_CHANNEL_ATTR_MAX,
+};
+
 /*
  * RPMI SERVICEGROUPS AND SERVICES
  */
diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index b8bd3cd6..e9f52c7a 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -490,6 +490,40 @@ static int rpmi_shmem_mbox_xfer(struct mbox_chan *chan, struct mbox_xfer *xfer)
 	return 0;
 }
 
+static int rpmi_shmem_mbox_get_attribute(struct mbox_chan *chan,
+					 int attr_id, void *out_value)
+{
+	struct rpmi_shmem_mbox_controller *mctl =
+			container_of(chan->mbox,
+				     struct rpmi_shmem_mbox_controller,
+				     controller);
+	struct rpmi_srvgrp_chan *srvgrp_chan = to_srvgrp_chan(chan);
+
+	switch (attr_id) {
+	case RPMI_CHANNEL_ATTR_PROTOCOL_VERSION:
+		*((u32 *)out_value) = mctl->spec_version;
+		break;
+	case RPMI_CHANNEL_ATTR_MAX_DATA_LEN:
+		*((u32 *)out_value) = RPMI_MSG_DATA_SIZE(mctl->slot_size);
+		break;
+	case RPMI_CHANNEL_ATTR_TX_TIMEOUT:
+		*((u32 *)out_value) = RPMI_DEF_TX_TIMEOUT;
+		break;
+	case RPMI_CHANNEL_ATTR_RX_TIMEOUT:
+		*((u32 *)out_value) = RPMI_DEF_RX_TIMEOUT;
+		break;
+	case RPMI_CHANNEL_ATTR_SERVICEGROUP_ID:
+		*((u32 *)out_value) = srvgrp_chan->servicegroup_id;
+		break;
+	case RPMI_CHANNEL_ATTR_SERVICEGROUP_VERSION:
+		*((u32 *)out_value) = srvgrp_chan->servicegroup_version;
+		break;
+	default:
+		return SBI_ENOTSUPP;
+	}
+
+	return 0;
+}
 
 static struct mbox_chan *rpmi_shmem_mbox_request_chan(
 						struct mbox_controller *mbox,
@@ -665,6 +699,7 @@ static int rpmi_shmem_mbox_init(const void *fdt, int nodeoff,
 	mctl->controller.request_chan = rpmi_shmem_mbox_request_chan;
 	mctl->controller.free_chan = rpmi_shmem_mbox_free_chan;
 	mctl->controller.xfer = rpmi_shmem_mbox_xfer;
+	mctl->controller.get_attribute = rpmi_shmem_mbox_get_attribute;
 	ret = mbox_controller_add(&mctl->controller);
 	if (ret)
 		goto fail_free_controller;
-- 
2.43.0


