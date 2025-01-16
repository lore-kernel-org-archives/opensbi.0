From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 16 Jan 2025 21:26:51 +0530
Subject: [PATCH 12/12] lib: utils: Add MPXY RPMI mailbox driver for System MSI service group
In-Reply-To: <20250116155651.103782-1-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
Message-ID: <20250116155651.103782-13-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The supervisor software can directly receive most of the system MSIs
except P2A doorbell and MSIs preferred to be handled in M-mode.

Add MPXY RPMI mailbox client driver for the System MSI service group.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h |  88 ++++++++++
 lib/utils/mpxy/Kconfig                   |   4 +
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c    | 208 +++++++++++++++++++++++
 lib/utils/mpxy/objects.mk                |   3 +
 platform/generic/configs/defconfig       |   1 +
 5 files changed, 304 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 363cc653..8d8fa5e5 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -208,6 +208,7 @@ enum rpmi_channel_attribute_id {
 enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_ID_MIN = 0,
 	RPMI_SRVGRP_BASE = 0x0001,
+	RPMI_SRVGRP_SYSTEM_MSI = 0x0002,
 	RPMI_SRVGRP_SYSTEM_RESET = 0x0003,
 	RPMI_SRVGRP_SYSTEM_SUSPEND = 0x0004,
 	RPMI_SRVGRP_HSM = 0x0005,
@@ -267,6 +268,93 @@ struct rpmi_base_get_platform_info_resp {
 	char plat_info[];
 };
 
+/** RPMI System MSI ServiceGroup Service IDs */
+enum rpmi_sysmsi_service_id {
+	RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_SYSMSI_SRV_GET_ATTRIBUTES = 0x2,
+	RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES = 0x3,
+	RPMI_SYSMSI_SRV_SET_MSI_STATE = 0x4,
+	RPMI_SYSMSI_SRV_GET_MSI_STATE = 0x5,
+	RPMI_SYSMSI_SRV_SET_MSI_TARGET = 0x6,
+	RPMI_SYSMSI_SRV_GET_MSI_TARGET = 0x7,
+	RPMI_SYSMSI_SRV_ID_MAX_COUNT,
+};
+
+/** Response for system MSI service group attributes */
+struct rpmi_sysmsi_get_attributes_resp {
+	s32 status;
+	u32 sys_num_msi;
+	u32 p2a_db_index;
+	u32 flag0;
+	u32 flag1;
+};
+
+/** Request for system MSI attributes */
+struct rpmi_sysmsi_get_msi_attributes_req {
+	u32 sys_msi_index;
+};
+
+/** Response for system MSI attributes */
+struct rpmi_sysmsi_get_msi_attributes_resp {
+	s32 status;
+	u32 flag0;
+	u32 flag1;
+	u8 name[16];
+};
+
+#define RPMI_SYSMSI_MSI_ATTRIBUTES_FLAG0_PREF_PRIV	(1U << 0)
+
+/** Request for system MSI set state */
+struct rpmi_sysmsi_set_msi_state_req {
+	u32 sys_msi_index;
+	u32 sys_msi_state;
+};
+
+#define RPMI_SYSMSI_MSI_STATE_ENABLE			(1U << 0)
+#define RPMI_SYSMSI_MSI_STATE_PENDING			(1U << 1)
+
+/** Response for system MSI set state */
+struct rpmi_sysmsi_set_msi_state_resp {
+	s32 status;
+};
+
+/** Request for system MSI get state */
+struct rpmi_sysmsi_get_msi_state_req {
+	u32 sys_msi_index;
+};
+
+/** Response for system MSI get state */
+struct rpmi_sysmsi_get_msi_state_resp {
+	s32 status;
+	u32 sys_msi_state;
+};
+
+/** Request for system MSI set target */
+struct rpmi_sysmsi_set_msi_target_req {
+	u32 sys_msi_index;
+	u32 sys_msi_address_low;
+	u32 sys_msi_address_high;
+	u32 sys_msi_data;
+};
+
+/** Response for system MSI set target */
+struct rpmi_sysmsi_set_msi_target_resp {
+	s32 status;
+};
+
+/** Request for system MSI get target */
+struct rpmi_sysmsi_get_msi_target_req {
+	u32 sys_msi_index;
+};
+
+/** Response for system MSI get target */
+struct rpmi_sysmsi_get_msi_target_resp {
+	s32 status;
+	u32 sys_msi_address_low;
+	u32 sys_msi_address_high;
+	u32 sys_msi_data;
+};
+
 /** RPMI System Reset ServiceGroup Service IDs */
 enum rpmi_system_reset_service_id {
 	RPMI_SYSRST_SRV_ENABLE_NOTIFICATION = 0x01,
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index ff88f24f..8d1f5183 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -18,6 +18,10 @@ config FDT_MPXY_RPMI_CLOCK
 	bool "MPXY driver for RPMI clock service group"
 	default n
 
+config FDT_MPXY_RPMI_SYSMSI
+	bool "MPXY driver for RPMI system MSI service group"
+	default n
+
 endif
 
 endmenu
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
new file mode 100644
index 00000000..3dacf28f
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
@@ -0,0 +1,208 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <sbi/sbi_bitmap.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_byteorder.h>
+#include <sbi/sbi_heap.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+
+struct mpxy_rpmi_sysmsi {
+	u32 sys_num_msi;
+	unsigned long *sys_msi_denied_bmap;
+};
+
+static int mpxy_rpmi_sysmis_xfer(void *context, struct mbox_chan *chan,
+				 struct mbox_xfer *xfer)
+{
+	struct rpmi_message_args *args = xfer->args;
+	struct mpxy_rpmi_sysmsi *smg = context;
+	u64 sys_msi_address;
+	u32 sys_msi_index;
+	int rc = 0;
+
+	if (!xfer->rx || args->type != RPMI_MSG_NORMAL_REQUEST)
+		return 0;
+
+	switch (args->service_id) {
+	case RPMI_SYSMSI_SRV_GET_ATTRIBUTES:
+		((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_SUCCESS);
+		((u32 *)xfer->rx)[1] = cpu_to_le32(smg->sys_num_msi);
+		((u32 *)xfer->rx)[2] = -1U;
+		((u32 *)xfer->rx)[3] = 0;
+		((u32 *)xfer->rx)[4] = 0;
+		args->rx_data_len = 5 * sizeof(u32);
+		break;
+	case RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES:
+	case RPMI_SYSMSI_SRV_SET_MSI_STATE:
+	case RPMI_SYSMSI_SRV_GET_MSI_STATE:
+	case RPMI_SYSMSI_SRV_SET_MSI_TARGET:
+	case RPMI_SYSMSI_SRV_GET_MSI_TARGET:
+		sys_msi_index = le32_to_cpu(((u32 *)xfer->tx)[0]);
+		if (smg->sys_num_msi <= sys_msi_index) {
+			((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_ERR_INVALID_PARAM);
+			args->rx_data_len = sizeof(u32);
+			break;
+		}
+		if (bitmap_test(smg->sys_msi_denied_bmap, sys_msi_index)) {
+			((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_ERR_DENIED);
+			args->rx_data_len = sizeof(u32);
+			break;
+		}
+		if (args->service_id == RPMI_SYSMSI_SRV_SET_MSI_TARGET) {
+			sys_msi_address = le32_to_cpu(((u32 *)xfer->tx)[1]);
+			sys_msi_address |= ((u64)le32_to_cpu(((u32 *)xfer->tx)[2])) << 32;
+			if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
+							 sys_msi_address, 0x4, PRV_S,
+							 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
+				((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_ERR_INVALID_ADDR);
+				args->rx_data_len = sizeof(u32);
+				break;
+			}
+		}
+		rc = mbox_chan_xfer(chan, xfer);
+		break;
+	default:
+		((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_ERR_NOTSUPP);
+		args->rx_data_len = sizeof(u32);
+		break;
+	};
+
+	return rc;
+}
+
+static void mpxy_rpmi_sysmsi_cleanup(void *context)
+{
+	struct mpxy_rpmi_sysmsi *smg = context;
+
+	sbi_free(smg->sys_msi_denied_bmap);
+	sbi_free(smg);
+}
+
+static int mpxy_rpmi_sysmsi_setup(void **context, struct mbox_chan *chan,
+				  const struct mpxy_rpmi_mbox_data *data)
+{
+	struct rpmi_sysmsi_get_msi_attributes_resp gmaresp;
+	struct rpmi_sysmsi_get_msi_attributes_req gmareq;
+	struct rpmi_sysmsi_get_attributes_resp garesp;
+	struct mpxy_rpmi_sysmsi *smg;
+	int rc, i;
+
+	rc = rpmi_normal_request_with_status(chan, RPMI_SYSMSI_SRV_GET_ATTRIBUTES,
+					     NULL, 0, 0, &garesp, rpmi_u32_count(garesp),
+					     rpmi_u32_count(garesp));
+	if (rc)
+		return rc;
+
+	smg = sbi_zalloc(sizeof(*smg));
+	if (!smg)
+		return SBI_ENOMEM;
+
+	smg->sys_num_msi = garesp.sys_num_msi;
+	smg->sys_msi_denied_bmap = sbi_zalloc(bitmap_estimate_size(smg->sys_num_msi));
+	if (!smg->sys_msi_denied_bmap) {
+		sbi_free(smg);
+		return SBI_ENOMEM;
+	}
+
+	for (i = 0; i < smg->sys_num_msi; i++) {
+		gmareq.sys_msi_index = i;
+		rc = rpmi_normal_request_with_status(chan,
+						     RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES,
+						     &gmareq, rpmi_u32_count(gmareq),
+						     rpmi_u32_count(gmareq),
+						     &gmaresp, rpmi_u32_count(gmaresp),
+						     rpmi_u32_count(gmaresp));
+		if (rc) {
+			mpxy_rpmi_sysmsi_cleanup(smg);
+			return rc;
+		}
+
+		if (garesp.p2a_db_index == i ||
+		    (gmaresp.flag0 & RPMI_SYSMSI_MSI_ATTRIBUTES_FLAG0_PREF_PRIV))
+			bitmap_set(smg->sys_msi_denied_bmap, i, 1);
+	}
+
+	*context = smg;
+	return 0;
+}
+
+static struct mpxy_rpmi_service_group_ops sysmsi_ops = {
+	.xfer_group = mpxy_rpmi_sysmis_xfer,
+	.setup_group = mpxy_rpmi_sysmsi_setup,
+	.cleanup_group = mpxy_rpmi_sysmsi_cleanup,
+};
+
+static struct mpxy_rpmi_service_data sysmsi_services[] = {
+{
+	.id = RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION,
+	.min_tx_len = sizeof(struct rpmi_enable_notification_req),
+	.max_tx_len = sizeof(struct rpmi_enable_notification_req),
+	.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
+	.max_rx_len = sizeof(struct rpmi_enable_notification_resp),
+},
+{
+	.id = RPMI_SYSMSI_SRV_GET_ATTRIBUTES,
+	.min_tx_len = 0,
+	.max_tx_len = 0,
+	.min_rx_len = sizeof(struct rpmi_sysmsi_get_attributes_resp),
+	.max_rx_len = sizeof(struct rpmi_sysmsi_get_attributes_resp),
+},
+{
+	.id = RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES,
+	.min_tx_len = sizeof(struct rpmi_sysmsi_get_msi_attributes_req),
+	.max_tx_len = sizeof(struct rpmi_sysmsi_get_msi_attributes_req),
+	.min_rx_len = sizeof(struct rpmi_sysmsi_get_msi_attributes_resp),
+	.max_rx_len = sizeof(struct rpmi_sysmsi_get_msi_attributes_resp),
+},
+{
+	.id = RPMI_SYSMSI_SRV_SET_MSI_STATE,
+	.min_tx_len = sizeof(struct rpmi_sysmsi_set_msi_state_req),
+	.max_tx_len = sizeof(struct rpmi_sysmsi_set_msi_state_req),
+	.min_rx_len = sizeof(struct rpmi_sysmsi_set_msi_state_resp),
+	.max_rx_len = sizeof(struct rpmi_sysmsi_set_msi_state_resp),
+},
+{
+	.id = RPMI_SYSMSI_SRV_GET_MSI_STATE,
+	.min_tx_len = sizeof(struct rpmi_sysmsi_get_msi_state_req),
+	.max_tx_len = sizeof(struct rpmi_sysmsi_get_msi_state_req),
+	.min_rx_len = sizeof(struct rpmi_sysmsi_get_msi_state_resp),
+	.max_rx_len = sizeof(struct rpmi_sysmsi_get_msi_state_resp),
+},
+{
+	.id = RPMI_SYSMSI_SRV_SET_MSI_TARGET,
+	.min_tx_len = sizeof(struct rpmi_sysmsi_set_msi_target_req),
+	.max_tx_len = sizeof(struct rpmi_sysmsi_set_msi_target_req),
+	.min_rx_len = sizeof(struct rpmi_sysmsi_set_msi_target_resp),
+	.max_rx_len = sizeof(struct rpmi_sysmsi_set_msi_target_resp),
+},
+{
+	.id = RPMI_SYSMSI_SRV_GET_MSI_TARGET,
+	.min_tx_len = sizeof(struct rpmi_sysmsi_get_msi_target_req),
+	.max_tx_len = sizeof(struct rpmi_sysmsi_get_msi_target_req),
+	.min_rx_len = sizeof(struct rpmi_sysmsi_get_msi_target_resp),
+	.max_rx_len = sizeof(struct rpmi_sysmsi_get_msi_target_resp),
+},
+};
+
+static struct mpxy_rpmi_mbox_data sysmsi_data = {
+	.servicegrp_id = RPMI_SRVGRP_SYSTEM_MSI,
+	.num_services = RPMI_SYSMSI_SRV_ID_MAX_COUNT,
+	.service_data = sysmsi_services,
+	.group_ops = &sysmsi_ops,
+};
+
+static const struct fdt_match sysmsi_match[] = {
+	{ .compatible = "riscv,rpmi-mpxy-system-msi", .data = &sysmsi_data },
+	{ },
+};
+
+struct fdt_driver fdt_mpxy_rpmi_sysmsi = {
+	.match_table = sysmsi_match,
+	.init = mpxy_rpmi_mbox_init,
+	.experimental = true,
+};
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 1c9afed9..5b6e9bdf 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -14,3 +14,6 @@ libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MBOX) += mpxy/fdt_mpxy_rpmi_mbox.o
 
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += fdt_mpxy_rpmi_clock
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += mpxy/fdt_mpxy_rpmi_clock.o
+
+carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_SYSMSI) += fdt_mpxy_rpmi_sysmsi
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_SYSMSI) += mpxy/fdt_mpxy_rpmi_sysmsi.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 55607a28..bb260626 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -56,3 +56,4 @@ CONFIG_FDT_TIMER_PLMT=y
 CONFIG_FDT_MPXY=y
 CONFIG_FDT_MPXY_RPMI_MBOX=y
 CONFIG_FDT_MPXY_RPMI_CLOCK=y
+CONFIG_FDT_MPXY_RPMI_SYSMSI=y
-- 
2.43.0


