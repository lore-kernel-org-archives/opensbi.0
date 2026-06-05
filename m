Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B3ECD6E7C
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9x2pUpmdTruj9X7v/xBdliAGssSjuwTXoQn+FvyPQ6Q=; b=l7+sGHsMWdlyuk
	h3Whu9qp8IWsLSos72jv2iHeu3FFdg43DO5mh9chpNeSNRycyZQGcQYetII5UCED7FfP4QXPhnYou
	K5r0yn3r1aigFKLZG6FWGrPVq+2spT+07AbJ43B0+z7C0zODopDGGH+g03M8PqjjTMFaAWwlqnRUy
	5BY2qM76fyby6VUuYPTG+7Qx868+5vdudLxVrIY5iJtSmteOloG1Pc9V3ac4mFF6RG8n9cG0uRd0O
	HhBFL+o8vWx6oIOaP6//2MlO0BFKzuUeGoMcYGABwWcl+P/a3U+JbZhq9JrjnP1o8YjTrB7HkJo0K
	ylmuWp79EfdSV2ln44KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPSz-00000000H0v-3ZEG;
	Fri, 05 Jun 2026 07:59:45 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPSv-00000000GzC-33ti
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 07:59:44 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c85c9e8b7e4so691029a12.1
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780646379; x=1781251179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGf/gQXT1Y/2dDyV7edMPZbpoQ+AW8rkhMirtF2zl08=;
        b=XAmb0bzbM/u8W92aCOWlEnlO3DG+1UBDPRC+01KBrgpQV0AawXpYWXgsXYfvzvL4oX
         ThC4ClPpmNVZ0HUYKglb9Viv1586MCH4kZz/kM2YZwhv8ChSNP6JS2Lsv18XAEL2e/QU
         vic+iq6F9qN6VXrEXhl3ZSMyRchcLq4z0UU3ZX182EHiAJTpnpIA1EjRpvWvHwaFq9RJ
         0qLQ3DqkPOf5gW0TZDOxd1aQ9/CO8G4df5F0hheeAZdEMuBc9lqcxsMYgDLNCpT0p944
         AevMKd0D9z/np9wjdySSxv5heeg027NpbiHijSqNmcQ7fYeSnQQ2TCHfxJsjnuj511G5
         ceHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646379; x=1781251179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fGf/gQXT1Y/2dDyV7edMPZbpoQ+AW8rkhMirtF2zl08=;
        b=EvHKkXFcP8ygGm+pR/CSSXbyZg6zQxT+5MfwYyVQrGkrpKIqMH1tvTiVeymgfte/4L
         I9fHW64gYu3JkE/2RUgRUMOOIBzmoQzNQYwmBG9UccHr3lqxxocxVQENJtvtxuGlYpNW
         TsXUwiFsFNEvGvSFGTf7EkWQ87roM56xYWeLjz6jsWemQUPwkJIWq7fp8eXGfByBL0m7
         Kvdg/rzWfMT6A+vsnxsEWgdzFLYVsHAdNd5n59qf/RnFxia5HhQeV+oMKUe4fmVSmJAa
         YR+eXLPRY4HHm1drzKNy6DL7r0Z4QNI4cYC0hEvKkEWed2Ht1RndWUYEZ8MbiEDRcpc1
         AVGQ==
X-Gm-Message-State: AOJu0Yy9+wApeJkQIB6wPrwGEAWiwpIAuRYZJeP90VBJnM6dYagB2aag
	ePb5wchhe/I0zBiH88TffdUA4B78mi0Rn1EEM3PIW3Z0T5Y7pvzOrYNhMbG39g==
X-Gm-Gg: Acq92OGiXz8+4+1J7EYYWfvc9K5fO4mZ55/oDX808q13ipMQXWLvzzm//+jJo20cKfQ
	VqJUNLpsxigjnjrAO4ThvCfVXLjeYcpNJb6u3YhT1xwEsO+j+uM8dOIiEmHsAMtXuC+5jjRTlk2
	C8jyP4pS8KKfozy5ZVgX/JbIBYZ8U2jNLva4Ttur3JWA4ZVHhaRfsevCYI6aAWBToEv4MCU9ks0
	21Fj9E+bobi9MvH2D+R957U8AK9kw4/T3it9+9wDM4etSD1gk52EJ5v7LJx9GOXMhtSY/453R/F
	V7Q5ekYcXfUaU4/YEM2QYIratjqjY7U/NrPIZBtn17e0oiASmqA3ocEru/eTOY0XSIFIvpdOKWL
	2QDYzYKWo9Em+zJXX9I+G1hB4dNumGf7GKztDE14PV9i1NszaaWddDxUa0s2yzPmR9ucF1ldTtA
	BdqyCQrWyXXWHdTAbmiZdMpxxHSrTiE6KtwHw=
X-Received: by 2002:a05:6a20:db8e:b0:3b4:81b4:9b79 with SMTP id adf61e73a8af0-3b4cd05387dmr2992182637.40.1780646379359;
        Fri, 05 Jun 2026 00:59:39 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm6883862a12.26.2026.06.05.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:59:38 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: nick.hu@sifive.com,
	linmin@eswincomputing.com,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Subject: [PATCH v2 2/2] platform: generic: eswin: Add eic770x_hsm and fix warm reset issues
Date: Fri,  5 Jun 2026 00:57:08 -0700
Message-Id: <20260605075708.96-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605075708.96-1-ganboing@gmail.com>
References: <20260605075708.96-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_005941_794204_37059215 
X-CRM114-Status: GOOD (  26.19  )
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

During warm reset, my EIC770X/Hifive Premier P550 can sometimes
encounter memory corruption issue crashing Linux boot. Currently the
issue is mitigated by having a sbi_printf before writing to the reset
register. I analyzed the issue further since then. From the SoC
datasheet[1], it's recommended to implement power-down flow as:

  a. Designate a primary core, and let it broadcast requests to other
     cores to execute a CEASE insn. Primary core also notifies an
     "Externel Agent" to start monitoring.
  b. Primary core waits for other cores to CEASE before it CEASEs.
  c. "External Agent" waits for primary core to CEASE before resets
     the Core Complex.

It's possible that EIC770X can trigger undefined behavior if the core
complex is reset while the harts are actively running. The sbi_printf
in the reset handler effectively hides the problem by delaying the
reset -- by the time sbi_printf finishes, all other harts will have
already landed in the loop in sbi_hsm_hart_wait(), which parks the hart.
Without the sbi_printf, I confirmed that other harts haven't reached
sbi_hsm_hart_wait yet before current hart resets the SoC. (by debugging)

To safely reset, and inspired by the datasheet, the warm reset logic
in eic770x.c now use the current hart as both primary core and the
"External Agent", and other harts as secondary cores. It leverages
the HSM framework and a new eic770x_hsm device to CEASE other harts,
and wait for them to CEASE before resets the SoC. with the sbi_printf
before reset removed, and this logic in place, stress test shows that
the memory corruption issue no longer occurs.

The new eic770x_hsm device is only used for the reset-CEASE logic at
the moment, and may be extended to a fully functional HSM device in
the future.

[1] https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual

Fixes: e5797e0688c1 ("platform: generic: eswin: add EIC7700")
Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 platform/generic/eswin/eic770x.c         | 118 +++++++++++++++++++++--
 platform/generic/eswin/hfp.c             |   4 +-
 platform/generic/include/eswin/eic770x.h |  20 +++-
 3 files changed, 126 insertions(+), 16 deletions(-)

diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index 7330df9f..b5c128c6 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -10,14 +10,109 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_math.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_ipi.h>
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/sbi_hart_protection.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
 #include <eswin/eic770x.h>
 #include <eswin/hfp.h>
 
 static struct sbi_hart_protection eswin_eic7700_pmp_protection;
+static volatile bool eic770x_power_down = false;
 
-static int eic770x_system_reset_check(u32 type, u32 reason)
+static int eic770x_hart_start(u32 hartid, ulong saddr)
+{
+	u32 hartindex = sbi_hartid_to_hartindex(hartid);
+
+	/*
+	 * saddr is ignored intentionally.
+	 * For non-power-down scenarios, eic770x_hart_stop simply
+	 * returns, putting the hart in atomic_read(&hdata->state)
+	 * loop in sbi_hsm_hart_wait. We wake it up if it's in wfi()
+	 */
+	return sbi_ipi_raw_send(hartindex, true);
+}
+
+static int eic770x_hart_stop()
+{
+	/*
+	 * fence to enforce all previous ipi clears are done
+	 * Refer to comments below in eic770x_cease_other_harts
+	 */
+	asm volatile ("fence o, r");
+
+	if (!eic770x_power_down)
+		return SBI_ENOTSUPP;
+
+	/*
+	 * bit 0: disableDCacheClockGate
+	 * When some or all warm boot harts haven't gone under at least 1
+	 * cycle of hsm start/stop, (happens if reset is issued in pre-
+	 * boot environment u-boot/UEFI where all warm boot harts are
+	 * pending start), the FEAT0 CSR still holds the SoC reset values,
+	 * and disableDCacheClockGate is set. A CEASE instruction executed
+	 * when disableDCacheClockGate=1 will not properly reflect its
+	 * ceased status in mcput_cease_from_tile_x. Thus, clear it before
+	 * CEASE.
+	 */
+	csr_clear(EIC770X_CSR_FEAT0, 0x1);
+
+	sifive_cease();
+}
+
+void eic770x_cease_other_harts(void)
+{
+	u32 to_cease[2] = {};
+
+	eic770x_power_down = true;
+	sbi_for_each_hartindex(i) {
+		u32 hartid = sbi_hartindex_to_hartid(i);
+		u32 die    = hart_die(hartid);
+		u32 core   = hart_core(hartid);
+
+		/* Only wait for other harts */
+		if (i == current_hartindex())
+			continue;
+		/*
+		 * Bring harts out of WFI in sbi_hsm_hart_wait
+		 * Harts won't miss this IPI, because:
+		 *  1. If hart goes to wfi() in sbi_hsm_hart_wait,
+		 *     it must have not observed eic770x_power_down
+		 *  2. If it hasn't observed eic770x_power_down,
+		 *     then it must haven't observed the IPI sent,
+		 *     given the wmb() in sbi_ipi_raw_send
+		 *  3. Given the fence o, r, any previous ipi_clear
+		 *     can't fall-through the read of eic770x_power_down
+		 */
+		sbi_ipi_raw_send(i, false);
+		to_cease[die] |= EIC770X_MC_CEASE_BIT(core);
+	}
+
+	for (u32 die = 0; die < array_size(to_cease); die++) {
+		/*
+		 * MCPU status indicates the wfi/debug/halt/cease status
+		 * of each individual harts in the same die. The value
+		 * can change on the fly, but for ceased harts, the cease
+		 * bit remains high until reset
+		 */
+		u32 *status = (u32*)EIC770X_MCPU_STATUS(die);
+
+		if (!to_cease[die])
+			continue;
+
+		/* Wait for mcput_cease_from_tile_x */
+		while ((readl(status) & to_cease[die]) != to_cease[die]);
+	}
+}
+
+static const struct sbi_hsm_device eswin_eic770x_hsm = {
+	.name	      = "eic770x_hsm",
+	.hart_start   = eic770x_hart_start,
+	.hart_stop    = eic770x_hart_stop,
+};
+
+static int eic7700_system_reset_check(u32 type, u32 reason)
 {
 	switch (type) {
 	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
@@ -28,23 +123,23 @@ static int eic770x_system_reset_check(u32 type, u32 reason)
 	}
 }
 
-static void eic770x_system_reset(u32 type, u32 reason)
+static void eic7700_system_reset(u32 type, u32 reason)
 {
 	switch (type) {
 	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
 	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
-		sbi_printf("%s: resetting...\n", __func__);
-		writel(EIC770X_SYSCRG_RST_VAL, (void *)EIC770X_SYSCRG_RST);
+		eic770x_cease_other_harts();
+		writel(EIC770X_SYSRST_VAL, (void *)EIC770X_SYSCRG_SYSRST);
 	}
 
-	sbi_hart_hang();
+	sifive_cease();
 }
 
 static struct sbi_system_reset_device *board_reset = NULL;
-static struct sbi_system_reset_device eic770x_reset = {
-	.name = "eic770x_reset",
-	.system_reset_check = eic770x_system_reset_check,
-	.system_reset = eic770x_system_reset,
+static struct sbi_system_reset_device eic7700_reset = {
+	.name = "eic7700_reset",
+	.system_reset_check = eic7700_system_reset_check,
+	.system_reset = eic7700_system_reset,
 };
 
 #define add_root_mem_chk(...) do { \
@@ -145,7 +240,7 @@ static int eswin_eic7700_early_init(bool cold_boot)
 
 	if (board_reset)
 		sbi_system_reset_add_device(board_reset);
-	sbi_system_reset_add_device(&eic770x_reset);
+	sbi_system_reset_add_device(&eic7700_reset);
 
 	/* Enable bus blocker */
 	writel(1, (void*)EIC770X_TL64D2D_OUT);
@@ -231,6 +326,9 @@ static int eswin_eic7700_final_init(bool cold_boot)
 	int rc;
 
 
+	if (cold_boot)
+		sbi_hsm_set_device(&eswin_eic770x_hsm);
+
 	/**
 	 * Do generic_final_init stuff first, because it touchs FDT.
 	 * After final_init, we'll block entire memory port with the
diff --git a/platform/generic/eswin/hfp.c b/platform/generic/eswin/hfp.c
index eabed191..a6e73e18 100644
--- a/platform/generic/eswin/hfp.c
+++ b/platform/generic/eswin/hfp.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi_utils/serial/uart8250.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
 #include <eswin/eic770x.h>
 #include <eswin/hfp.h>
 
@@ -94,6 +95,7 @@ static int hfp_system_reset_check(u32 type, u32 reason)
 
 static void hfp_system_reset(u32 type, u32 reason)
 {
+	eic770x_cease_other_harts();
 	switch (type) {
 	case SBI_SRST_RESET_TYPE_SHUTDOWN:
 		hfp_send_bmc_msg(HFP_MSG_NOTIFY, HFP_CMD_POWER_OFF,
@@ -104,7 +106,7 @@ static void hfp_system_reset(u32 type, u32 reason)
 				NULL, 0);
 		break;
 	}
-	sbi_hart_hang();
+	sifive_cease();
 }
 
 static struct sbi_system_reset_device hfp_reset = {
diff --git a/platform/generic/include/eswin/eic770x.h b/platform/generic/include/eswin/eic770x.h
index 67764ec0..9c80b589 100644
--- a/platform/generic/include/eswin/eic770x.h
+++ b/platform/generic/include/eswin/eic770x.h
@@ -14,6 +14,8 @@ struct eic770x_board_override {
 	struct sbi_system_reset_device *reset_dev;
 };
 
+void eic770x_cease_other_harts(void);
+
 /* CSRs */
 #define EIC770X_CSR_BRPREDICT	0x7c0
 #define EIC770X_CSR_FEAT0	0x7c1
@@ -55,11 +57,16 @@ struct eic770x_board_override {
 #define EIC770X_UART_REG_SHIFT	2
 #define EIC770X_UART_REG_WIDTH	4
 
-#define EIC770X_SYSCRG		(EIC770X_SYSPORT_LOCAL + 0x11828000UL)
-#define EIC770X_SYSCRG_LSPCLK0	(EIC770X_SYSCRG + 0x200UL)
-#define EIC770X_SYSCRG_SYSCLK	(EIC770X_SYSCRG + 0x20cUL)
-#define EIC770X_SYSCRG_RST	(EIC770X_SYSCRG + 0x300UL)
-#define EIC770X_SYSCRG_RST_VAL	0x1AC0FFE6UL
+#define EIC770X_SYSCON(d)	(EIC770X_SYSPORT_BASE(d) + 0x11810000UL)
+#define EIC770X_MCPU_STATUS(d)	(EIC770X_SYSCON(d) + 0x608UL)
+#define EIC770X_MC_CEASE_BIT(c)	(1UL << (15 - c))
+
+#define EIC770X_SYSCRG(d)	(EIC770X_SYSPORT_BASE(d) + 0x11828000UL)
+#define EIC770X_SYSCRG_LOCAL	(EIC770X_SYSPORT_LOCAL + 0x11828000UL)
+#define EIC770X_SYSCRG_LSPCLK0	(EIC770X_SYSCRG_LOCAL + 0x200UL)
+#define EIC770X_SYSCRG_MCCLK(d)	(EIC770X_SYSCRG(d) + 0x208UL)
+#define EIC770X_SYSCRG_SYSCLK	(EIC770X_SYSCRG_LOCAL + 0x20cUL)
+#define EIC770X_SYSCRG_SYSRST	(EIC770X_SYSCRG_LOCAL + 0x300UL)
 
 /* Memory Ports */
 #define EIC770X_MEMPORT_BASE	0x0080000000UL // 2G
@@ -98,4 +105,7 @@ struct eic770x_board_override {
 		divisor > 2 ? divisor : 2; 		\
 	})
 
+/* Reset definitions */
+#define EIC770X_SYSRST_VAL	0x1AC0FFE6UL
+
 #endif
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
