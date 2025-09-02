Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05057CA1007
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 02:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaVVRvsyJJq3/k9/9e6Ia8oOkZRUUpO67HBukEiimvo=; b=eGC6tZazscDoTp
	LJz1eqnlRPrh+aQEdemsoLqTY+dMS1ynA3+f0aaAAABVo81XdbFbHFJU7QbbmUEWqP/F11fKK3IAw
	nExqGWJphe690bmIXZ7L0Qm25XBsBf4EF9kUVBib2VjsuXLt2KlrvRaBI+BfVbxzGxAT39LecB9t0
	CXbT+mmD5ROUIgY1YTGWVrPAkQSdRXHDcg5ZmFgBp6sCOsjo/f5DWTdxUZ+8Y11uQ8RZ6tkq5Hxn/
	eX9XoFEcsggQsRECHXJTm3Opn98YXlcp4ItXnvAjzkboUpGF/0nRnsncvOXr+4D+ku7CNccbcryXc
	YsFSbtguNfAhyQmBvfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGc1-0000000EpiB-1mJM;
	Tue, 02 Sep 2025 02:19:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbz-0000000EpgR-2QLN
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:19:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-248ff5cabe0so24119225ad.0
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779547; x=1757384347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DElJWRx4mkDDHBFG5RBhwgkc093Hdm+wxXSDozLlD8=;
        b=ZOfpfHMmpUTiY1/HCyWoCUI95qxTvNezMST3c9E04AemrcUe9UJ4ySh33ZOgNtm2WK
         l7gComKY7gFXVpzokqRzf0ICiHDim1z0/oBDb9Jb2fwHCBwpZvyB2nL6D0DmGcJoS6a9
         FaXC1CCo/eMwlu4haAZ+QE2LKAer6Kzx7VSiL6riJuFbCghUSC4TQ1xUnUWipXhSFYqN
         vu3hDG5SeDJwT/fqgBksSwSSFsSpgNb2FViSV3BO3lxDHzSNvF4gbnrvAes5XXZQ0DrP
         LfRxcS/T0LqWp50HhF0AHdB75CnZHAVPezzKsj6cCsImTZevHtuxjzwz4k5s8FYlPyci
         Bzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779547; x=1757384347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DElJWRx4mkDDHBFG5RBhwgkc093Hdm+wxXSDozLlD8=;
        b=kOj595NSiAtbJYqsnzw2icq/f1NkLrjSIJwBVf817q9a8l3f8s1wbl9+7sqqbVHukr
         YryJoPmwXveKreqz3VMJ9LuapEG4oxkBLszzCodi40980FkHgh3MpGmuscJNf9d4fHa6
         OriEsSLDiSoSHP2r4hNW0wHI3s5hi8iwhp59HMdAyNfYqoxlnLkKh9+Q71zjgE1V+7Ft
         q6ox+zWBaaCShgxbiuTeBgAVJtOEyaO5SuxmUQr3B6hoPyGG4j/YrwlRrd+WdXOgE1QN
         uzfHcZmYBRuOIQgSF/sJwn0DjWwN7uW7J2NUAqxIGo5xh6g1og4SiOIpTkjOy5jNTuob
         I+Fw==
X-Gm-Message-State: AOJu0YyjzXfh7m39rs/OKPChcGN6oujZ1hQ3hMQvDB2gSNYxE0PcsYtj
	8955GCHjSwwOnh3bStn9/baBOGDBEh9330mIttmUL9Ns5Q14F2jhAfKnY+q2V7RV7o4SumQs9UR
	mELsPby+aFA5BqGIdMQIFF2/46S5ZRDmfd1UoXECUZdSOTwbnj+8PhLzUqM1wDL1ndBuHkluGf8
	k9CMEnL6WXdbNO1BnOyYpXLhcKwMHKkdbuWPO/NpoPP2QXXQ==
X-Gm-Gg: ASbGnctpofraN8Kz5CYiIQiMZiXA9Mnd1k5VH9nkgyQ02s1ZL+2I4sge2IeUs7J1v8K
	jHxg3NUeff86riOTZxQNm5otVFCOQB4kCXUl8Y4SlS6FwfmzFL5qwN5k8/BpBtrDATnQXGPXKag
	Fl3IueZ0Fi5lMkBbprDtz5rrjOLmp/Luf2o101SIozLCq+B7shpy2Vu9i79ejSUn0YOCMK5LwXj
	eElrmtercwzPR+O9AgcHCpt3+3kjY//bpve6wo0nulSpGEQj7h2GyxWczUyIH2fSU/ioyN9v+zH
	nSrfXi/qdr3ii4rbIeqCIW4lDcRhMBWA/6+2hF8G0Eh6lhgezX08kyFPBAmBCd95sA6U2u1yAd8
	nXlj4jtVuPzsM89KVOJexBhwM5XndCMk=
X-Google-Smtp-Source: AGHT+IFFXh0OTmDoceiQdC+MikrVPltLaf+pLo+NQGf7tBLRFe3hJ1/TqVofflyJVYmaXWDTgh72Rg==
X-Received: by 2002:a17:903:98f:b0:248:79d4:93b3 with SMTP id d9443c01a7336-24944b29e4dmr129011675ad.59.1756779546326;
        Mon, 01 Sep 2025 19:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:19:05 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:50 +0800
Subject: [PATCH v5 11/11] platform: sifive: Add SiFive SMC0 driver
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-11-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191907_634881_BFB69CED 
X-CRM114-Status: GOOD (  24.61  )
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
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h        |   3 +
 .../sbi_utils/suspend/fdt_suspend_sifive_smc0.h    |  18 ++
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c                |  88 ++++++
 lib/utils/suspend/Kconfig                          |   4 +
 lib/utils/suspend/fdt_suspend_sifive_smc0.c        | 323 +++++++++++++++++++++
 lib/utils/suspend/objects.mk                       |   3 +
 platform/generic/configs/defconfig                 |   1 +
 7 files changed, 440 insertions(+)

diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h b/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
index 4ba048b92541ae0e303a0bdc6a018cbd88555683..d370158a57132102274eb3f87b057700d2eb6247 100644
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
index c57fbed0a1ebd1275327a72aa67babcbdeeb021d..e55f37f135555895f8fc3a9b1a17ae3b6e33b69f 100644
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
@@ -230,10 +299,29 @@ static int sifive_tmc0_stop(void)
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
index 9c98ce309d9894c654ec6f348e32c940126960a3..a5904f77cfc77e2ef992665c83d5555c7a34b687 100644
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
