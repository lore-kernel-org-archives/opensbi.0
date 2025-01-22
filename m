From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 22 Jan 2025 12:14:29 +0530
Subject: [PATCH v2 02/13] lib: utils: Constantify mpxy_rpmi_mbox_data in mpxy_rpmi_mbox
In-Reply-To: <20250122064441.272115-1-apatel@ventanamicro.com>
References: <20250122064441.272115-1-apatel@ventanamicro.com>
Message-ID: <20250122064441.272115-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The mpxy_rpmi_mbox_data is provided by RPMI service group specific
MPXY driver to the common MPXY RPMI mailbox client implementation
so let's constantify mpxy_rpmi_mbox_data in mpxy_rpmi_mbox so that
it is not accidently modified.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi_clock.c |  2 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c  | 15 ++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
index d2ce0718..4e36d4f5 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
@@ -69,7 +69,7 @@ static struct mpxy_rpmi_service_data clock_services[] = {
 },
 };
 
-static struct mpxy_rpmi_mbox_data clock_data = {
+static const struct mpxy_rpmi_mbox_data clock_data = {
 	.servicegrp_id = RPMI_SRVGRP_CLOCK,
 	.num_services = RPMI_CLOCK_SRV_MAX_COUNT,
 	.notifications_support = 1,
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
index 0d4fd1fe..7034fb9e 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -22,7 +22,7 @@
  */
 struct mpxy_rpmi_mbox {
 	struct mbox_chan *chan;
-	struct mpxy_rpmi_mbox_data *mbox_data;
+	const struct mpxy_rpmi_mbox_data *mbox_data;
 	struct mpxy_rpmi_channel_attrs msgprot_attrs;
 	struct sbi_mpxy_channel channel;
 };
@@ -31,11 +31,11 @@ struct mpxy_rpmi_mbox {
  * Discover the RPMI service data using message_id
  * MPXY message_id == RPMI service_id
  */
-static struct mpxy_rpmi_service_data *mpxy_find_rpmi_srvid(u32 message_id,
-					struct mpxy_rpmi_mbox_data *mbox_data)
+static const struct mpxy_rpmi_service_data *mpxy_find_rpmi_srvid(u32 message_id,
+					const struct mpxy_rpmi_mbox_data *mbox_data)
 {
 	int mid = 0;
-	struct mpxy_rpmi_service_data *srv = mbox_data->service_data;
+	const struct mpxy_rpmi_service_data *srv = mbox_data->service_data;
 
 	for (mid = 0; srv[mid].id < mbox_data->num_services; mid++) {
 		if (srv[mid].id == (u8)message_id)
@@ -146,8 +146,9 @@ static int __mpxy_mbox_send_message(struct sbi_mpxy_channel *channel,
 	struct rpmi_message_args args = {0};
 	struct mpxy_rpmi_mbox *rmb =
 		container_of(channel, struct mpxy_rpmi_mbox, channel);
-	struct mpxy_rpmi_service_data *srv =
-			mpxy_find_rpmi_srvid(message_id, rmb->mbox_data);
+	const struct mpxy_rpmi_service_data *srv =
+		mpxy_find_rpmi_srvid(message_id, rmb->mbox_data);
+
 	if (!srv)
 		return SBI_ENOTSUPP;
 
@@ -299,7 +300,7 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	rmb->msgprot_attrs.servicegrp_ver =
 			SBI_MPXY_MSGPROTO_VERSION(MPXY_RPMI_MAJOR_VER, MPXY_RPMI_MINOR_VER);
 
-	rmb->mbox_data = (struct mpxy_rpmi_mbox_data *)data;
+	rmb->mbox_data = data;
 	rmb->chan = chan;
 
 	/* Register RPXY service group */
-- 
2.43.0


