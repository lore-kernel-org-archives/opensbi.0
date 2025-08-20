Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E11DCA0EDC
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VZQ/NzpIbKzqg1/pMQe3egHQZP+UQmpb0RNvHrL0fd8=; b=zvq0n4C9+mGUItX2n5/PvXu7QA
	iiOr5PFByPZJgLqDmtWzg9S2Lt7bD4Gc/XqZNwnZ1RgoMm4Nb3xLf/5mT56U/QP7bcvN/iG0zT4rI
	DFpTCDpzMaLVLkhNapvhqFPCzBGZm/HDdk/gZtbxxY4zjLKPW/j4WNrgVsU+7XRslykR4oVfx8doH
	WZCiQxdTJBK0q9LlMP3btkLT7L+13MNXWa1nWC0VA8cOGSHeivmi+T05UMvhYE9zgqK7RFZLJ9ipA
	F+3WwH3t41G22/gcMQCy4hE1eAUN0SaU6kasIyXETuhP8w6MXufkGXbSzLiRujJJQB7cxgwK1vx1Y
	nYKSfPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbN-0000000CHTO-13gH;
	Wed, 20 Aug 2025 03:35:05 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZg-0000000CHFL-3sDa
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:22 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b474e8d6d04so1894330a12.0
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660800; x=1756265600; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJl5oVmMgI5BGBsHlip9UaDowHA3DOHEeTDLQcDqJqg=;
        b=QFrvEd8Qi67GMumW+Y45y0YmoXsfjVJ4yHmPxNPIs7Vz6gOkAI6rMQy5Bl6/0ifTxi
         w6JRqRgPij8483qXzVSiKS3YBsWXe4NiLiDRlu6uLCdPlopFs2BbSx7rvLvGa8omNT4c
         fdxyt95zpqABJBeLw3oagRrTddBpajCD+B7FpQvzD/lBa2Swomjldb/8MUMCEURIqNDP
         9vcyI3Xjesjv7gTjByqXWFmVIz4muJei/+Uph+iSvLmNnLizOmKudjTGROUKetLzbeqM
         pVYLUtfqlcQYFtGyto6/WI/m7PhpNuTphKG+CXXdrbnM8j2VozN49f8UE3pcVa4M2QBm
         WldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660800; x=1756265600;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJl5oVmMgI5BGBsHlip9UaDowHA3DOHEeTDLQcDqJqg=;
        b=Sf81fZfTi8kXZBB/NbDtVrjre/R2WjHz1gvYJX9Tscu6h+6YXDKzrzOra43i9sP7cN
         YYd9ZG5p/fJMZLZ3Mfiz7NsswmaMDganGkC51OfwhqT7wBLgLTJdFVXpJm0I3cSYkcH/
         fhSC61fqKqlGqv5uRJ2HdoGNWd4PGesyBQf7MsBp8LoszxavdhxNFLSlnoWnA99lgyhg
         nvhzblEN9Ka67DWbxYKl3Ip26SmVVG8GqCoWDP4DBK8aUGub+Ul+/Yc4dVSeN2MBLGRH
         xrwH0s/3YBKlW3yYrzLvPWwhTkhIuMf4xpv+5AuCUFXPiUKvyCQwvvsJvJAytw3LEwfV
         Uzcw==
X-Gm-Message-State: AOJu0YwSgEt24/9ZFtARHK7kBqA6G4DzVw26Lbt94PK5Tm3RXuYVjiLa
	xvQy3hKJ71Lrm9Au1ZZeffpZCcr3QjWu0h78ViNGnP44RRZxGhRgAWZQD3hyTJWznUGFR7i4Enq
	YNhK9klXtaZbScJr06SefaZz3Gm2HFB9L5edpYdLWw9O68/p06ADJeTHRd54xrt/0nBfY+tOcBQ
	Gv07A4kOYZAmFzvXmpXPttIdvUI4iQCKyaPNueuRMNI2vg5g==
X-Gm-Gg: ASbGncugNnn44XLTJqX6uBSmEWx+S8lhSIr/xtqhZtJijeAossOivlRBLgV0+qf6p/n
	FvI1ndC/b2HW3SXYchOA0oK3lFBLPsk1NbPMkUuT2dGCqbAeU1E3CEPA84ZK8cX8ENximcUotjP
	cL60RZ6hshuARUjcgrbg1S3ADmonQ5cStu6oKHX3EGvhJO9FNv9wSN+6lsOErp4utotxU6/TBJe
	z5/+QUIqt3l+wyUJkgXiVZitFBaKIz19b/Zwu9fkb9RKh9iWyVm2W47s5OXyY5E47f3osfLCxSr
	akuq6mfXhwB6Ycp0P/cdVbX1L6CKz/0LaGlxdgke1O5tRc3i7aRJKKvC4olXqioVpNH0RJ3Bjva
	hB0ioMHtus2p2ijrrD8HRBeD6sdgT66fefw9TDDCB83OF
X-Google-Smtp-Source: AGHT+IHBy4UrMGQR1yYkfuJMaUYvDzhFtPB22WIAuCfuARWJ1t46+wmtSZsKiC0c4UszhVsBJTR0OQ==
X-Received: by 2002:a17:902:e74e:b0:242:9bbc:c775 with SMTP id d9443c01a7336-245ef289b8emr17514135ad.56.1755660799773;
        Tue, 19 Aug 2025 20:33:19 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:19 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 11/11] platform: sifive: Add SiFive SMC0 driver
Date: Wed, 20 Aug 2025 11:32:50 +0800
Message-Id: <20250820033250.544-12-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203320_970586_68E1E653 
X-CRM114-Status: GOOD (  26.28  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

The SiFive SMC0 controls the clock and power domain of the core complex
on the SiFive platform. The core complex enters the low power state
after the secondary cores enter the tile power gating and last core
execute the `CEASE` instruction with the corresponding SMC0
configurations. The devices that inside both tile power domain and core
complex power domain will be off, including caches and timer. Therefore
we need to flush the last level cache before entering the core complex
power gating and update the timer after waking up.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h   |   3 +
 .../suspend/fdt_suspend_sifive_smc0.h         |  18 +
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c           |  88 +++++
 lib/utils/suspend/Kconfig                     |   4 +
 lib/utils/suspend/fdt_suspend_sifive_smc0.c   | 323 ++++++++++++++++++
 lib/utils/suspend/objects.mk                  |   3 +
 platform/generic/configs/defconfig            |   1 +
 7 files changed, 440 insertions(+)
 create mode 100644 include/sbi_utils/suspend/fdt_suspend_sifive_smc0.h
 create mode 100644 lib/utils/suspend/fdt_suspend_sifive_smc0.c

diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h b/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
index 4ba048b9..d370158a 100644
--- a/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
+++ b/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
@@ -9,6 +9,9 @@
 
 #ifdef CONFIG_FDT_HSM_SIFIVE_TMC0
 int fdt_hsm_sifive_tmc0_cold_init(void);
+int sifive_tmc0_set_wakemask_enareq(u32 hartid);
+void sifive_tmc0_set_wakemask_disreq(u32 hartid);
+bool sifive_tmc0_is_pg(u32 hartid);
 #else
 static inline int fdt_hsm_sifive_tmc0_cold_init(void) { return 0; }
 #endif
diff --git a/include/sbi_utils/suspend/fdt_suspend_sifive_smc0.h b/include/sbi_utils/suspend/fdt_suspend_sifive_smc0.h
new file mode 100644
index 00000000..f092be52
--- /dev/null
+++ b/include/sbi_utils/suspend/fdt_suspend_sifive_smc0.h
@@ -0,0 +1,18 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_SUSPEND_SIFIVE_SMC0_H__
+#define __FDT_SUSPEND_SIFIVE_SMC0_H__
+
+#ifdef CONFIG_FDT_SUSPEND_SIFIVE_SMC0
+bool sifive_smc0_check_warm_reset(void);
+void sifive_smc0_mtime_update(void);
+#else
+static inline bool sifive_smc0_check_warm_reset(void) { return false; }
+static inline void sifive_smc0_mtime_update(void) { return; }
+#endif
+
+#endif
diff --git a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
index 83f86c88..4a13fd4d 100644
--- a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
+++ b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
@@ -20,6 +20,8 @@
 #include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
 #include <sbi_utils/hsm/fdt_hsm_sifive_tmc0.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
+#include <sbi_utils/irqchip/aplic.h>
+#include <sbi_utils/suspend/fdt_suspend_sifive_smc0.h>
 
 struct sifive_tmc0 {
 	unsigned long reg;
@@ -79,6 +81,73 @@ static unsigned long tmc0_offset;
 #define SIFIVE_TMC_WAKE_MASK_WREQ		BIT(31)
 #define SIFIVE_TMC_WAKE_MASK_ACK		BIT(30)
 
+int sifive_tmc0_set_wakemask_enareq(u32 hartid)
+{
+	struct sbi_scratch *scratch = sbi_hartid_to_scratch(hartid);
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(scratch);
+	unsigned long addr;
+	u32 v;
+
+	if (!tmc0)
+		return SBI_ENODEV;
+
+	addr = tmc0->reg + SIFIVE_TMC_WAKE_MASK_OFF;
+	v = readl((void *)addr);
+	writel(v | SIFIVE_TMC_WAKE_MASK_WREQ, (void *)addr);
+
+	while (!(readl((void *)addr) & SIFIVE_TMC_WAKE_MASK_ACK));
+
+	return SBI_OK;
+}
+
+void sifive_tmc0_set_wakemask_disreq(u32 hartid)
+{
+	struct sbi_scratch *scratch = sbi_hartid_to_scratch(hartid);
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(scratch);
+	unsigned long addr;
+	u32 v;
+
+	if (!tmc0)
+		return;
+
+	addr = tmc0->reg + SIFIVE_TMC_WAKE_MASK_OFF;
+	v = readl((void *)addr);
+	writel(v & ~SIFIVE_TMC_WAKE_MASK_WREQ, (void *)addr);
+
+	while (readl((void *)addr) & SIFIVE_TMC_WAKE_MASK_ACK);
+}
+
+bool sifive_tmc0_is_pg(u32 hartid)
+{
+	struct sbi_scratch *scratch = sbi_hartid_to_scratch(hartid);
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(scratch);
+	unsigned long addr;
+	u32 v;
+
+	if (!tmc0)
+		return false;
+
+	addr = tmc0->reg + SIFIVE_TMC_PG_OFF;
+	v = readl((void *)addr);
+	if (!(v & SIFIVE_TMC_PG_ENA_ACK) ||
+	    (v & SIFIVE_TMC_PG_ENARSP) ||
+	    (v & SIFIVE_TMC_PG_DIS_REQ))
+		return false;
+
+	return true;
+}
+
+static bool sifive_tmc0_check_warm_reset(void)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+	unsigned long addr = tmc0->reg + SIFIVE_TMC_PG_OFF;
+
+	if (!tmc0)
+		return false;
+
+	return readl((void *)addr) & SIFIVE_TMC_PG_WARM_RESET ? true : false;
+}
+
 static void sifive_tmc0_set_resumepc(physical_addr_t addr)
 {
 	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
@@ -356,10 +425,29 @@ static int sifive_tmc0_stop(void)
 	return SBI_OK;
 }
 
+static void sifive_pg_resume(void)
+{
+	/*
+	 * To simplify the implementation, the SW won't clear the warm
+	 * reset bit. If the system woken up from the Core Complex power
+	 * gating, the warm reset bit of the TMC0 will be clear. Therefore
+	 * we need to check the warm reset bit of the TMC0 first as the
+	 * Tile power gating won't clear the warm reset bit of the SMC0.
+	 */
+	if (sifive_tmc0_check_warm_reset())
+		return;
+
+	if (sifive_smc0_check_warm_reset()) {
+		aplic_restore();
+		sifive_smc0_mtime_update();
+	}
+}
+
 static struct sbi_hsm_device tmc0_hsm_dev = {
 	.name = "SiFive TMC0",
 	.hart_start = sifive_tmc0_start,
 	.hart_stop = sifive_tmc0_stop,
+	.hart_resume = sifive_pg_resume,
 };
 
 int fdt_hsm_sifive_tmc0_cold_init(void)
diff --git a/lib/utils/suspend/Kconfig b/lib/utils/suspend/Kconfig
index 2cbea75c..623e053f 100644
--- a/lib/utils/suspend/Kconfig
+++ b/lib/utils/suspend/Kconfig
@@ -14,6 +14,10 @@ config FDT_SUSPEND_RPMI
 	depends on FDT_MAILBOX && RPMI_MAILBOX
 	default n
 
+config FDT_SUSPEND_SIFIVE_SMC0
+	bool "FDT SIFIVE SMC0 suspend driver"
+	depends on FDT_HSM_SIFIVE_TMC0
+	default n
 endif
 
 endmenu
diff --git a/lib/utils/suspend/fdt_suspend_sifive_smc0.c b/lib/utils/suspend/fdt_suspend_sifive_smc0.c
new file mode 100644
index 00000000..005486b4
--- /dev/null
+++ b/lib/utils/suspend/fdt_suspend_sifive_smc0.c
@@ -0,0 +1,323 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_system.h>
+#include <sbi/sbi_timer.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_tmc0.h>
+#include <sbi_utils/suspend/fdt_suspend_sifive_smc0.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
+
+#define SIFIVE_SMC_PGPREP_OFF			0x0
+#define SIFIVE_SMC_PG_OFF			0x4
+#define SIFIVE_SMC_CCTIMER_OFF			0xc
+#define SIFIVE_SMC_RESUMEPC_LO_OFF		0x10
+#define SIFIVE_SMC_RESUMEPC_HI_OFF		0x14
+#define SIFIVE_SMC_SYNC_PMC_OFF			0x24
+#define SIFIVE_SMC_CYCLECOUNT_LO_OFF		0x28
+#define SIFIVE_SMC_CYCLECOUNT_HI_OFF		0x2c
+#define SIFIVE_SMC_WFI_UNCORE_CG_OFF		0x50
+
+#define SIFIVE_SMC_PGPREP_ENA_REQ		BIT(31)
+#define SIFIVE_SMC_PGPREP_ENA_ACK		BIT(30)
+#define SIFIVE_SMC_PGPREP_DIS_REQ		BIT(29)
+#define SIFIVE_SMC_PGPREP_DIS_ACK		BIT(29)
+#define SIFIVE_SMC_PGPREP_FRONTNOTQ		BIT(19)
+#define SIFIVE_SMC_PGPREP_CLFPNOTQ		BIT(18)
+#define SIFIVE_SMC_PGPREP_PMCENAERR		BIT(17)
+#define SIFIVE_SMC_PGPREP_WAKE_DETECT		BIT(16)
+#define SIFIVE_SMC_PGPREP_BUSERR		BIT(15)
+#define SIFIVE_SMC_PGPREP_EARLY_ABORT		BIT(3)
+#define SIFIVE_SMC_PGPREP_INTERNAL_ABORT	BIT(2)
+#define SIFIVE_SMC_PGPREP_ENARSP		(SIFIVE_SMC_PGPREP_FRONTNOTQ | \
+						 SIFIVE_SMC_PGPREP_CLFPNOTQ | \
+						 SIFIVE_SMC_PGPREP_PMCENAERR | \
+						 SIFIVE_SMC_PGPREP_WAKE_DETECT | \
+						 SIFIVE_SMC_PGPREP_BUSERR)
+
+#define SIFIVE_SMC_PGPREP_ABORT			(SIFIVE_SMC_PGPREP_EARLY_ABORT | \
+						 SIFIVE_SMC_PGPREP_INTERNAL_ABORT)
+
+#define SIFIVE_SMC_PG_ENA_REQ			BIT(31)
+#define SIFIVE_SMC_PG_WARM_RESET		BIT(1)
+
+#define SIFIVE_SMC_SYNCPMC_SYNC_REQ		BIT(31)
+#define SIFIVE_SMC_SYNCPMC_SYNC_WREQ		BIT(30)
+#define SIFIVE_SMC_SYNCPMC_SYNC_ACK		BIT(29)
+
+static struct aclint_mtimer_data smc_sync_timer;
+static unsigned long smc0_base;
+
+static void sifive_smc0_set_pmcsync(char regid, bool write_mode)
+{
+	unsigned long addr = smc0_base + SIFIVE_SMC_SYNC_PMC_OFF;
+	u32 v = regid | SIFIVE_SMC_SYNCPMC_SYNC_REQ;
+
+	if (write_mode)
+		v |= SIFIVE_SMC_SYNCPMC_SYNC_WREQ;
+
+	writel(v, (void *)addr);
+	while (!(readl((void *)addr) & SIFIVE_SMC_SYNCPMC_SYNC_ACK));
+}
+
+static u64 sifive_smc0_time_read(volatile u64 *addr)
+{
+	u32 lo, hi;
+
+	do {
+		sifive_smc0_set_pmcsync(SIFIVE_SMC_CYCLECOUNT_LO_OFF, false);
+		sifive_smc0_set_pmcsync(SIFIVE_SMC_CYCLECOUNT_HI_OFF, false);
+		hi = readl_relaxed((u32 *)addr + 1);
+		lo = readl_relaxed((u32 *)addr);
+	} while (hi != readl_relaxed((u32 *)addr + 1));
+
+	return ((u64)hi << 32) | (u64)lo;
+}
+
+static void sifive_smc0_set_resumepc(physical_addr_t raddr)
+{
+	/* Set resumepc_lo */
+	writel((u32)raddr, (void *)(smc0_base + SIFIVE_SMC_RESUMEPC_LO_OFF));
+	/* copy resumepc_lo from SMC to PMC */
+	sifive_smc0_set_pmcsync(SIFIVE_SMC_RESUMEPC_LO_OFF, true);
+#if __riscv_xlen > 32
+	/* Set resumepc_hi */
+	writel((u32)(raddr >> 32), (void *)(smc0_base + SIFIVE_SMC_RESUMEPC_HI_OFF));
+	/* copy resumepc_hi from SMC to PMC */
+	sifive_smc0_set_pmcsync(SIFIVE_SMC_RESUMEPC_HI_OFF, true);
+#endif
+}
+
+static u32 sifive_smc0_get_pgprep_enarsp(void)
+{
+	u32 v = readl((void *)(smc0_base + SIFIVE_SMC_PGPREP_OFF));
+
+	return v & SIFIVE_SMC_PGPREP_ENARSP;
+}
+
+static void sifive_smc0_set_pgprep_disreq(void)
+{
+	unsigned long addr = smc0_base + SIFIVE_SMC_PGPREP_OFF;
+	u32 v = readl((void *)addr);
+
+	writel(v | SIFIVE_SMC_PGPREP_DIS_REQ, (void *)addr);
+	while (!(readl((void *)addr) & SIFIVE_SMC_PGPREP_DIS_ACK));
+}
+
+static u32 sifive_smc0_set_pgprep_enareq(void)
+{
+	unsigned long addr = smc0_base + SIFIVE_SMC_PGPREP_OFF;
+	u32 v = readl((void *)addr);
+
+	writel(v | SIFIVE_SMC_PGPREP_ENA_REQ, (void *)addr);
+	while (!(readl((void *)addr) & SIFIVE_SMC_PGPREP_ENA_ACK));
+
+	v = readl((void *)addr);
+
+	return v & SIFIVE_SMC_PGPREP_ABORT;
+}
+
+static void sifive_smc0_set_pg_enareq(void)
+{
+	unsigned long addr = smc0_base + SIFIVE_SMC_PG_OFF;
+	u32 v = readl((void *)addr);
+
+	writel(v | SIFIVE_SMC_PG_ENA_REQ, (void *)addr);
+}
+
+bool sifive_smc0_check_warm_reset(void)
+{
+	unsigned long addr = smc0_base + SIFIVE_SMC_PG_OFF;
+
+	if (!smc0_base)
+		return false;
+
+	sifive_smc0_set_pmcsync(SIFIVE_SMC_PG_OFF, false);
+
+	return readl((void *)addr) & SIFIVE_SMC_PG_WARM_RESET ? true : false;
+}
+
+static inline void sifive_smc0_set_cg(bool enable)
+{
+	unsigned long addr = smc0_base + SIFIVE_SMC_WFI_UNCORE_CG_OFF;
+
+	if (enable)
+		writel(0, (void *)addr);
+	else
+		writel(1, (void *)addr);
+}
+
+static int sifive_smc0_prep(void)
+{
+	const struct sbi_domain *dom = &root;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned long i;
+	int rc;
+	u32 target;
+
+	if (!smc0_base)
+		return SBI_ENODEV;
+
+	/* Prevent all secondary tiles from waking up from PG state */
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+		target = sbi_hartindex_to_hartid(i);
+		if (target != current_hartid()) {
+			rc = sifive_tmc0_set_wakemask_enareq(target);
+			if (rc) {
+				sbi_printf("Fail to enable wakemask for hart %d\n",
+					   target);
+				goto fail;
+			}
+		}
+	}
+
+	/* Check if all secondary tiles enter PG state */
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+		target = sbi_hartindex_to_hartid(i);
+		if (target != current_hartid() &&
+		    !sifive_tmc0_is_pg(target)) {
+			sbi_printf("Hart %d not in the PG state\n", target);
+			goto fail;
+		}
+	}
+
+	rc = sifive_smc0_set_pgprep_enareq();
+	if (rc) {
+		sbi_printf("SMC0 error: abort code: 0x%x\n", rc);
+		goto fail;
+	}
+
+	rc = sifive_smc0_get_pgprep_enarsp();
+	if (rc) {
+		sifive_smc0_set_pgprep_disreq();
+		sbi_printf("SMC0 error: error response code: 0x%x\n", rc);
+		goto fail;
+	}
+
+	sifive_smc0_set_resumepc(scratch->warmboot_addr);
+	return SBI_OK;
+fail:
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+		target = sbi_hartindex_to_hartid(i);
+		if (target != current_hartid())
+			sifive_tmc0_set_wakemask_disreq(target);
+	}
+
+	return SBI_EFAIL;
+}
+
+static int sifive_smc0_enter(void)
+{
+	const struct sbi_domain *dom = &root;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned long i;
+	u32 target, rc;
+
+	/* Flush cache and check if there is wake detect or bus error */
+	if (fdt_cmo_llc_flush_all() &&
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1))
+		sifive_cflush();
+
+	rc = sifive_smc0_get_pgprep_enarsp();
+	if (rc) {
+		sbi_printf("SMC0 error: error response code: 0x%x\n", rc);
+		rc = SBI_EFAIL;
+		goto fail;
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_XSIFIVE_CEASE)) {
+		sifive_smc0_set_pg_enareq();
+		while (1)
+			sifive_cease();
+	}
+
+	rc = SBI_ENOTSUPP;
+fail:
+	sifive_smc0_set_pgprep_disreq();
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+		target = sbi_hartindex_to_hartid(i);
+		if (target != current_hartid())
+			sifive_tmc0_set_wakemask_disreq(target);
+	}
+	return rc;
+}
+
+static int sifive_smc0_pg(void)
+{
+	int rc;
+
+	rc = sifive_smc0_prep();
+	if (rc)
+		return rc;
+
+	return sifive_smc0_enter();
+}
+
+static int sifive_smc0_system_suspend(u32 sleep_type, unsigned long addr)
+{
+	/* Disable the timer interrupt */
+	sbi_timer_exit(sbi_scratch_thishart_ptr());
+
+	return sifive_smc0_pg();
+}
+
+static int sifive_smc0_system_suspend_check(u32 sleep_type)
+{
+	return sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND ? SBI_OK : SBI_EINVAL;
+}
+
+static struct sbi_system_suspend_device smc0_sys_susp = {
+	.name = "Sifive SMC0",
+	.system_suspend_check = sifive_smc0_system_suspend_check,
+	.system_suspend = sifive_smc0_system_suspend,
+};
+
+void sifive_smc0_mtime_update(void)
+{
+	struct aclint_mtimer_data *mt = aclint_get_mtimer_data();
+
+	aclint_mtimer_update(mt, &smc_sync_timer);
+}
+
+static int sifive_smc0_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	int rc;
+	u64 addr;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
+	if (rc)
+		return rc;
+
+	smc0_base = (unsigned long)addr;
+	smc_sync_timer.time_rd = sifive_smc0_time_read;
+	smc_sync_timer.mtime_addr = smc0_base + SIFIVE_SMC_CYCLECOUNT_LO_OFF;
+
+	sbi_system_suspend_set_device(&smc0_sys_susp);
+	sifive_smc0_set_cg(true);
+
+	return SBI_OK;
+}
+
+static const struct fdt_match sifive_smc0_match[] = {
+	{ .compatible = "sifive,smc0" },
+	{ },
+};
+
+const struct fdt_driver fdt_suspend_sifive_smc0 = {
+	.match_table = sifive_smc0_match,
+	.init = sifive_smc0_probe,
+};
diff --git a/lib/utils/suspend/objects.mk b/lib/utils/suspend/objects.mk
index 9c386248..1fb29b5e 100644
--- a/lib/utils/suspend/objects.mk
+++ b/lib/utils/suspend/objects.mk
@@ -9,3 +9,6 @@
 
 carray-fdt_early_drivers-$(CONFIG_FDT_SUSPEND_RPMI) += fdt_suspend_rpmi
 libsbiutils-objs-$(CONFIG_FDT_SUSPEND_RPMI) += suspend/fdt_suspend_rpmi.o
+
+carray-fdt_early_drivers-$(CONFIG_FDT_SUSPEND_SIFIVE_SMC0) += fdt_suspend_sifive_smc0
+libsbiutils-objs-$(CONFIG_FDT_SUSPEND_SIFIVE_SMC0) += suspend/fdt_suspend_sifive_smc0.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 837acd79..258988cc 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -55,6 +55,7 @@ CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
 CONFIG_SERIAL_SEMIHOSTING=y
 CONFIG_FDT_SUSPEND=y
 CONFIG_FDT_SUSPEND_RPMI=y
+CONFIG_FDT_SUSPEND_SIFIVE_SMC0=y
 CONFIG_FDT_TIMER=y
 CONFIG_FDT_TIMER_MTIMER=y
 CONFIG_FDT_TIMER_PLMT=y
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
