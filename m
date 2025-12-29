Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD67E8FDB1
	for <opensbi@archiver.kernel.org>; Mon, 29 Dec 2025 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybLo2DB3Lk4YYcjEhfNKnuFx3jPrkNSv2pOWOIbeK0c=; b=BBtCgM3GsCZDoU
	OKoL92hL1RVBfAFOMth+O8WWTN891pyRI2sSdkyZkXJYCo30v+8rBFOH/+XpH5ytJyOmYq7XZW64l
	h1uLV2vrSBAsmAm21ElhHQqr0nnJ630y8S74sPXCjb7Ahyf9/c5DsfzL8Eg/x/TrHqrYXef7Dxgco
	qJ1FIdvp4polzEgIfSKnIyPnUljHbb4wCuthGq+dKRo0ssFOGkI6zuZaotTVFUDtVNCeA/g2a68Y+
	xKARH4dOsvQXPuRto9r+a8be/xTZJJ1PiRGTHdV+9beOzEdfxHItkGhZ9MfDdb1a2nZ4QUsjWGPvQ
	CBMPLDqrqJ4OcZIXE1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7Xe-00000003Q2s-3zAX;
	Mon, 29 Dec 2025 07:19:46 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7Xb-00000003Q0d-49xC
	for opensbi@lists.infradead.org;
	Mon, 29 Dec 2025 07:19:45 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5BT7JR7g084323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <opensbi@lists.infradead.org>; Mon, 29 Dec 2025 15:19:27 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Dec 2025
 15:19:27 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 5/5] lib: utils/suspend: add Andes ATCSMU suspend driver
Date: Mon, 29 Dec 2025 15:19:14 +0800
Message-ID: <20251229071914.1451587-6-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229071914.1451587-1-ben717@andestech.com>
References: <20251229071914.1451587-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5BT7JR7g084323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_231944_368265_D97F4CBB 
X-CRM114-Status: GOOD (  24.44  )
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
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Implement a system-wide suspend driver for the Andes AE350 platform.
This driver supports Andes-specific deep sleep (suspend to RAM) and
light sleep (suspend to standby) functionalities via the ATCSMU.

The major differences between deep sleep and light sleep are:

- Power Domain and Resume Path: Deep sleep powers down the core domain.
  Consequently, harts waking from deep sleep resume from the reset
  vector. Light sleep utilizes clock gating to the core domain; harts
  maintain state and resume execution at the instruction immediately
  following the WFI instruction.

- Primary Hart Wakeup: In both modes, the primary hart is woken by
  UART or RTC alarm interrupts. In deep sleep, the primary hart is
  additionally responsible for re-enabling the Last Level Cache (LLC)
  and restoring Andes-specific CSRs.

- Secondary Hart Wakeup: In light sleep, secondary harts are woken
  by an IPI sent from the primary hart. In deep sleep, they are
  woken by an ATCSMU hardware wake-up command. Furthermore,
  secondary harts must restore Andes-specific CSRs when returning
  from deep sleep.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h |   1 +
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c         |  49 ++++++--
 lib/utils/suspend/Kconfig                    |   5 +
 lib/utils/suspend/fdt_suspend_andes_atcsmu.c | 119 +++++++++++++++++++
 lib/utils/suspend/objects.mk                 |   3 +
 platform/generic/andes/ae350.c               |  10 +-
 platform/generic/configs/defconfig           |   1 +
 7 files changed, 178 insertions(+), 10 deletions(-)
 create mode 100644 lib/utils/suspend/fdt_suspend_andes_atcsmu.c

diff --git a/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
index ef851b7501b5..5e71fab7c69e 100644
--- a/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
+++ b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
@@ -60,5 +60,6 @@ int atcsmu_set_reset_vector(u64 wakeup_addr, u32 hartid);
 u32 atcsmu_get_sleep_type(u32 hartid);
 void atcsmu_write_scratch(u32 value);
 u32 atcsmu_read_scratch(void);
+bool atcsmu_pcs_is_sleep(u32 hartid, bool deep_sleep);
 
 #endif
diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
index 32f6fef808c6..0874d365cb34 100644
--- a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -94,16 +94,38 @@ u32 atcsmu_read_scratch(void)
 	return readl_relaxed((char *)atcsmu_base + SCRATCH_PAD_OFFSET);
 }
 
+bool atcsmu_pcs_is_sleep(u32 hartid, bool deep_sleep)
+{
+	u32 pcs_status = readl_relaxed((char *)atcsmu_base + PCSm_STATUS_OFFSET(hartid));
+	u32 pd_status = deep_sleep ? PD_STATUS_DEEP_SLEEP : PD_STATUS_LIGHT_SLEEP;
+
+	if (EXTRACT_FIELD(pcs_status, PD_TYPE_MASK) != PD_TYPE_SLEEP) {
+		sbi_printf("ATCSMU: hart%d (PCS%d): failed to sleep\n", hartid, hartid + 3);
+		return false;
+	}
+
+	if (EXTRACT_FIELD(pcs_status, PD_STATUS_MASK) != pd_status) {
+		sbi_printf("ATCSMU: hart%d (PCS%d): failed to enter %s sleep\n",
+			   hartid, hartid + 3, deep_sleep ? "deep" : "light");
+		return false;
+	}
+
+	return true;
+}
+
 static int ae350_hart_start(u32 hartid, ulong saddr)
 {
 	u32 hartindex = sbi_hartid_to_hartindex(hartid);
+	u32 sleep_type = atcsmu_get_sleep_type(hartid);
 
 	/*
 	 * Don't send wakeup command when:
 	 * 1) boot time
 	 * 2) the target hart is non-sleepable 25-series hart0
+	 * 3) light sleep
 	 */
-	if (!sbi_init_count(hartindex) || (is_andes(25) && hartid == 0))
+	if (!sbi_init_count(hartindex) || (is_andes(25) && hartid == 0) ||
+	    sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP)
 		return sbi_ipi_raw_send(hartindex, false);
 
 	atcsmu_set_command(WAKEUP_CMD, hartid);
@@ -130,16 +152,27 @@ static int ae350_hart_stop(void)
 	/* Prevent the core leaving the WFI mode unexpectedly */
 	csr_write(CSR_MIE, 0);
 
-	atcsmu_set_wakeup_events(0x0, hartid);
-	atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
-	rc = atcsmu_set_reset_vector((u64)ae350_enable_coherency_warmboot, hartid);
-	if (rc)
-		return SBI_EFAIL;
+	if (sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP) {
+		csr_write(CSR_MIE, MIP_MSIP);
+		atcsmu_set_wakeup_events(PCS_WAKEUP_MSIP_MASK, hartid);
+		atcsmu_set_command(LIGHT_SLEEP_CMD, hartid);
+	} else if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) {
+		atcsmu_set_wakeup_events(0x0, hartid);
+		atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
+		rc = atcsmu_set_reset_vector((u64)ae350_enable_coherency_warmboot, hartid);
+		if (rc)
+			return SBI_EFAIL;
+
+		ae350_non_ret_save(sbi_scratch_thishart_ptr());
+	}
 
-	ae350_non_ret_save(sbi_scratch_thishart_ptr());
 	ae350_disable_coherency();
 	wfi();
-	return 0;
+
+	/* Light sleep resumes here */
+	ae350_enable_coherency();
+
+	return SBI_ENOTSUPP;
 }
 
 static const struct sbi_hsm_device hsm_andes_atcsmu = {
diff --git a/lib/utils/suspend/Kconfig b/lib/utils/suspend/Kconfig
index 6c09d95253d2..8d05aff67ace 100644
--- a/lib/utils/suspend/Kconfig
+++ b/lib/utils/suspend/Kconfig
@@ -9,6 +9,11 @@ config FDT_SUSPEND
 
 if FDT_SUSPEND
 
+config FDT_SUSPEND_ANDES_ATCSMU
+	bool "FDT Andes ATCSMU suspend driver"
+	depends on FDT_HSM_ANDES_ATCSMU && FDT_CACHE_ANDES_LLCACHE
+	default n
+
 config FDT_SUSPEND_RPMI
 	bool "FDT RPMI suspend driver"
 	depends on FDT_MAILBOX && RPMI_MAILBOX
diff --git a/lib/utils/suspend/fdt_suspend_andes_atcsmu.c b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
new file mode 100644
index 000000000000..05e67e47eebe
--- /dev/null
+++ b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
@@ -0,0 +1,119 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Andes Technology Corporation
+ */
+
+#include <andes/andes.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_system.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/hsm/fdt_hsm_andes_atcsmu.h>
+
+static int check_secondary_harts_sleep(u32 hartid, bool deep_sleep)
+{
+	const struct sbi_domain *dom = &root;
+	unsigned long i;
+	u32 target;
+
+	/* Ensure the secondary harts entering the corresponding sleep state */
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+		target = sbi_hartindex_to_hartid(i);
+		if (target != hartid && !atcsmu_pcs_is_sleep(target, deep_sleep))
+			return SBI_EFAIL;
+	}
+
+	return SBI_OK;
+}
+
+static int ae350_system_suspend_check(u32 sleep_type)
+{
+	return (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND ||
+		sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP) ? SBI_OK : SBI_EINVAL;
+}
+
+static int ae350_system_suspend(u32 sleep_type, unsigned long addr)
+{
+	u32 hartid = current_hartid();
+	int rc;
+
+	/* Prevent the core leaving the WFI mode unexpectedly */
+	csr_write(CSR_MIE, 0);
+
+	/*
+	 * Only allow the S-mode external interrupts (UART2 and RTC alarm) to
+	 * wake up the primary hart
+	 */
+	csr_set(CSR_SIE, MIP_SEIP);
+	atcsmu_set_wakeup_events(PCS_WAKEUP_RTC_ALARM_MASK | PCS_WAKEUP_UART2_MASK, hartid);
+
+	if (sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP) {
+		rc = check_secondary_harts_sleep(hartid, false);
+		if (rc)
+			return rc;
+
+		atcsmu_set_command(LIGHT_SLEEP_CMD, hartid);
+	} else if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) {
+		rc = check_secondary_harts_sleep(hartid, true);
+		if (rc)
+			return rc;
+
+		atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
+		rc = atcsmu_set_reset_vector((u64)ae350_enable_coherency_warmboot, hartid);
+		if (rc)
+			return rc;
+
+		ae350_non_ret_save(sbi_scratch_thishart_ptr());
+		fdt_cmo_llc_enable(false);
+		rc = fdt_cmo_llc_flush_all();
+		if (rc)
+			return rc;
+	}
+
+	ae350_disable_coherency();
+	wfi();
+
+	/* Light sleep resumes here */
+	ae350_enable_coherency();
+
+	return SBI_OK;
+}
+
+static void ae350_system_resume(void)
+{
+	u32 hartid = current_hartid();
+	u32 sleep_type = atcsmu_get_sleep_type(hartid);
+
+	if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND)
+		fdt_cmo_llc_enable(true);
+}
+
+static struct sbi_system_suspend_device suspend_andes_atcsmu = {
+	.name = "andes_atcsmu",
+	.system_suspend_check = ae350_system_suspend_check,
+	.system_suspend = ae350_system_suspend,
+	.system_resume = ae350_system_resume,
+};
+
+static int suspend_andes_atcsmu_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	sbi_system_suspend_set_device(&suspend_andes_atcsmu);
+	return 0;
+}
+
+static const struct fdt_match suspend_andes_atcsmu_match[] = {
+	{ .compatible = "andestech,atcsmu-sys" },
+	{ },
+};
+
+const struct fdt_driver fdt_suspend_andes_atcsmu = {
+	.match_table = suspend_andes_atcsmu_match,
+	.init = suspend_andes_atcsmu_probe,
+};
diff --git a/lib/utils/suspend/objects.mk b/lib/utils/suspend/objects.mk
index 1fb29b5e7941..fb1ad9ae34c7 100644
--- a/lib/utils/suspend/objects.mk
+++ b/lib/utils/suspend/objects.mk
@@ -7,6 +7,9 @@
 #   Anup Patel <apatel@ventanamicro.com>
 #
 
+carray-fdt_early_drivers-$(CONFIG_FDT_SUSPEND_ANDES_ATCSMU) += fdt_suspend_andes_atcsmu
+libsbiutils-objs-$(CONFIG_FDT_SUSPEND_ANDES_ATCSMU) += suspend/fdt_suspend_andes_atcsmu.o
+
 carray-fdt_early_drivers-$(CONFIG_FDT_SUSPEND_RPMI) += fdt_suspend_rpmi
 libsbiutils-objs-$(CONFIG_FDT_SUSPEND_RPMI) += suspend/fdt_suspend_rpmi.o
 
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 9bd1554394b7..4cf7e26def54 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -8,9 +8,12 @@
 #include <andes/andes_pmu.h>
 #include <andes/andes_sbi.h>
 #include <platform_override.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/riscv_asm.h>
 #include <sbi/sbi_init.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/hsm/fdt_hsm_andes_atcsmu.h>
 
 static unsigned long andes_hart_data_offset;
 extern void _start_warm(void);
@@ -59,14 +62,17 @@ void ae350_enable_coherency_warmboot(void)
 
 static int ae350_early_init(bool cold_boot)
 {
+	u32 hartid = current_hartid();
+	u32 sleep_type = atcsmu_get_sleep_type(hartid);
+
 	if (cold_boot) {
 		andes_hart_data_offset = sbi_scratch_alloc_offset(sizeof(struct andes_hart_data));
 		if (!andes_hart_data_offset)
 			return SBI_ENOMEM;
 	}
 
-	/* Don't restore Andes CSRs during boot */
-	if (sbi_init_count(current_hartindex()))
+	/* Don't restore Andes CSRs during boot or wake up from light sleep */
+	if (sbi_init_count(current_hartindex()) && sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND)
 		ae350_non_ret_restore(sbi_scratch_thishart_ptr());
 
 	return generic_early_init(cold_boot);
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 4b7615d6c51b..19a73a247765 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -62,6 +62,7 @@ CONFIG_FDT_SERIAL_UART8250=y
 CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
 CONFIG_SERIAL_SEMIHOSTING=y
 CONFIG_FDT_SUSPEND=y
+CONFIG_FDT_SUSPEND_ANDES_ATCSMU=y
 CONFIG_FDT_SUSPEND_RPMI=y
 CONFIG_FDT_SUSPEND_SIFIVE_SMC0=y
 CONFIG_FDT_TIMER=y
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
