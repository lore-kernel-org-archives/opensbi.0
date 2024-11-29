From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:46 +0530
Subject: [PATCH v2 11/17] lib: utils/hsm: Add RPMI HSM driver
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-12-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Subrahmanya Lingappa <slingappa@ventanamicro.com>

The RPMI HSM service group provides set of routine to query and control
power states of a Hart. Add RPMI based Hart State Management (HSM) driver.

Signed-off-by: Subrahmanya Lingappa <slingappa@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h |  92 ++++++
 lib/utils/hsm/Kconfig                    |   9 +
 lib/utils/hsm/fdt_hsm_rpmi.c             | 362 +++++++++++++++++++++++
 lib/utils/hsm/objects.mk                 |   3 +
 platform/generic/configs/defconfig       |   1 +
 5 files changed, 467 insertions(+)
 create mode 100644 lib/utils/hsm/fdt_hsm_rpmi.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 4de86adf..8e2b23e2 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -199,6 +199,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_BASE = 0x0001,
 	RPMI_SRVGRP_SYSTEM_RESET = 0x0002,
 	RPMI_SRVGRP_SYSTEM_SUSPEND = 0x0003,
+	RPMI_SRVGRP_HSM = 0x0004,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
 	/* Reserved range for service groups */
@@ -314,4 +315,95 @@ struct rpmi_syssusp_suspend_resp {
 	s32 status;
 };
 
+/** RPMI HSM State Management ServiceGroup Service IDs */
+enum rpmi_hsm_service_id {
+	RPMI_HSM_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_HSM_SRV_GET_HART_STATUS = 0x02,
+	RPMI_HSM_SRV_GET_HART_LIST = 0x03,
+	RPMI_HSM_SRV_GET_SUSPEND_TYPES = 0x04,
+	RPMI_HSM_SRV_GET_SUSPEND_INFO = 0x05,
+	RPMI_HSM_SRV_HART_START = 0x06,
+	RPMI_HSM_SRV_HART_STOP = 0x07,
+	RPMI_HSM_SRV_HART_SUSPEND = 0x08,
+	RPMI_HSM_SRV_ID_MAX = 0x09,
+};
+
+/* HSM service group request and response structs */
+struct rpmi_hsm_hart_start_req {
+	u32 hartid;
+	u32 start_addr_lo;
+	u32 start_addr_hi;
+};
+
+struct rpmi_hsm_hart_start_resp {
+	s32 status;
+};
+
+struct rpmi_hsm_hart_stop_req {
+	u32 hartid;
+};
+
+struct rpmi_hsm_hart_stop_resp {
+	s32 status;
+};
+
+struct rpmi_hsm_hart_susp_req {
+	u32 hartid;
+	u32 suspend_type;
+	u32 resume_addr_lo;
+	u32 resume_addr_hi;
+};
+
+struct rpmi_hsm_hart_susp_resp {
+	s32 status;
+};
+
+struct rpmi_hsm_get_hart_status_req {
+	u32 hartid;
+};
+
+struct rpmi_hsm_get_hart_status_resp {
+	s32 status;
+	u32 hart_status;
+};
+
+struct rpmi_hsm_get_hart_list_req {
+	u32 start_index;
+};
+
+struct rpmi_hsm_get_hart_list_resp {
+	s32 status;
+	u32 remaining;
+	u32 returned;
+	/* remaining space need to be adjusted for the above 3 u32's */
+	u32 hartid[(RPMI_MSG_DATA_SIZE(RPMI_SLOT_SIZE_MIN) - (sizeof(u32) * 3)) / sizeof(u32)];
+};
+
+struct rpmi_hsm_get_susp_types_req {
+	u32 start_index;
+};
+
+struct rpmi_hsm_get_susp_types_resp {
+	s32 status;
+	u32 remaining;
+	u32 returned;
+	/* remaining space need to be adjusted for the above 3 u32's */
+	u32 types[(RPMI_MSG_DATA_SIZE(RPMI_SLOT_SIZE_MIN) - (sizeof(u32) * 3)) / sizeof(u32)];
+};
+
+struct rpmi_hsm_get_susp_info_req {
+	u32 suspend_type;
+};
+
+#define RPMI_HSM_SUSPEND_INFO_FLAGS_TIMER_STOP		1U
+
+struct rpmi_hsm_get_susp_info_resp {
+	s32 status;
+	u32 flags;
+	u32 entry_latency_us;
+	u32 exit_latency_us;
+	u32 wakeup_latency_us;
+	u32 min_residency_us;
+};
+
 #endif /* !__RPMI_MSGPROT_H__ */
diff --git a/lib/utils/hsm/Kconfig b/lib/utils/hsm/Kconfig
index 31506116..1ad7958f 100644
--- a/lib/utils/hsm/Kconfig
+++ b/lib/utils/hsm/Kconfig
@@ -7,4 +7,13 @@ config FDT_HSM
 	depends on FDT
 	default n
 
+if FDT_HSM
+
+config FDT_HSM_RPMI
+	bool "FDT RPMI HSM driver"
+	depends on FDT_MAILBOX && RPMI_MAILBOX
+	default n
+
+endif
+
 endmenu
diff --git a/lib/utils/hsm/fdt_hsm_rpmi.c b/lib/utils/hsm/fdt_hsm_rpmi.c
new file mode 100644
index 00000000..975d3484
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm_rpmi.c
@@ -0,0 +1,362 @@
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
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/hsm/fdt_hsm.h>
+#include <sbi_utils/mailbox/fdt_mailbox.h>
+#include <sbi_utils/mailbox/mailbox.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+
+#define MAX_HSM_SUPSEND_STATE_NAMELEN		16
+
+struct rpmi_hsm_suspend {
+	u32 num_states;
+	struct sbi_cpu_idle_state *states;
+};
+
+struct rpmi_hsm {
+	struct mbox_chan *chan;
+	struct rpmi_hsm_suspend *susp;
+};
+
+static unsigned long rpmi_hsm_offset;
+
+static struct rpmi_hsm *rpmi_hsm_get_pointer(u32 hartid)
+{
+	struct sbi_scratch *scratch;
+
+	scratch = sbi_hartid_to_scratch(hartid);
+	if (!scratch || !rpmi_hsm_offset)
+		return NULL;
+
+	return sbi_scratch_offset_ptr(scratch, rpmi_hsm_offset);
+}
+
+static int rpmi_hsm_start(u32 hartid, ulong resume_addr)
+{
+	struct rpmi_hsm_hart_start_req req;
+	struct rpmi_hsm_hart_start_resp resp;
+	struct rpmi_hsm *rpmi = rpmi_hsm_get_pointer(hartid);
+
+	if (!rpmi)
+		return SBI_ENOSYS;
+
+	req.hartid = hartid;
+	req.start_addr_lo = resume_addr;
+	req.start_addr_hi = (u64)resume_addr  >> 32;
+
+	return rpmi_normal_request_with_status(
+			rpmi->chan, RPMI_HSM_SRV_HART_START,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+}
+
+static int rpmi_hsm_stop(void)
+{
+	int rc;
+	struct rpmi_hsm_hart_stop_req req;
+	struct rpmi_hsm_hart_stop_resp resp;
+	void (*jump_warmboot)(void) =
+		(void (*)(void))sbi_scratch_thishart_ptr()->warmboot_addr;
+	struct rpmi_hsm *rpmi = rpmi_hsm_get_pointer(current_hartid());
+
+	if (!rpmi)
+		return SBI_ENOSYS;
+
+	req.hartid = current_hartid();
+
+	rc = rpmi_normal_request_with_status(
+			rpmi->chan, RPMI_HSM_SRV_HART_STOP,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+	if (rc)
+		return rc;
+
+	/* Wait for interrupt */
+	wfi();
+
+	jump_warmboot();
+
+	return 0;
+}
+
+static bool is_rpmi_hsm_susp_supported(struct rpmi_hsm_suspend *susp, u32 type)
+{
+	int i;
+
+	for (i = 0; i < susp->num_states; i++)
+		if (type == susp->states[i].suspend_param)
+			return true;
+
+	return false;
+}
+
+static int rpmi_hsm_suspend(u32 type, ulong resume_addr)
+{
+	int rc;
+	struct rpmi_hsm_hart_susp_req req;
+	struct rpmi_hsm_hart_susp_resp resp;
+	struct rpmi_hsm *rpmi = rpmi_hsm_get_pointer(current_hartid());
+
+	if (!rpmi)
+		return SBI_ENOSYS;
+
+	/* check if harts support this suspend type */
+	if (!is_rpmi_hsm_susp_supported(rpmi->susp, type))
+		return SBI_EINVAL;
+
+	req.hartid = current_hartid();
+	req.suspend_type = type;
+	req.resume_addr_lo = resume_addr;
+	req.resume_addr_hi = (u64)resume_addr  >> 32;
+
+	rc = rpmi_normal_request_with_status(
+			rpmi->chan, RPMI_HSM_SRV_HART_SUSPEND,
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
+static struct sbi_hsm_device sbi_hsm_rpmi = {
+	.name		= "rpmi-hsm",
+	.hart_start	= rpmi_hsm_start,
+	.hart_stop	= rpmi_hsm_stop,
+	.hart_suspend	= rpmi_hsm_suspend,
+};
+
+static void rpmi_hsm_do_fixup(struct fdt_general_fixup *f, void *fdt)
+{
+	struct rpmi_hsm *rpmi = rpmi_hsm_get_pointer(current_hartid());
+
+	if (!rpmi || !rpmi->susp || !rpmi->susp->num_states)
+		return;
+
+	fdt_add_cpu_idle_states(fdt, rpmi->susp->states);
+}
+
+static struct fdt_general_fixup rpmi_hsm_fixup = {
+	.name = "rpmi-hsm-fixup",
+	.do_fixup = rpmi_hsm_do_fixup,
+};
+
+static int rpmi_hsm_get_num_suspend_states(struct mbox_chan *chan,
+					   struct rpmi_hsm_suspend *susp)
+{
+	int rc;
+	struct rpmi_hsm_get_susp_types_req req;
+	struct rpmi_hsm_get_susp_types_resp resp;
+
+	req.start_index = 0;
+	rc = rpmi_normal_request_with_status(
+			chan, RPMI_HSM_SRV_GET_SUSPEND_TYPES,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+	if (rc)
+		return rc;
+
+	susp->num_states = resp.returned + resp.remaining;
+	return 0;
+}
+
+static int rpmi_hsm_get_suspend_states(struct mbox_chan *chan,
+					struct rpmi_hsm_suspend *susp)
+{
+	int rc, i, cnt = 0;
+	struct rpmi_hsm_get_susp_types_req req;
+	struct rpmi_hsm_get_susp_types_resp resp;
+	struct rpmi_hsm_get_susp_info_req dreq;
+	struct rpmi_hsm_get_susp_info_resp dresp;
+	struct sbi_cpu_idle_state *state;
+
+	if (!susp->num_states)
+		return 0;
+
+	req.start_index = 0;
+	do {
+		rc = rpmi_normal_request_with_status(
+			chan, RPMI_HSM_SRV_GET_SUSPEND_TYPES,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+		if (rc)
+			return rc;
+
+		for (i = 0; i < resp.returned && cnt < susp->num_states; i++)
+			susp->states[cnt++].suspend_param = resp.types[i];
+		req.start_index = i;
+	} while (resp.remaining);
+
+	for (i = 0; i < susp->num_states; i++) {
+		state = &susp->states[i];
+
+		dreq.suspend_type = state->suspend_param;
+		rc = rpmi_normal_request_with_status(
+			chan, RPMI_HSM_SRV_GET_SUSPEND_INFO,
+			&dreq, rpmi_u32_count(dreq), rpmi_u32_count(dreq),
+			&dresp, rpmi_u32_count(dresp), rpmi_u32_count(dresp));
+		if (rc)
+			return rc;
+
+		state->local_timer_stop =
+			(dresp.flags & RPMI_HSM_SUSPEND_INFO_FLAGS_TIMER_STOP) ? true : false;
+		state->entry_latency_us = dresp.entry_latency_us;
+		state->exit_latency_us = dresp.exit_latency_us;
+		state->wakeup_latency_us = dresp.wakeup_latency_us;
+		state->min_residency_us = dresp.min_residency_us;
+	}
+
+	return 0;
+}
+
+static int rpmi_hsm_update_hart_scratch(struct mbox_chan *chan,
+					struct rpmi_hsm_suspend *susp)
+{
+	int rc, i;
+	struct rpmi_hsm_get_hart_list_req req;
+	struct rpmi_hsm_get_hart_list_resp resp;
+	struct rpmi_hsm *rpmi = rpmi_hsm_get_pointer(current_hartid());
+
+	req.start_index = 0;
+	do {
+		rc = rpmi_normal_request_with_status(
+			chan, RPMI_HSM_SRV_GET_HART_LIST,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+		if (rc)
+			return rc;
+
+		for (i = 0; i < resp.returned; i++) {
+			rpmi = rpmi_hsm_get_pointer(resp.hartid[i]);
+			if (!rpmi)
+				return SBI_ENOSYS;
+
+			rpmi->chan = chan;
+			rpmi->susp = susp;
+		}
+
+		req.start_index += resp.returned;
+	} while (resp.remaining);
+
+	return 0;
+}
+
+static int rpmi_hsm_cold_init(const void *fdt, int nodeoff,
+			      const struct fdt_match *match)
+{
+	int rc, i;
+	struct mbox_chan *chan;
+	struct rpmi_hsm_suspend *susp;
+
+	if (!rpmi_hsm_offset) {
+		rpmi_hsm_offset =
+			sbi_scratch_alloc_type_offset(struct rpmi_hsm);
+		if (!rpmi_hsm_offset)
+			return SBI_ENOMEM;
+	}
+
+	/*
+	 * If channel request failed then other end does not support
+	 * HSM service group so do nothing.
+	 */
+	rc = fdt_mailbox_request_chan(fdt, nodeoff, 0, &chan);
+	if (rc)
+		return SBI_ENODEV;
+
+	/* Allocate context for HART suspend states */
+	susp = sbi_zalloc(sizeof(*susp));
+	if (!susp)
+		return SBI_ENOMEM;
+
+	/* Get number of HART suspend states */
+	rc = rpmi_hsm_get_num_suspend_states(chan, susp);
+	if (rc)
+		goto fail_free_susp;
+
+	/* Skip HART suspend state discovery for zero HART suspend states */
+	if (!susp->num_states)
+		goto skip_suspend_states;
+
+	/* Allocate array of HART suspend states */
+	susp->states = sbi_calloc(susp->num_states + 1, sizeof(*susp->states));
+	if (!susp->states) {
+		rc = SBI_ENOMEM;
+		goto fail_free_susp;
+	}
+
+	/* Allocate name of each HART suspend state */
+	for (i = 0; i < susp->num_states; i++) {
+		susp->states[i].name =
+			sbi_zalloc(MAX_HSM_SUPSEND_STATE_NAMELEN);
+		if (!susp->states[i].name) {
+			do {
+				i--;
+				sbi_free((void *)susp->states[i].name);
+			} while (i > 0);
+
+			rc = SBI_ENOMEM;
+			goto fail_free_susp_states;
+		}
+		sbi_snprintf((char *)susp->states[i].name,
+			     MAX_HSM_SUPSEND_STATE_NAMELEN, "cpu-susp%d", i);
+	}
+
+	/* Get details about each HART suspend state */
+	rc = rpmi_hsm_get_suspend_states(chan, susp);
+	if (rc)
+		goto fail_free_susp_state_names;
+
+skip_suspend_states:
+	/* Update per-HART scratch space */
+	rc = rpmi_hsm_update_hart_scratch(chan, susp);
+	if (rc)
+		goto fail_free_susp_state_names;
+
+	/* Register HSM fixup callback */
+	rc = fdt_register_general_fixup(&rpmi_hsm_fixup);
+	if (rc)
+		goto fail_free_susp_state_names;
+
+	/* Register HSM device */
+	if (!susp->num_states)
+		sbi_hsm_rpmi.hart_suspend = NULL;
+	sbi_hsm_set_device(&sbi_hsm_rpmi);
+
+	return 0;
+
+fail_free_susp_state_names:
+	for (i = 0; i < susp->num_states; i++)
+		sbi_free((void *)susp->states[i].name);
+fail_free_susp_states:
+	if (susp->num_states)
+		sbi_free(susp->states);
+fail_free_susp:
+	sbi_free(susp);
+	return rc;
+}
+
+static const struct fdt_match rpmi_hsm_match[] = {
+	{ .compatible = "riscv,rpmi-hsm" },
+	{},
+};
+
+struct fdt_driver fdt_hsm_rpmi = {
+	.match_table = rpmi_hsm_match,
+	.init = rpmi_hsm_cold_init,
+};
diff --git a/lib/utils/hsm/objects.mk b/lib/utils/hsm/objects.mk
index 49337bf5..b54b6f6c 100644
--- a/lib/utils/hsm/objects.mk
+++ b/lib/utils/hsm/objects.mk
@@ -9,3 +9,6 @@
 
 libsbiutils-objs-$(CONFIG_FDT_HSM) += hsm/fdt_hsm.o
 libsbiutils-objs-$(CONFIG_FDT_HSM) += hsm/fdt_hsm_drivers.carray.o
+
+carray-fdt_hsm_drivers-$(CONFIG_FDT_HSM_RPMI) += fdt_hsm_rpmi
+libsbiutils-objs-$(CONFIG_FDT_HSM_RPMI) += hsm/fdt_hsm_rpmi.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 2efc7136..78fc96b6 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -11,6 +11,7 @@ CONFIG_FDT_GPIO_DESIGNWARE=y
 CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_GPIO_STARFIVE=y
 CONFIG_FDT_HSM=y
+CONFIG_FDT_HSM_RPMI=y
 CONFIG_FDT_I2C=y
 CONFIG_FDT_I2C_SIFIVE=y
 CONFIG_FDT_I2C_DW=y
-- 
2.43.0


