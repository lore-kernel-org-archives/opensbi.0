Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDE8CA1002
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 02:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BcA7cH7qVwFQMgjBaMUcU65mFgOCNil+YZFSAXnRepg=; b=OlLKat3WYcZQvQ
	3ZwRgGFSm05fHKDu0eilZdYtd8r3DcLRY2oVvhBFqR9YiqpFx/QncOc4sEQE55kSKcl0/HkWdHWo3
	YXRm08rqsZBbF0KK+2gcnAUyfmDECaJ7u5E2oIffkkb3aSIDNnn6Rjc9wMWy87KEOsa0P9KYKE2KN
	gGA/jYohnc9uZ9UBPdePYkqD4nAiU/AW9uj4YcitpeH12cruNyVwy/VKwmMbTVzsS6JFpWXU5XgCX
	SwaeCS4gdjIe6gMMfv5HRKP6GjogHjNaYmeaZxb6TiNAjIqRXzTTuTE2/3OXt3Gs7qKs0iYP61FSX
	l/gsrmyuTjnxraqioS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM7z-0000000G8Ie-4295;
	Fri, 05 Sep 2025 02:24:39 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0P-0000000Fxk7-0rTx
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:50 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-323267b98a4so1498822a91.1
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038608; x=1757643408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6zDaq6FAiEb0Gl9HksnIiUbndoeyKcmurJA86G+tvg=;
        b=eZ+3Lgd2gbZYjHctbo1QTE6lyaYRcdMKqU9wkczKzYfPrxQk2UW7WTXQY0oUSA18LV
         GQXqaJQpN/id+0WDZz+dQy7MEckZkLDT6C+qXcdIMTbnoam6aD8BqUp/W3V4Sp7ZKZB0
         QU/wW0qJwj08zl6/wd6IW/LAv7F8sY1BEwizvAvW8tYbNm06l6sJv6cgnx7n2dOG8jgP
         lo5Fulm2uwlQM1AeUL49gheBd4asTW8BoC5Vtp9t5vdpzv7d+jo2o6LISlf+V8B8tzRe
         XxcbLXrN/KcJfWvRxcIoJlvSBtI0oFMxDjc7Jr4dXrKdvvukVR8c3CN1TgPKWI3CJZX8
         TDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038608; x=1757643408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6zDaq6FAiEb0Gl9HksnIiUbndoeyKcmurJA86G+tvg=;
        b=uYsv0vt5iQTB8HXHe6UKq0a/PZKAuAmkcB8XfyloOLaD3pg647aA8SUnmkamKhBw2F
         2DlPobZMapX5qS3sNHA6mgJciKeUvqywoIi3wwCVYkQT+vPmtblBiz94oF5u0otvvzkx
         WGz593epDGdkdqi1H/mtRh18okDFHHd5K3EcCYB7CXf8tsdz5QqWwCF+ER6r/+Ge3tOf
         nE8jKhhY3h7bZOlmyy+EIywIRuRTwqQSJtT0fZgbgOybQ5e6ACxlPh2iA0+5phwSgrUL
         56+bJroyOc9tnWaOFe+qDyTsNl33PRYmLYJmjzCTmIdP0bAEoayixUgP01j1jsNCuTGP
         1q/w==
X-Gm-Message-State: AOJu0Yw42cNxib3WZ17vaWO+YgxRGovargGkj3+42KROo73hBx/nWiSG
	iX48YytyRDkeVB5TLzEETmgebjOa10F0td0EbIqb37cgoIF3gNd/D1lmRJ4y4i0Z+YDkDPTXzt9
	w550urm6FIDYEz4s/HlxILHeyG3G1Ie6EVAywSyEWZtQ11om++QMLB30a1bEqABG9Ys+YslNeYt
	b/vDz4nU7bu2k5ibEfATRdi4tzA2NTwC01tZcqAPubgW3rWgZN
X-Gm-Gg: ASbGnctMFDZkueFHaRpLqQPiHs7EMccfIGsKFVkPTpQL+t/YiZZj3NCNXvOBlk7qZtA
	VhVBT7g/2eqcri9zbZu3wLJGb2A2vTw/b6OxSZFKi+Ge+AOaRSNMwMkOYwDD21R+I73rYcq6wLB
	MD98IGfk3NH6woEY5pDeeaZjzB/TZ/+uHAhVi2UIGTgFUloKA+iHkGeY6OdfzVFep+jN/0krc6I
	yfN4m1PKlz1TP+GnxGsrOYUBsW7QPmbMNGXPjnbOM6PL8+cm19UcsKaJ9mWVpr62moaREkgffPZ
	owT0ooxnKDNn5LYSPgkys5en8txs1zavvNffOFPrDRNW5bIB1nCMebjO+j+GNd2LmXUXMYvrubv
	uoKC+ziG/p5h1nLAV0VWt
X-Google-Smtp-Source: AGHT+IH8Bv0SnPZne2gQESCoWTbYSd1F5WHObD4pxFvchO8TZHEDmYF8ZylXXV8Uig7vVysdkxnFow==
X-Received: by 2002:a17:90b:48c3:b0:327:ba78:e96e with SMTP id 98e67ed59e1d1-328154360camr26845321a91.13.1757038607944;
        Thu, 04 Sep 2025 19:16:47 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:47 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 05 Sep 2025 10:24:44 +0800
Subject: [PATCH v6 11/11] platform: sifive: Add SiFive SMC0 driver
MIME-Version: 1.0
Message-Id: <20250905-cache-upstream-v6-11-6a6da629c961@sifive.com>
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191649_256357_87ABC151 
X-CRM114-Status: GOOD (  23.93  )
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

The SiFive SMC0 controls the clock and power domain of the core complex
on the SiFive platform. The core complex enters the low power state
after the secondary cores enter the tile power gating and last core
execute the `CEASE` instruction with the corresponding SMC0
configurations. The devices that inside both tile power domain and core
complex power domain will be off, including caches and timer. Therefore
we need to flush the last level cache before entering the core complex
power gating and update the timer after waking up.

Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h        |  14 +
 .../sbi_utils/suspend/fdt_suspend_sifive_smc0.h    |  18 ++
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c                |  89 ++++++
 lib/utils/suspend/Kconfig                          |   4 +
 lib/utils/suspend/fdt_suspend_sifive_smc0.c        | 323 +++++++++++++++++++++
 lib/utils/suspend/objects.mk                       |   3 +
 platform/generic/configs/defconfig                 |   1 +
 7 files changed, 452 insertions(+)

diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h b/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
new file mode 100644
index 0000000000000000000000000000000000000000..06cfb390f6af32f11856d869caf52b212aceb9b0
--- /dev/null
+++ b/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
@@ -0,0 +1,14 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_HSM_SIFIVE_TMC0_H__
+#define __FDT_HSM_SIFIVE_TMC0_H__
+
+int sifive_tmc0_set_wakemask_enareq(u32 hartid);
+void sifive_tmc0_set_wakemask_disreq(u32 hartid);
+bool sifive_tmc0_is_pg(u32 hartid);
+
+#endif
diff --git a/include/sbi_utils/suspend/fdt_suspend_sifive_smc0.h b/include/sbi_utils/suspend/fdt_suspend_sifive_smc0.h
new file mode 100644
index 0000000000000000000000000000000000000000..f092be529ccd5e316a97051235ea400ae9447ea7
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
index 768b221d085d15d1b6a4684d01f6addb2598739a..059bf44be125fbea1667f2890b72023bf1ecb1a0 100644
--- a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
+++ b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
@@ -18,7 +18,10 @@
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_tmc0.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
+#include <sbi_utils/irqchip/aplic.h>
+#include <sbi_utils/suspend/fdt_suspend_sifive_smc0.h>
 
 struct sifive_tmc0 {
 	unsigned long reg;
@@ -78,6 +81,73 @@ static unsigned long tmc0_offset;
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
@@ -229,10 +299,29 @@ static int sifive_tmc0_stop(void)
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
+		aplic_reinit_all();
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
 
 static int sifive_tmc0_bind_cpu(struct sifive_tmc0 *tmc0)
diff --git a/lib/utils/suspend/Kconfig b/lib/utils/suspend/Kconfig
index 2cbea75c265fa1995c7ee7a5f5f9e0b7369418fc..623e053f280e0a3daec1c0b1e104e9cc35fc55ea 100644
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
index 0000000000000000000000000000000000000000..005486b44f80ac85a908250ad024f687cf996b78
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
index 9c386248be3074e1cb0a037903926a4fda982cd1..1fb29b5e794123986bc7167bb92504bcf4d3eb09 100644
--- a/lib/utils/suspend/objects.mk
+++ b/lib/utils/suspend/objects.mk
@@ -9,3 +9,6 @@
 
 carray-fdt_early_drivers-$(CONFIG_FDT_SUSPEND_RPMI) += fdt_suspend_rpmi
 libsbiutils-objs-$(CONFIG_FDT_SUSPEND_RPMI) += suspend/fdt_suspend_rpmi.o
+
+carray-fdt_early_drivers-$(CONFIG_FDT_SUSPEND_SIFIVE_SMC0) += fdt_suspend_sifive_smc0
+libsbiutils-objs-$(CONFIG_FDT_SUSPEND_SIFIVE_SMC0) += suspend/fdt_suspend_sifive_smc0.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 842565dc3cc56608c3c88ed2b2cc2ee4da864457..573053f47435d940451efaeb4e7b8fedf88010a7 100644
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
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
