Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1160ED216A4
	for <opensbi@archiver.kernel.org>; Thu,  4 Dec 2025 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6J64lMwT/87INbfpaOH2RRzMiHUxDhVpynx/ngdBx68=; b=zi1hkwhLSSh10h
	Y3xERke/aisb6QGPeKqT+iO0TZiXL7ZMuSJ69VfrC+GW86UU5JU8mJp2LrhgalMjDfFUVmeUxC7LI
	fBqDFCWQ70s1aKgcrVU0JgfCpb2i0FhMikV689IWv1Hk4sN2RWgfyf4AtwaRzapIPS5B5JIU3uMfO
	yKSgU4A1ZxmLs+0hfaZo+kQBkRh4Q55+gpIESJi4SDV1QE8x6bFXcV2NmZ/WRh5QfSC1bclHtHBa4
	o+rD5EQ5RVJ9FI/Vqc0Bcy7GZQt9foMP+kpH9wJwqN6w3kNcVT01HpSj+kCqTbGCwgDB8Yprdybwr
	MbD5J/VQaTUyqW9tFm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBiV-00000008EyR-1ovo;
	Thu, 04 Dec 2025 15:58:03 +0000
Received: from esa.hc1631-21.eu.iphmx.com ([23.90.122.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBiR-00000008Exq-29W0
	for opensbi@lists.infradead.org;
	Thu, 04 Dec 2025 15:58:01 +0000
X-CSE-ConnectionGUID: TEf4DagmSeSf7pTE6iSH+A==
X-CSE-MsgGUID: XreELRAXR5ihg2xGjQDdzA==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com; dkim=pass (signature verified) header.i=@thalesgroup.com
X-THALES-CLOUD-URL: Yes
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="41130362"
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="41130362"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
  t=1764863874;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=HN1hls0z9siL/BtsNd/QFFyhpPn+ExrIzkG9RKw7qFI=;
  b=XChGeWOfk5rX1HtnfrmuepPoAX50+EvOarM5gvd59G9s8WnUILcQtSM7
   S0ynsNzLfb0PKvHjgMVSmXcOsJpG6G3CSF7YhUZ92n82p3tqpDUh1tL7a
   NifGYu4MtsjevATJyhOxc+XQ+Ow+ilLtozHzhgdOuEzztpYG+Q+kpkQjA
   q9hEXpAUhAnC7TKcHmaqxalIor9dPhTYO6nU/VAdKFdn1iu7BppC6mI8z
   V8Ri7uFxODfyE55Kn98jEL4an6ae7PUZ6npuRSTqOUKdV5spK6QZTCSjo
   oD+gIng/hu+bX0UP5t/4EsEIBWMCzdCytZOBcssOVNxWscrJ9wr7lenGV
   Q==;
X-CSE-ConnectionGUID: Eqv091nDRA++pzYSOSHuiQ==
X-CSE-MsgGUID: gGTXZtuCTleu+o24KjLKnA==
X-THALES-FO-URL: Yes
X-CSE-ConnectionGUID: CAL4sQI1SB+05GD5bx1qEA==
X-CSE-MsgGUID: goQP7JIuTo+T37ph89gV5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="58262287"
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="58262287"
From: LE RHUN Jimmy <jimmy.lerhun@thalesgroup.com>
To: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Subject: platform: generic: add CVA6 platform and support for PMU
Thread-Topic: platform: generic: add CVA6 platform and support for PMU
Thread-Index: AdxlNr4lyuKAA3lWSBu1kuNF+8VdoQ==
Date: Thu, 4 Dec 2025 15:57:53 +0000
Message-ID: <46f88d260ac64ca7af4e5f5cbefabeb7@thalesgroup.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
thales-sensitivity: {TGOPEN}
dlpmanualfileclassification: {64c9cc36-7289-4c96-81d0-25ee8eefd11d}
x-endpointsecurity-0xde81-ev: v:7.9.29.589, d:out, a:y, w:t, t:24,
 sv:1764835806, ts:1764863874
x-ms-exchange-nodisclaimer: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_075759_974757_1F3D46D8 
X-CRM114-Status: GOOD (  13.21  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Classified as: {OPEN}

Add a new generic platform called CVA6 (https://github.com/openhwgroup/cva6).
Add support for Performance Monitoring Unit for this platform.

I hope it is in the right place this time.

Signed-off-by: Jimmy Le Rhun <jimmy.lerhun@thalesgroup.com> 

---
platform/generic/Kconfig                |   4 +
 platform/generic/configs/defconfig      |   1 +
 platform/generic/openhwgroup/cva6.c     | 185 ++++++++++++++++++++++++++++++++
 platform/generic/openhwgroup/objects.mk |   3 +
 4 files changed, 193 insertions(+)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig index 4b9bcfc..b8adb16 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -43,6 +43,10 @@ config PLATFORM_ANDES_QILAI
 	select ANDES_SBI
 	default n
 
+config PLATFORM_OPENHWGROUP_CVA6
+	bool "OpenHWGroup CVA6 support"
+	default n
+
 config PLATFORM_OPENHWGROUP_OPENPITON
 	bool "OpenHWGroup Openpiton support"
 	default n
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index fb90bb3..f705934 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -9,6 +9,7 @@ CONFIG_PLATFORM_STARFIVE_JH7110=y  CONFIG_PLATFORM_THEAD=y  CONFIG_PLATFORM_MIPS_P8700=y  CONFIG_PLATFORM_OPENHWGROUP_OPENPITON=y
+CONFIG_PLATFORM_OPENHWGROUP_CVA6=y
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y
diff --git a/platform/generic/openhwgroup/cva6.c b/platform/generic/openhwgroup/cva6.c
new file mode 100644
index 0000000..bf44a50
--- /dev/null
+++ b/platform/generic/openhwgroup/cva6.c
@@ -0,0 +1,185 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (C) 2019 FORTH-ICS/CARV
+ *				Panagiotis Peristerakis <perister@ics.forth.gr>
+ * Copyright (C) 2025 Thales Research & Technology
+ *				Jimmy Le Rhun <jimmy.lerhun@thalesgroup.com>
+ */
+
+#include <platform_override.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_pmu.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
+#include <sbi_utils/irqchip/plic.h>
+#include <sbi_utils/serial/uart8250.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
+
+#define CVA6_UART_ADDR			0x10000000ULL
+#define CVA6_UART_FREQ			50000000
+#define CVA6_UART_BAUDRATE		115200
+#define CVA6_UART_REG_SHIFT		2
+#define CVA6_UART_REG_WIDTH		4
+#define CVA6_UART_REG_OFFSET		0
+#define CVA6_UART_CAPS			0
+#define CVA6_PLIC_ADDR			0xc000000ULL
+#define CVA6_PLIC_SIZE			(0x200000 + \
+						 (CVA6_HART_COUNT * 0x1000))
+#define CVA6_PLIC_NUM_SOURCES		3
+#define CVA6_HART_COUNT			1
+#define CVA6_CLINT_ADDR			0x2000000ULL
+#define CVA6_ACLINT_MTIMER_FREQ		1000000
+#define CVA6_ACLINT_MSWI_ADDR			(CVA6_CLINT_ADDR + \
+						 CLINT_MSWI_OFFSET)
+#define CVA6_ACLINT_MTIMER_ADDR		(CVA6_CLINT_ADDR + \
+						 CLINT_MTIMER_OFFSET)
+
+#define CVA6_PERFCOUNTER_MASK		0x000001F8	//six configurable counters
+#define CVA6_PERFEVENTS			22		//number of available events
+#define CVA6_PERFEVENTS_RANGE		0x0000001F	//five bits to encode 22 events
+
+static struct plic_data plic = {
+	.addr = (unsigned long)CVA6_PLIC_ADDR,
+	.size = CVA6_PLIC_SIZE,
+	.num_src = CVA6_PLIC_NUM_SOURCES,
+	.flags = PLIC_FLAG_ARIANE_BUG,
+	.context_map = {
+		[0] = { 0, 1 },
+	},
+};
+
+static struct aclint_mswi_data mswi = {
+	.addr = (unsigned long)CVA6_ACLINT_MSWI_ADDR,
+	.size = ACLINT_MSWI_SIZE,
+	.first_hartid = 0,
+	.hart_count = CVA6_HART_COUNT,
+};
+
+static struct aclint_mtimer_data mtimer = {
+	.mtime_freq = CVA6_ACLINT_MTIMER_FREQ,
+	.mtime_addr = (unsigned long)CVA6_ACLINT_MTIMER_ADDR +
+		      ACLINT_DEFAULT_MTIME_OFFSET,
+	.mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
+	.mtimecmp_addr = (unsigned long)CVA6_ACLINT_MTIMER_ADDR +
+			 ACLINT_DEFAULT_MTIMECMP_OFFSET,
+	.mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
+	.first_hartid = 0,
+	.hart_count = CVA6_HART_COUNT,
+	.has_64bit_mmio = true,
+};
+
+/*
+ * Initialize the cva6 console.
+ */
+static int cva6_console_init(void)
+{
+	return uart8250_init(CVA6_UART_ADDR,
+			     CVA6_UART_FREQ,
+			     CVA6_UART_BAUDRATE,
+			     CVA6_UART_REG_SHIFT,
+			     CVA6_UART_REG_WIDTH,
+			     CVA6_UART_REG_OFFSET,
+			     CVA6_UART_CAPS);
+}
+
+/*
+ * Initialize IPI for current HART.
+ */
+static int cva6_ipi_init(void)
+{
+	return aclint_mswi_cold_init(&mswi);
+}
+
+/*
+ * CVA6 platform early initialization.
+ */
+static int cva6_early_init(bool cold_boot) {
+	int ret;
+	ret = cva6_console_init();
+	if (ret)
+		return ret;
+
+	ret = cva6_ipi_init();
+
+	return ret;
+}
+
+/*
+ * CVA6 platform final initialization.
+ */
+static int cva6_final_init(bool cold_boot) {
+	void *fdt;
+
+	if (!cold_boot)
+		return 0;
+
+	fdt = fdt_get_address_rw();
+	fdt_fixups(fdt);
+
+	return 0;
+}
+
+/*
+ * Initialize the cva6 interrupt controller for current HART.
+ */
+static int cva6_irqchip_init(void)
+{
+	return plic_cold_irqchip_init(&plic);
+}
+
+/*
+ * Initialize cva6 timer for current HART.
+ */
+static int cva6_timer_init(void)
+{
+		return aclint_mtimer_cold_init(&mtimer, NULL); }
+
+/*
+ * Performance Monitoring Unit
+ */
+static const struct sbi_pmu_device cva6_pmu_device = {
+	.name = "cva6-pmu",
+};
+
+static int cva6_pmu_init(void)
+{
+	int ret = 0;
+	sbi_pmu_set_device(&cva6_pmu_device);
+	/* All 6 assignable counters can be assigned any of 22 hardware events */
+	/* Specify raw events, from 1 to 22. */
+	for (int i=1; i<=CVA6_PERFEVENTS; i++)
+		/* select = event id; select_mask = up to 32, 5 bits; cmap = six counters, mhpm_couter3 to 8 */
+		ret |= sbi_pmu_add_raw_event_counter_map( i, CVA6_PERFEVENTS_RANGE, 
+CVA6_PERFCOUNTER_MASK);
+
+	if (ret)
+		sbi_printf("%s: sbi pmu add event failed (error %d)\n", __func__, 
+ret);
+
+	return ret;
+}
+
+static int cva6_platform_init(const void *fdt, int nodeoff, const 
+struct fdt_match *match) {
+	generic_platform_ops.early_init = cva6_early_init;
+	generic_platform_ops.timer_init = cva6_timer_init;
+	generic_platform_ops.irqchip_init = cva6_irqchip_init;
+	generic_platform_ops.final_init = cva6_final_init;
+	generic_platform_ops.pmu_init = cva6_pmu_init;
+
+	return 0;
+}
+
+/* found in 
+cva6-yocto/meta-cva6-yocto/recipes-kernel/linux/linux-yocto/0001-cva6-genesys2-add-32-and-64-bits-dts.patch */ static const struct fdt_match cva6_match[] = {
+	{ .compatible = "eth,cva6-bare-dev" },
+	{ },
+};
+
+const struct fdt_driver openhwgroup_cva6 = {
+	.match_table = cva6_match,
+	.init = cva6_platform_init,
+};
+
diff --git a/platform/generic/openhwgroup/objects.mk b/platform/generic/openhwgroup/objects.mk
index ab6ca79..94a2b3c 100644
--- a/platform/generic/openhwgroup/objects.mk
+++ b/platform/generic/openhwgroup/objects.mk
@@ -3,6 +3,9 @@
 #
 # Copyright (c) 2020 Western Digital Corporation or its affiliates.
 #
+carray-platform_override_modules-$(CONFIG_PLATFORM_OPENHWGROUP_CVA6) += 
+openhwgroup_cva6
+platform-objs-$(CONFIG_PLATFORM_OPENHWGROUP_CVA6) += openhwgroup/cva6.o
 
 carray-platform_override_modules-$(CONFIG_PLATFORM_OPENHWGROUP_OPENPITON) += openhwgroup_openpiton
 platform-objs-$(CONFIG_PLATFORM_OPENHWGROUP_OPENPITON) += openhwgroup/openpiton.o
+

{OPEN}

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
