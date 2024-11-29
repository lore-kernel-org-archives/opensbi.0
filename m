From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:40 +0530
Subject: [PATCH v2 05/17] lib/utils: reset: Add RPMI System Reset driver
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-6-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rahul Pathak <rpathak@ventanamicro.com>

Add RPMI based driver for system reset and enable it in the generic
platform defconfig

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h |  27 +++++
 lib/utils/reset/Kconfig                  |   5 +
 lib/utils/reset/fdt_reset_rpmi.c         | 141 +++++++++++++++++++++++
 lib/utils/reset/objects.mk               |   3 +
 platform/generic/configs/defconfig       |   1 +
 5 files changed, 177 insertions(+)
 create mode 100644 lib/utils/reset/fdt_reset_rpmi.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index f9f65447..31c3034b 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -196,6 +196,7 @@ struct rpmi_message_args {
 enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_ID_MIN = 0,
 	RPMI_SRVGRP_BASE = 0x0001,
+	RPMI_SRVGRP_SYSTEM_RESET = 0x0002,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
 	/* Reserved range for service groups */
@@ -252,4 +253,30 @@ struct rpmi_base_get_platform_info_resp {
 	char plat_info[];
 };
 
+/** RPMI System Reset ServiceGroup Service IDs */
+enum rpmi_system_reset_service_id {
+	RPMI_SYSRST_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_SYSRST_SRV_GET_ATTRIBUTES = 0x02,
+	RPMI_SYSRST_SRV_SYSTEM_RESET = 0x03,
+	RPMI_SYSRST_SRV_ID_MAX_COUNT,
+};
+
+/** RPMI System Reset types */
+enum rpmi_sysrst_reset_type {
+	RPMI_SYSRST_TYPE_SHUTDOWN = 0x0,
+	RPMI_SYSRST_TYPE_COLD_REBOOT = 0x1,
+	RPMI_SYSRST_TYPE_WARM_REBOOT = 0x2,
+	RPMI_SYSRST_TYPE_MAX,
+};
+
+#define RPMI_SYSRST_ATTRS_FLAGS_RESETTYPE_POS		(1)
+#define RPMI_SYSRST_ATTRS_FLAGS_RESETTYPE_MASK		\
+			(1U << RPMI_SYSRST_ATTRS_FLAGS_RESETTYPE_POS)
+
+/** Response for system reset attributes */
+struct rpmi_sysrst_get_reset_attributes_resp {
+	s32 status;
+	u32 flags;
+};
+
 #endif /* !__RPMI_MSGPROT_H__ */
diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index 6c077fe7..68e66716 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -24,6 +24,11 @@ config FDT_RESET_HTIF
 	select SYS_HTIF
 	default n
 
+config FDT_RESET_RPMI
+	bool "RPMI FDT reset driver"
+	depends on FDT_MAILBOX && RPMI_MAILBOX
+	default n
+
 config FDT_RESET_SG2042_HWMON_MCU
 	bool "Sophgo SG2042 hwmon MCU FDT reset driver"
 	default n
diff --git a/lib/utils/reset/fdt_reset_rpmi.c b/lib/utils/reset/fdt_reset_rpmi.c
new file mode 100644
index 00000000..1ec4396b
--- /dev/null
+++ b/lib/utils/reset/fdt_reset_rpmi.c
@@ -0,0 +1,141 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Rahul Pathak <rpathak@ventanamicro.com>
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_system.h>
+#include <sbi/sbi_console.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/reset/fdt_reset.h>
+#include <sbi_utils/mailbox/fdt_mailbox.h>
+#include <sbi_utils/mailbox/rpmi_msgprot.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+
+/* struct rpmi_sysreset: RPMI System Reset Context */
+struct rpmi_sysreset {
+	int warm_reset_support;
+	struct mbox_chan *chan;
+};
+
+static struct rpmi_sysreset sysreset_ctx;
+
+static int rpmi_system_reset_type_check(u32 reset_type)
+{
+	int ret;
+	struct rpmi_sysrst_get_reset_attributes_resp resp;
+
+	ret = rpmi_normal_request_with_status(sysreset_ctx.chan,
+		RPMI_SYSRST_SRV_GET_ATTRIBUTES, &reset_type,
+		rpmi_u32_count(reset_type), rpmi_u32_count(reset_type),
+		&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+	if (ret) {
+		return 0;
+	}
+
+	return (resp.flags & RPMI_SYSRST_ATTRS_FLAGS_RESETTYPE_MASK) ? 1 : 0;
+}
+
+/**
+ * rpmi_do_system_reset: Do system reset
+ *
+ * @reset_type: RPMI System Reset Type
+ */
+static void rpmi_do_system_reset(u32 reset_type)
+{
+	int ret;
+
+	ret = rpmi_posted_request(sysreset_ctx.chan,
+				  RPMI_SYSRST_SRV_SYSTEM_RESET,
+				  &reset_type, rpmi_u32_count(reset_type),
+				  rpmi_u32_count(reset_type));
+	if (ret)
+		sbi_printf("system reset failed [type: %d]: ret: %d\n",
+			   reset_type, ret);
+}
+
+/**
+ * rpmi_system_reset_check: Check the support for
+ * various reset types
+ *
+ * @type: SBI System Reset Type
+ * @reason: Reason for system reset
+ */
+static int rpmi_system_reset_check(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+		return 1;
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		return sysreset_ctx.warm_reset_support;
+	default:
+		return 0;
+	}
+}
+
+static void rpmi_system_reset(u32 type, u32 reason)
+{
+	u32 reset_type;
+
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+		reset_type = RPMI_SYSRST_TYPE_SHUTDOWN;
+		break;
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+		reset_type = RPMI_SYSRST_TYPE_COLD_REBOOT;
+		break;
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		reset_type = RPMI_SYSRST_TYPE_WARM_REBOOT;
+		break;
+	default:
+		return;
+	}
+
+	rpmi_do_system_reset(reset_type);
+}
+
+static struct sbi_system_reset_device rpmi_reset_dev = {
+	.name = "rpmi-system-reset",
+	.system_reset_check = rpmi_system_reset_check,
+	.system_reset = rpmi_system_reset,
+};
+
+static int rpmi_reset_init(const void *fdt, int nodeoff,
+			   const struct fdt_match *match)
+{
+	int ret;
+
+	/* If channel already available then do nothing. */
+	if (sysreset_ctx.chan)
+		return 0;
+
+	/*
+	 * If channel request failed then other end does not support
+	 * system reset group so do nothing.
+	 */
+	ret = fdt_mailbox_request_chan(fdt, nodeoff, 0, &sysreset_ctx.chan);
+	if (ret)
+		return SBI_ENODEV;
+
+	sysreset_ctx.warm_reset_support =
+			rpmi_system_reset_type_check(RPMI_SYSRST_TYPE_WARM_REBOOT);
+
+	sbi_system_reset_add_device(&rpmi_reset_dev);
+
+	return SBI_OK;
+}
+
+static const struct fdt_match rpmi_reset_match[] = {
+	{ .compatible = "riscv,rpmi-system-reset" },
+	{},
+};
+
+struct fdt_driver fdt_reset_rpmi = {
+	.match_table = rpmi_reset_match,
+	.init = rpmi_reset_init,
+};
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index a84336cf..8f3774c5 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -29,3 +29,6 @@ libsbiutils-objs-$(CONFIG_FDT_RESET_SUNXI_WDT) += reset/fdt_reset_sunxi_wdt.o
 carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SYSCON) += fdt_syscon_poweroff
 carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SYSCON) += fdt_syscon_reboot
 libsbiutils-objs-$(CONFIG_FDT_RESET_SYSCON) += reset/fdt_reset_syscon.o
+
+carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_RPMI) += fdt_reset_rpmi
+libsbiutils-objs-$(CONFIG_FDT_RESET_RPMI) += reset/fdt_reset_rpmi.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 233a9a89..48f8df4c 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_FDT_RESET=y
 CONFIG_FDT_RESET_ATCWDT200=y
 CONFIG_FDT_RESET_GPIO=y
 CONFIG_FDT_RESET_HTIF=y
+CONFIG_FDT_RESET_RPMI=y
 CONFIG_FDT_RESET_SUNXI_WDT=y
 CONFIG_FDT_RESET_SG2042_HWMON_MCU=y
 CONFIG_FDT_RESET_SYSCON=y
-- 
2.43.0


