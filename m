Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C109CCD193
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rNqua08UnfwzECg7rz+yTwTi29v2AJijFABBUEFYGw=; b=F6tLLzHms/Tuk8
	h3MUKVRMHvP2MPWSL/yWj6YXhkmbEWUT0osF9vsBSpvtPSHBsxU7GdRC3hxPLMQlYrll6S5lxFFtu
	B2q1icVul34bK3o1jZHTqQYFJVxo5XeJy4zP4FZmCwuUzISKnZzWBqPzyiOTV6RglfhTJXUbXyJCQ
	IMSl4E3KquHH+p0jVxgsjyGnOskyU6Q3z3KPj+/vWslZQHntstyZPh9P6oVCLkMHp+QVYnz9Czl7f
	NfLcjwkIYecyj83xLg31zkU9hJYaBO554Mju53hMMGlpmd2mhpJ+BsyyOCnWEcidp75wMn95nBSb6
	8hpXtHPE23leo3RIK2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjML-0000000C2DQ-3ixh;
	Mon, 20 Oct 2025 06:27:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMI-0000000C27u-3Uas
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:27:09 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7a226a0798cso2066809b3a.2
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941626; x=1761546426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pj5/1DaubZfw+JmS0hS+l4cmMIVzLl+Ws9Ve8AoWbM=;
        b=F0usSCAn3cWshEWRqInqJ672NHf1ZRk+odBzZUyGk9WZ3+PpWc4nNu9uv+upxcmm5q
         kx/0n4A6wiEozOBzgH5tsW6c2qYM40ueJzaIPY/AuUsoelF9I3PWTlkn9WkKyyNqkSi9
         cFtexJaCsKkN37XJnkawOFWU1WhRprI6uTyOemf0ljNTjdm1K/uQ18R8Hfjeq5iSv72Y
         UHLQUgVDEDU/CTTH14oTy6NqVl/oPgB5b+nuwAo0838x4TTd/K4kIAcmUTxBYF8PvZ6D
         EFri4o+SLmhU1FpLvQetBkH/BgTRUNsVzvLRpEnpzlC57eJRglUfiA3qPxSUhQ6j4gLa
         3Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941626; x=1761546426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pj5/1DaubZfw+JmS0hS+l4cmMIVzLl+Ws9Ve8AoWbM=;
        b=vhm3tqfJkITz0kjIlukv7p/PCAMtbhppdubTNs0TetpTI4Wef8W+dUeO+FUaO+IhOM
         wV1I3GLyQvF/GQl3BMBRFzE+1POj8lUfOVR28QzEy9YlY45Ubdb+DfgGY0CtosPOAQYx
         9vOp+102HINMLPD5sdVZDdOGluBKGjOgQbw6CVb0RMsf60EhPTk0zYtigc+wX5Ircbg3
         ubz8gz0223cP8+KtEopAd1xPZHoSZr6lEJC3QsTSilviom1sAyxpzSKSrqqOF61n7Cwy
         m+6ygdA6n/TNv8VP4C7Uctsyu1lic40HKQGZA51b5qUle2vffHxoDeDCNIKBd9Uybe/G
         jFwg==
X-Gm-Message-State: AOJu0YxyvYaPxwZO9KRSyHG4zR/83gctyL5Ux/AbBv3NKwnJf+K9/C5Z
	+S/hpwGoRE3yywBYnOn36G4Avd6VW+1auDeKf9YSJmMhh6hi+GQMKsk/dHUHGydfql0=
X-Gm-Gg: ASbGncug0wcviql+cE1HX/8XgqqA2LOZJAwIt8NxzyIHzgApuiadZyAFtqhQBvDPRcu
	kDTsVFIAQL/UvCeAjEqQxO6FIlJNx8ia9bKCO5K+pIAIY10h6X2Ql55T3xkz7cSsTL++YQpZdwK
	LNhLycaUbnNl3B8RwDeKb0Tg2h2D09fb/D96swHY7S5Q2ZSq2xIxjm6qdqFPrVmyyTFcNvMcFZB
	gzG2KiZlbY/NVhvrizcyqQAw3F5QjRNT5c52odcfrA3NEQ/4DxY+dJGsnoJDpkWVKkHHoRAlhT9
	SpMRU5ThsOPIlIpdPCIf/C8SuNMIgUnKG/Yz0W1SilYppgFCNF4JcS81FrJHPvizxktY5s6u9Bf
	tNryH1NKnBJA0ARn119GJFNGnNgf45njUlXih47f1nKSlIGi2KPN6/26BwJ3P521m4FefOtaVWi
	llDJdh3L+e
X-Google-Smtp-Source: AGHT+IHPBBisWgyRqnsnsyEzm/XgZ9MKEewmHwd17KCHWx65WF8iuR2eCdanx4dKzMXeZCDwI395mg==
X-Received: by 2002:a05:6a00:99d:b0:78c:9b1b:e0e3 with SMTP id d2e1a72fcca58-7a220a08d8bmr11902297b3a.7.1760941625754;
        Sun, 19 Oct 2025 23:27:05 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:27:05 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:14 +0800
Subject: [PATCH v7 12/12] lib: utils/suspend: Add SiFive SMC0 driver
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-12-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232706_969425_BC26F331 
X-CRM114-Status: GOOD (  21.11  )
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
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h |  14 ++
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c         |  57 +++++
 lib/utils/suspend/Kconfig                   |   4 +
 lib/utils/suspend/fdt_suspend_sifive_smc0.c | 318 ++++++++++++++++++++++++++++
 lib/utils/suspend/objects.mk                |   3 +
 platform/generic/configs/defconfig          |   1 +
 6 files changed, 397 insertions(+)

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
diff --git a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
index 8b08a7d1bf025f033ee0ebbe02fb97c70d0afeef..2690a638d6e83ddf546f4958c4f8543b981e31dc 100644
--- a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
+++ b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
@@ -18,6 +18,7 @@
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_tmc0.h>
 
 struct sifive_tmc0 {
 	unsigned long reg;
@@ -77,6 +78,62 @@ static unsigned long tmc0_offset;
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
 static void sifive_tmc0_set_resumepc(physical_addr_t addr)
 {
 	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
diff --git a/lib/utils/suspend/Kconfig b/lib/utils/suspend/Kconfig
index 2cbea75c265fa1995c7ee7a5f5f9e0b7369418fc..6c09d95253d2cd5a57c5f2676f8e65dddd8676f0 100644
--- a/lib/utils/suspend/Kconfig
+++ b/lib/utils/suspend/Kconfig
@@ -14,6 +14,10 @@ config FDT_SUSPEND_RPMI
 	depends on FDT_MAILBOX && RPMI_MAILBOX
 	default n
 
+config FDT_SUSPEND_SIFIVE_SMC0
+	bool "FDT SIFIVE SMC0 suspend driver"
+	depends on FDT_HSM_SIFIVE_TMC0 && IRQCHIP_APLIC
+	default n
 endif
 
 endmenu
diff --git a/lib/utils/suspend/fdt_suspend_sifive_smc0.c b/lib/utils/suspend/fdt_suspend_sifive_smc0.c
new file mode 100644
index 0000000000000000000000000000000000000000..7a23e68bf2b1494c01fe2cad56d4977a9e7aaf4a
--- /dev/null
+++ b/lib/utils/suspend/fdt_suspend_sifive_smc0.c
@@ -0,0 +1,318 @@
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
+#include <sbi_utils/irqchip/aplic.h>
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
+static void sifive_smc0_mtime_update(void)
+{
+	struct aclint_mtimer_data *mt = aclint_get_mtimer_data();
+
+	aclint_mtimer_update(mt, &smc_sync_timer);
+}
+
+static int sifive_smc0_system_suspend_check(u32 sleep_type)
+{
+	return sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND ? SBI_OK : SBI_EINVAL;
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
+static void sifive_smc0_system_resume(void)
+{
+	aplic_reinit_all();
+	sifive_smc0_mtime_update();
+}
+
+static struct sbi_system_suspend_device smc0_sys_susp = {
+	.name = "Sifive SMC0",
+	.system_suspend_check = sifive_smc0_system_suspend_check,
+	.system_suspend = sifive_smc0_system_suspend,
+	.system_resume = sifive_smc0_system_resume,
+};
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
index 897d552813121f22c812e9760d2b144f41141c49..554c5e1bc69243b572e570a1bd3221b3c3fd1db0 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -56,6 +56,7 @@ CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
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
