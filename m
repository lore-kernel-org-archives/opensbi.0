From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  6 Aug 2024 13:03:34 +0530
Subject: [PATCH 12/16] lib: utils/cppc: Add RPMI CPPC driver
In-Reply-To: <20240806073338.1856901-1-apatel@ventanamicro.com>
References: <20240806073338.1856901-1-apatel@ventanamicro.com>
Message-ID: <20240806073338.1856901-13-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Subrahmanya Lingappa <slingappa@ventanamicro.com>

Add RPMI based driver for CPPC register read, write and probe.

Signed-off-by: Subrahmanya Lingappa <slingappa@ventanamicro.com>
Co-developed-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h |  83 +++++++
 lib/utils/cppc/Kconfig                   |   9 +
 lib/utils/cppc/fdt_cppc_rpmi.c           | 287 +++++++++++++++++++++++
 lib/utils/cppc/objects.mk                |   3 +
 platform/generic/configs/defconfig       |   1 +
 5 files changed, 383 insertions(+)
 create mode 100644 lib/utils/cppc/fdt_cppc_rpmi.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index efe35aee..f7913ab1 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -152,6 +152,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_SYSTEM_RESET = 0x00002,
 	RPMI_SRVGRP_SYSTEM_SUSPEND = 0x00003,
 	RPMI_SRVGRP_HSM = 0x00004,
+	RPMI_SRVGRP_CPPC = 0x00005,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 };
 
@@ -334,4 +335,86 @@ struct rpmi_hsm_get_susp_info_resp {
 	u32 min_residency_us;
 };
 
+/** RPMI CPPC ServiceGroup Service IDs */
+enum rpmi_cppc_service_id {
+	RPMI_CPPC_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_CPPC_SRV_PROBE_REG = 0x02,
+	RPMI_CPPC_SRV_READ_REG = 0x03,
+	RPMI_CPPC_SRV_WRITE_REG = 0x04,
+	RPMI_CPPC_SRV_GET_FAST_CHANNEL_ADDR = 0x05,
+	RPMI_CPPC_SRV_POKE_FAST_CHANNEL = 0x06,
+	RPMI_CPPC_SRV_GET_HART_LIST = 0x07,
+	RPMI_CPPC_SRV_MAX_COUNT,
+};
+
+struct rpmi_cppc_probe_req {
+	u32 hart_id;
+	u32 reg_id;
+};
+
+struct rpmi_cppc_probe_resp {
+	s32 status;
+	u32 reg_len;
+};
+
+struct rpmi_cppc_read_reg_req {
+	u32 hart_id;
+	u32 reg_id;
+};
+
+struct rpmi_cppc_read_reg_resp {
+	s32 status;
+	u32 data_lo;
+	u32 data_hi;
+};
+
+struct rpmi_cppc_write_reg_req {
+	u32 hart_id;
+	u32 reg_id;
+	u32 data_lo;
+	u32 data_hi;
+};
+
+struct rpmi_cppc_write_reg_resp {
+	s32 status;
+};
+
+struct rpmi_cppc_get_fast_channel_addr_req {
+	u32 hart_id;
+};
+
+struct rpmi_cppc_get_fast_channel_addr_resp {
+	s32 status;
+#define RPMI_CPPC_FAST_CHANNEL_FLAGS_DB_WIDTH_POS	1
+#define RPMI_CPPC_FAST_CHANNEL_FLAGS_DB_WIDTH_MASK	\
+			(3U << RPMI_CPPC_FAST_CHANNEL_FLAGS_DB_WIDTH_POS)
+#define RPMI_CPPC_FAST_CHANNEL_FLAGS_DB_SUPPORTED	(1U << 0)
+	u32 flags;
+	u32 addr_lo;
+	u32 addr_hi;
+	u32 db_addr_lo;
+	u32 db_addr_hi;
+	u32 db_id_lo;
+	u32 db_id_hi;
+};
+
+enum rpmi_cppc_fast_channel_db_width {
+	RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_8 = 0x0,
+	RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_16 = 0x1,
+	RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_32 = 0x2,
+	RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_64 = 0x3,
+};
+
+struct rpmi_cppc_hart_list_req {
+	u32 start_index;
+};
+
+struct rpmi_cppc_hart_list_resp {
+	s32 status;
+	u32 remaining;
+	u32 returned;
+	/* remaining space need to be adjusted for the above 3 u32's */
+	u32 hartid[(RPMI_MSG_DATA_SIZE(RPMI_SLOT_SIZE_MIN) - (sizeof(u32) * 3)) / sizeof(u32)];
+};
+
 #endif /* !__RPMI_MSGPROT_H__ */
diff --git a/lib/utils/cppc/Kconfig b/lib/utils/cppc/Kconfig
index 08d1c97f..494f6894 100644
--- a/lib/utils/cppc/Kconfig
+++ b/lib/utils/cppc/Kconfig
@@ -7,4 +7,13 @@ config FDT_CPPC
 	depends on FDT
 	default n
 
+if FDT_CPPC
+
+config FDT_CPPC_RPMI
+	bool "FDT RPMI CPPC driver"
+	depends on FDT_MAILBOX && RPMI_MAILBOX
+	default n
+
+endif
+
 endmenu
diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
new file mode 100644
index 00000000..e9669ce4
--- /dev/null
+++ b/lib/utils/cppc/fdt_cppc_rpmi.c
@@ -0,0 +1,287 @@
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
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_cppc.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi_utils/cppc/fdt_cppc.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/mailbox/fdt_mailbox.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+
+struct rpmi_cppc {
+	struct mbox_chan *chan;
+	bool fast_chan_supported;
+	ulong fast_chan_addr;
+	bool fast_chan_db_supported;
+	enum rpmi_cppc_fast_channel_db_width fast_chan_db_width;
+	ulong fast_chan_db_addr;
+	u64 fast_chan_db_id;
+};
+
+static unsigned long rpmi_cppc_offset;
+
+static struct rpmi_cppc *rpmi_cppc_get_pointer(u32 hartid)
+{
+	struct sbi_scratch *scratch;
+
+	scratch = sbi_hartid_to_scratch(hartid);
+	if (!scratch || !rpmi_cppc_offset)
+		return NULL;
+
+	return sbi_scratch_offset_ptr(scratch, rpmi_cppc_offset);
+}
+
+static int rpmi_cppc_read(unsigned long reg, u64 *val)
+{
+	int rc = SBI_SUCCESS;
+	struct rpmi_cppc_read_reg_req req;
+	struct rpmi_cppc_read_reg_resp resp;
+	struct rpmi_cppc *cppc;
+
+	req.hart_id = current_hartid();
+	req.reg_id = reg;
+	cppc = rpmi_cppc_get_pointer(req.hart_id);
+
+	rc = rpmi_normal_request_with_status(
+			cppc->chan, RPMI_CPPC_SRV_READ_REG,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+	if (rc)
+		return rc;
+
+#if __riscv_xlen == 32
+	*val = resp.data_lo;
+#else
+	*val = (u64)resp.data_hi << 32 | resp.data_lo;
+#endif
+	return rc;
+}
+
+static int rpmi_cppc_write(unsigned long reg, u64 val)
+{
+	int rc = SBI_SUCCESS;
+	u32 hart_id = current_hartid();
+	struct rpmi_cppc_write_reg_req req;
+	struct rpmi_cppc_write_reg_resp resp;
+	struct rpmi_cppc *cppc = rpmi_cppc_get_pointer(hart_id);
+
+	if (reg != SBI_CPPC_DESIRED_PERF || !cppc->fast_chan_supported) {
+		req.hart_id = hart_id;
+		req.reg_id = reg;
+		req.data_lo = val & 0xFFFFFFFF;
+		req.data_hi = val >> 32;
+
+		rc = rpmi_normal_request_with_status(
+			cppc->chan, RPMI_CPPC_SRV_WRITE_REG,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+	} else {
+		/* use fast path writes */
+#if __riscv_xlen != 32
+		writeq(val, (void *)cppc->fast_chan_addr);
+#else
+		writel((u32)val, (void *)cppc->fast_chan_addr);
+		writel((u32)(val >> 32), (void *)(cppc->fast_chan_addr + 4));
+#endif
+		if (cppc->fast_chan_db_supported) {
+			switch (cppc->fast_chan_db_width) {
+			case RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_8:
+				writeb((u8)cppc->fast_chan_db_id,
+				       (void *)cppc->fast_chan_db_addr);
+				break;
+			case RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_16:
+				writew((u16)cppc->fast_chan_db_id,
+				       (void *)cppc->fast_chan_db_addr);
+				break;
+			case RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_32:
+				writel((u32)cppc->fast_chan_db_id,
+				       (void *)cppc->fast_chan_db_addr);
+				break;
+			case RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_64:
+#if __riscv_xlen != 32
+				writeq(cppc->fast_chan_db_id,
+				       (void *)cppc->fast_chan_db_addr);
+#else
+				writel((u32)cppc->fast_chan_db_id,
+				       (void *)cppc->fast_chan_db_addr);
+				writel((u32)(cppc->fast_chan_db_id >> 32),
+				       (void *)(cppc->fast_chan_db_addr + 4));
+#endif
+				break;
+			default:
+				break;
+			}
+		}
+	}
+
+	return rc;
+}
+
+static int rpmi_cppc_probe(unsigned long reg)
+{
+	int rc;
+	struct rpmi_cppc *cppc;
+	struct rpmi_cppc_probe_resp resp;
+	struct rpmi_cppc_probe_req req;
+
+	req.hart_id = current_hartid();
+	req.reg_id = reg;
+
+	cppc = rpmi_cppc_get_pointer(req.hart_id);
+	if (!cppc)
+		return SBI_ENOSYS;
+
+	rc = rpmi_normal_request_with_status(
+			cppc->chan, RPMI_CPPC_SRV_PROBE_REG,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+	if (rc)
+		return rc;
+
+	return resp.reg_len;
+}
+
+static struct sbi_cppc_device sbi_rpmi_cppc = {
+	.name		= "rpmi-cppc",
+	.cppc_read	= rpmi_cppc_read,
+	.cppc_write	= rpmi_cppc_write,
+	.cppc_probe	= rpmi_cppc_probe,
+};
+
+#define TOTAL_FAST_CHAN_SIZE		0x1000
+#define FAST_CHANNEL_REGION_ALIGN	0x1000
+
+static int rpmi_cppc_update_hart_scratch(struct mbox_chan *chan)
+{
+	int rc, i;
+	struct rpmi_cppc_hart_list_req req;
+	struct rpmi_cppc_hart_list_resp resp;
+	struct rpmi_cppc_get_fast_channel_addr_req freq;
+	struct rpmi_cppc_get_fast_channel_addr_resp fresp;
+	struct rpmi_cppc *cppc;
+	unsigned long fast_chan_base_addr;
+
+	/* Workaround for Smepmp issue */
+	freq.hart_id = 0;
+	rc = rpmi_normal_request_with_status(
+		chan, RPMI_CPPC_SRV_GET_FAST_CHANNEL_ADDR,
+		&freq, rpmi_u32_count(freq), rpmi_u32_count(freq),
+		&fresp, rpmi_u32_count(fresp), rpmi_u32_count(fresp));
+	if (rc)
+		return rc;
+
+#if __riscv_xlen == 32
+	fast_chan_base_addr = fresp.addr_lo;
+#else
+	fast_chan_base_addr = (ulong)fresp.addr_hi << 32 |
+						fresp.addr_lo;
+#endif
+	rc = sbi_domain_root_add_memrange(fast_chan_base_addr,
+				TOTAL_FAST_CHAN_SIZE,
+				FAST_CHANNEL_REGION_ALIGN,
+				(SBI_DOMAIN_MEMREGION_MMIO |
+				 SBI_DOMAIN_MEMREGION_M_READABLE |
+				 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+	if (rc)
+		return rc;
+
+	req.start_index = 0;
+	do {
+		rc = rpmi_normal_request_with_status(
+			chan, RPMI_CPPC_SRV_GET_HART_LIST,
+			&req, rpmi_u32_count(req), rpmi_u32_count(req),
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+		if (rc)
+			return rc;
+
+		for (i = 0; i < resp.returned; i++) {
+			cppc = rpmi_cppc_get_pointer(resp.hartid[i]);
+			if (!cppc)
+				return SBI_ENOSYS;
+			cppc->chan = chan;
+
+			freq.hart_id = resp.hartid[i];
+			rc = rpmi_normal_request_with_status(
+				chan, RPMI_CPPC_SRV_GET_FAST_CHANNEL_ADDR,
+				&freq, rpmi_u32_count(freq), rpmi_u32_count(freq),
+				&fresp, rpmi_u32_count(fresp), rpmi_u32_count(fresp));
+			if (rc)
+				continue;
+
+			cppc->fast_chan_supported = true;
+#if __riscv_xlen == 32
+			cppc->fast_chan_addr = fresp.addr_lo;
+#else
+			cppc->fast_chan_addr = (ulong)fresp.addr_hi << 32 |
+						fresp.addr_lo;
+#endif
+			cppc->fast_chan_db_supported = fresp.flags &
+				RPMI_CPPC_FAST_CHANNEL_FLAGS_DB_SUPPORTED;
+			cppc->fast_chan_db_width = (fresp.flags &
+				RPMI_CPPC_FAST_CHANNEL_FLAGS_DB_WIDTH_MASK) >>
+				RPMI_CPPC_FAST_CHANNEL_FLAGS_DB_WIDTH_POS;
+#if __riscv_xlen == 32
+			cppc->fast_chan_db_addr = fresp.db_addr_lo;
+#else
+			cppc->fast_chan_db_addr = (ulong)fresp.db_addr_hi << 32 |
+						fresp.db_addr_lo;
+#endif
+			cppc->fast_chan_db_id = (u64)fresp.db_id_hi << 32 |
+						fresp.db_id_lo;
+		}
+
+		req.start_index += resp.returned;
+	} while (resp.remaining);
+
+	return 0;
+}
+
+static int rpmi_cppc_cold_init(void *fdt, int nodeoff,
+			       const struct fdt_match *match)
+{
+	int rc;
+	struct mbox_chan *chan;
+
+	if (!rpmi_cppc_offset) {
+		rpmi_cppc_offset =
+			sbi_scratch_alloc_type_offset(struct rpmi_cppc);
+		if (!rpmi_cppc_offset)
+			return SBI_ENOMEM;
+	}
+
+	/*
+	 * If channel request failed then other end does not support
+	 * CPPC service group so do nothing.
+	 */
+	rc = fdt_mailbox_request_chan(fdt, nodeoff, 0, &chan);
+	if (rc)
+		return 0;
+
+	/* Update per-HART scratch space */
+	rc = rpmi_cppc_update_hart_scratch(chan);
+	if (rc)
+		return rc;
+
+	sbi_cppc_set_device(&sbi_rpmi_cppc);
+
+	return 0;
+}
+
+static const struct fdt_match rpmi_cppc_match[] = {
+	{ .compatible = "riscv,rpmi-cppc" },
+	{},
+};
+
+struct fdt_cppc fdt_cppc_rpmi = {
+	.match_table = rpmi_cppc_match,
+	.cold_init = rpmi_cppc_cold_init,
+};
diff --git a/lib/utils/cppc/objects.mk b/lib/utils/cppc/objects.mk
index fb37478a..07dc7d89 100644
--- a/lib/utils/cppc/objects.mk
+++ b/lib/utils/cppc/objects.mk
@@ -9,3 +9,6 @@
 
 libsbiutils-objs-$(CONFIG_FDT_CPPC) += cppc/fdt_cppc.o
 libsbiutils-objs-$(CONFIG_FDT_CPPC) += cppc/fdt_cppc_drivers.carray.o
+
+carray-fdt_cppc_drivers-$(CONFIG_FDT_CPPC_RPMI) += fdt_cppc_rpmi
+libsbiutils-objs-$(CONFIG_FDT_CPPC_RPMI) += cppc/fdt_cppc_rpmi.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index bd18c3c1..384918f9 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -7,6 +7,7 @@ CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_FDT_CPPC=y
+CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y
 CONFIG_FDT_GPIO_DESIGNWARE=y
 CONFIG_FDT_GPIO_SIFIVE=y
-- 
2.34.1


