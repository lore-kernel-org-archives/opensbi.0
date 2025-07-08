Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4F0C83F0F
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eHRRKjE+BYUz/GIB7NhfGseXVspopQgnWUYN2ffYpF0=; b=wdMyWaamLa2cqznjGPb08JyvLN
	cs3g77PW5p4yjsc/5DJ8RWyAqR7vVCd/BKtnuNIOzKz5NIat9G7gMe9Y3gtQPOKLp+AVBFuej2Rdc
	Wnqs1IrPkMQiFYMpughvMsFu4wIitv4uYh+aa75HkGM9Rx9+dMDoiBF3qVcp9qGpVWpHVgE6NVgmS
	lpJdPiisvt4ZERUhdUd1dIo4pa89oD3kU98s3M+elzrFgEko6PhdyQIulja/zq2ApGLQyuKvnvJ6Y
	6iX5Xto3sMQ87p02uk1FNB+1TciHTkSSzXRyxyMpcgZJp4M7psUm3voKZIA7ZAkf1g9c8dfUp+k49
	jVLwz27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Ed-00000004fVk-2ccc;
	Tue, 08 Jul 2025 07:59:27 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35q-00000004dU3-0mvY
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:23 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso40175666d6.3
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961021; x=1752565821; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WUECyMIswkK2ww+L7ydFel6dyCd217U5AUc71jYtD0=;
        b=SFubbQRGRwNuYPLd82DDmE+3z75ufuFNmuxvqOYINXsg0bFn5w1XmBbbEAPHqILehH
         2KPaBF+x3RYHeMvu0xtWTvPxXRH57jlhWIzZf5j3xJL5DK6+ObtYLAz8lo09PF4j2IeD
         tYmA/DgOFEX+AABGawCMp6sGXPJGq34VBBfBIDWxEE7i5kZSgHEAc9+Kuq4ekJkW/KcC
         +BuishhItIvPNJ85lLKxRSCUlZbQHkO5muOXh4Vy0jffQ/3rZWm+g5nKMn+GK+ZlgWSF
         UHptZgkj45AVejPpst3x5mq5Mjun+NEGpgVDJFgRcWZI47/aPcunPQ24D09d8L0HQc+a
         DjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961021; x=1752565821;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WUECyMIswkK2ww+L7ydFel6dyCd217U5AUc71jYtD0=;
        b=hBTHjR1NdhASIHWkGJT8c3s/0FRTD3mpe2kode8SjjBF9rgdRpdK8DSFzx5zbH8Pvc
         tjb3RZPud46ctjsNor2JGt2W8/wyHqHz/Bqbhy7d4a6y7IHuWK88j1THl1jc0v7Pnr1z
         zvkTXo8H7cP3X/RehcV/3A9xbdD9p9DXIotuaZzpPsLozSZrjQDy8lM29+X8lsXono0q
         AufSKTUfo288leRH/hDjqspjGZ2K4ISZ1xh6a5JPXmBv87TyifNnn9/3A8IBQPSrekhQ
         ETeZh3xVOCpB80pAEv98Cq3LbcKwL985+MnCbWv4dKEM1qdQ3DZynzTPW62Ii/KLLzdZ
         MAYw==
X-Gm-Message-State: AOJu0Yz0yWGLEUnLzc0tYqYXIiIu5B9lTtZXxMSpB5CjsIVZ7VAKND33
	TD9fnucMYOAhPtPfaWMLvVzVWaNx9nZgaZKaGLWxR3h+QKdnA+S6tM4dZlqKShe76H6KK1Yk/Us
	7IWOfCyDidg880MaJqJfEsvPi41iSJRlpfjQQXRucSyppN+yzH2bdW5yklIQ12iLZKnejIDVgvb
	EDnugc7HRuimwYT8NREgf42ZINFdxUh3mGAD2jYJxdAqouUQ==
X-Gm-Gg: ASbGnctGWJIIWBXofYQwy7LO6fXyAd9KmRZFg6mOHqbp4uN5lF47T5rvLGztxmIh8aS
	ryUEeGkljQm0Jvr0pj2s/5pIk+sAFgXWPV8bVUfl86RRcNlPxSpEItPCX7mETGl66JwyAX2LZuY
	w4XY+MQ7jRxeC9RLQDSuzIwM+Xkde4Rk3Y2TiNwoofdgLEIM+zCrd3EL++ab044MbEB8PvtXS2o
	dfXOY40K8LdS/97zlaxeBxLwGb1YCjejPR1x3QlP00Fpm0drHNUgkg2J+fcLKF19tzQY5JWVC+L
	KpaJ2hf0Iv6kVotDUvhW2mvYQOE2Swj1E6LX6J/pxAMJLh20F8nuu7pVCWfYY7+yHK5yDuMzTx6
	RHJJMw9Fo
X-Google-Smtp-Source: AGHT+IHvD0Vs7kSDG7lOisuTPp0aHMvKs/eooMxckAtUE358cqb5+fqheqjQJoQGMFQ38RTlO2QfwA==
X-Received: by 2002:a05:6214:4ec4:b0:701:9d0:1408 with SMTP id 6a1803df08f44-7047dada2c5mr19157646d6.20.1751961020774;
        Tue, 08 Jul 2025 00:50:20 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:20 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 12/12] platform: sifive: Add SiFive SMC0 driver
Date: Tue,  8 Jul 2025 15:49:40 +0800
Message-Id: <20250708074940.10904-13-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005022_248300_5F2EE35B 
X-CRM114-Status: GOOD (  23.04  )
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
 platform/generic/Kconfig                      |   1 +
 platform/generic/include/sifive/sifive_smc0.h |  13 +
 platform/generic/include/sifive/sifive_tmc0.h |   3 +
 platform/generic/sifive/Kconfig               |   5 +
 platform/generic/sifive/objects.mk            |   2 +
 .../pmdomain/fdt_pmdomain_sifive_smc0.c       | 322 ++++++++++++++++++
 .../pmdomain/fdt_pmdomain_sifive_tmc0.c       |  88 +++++
 7 files changed, 434 insertions(+)
 create mode 100644 platform/generic/include/sifive/sifive_smc0.h
 create mode 100644 platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_smc0.c

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 1d6ea3f4..048822ef 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -46,6 +46,7 @@ config PLATFORM_RENESAS_RZFIVE
 config PLATFORM_SIFIVE_DEV
 	bool "SiFive development platform support"
 	depends on FDT_CACHE
+	select SIFIVE_SMC0
 	select SIFIVE_TMC0
 	default n
 
diff --git a/platform/generic/include/sifive/sifive_smc0.h b/platform/generic/include/sifive/sifive_smc0.h
new file mode 100644
index 00000000..d13bdf4d
--- /dev/null
+++ b/platform/generic/include/sifive/sifive_smc0.h
@@ -0,0 +1,13 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __SIFIVE_SMC0_H__
+#define __SIFIVE_SMC0_H__
+
+bool sifive_smc0_check_warm_reset(void);
+void sifive_smc0_mtime_update(void);
+
+#endif
diff --git a/platform/generic/include/sifive/sifive_tmc0.h b/platform/generic/include/sifive/sifive_tmc0.h
index 6100e0dc..ad0d2407 100644
--- a/platform/generic/include/sifive/sifive_tmc0.h
+++ b/platform/generic/include/sifive/sifive_tmc0.h
@@ -7,6 +7,9 @@
 #ifndef __SIFIVE_TMC0_H__
 #define __SIFIVE_TMC0_H__
 
+int sifive_tmc0_set_wakemask_enareq(u32 hartid);
+void sifive_tmc0_set_wakemask_disreq(u32 hartid);
+bool sifive_tmc0_is_pg(u32 hartid);
 int sifive_tmc0_cold_init(void);
 
 #endif
diff --git a/platform/generic/sifive/Kconfig b/platform/generic/sifive/Kconfig
index 2cbcea08..efb00c02 100644
--- a/platform/generic/sifive/Kconfig
+++ b/platform/generic/sifive/Kconfig
@@ -1,5 +1,10 @@
 # SPDX-License-Identifier: BSD-2-Clause
 
+
+config SIFIVE_SMC0
+	bool "SiFive SMC v0 driver support"
+	default n
+
 config SIFIVE_TMC0
 	bool "SiFive TMC v0 driver support"
 	default n
diff --git a/platform/generic/sifive/objects.mk b/platform/generic/sifive/objects.mk
index f8938713..28001453 100644
--- a/platform/generic/sifive/objects.mk
+++ b/platform/generic/sifive/objects.mk
@@ -11,4 +11,6 @@ platform-objs-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive/fu540.o
 carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_FU740) += sifive_fu740
 platform-objs-$(CONFIG_PLATFORM_SIFIVE_FU740) += sifive/fu740.o
 
+carray-fdt_early_drivers-$(CONFIG_SIFIVE_SMC0) += fdt_sifive_smc0
+platform-objs-$(CONFIG_SIFIVE_SMC0) += sifive/pmdomain/fdt_pmdomain_sifive_smc0.o
 platform-objs-$(CONFIG_SIFIVE_TMC0) += sifive/pmdomain/fdt_pmdomain_sifive_tmc0.o
diff --git a/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_smc0.c b/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_smc0.c
new file mode 100644
index 00000000..6c6d5d1f
--- /dev/null
+++ b/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_smc0.c
@@ -0,0 +1,322 @@
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
+#include <sbi_utils/timer/aclint_mtimer.h>
+#include <sifive/sifive_inst.h>
+#include <sifive/sifive_smc0.h>
+#include <sifive/sifive_tmc0.h>
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
+
+	/* Set resumepc_hi */
+	writel((u32)(raddr >> 32), (void *)(smc0_base + SIFIVE_SMC_RESUMEPC_HI_OFF));
+	/* copy resumepc_hi from SMC to PMC */
+	sifive_smc0_set_pmcsync(SIFIVE_SMC_RESUMEPC_HI_OFF, true);
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
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_XSF_CFLUSH_D_L1))
+		sifive_cflush();
+
+	rc = sifive_smc0_get_pgprep_enarsp();
+	if (rc) {
+		sbi_printf("SMC0 error: error response code: 0x%x\n", rc);
+		rc = SBI_EFAIL;
+		goto fail;
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_XSF_CEASE)) {
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
+const struct fdt_driver fdt_sifive_smc0 = {
+	.match_table = sifive_smc0_match,
+	.init = sifive_smc0_probe,
+};
diff --git a/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_tmc0.c b/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_tmc0.c
index 70d02b33..359c0be7 100644
--- a/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_tmc0.c
+++ b/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_tmc0.c
@@ -18,7 +18,9 @@
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
+#include <sbi_utils/irqchip/aplic.h>
 #include <sifive/sifive_inst.h>
+#include <sifive/sifive_smc0.h>
 #include <sifive/sifive_tmc0.h>
 
 struct sifive_tmc0 {
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
@@ -354,10 +423,29 @@ static int sifive_tmc0_stop(void)
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
 
 int sifive_tmc0_cold_init(void)
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
