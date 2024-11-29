From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:42 +0530
Subject: [PATCH v2 07/17] lib: utils/suspend: Add RPMI system suspend driver
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-8-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Subrahmanya Lingappa <slingappa@ventanamicro.com>

Add RPMI based system suspend driver.

To test this, execute the follwoing in Linux:
 $ echo mem > /sys/power/state

To wake up, execute the following command on qemu monitor terminal:
 (qemu) system_wakeup

Signed-off-by: Subrahmanya Lingappa <slingappa@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h |  35 ++++++
 lib/utils/suspend/Kconfig                |   9 ++
 lib/utils/suspend/fdt_suspend_rpmi.c     | 138 +++++++++++++++++++++++
 lib/utils/suspend/objects.mk             |   3 +
 platform/generic/configs/defconfig       |   1 +
 5 files changed, 186 insertions(+)
 create mode 100644 lib/utils/suspend/fdt_suspend_rpmi.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 31c3034b..4de86adf 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -5,6 +5,7 @@
  *
  * Authors:
  *   Rahul Pathak <rpathak@ventanamicro.com>
+ *   Subrahmanya Lingappa <slingappa@ventanamicro.com>
  */
 
 #ifndef __RPMI_MSGPROT_H__
@@ -197,6 +198,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_ID_MIN = 0,
 	RPMI_SRVGRP_BASE = 0x0001,
 	RPMI_SRVGRP_SYSTEM_RESET = 0x0002,
+	RPMI_SRVGRP_SYSTEM_SUSPEND = 0x0003,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
 	/* Reserved range for service groups */
@@ -279,4 +281,37 @@ struct rpmi_sysrst_get_reset_attributes_resp {
 	u32 flags;
 };
 
+/** RPMI System Suspend ServiceGroup Service IDs */
+enum rpmi_system_suspend_service_id {
+	RPMI_SYSSUSP_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_SYSSUSP_SRV_GET_ATTRIBUTES = 0x02,
+	RPMI_SYSSUSP_SRV_SYSTEM_SUSPEND = 0x03,
+	RPMI_SYSSUSP_SRV_ID_MAX_COUNT,
+};
+
+/** Request for system suspend attributes */
+struct rpmi_syssusp_get_attr_req {
+	u32 susp_type;
+};
+
+#define RPMI_SYSSUSP_ATTRS_FLAGS_RESUMEADDR	(1U << 1)
+#define RPMI_SYSSUSP_ATTRS_FLAGS_SUSPENDTYPE	1U
+
+/** Response for system suspend attributes */
+struct rpmi_syssusp_get_attr_resp {
+	s32 status;
+	u32 flags;
+};
+
+struct rpmi_syssusp_suspend_req {
+	u32 hartid;
+	u32 suspend_type;
+	u32 resume_addr_lo;
+	u32 resume_addr_hi;
+};
+
+struct rpmi_syssusp_suspend_resp {
+	s32 status;
+};
+
 #endif /* !__RPMI_MSGPROT_H__ */
diff --git a/lib/utils/suspend/Kconfig b/lib/utils/suspend/Kconfig
index 416ae795..2cbea75c 100644
--- a/lib/utils/suspend/Kconfig
+++ b/lib/utils/suspend/Kconfig
@@ -7,4 +7,13 @@ config FDT_SUSPEND
 	depends on FDT
 	default n
 
+if FDT_SUSPEND
+
+config FDT_SUSPEND_RPMI
+	bool "FDT RPMI suspend driver"
+	depends on FDT_MAILBOX && RPMI_MAILBOX
+	default n
+
+endif
+
 endmenu
diff --git a/lib/utils/suspend/fdt_suspend_rpmi.c b/lib/utils/suspend/fdt_suspend_rpmi.c
new file mode 100644
index 00000000..11696648
--- /dev/null
+++ b/lib/utils/suspend/fdt_suspend_rpmi.c
@@ -0,0 +1,138 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Subrahmanya Lingappa <slingappa@ventanamicro.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_system.h>
+#include <sbi/riscv_asm.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/mailbox/fdt_mailbox.h>
+#include <sbi_utils/mailbox/mailbox.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+#include <sbi_utils/suspend/fdt_suspend.h>
+
+struct rpmi_syssusp {
+	struct mbox_chan *chan;
+	bool cust_res_addr_supported;
+	bool suspend_supported;
+};
+
+static struct rpmi_syssusp syssusp_ctx;
+
+static int rpmi_syssusp_attrs(uint32_t *attrs)
+{
+	int rc;
+	struct rpmi_syssusp_get_attr_resp resp;
+	struct rpmi_syssusp_get_attr_req req;
+
+	req.susp_type = SBI_SUSP_SLEEP_TYPE_SUSPEND;
+
+	rc = rpmi_normal_request_with_status(
+		syssusp_ctx.chan, RPMI_SYSSUSP_SRV_GET_ATTRIBUTES,
+		&req, rpmi_u32_count(req), rpmi_u32_count(req),
+		&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+	if (rc)
+		return rc;
+
+	*attrs = resp.flags;
+
+	return 0;
+}
+
+static int rpmi_syssusp(uint32_t suspend_type, ulong resume_addr)
+{
+	int rc;
+	struct rpmi_syssusp_suspend_req req;
+	struct rpmi_syssusp_suspend_resp resp;
+
+	req.hartid = current_hartid();
+	req.suspend_type = suspend_type;
+	req.resume_addr_lo = resume_addr;
+	req.resume_addr_hi = (u64)resume_addr  >> 32;
+
+	rc = rpmi_normal_request_with_status(
+			syssusp_ctx.chan, RPMI_SYSSUSP_SRV_SYSTEM_SUSPEND,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+	if (rc)
+		return rc;
+
+	/* Wait for interrupt */
+	wfi();
+
+	return 0;
+}
+
+static int rpmi_system_suspend_check(u32 sleep_type)
+{
+	return ((sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) &&
+		syssusp_ctx.suspend_supported) ? 0 : SBI_EINVAL;
+}
+
+static int rpmi_system_suspend(u32 sleep_type, ulong resume_addr)
+{
+	int rc;
+
+	if (sleep_type != SBI_SUSP_SLEEP_TYPE_SUSPEND)
+		return SBI_ENOTSUPP;
+
+	rc = rpmi_syssusp(sleep_type, resume_addr);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static struct sbi_system_suspend_device rpmi_suspend_dev = {
+	.name = "rpmi-system-suspend",
+	.system_suspend_check = rpmi_system_suspend_check,
+	.system_suspend = rpmi_system_suspend,
+};
+
+static int rpmi_suspend_init(const void *fdt, int nodeoff,
+			     const struct fdt_match *match)
+{
+	int rc;
+	uint32_t attrs = 0;
+
+	/* If channel already available then do nothing. */
+	if (syssusp_ctx.chan)
+		return 0;
+
+	/*
+	 * If channel request failed then other end does not support
+	 * suspend service group so do nothing.
+	 */
+	rc = fdt_mailbox_request_chan(fdt, nodeoff, 0, &syssusp_ctx.chan);
+	if (rc)
+		return SBI_ENODEV;
+
+	/* Get suspend attributes */
+	rc = rpmi_syssusp_attrs(&attrs);
+	if (rc)
+		return rc;
+
+	syssusp_ctx.suspend_supported =
+			attrs & RPMI_SYSSUSP_ATTRS_FLAGS_SUSPENDTYPE;
+	syssusp_ctx.cust_res_addr_supported =
+			attrs & RPMI_SYSSUSP_ATTRS_FLAGS_RESUMEADDR;
+
+	sbi_system_suspend_set_device(&rpmi_suspend_dev);
+
+	return 0;
+}
+
+static const struct fdt_match rpmi_suspend_match[] = {
+	{ .compatible = "riscv,rpmi-system-suspend" },
+	{},
+};
+
+struct fdt_driver fdt_suspend_rpmi = {
+	.match_table = rpmi_suspend_match,
+	.init = rpmi_suspend_init,
+};
diff --git a/lib/utils/suspend/objects.mk b/lib/utils/suspend/objects.mk
index 30d897d1..657670a8 100644
--- a/lib/utils/suspend/objects.mk
+++ b/lib/utils/suspend/objects.mk
@@ -9,3 +9,6 @@
 
 libsbiutils-objs-$(CONFIG_FDT_SUSPEND) += suspend/fdt_suspend.o
 libsbiutils-objs-$(CONFIG_FDT_SUSPEND) += suspend/fdt_suspend_drivers.carray.o
+
+carray-fdt_suspend_drivers-$(CONFIG_FDT_SUSPEND_RPMI) += fdt_suspend_rpmi
+libsbiutils-objs-$(CONFIG_FDT_SUSPEND_RPMI) += suspend/fdt_suspend_rpmi.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index ec439d74..54300fb5 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -45,6 +45,7 @@ CONFIG_FDT_SERIAL_UART8250=y
 CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
 CONFIG_SERIAL_SEMIHOSTING=y
 CONFIG_FDT_SUSPEND=y
+CONFIG_FDT_SUSPEND_RPMI=y
 CONFIG_FDT_TIMER=y
 CONFIG_FDT_TIMER_MTIMER=y
 CONFIG_FDT_TIMER_PLMT=y
-- 
2.43.0


