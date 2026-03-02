Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B63C624C2
	for <opensbi@archiver.kernel.org>; Mon,  2 Mar 2026 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGReNqgfT0IxzNmiL/zq1wFFaOndJNM8t2TwriJKV9I=; b=0VUXGvxZ3ApWeA
	Yz2eCm+FwvmxsIn0buy94/h2T6nDO4tYr+DdFYJXcPB3N9B/PLjuWGDDmNszCsJdtCb25vtj/KkiY
	MyD9L1NwUyYUGI6cU7CmA8iQy8k1Gtc7nCCs2ZazK/lQjqQElwUc85rpKETSbLpAUvSu3yGjynkui
	AIpYCFDkLMj5S0Q/q2qKbxJLv+yoezmyKAXdfIJfI8cCsemzeGB3fFELhqE/IPlir3GDnGe2DjgGP
	zNNTlgCqHTPQH9pLM+pxnlAOs7zgpdLw4+HPo9uvw9csOp29mimtNRmHmJNItq2xTW37E4p9pOl7D
	CLqwSEBEk2ZqMtJml75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyrN-0000000CXD2-3hsc;
	Mon, 02 Mar 2026 08:42:37 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyrL-0000000CXAa-0gH2
	for opensbi@lists.infradead.org;
	Mon, 02 Mar 2026 08:42:36 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8cb3825b0fbso406845085a.0
        for <opensbi@lists.infradead.org>; Mon, 02 Mar 2026 00:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772440953; x=1773045753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JosPePCPmHXmAV5ZP9ec460Ha1dplC0itFDHlqxAtlw=;
        b=nsCSRcHbsMfXFm9xDLR3NLb2JfHwmzGizCkeSEU1XwS17c7TBfg5H13vYIi8AzMhaF
         PyaL3G395F6l7sAteyxKQQpTJTIrj7AYRNd+GyXqMzXuIGnpt7Q4DJ7DOVDR/h/ZjDG/
         ORbnFAdhqK8TaFsdlgbCNCKxGIXWYAH/foflcHn/2mDaZ6cVA3DhIHNYeQe96Yz7NOUg
         8N1dXMsYti1w/U2bwyfGCiFDoYqJXb5pnSxi3h0p42vxviuvi32bfrXUyK7Qt1ei/TZ6
         gMqP1yGExZ4+M/06dIiI5CYv2Yyql0OyP0eSEk4nXHFJpY/OkPvj2c+z49P1p+oeuhVK
         AP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440953; x=1773045753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JosPePCPmHXmAV5ZP9ec460Ha1dplC0itFDHlqxAtlw=;
        b=Kqff/BS/wxgUxHeqntU0WeDYMhnpZP6h/1pU947AepxBY8EWY2zdE7BskbWC9D5UTv
         Be6laaOf/O3d4lCkAjxRHouVGVi4Pyuef80DWv5stNJGrzrGBli0Ksk6jqS4zk/CWgIr
         atVzDQZmjyyVn7LpQG9Tj4IqS5K4sTFHRKK595T8N1CEXktPZLA1xm2WXIwiCta8xla0
         NRH2dEqd1hVnY9z99a6ZcVdJ0zy5k660Cf5FzqGPMqkDBR9wuU4rwXrRjAeS3OJs9prc
         4XNst1LMcV0HW/iPUaiA0Dt3bRerT4SwKqof7lqZfqArglle4ITUPSbAfQPBa4b5dDWu
         uSaQ==
X-Gm-Message-State: AOJu0YwhTe6TXA7y4sRm5Ldd7xEWXUIz1Ff5bWsovgtknFWzC2bC8ehF
	uJcjEEy55RrGHZNtkhWDWC7UO48eY3Y+1ULdM4oSM2aU6NtbrjujQ5/SHb6bSA==
X-Gm-Gg: ATEYQzw/Wlv7eSnkttQpI6XtoW+e12bzqpUdR/IDU/ltzt/FzCBS6324WWPWYzM6Ck2
	9wvYDxT2fhQwveq+fSPtATcvmPfSjE1gRhbXgPXt3cq0BOnktdk57n3D3P/kJAEFXG7I3PFDNmZ
	3Q8F5+QjK7OhLV85Xw/MNZIp6Lr3Ss70+DazfpmiS1mrQ3OQRKi0hEdoLX38l5OvPu60NmH+lu3
	sSC2F+sCCYEhfUxRnVvLZMXUCL5rcWZd+RwkB5EcUX5cQf+hssuMdKBrVGMAOTjjKWwdd5y5HIj
	q/hVbVLqT0tY+g755dC0quAs3vLltLJ8nNjC75hb9q9hr2JSsVYoosWENBCI/AMXlb9DG9D7kxn
	8S6cAU70D4rST0g1d+1uarxk7mUKijhZj+eMjnz9uRahXycue64iX1yoB2oPaysl9y3FCsVaUUA
	Ho9GxT1+03F1NCpd01mzr7p2rw
X-Received: by 2002:a05:620a:4590:b0:8b2:e9d2:9c69 with SMTP id af79cd13be357-8cbc8d7b815mr1457505885a.22.1772440953302;
        Mon, 02 Mar 2026 00:42:33 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf746fc5sm1106370485a.51.2026.03.02.00.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:42:32 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: nick.hu@sifive.com,
	linmin@eswincomputing.com,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Subject: [PATCH 2/2] platform: generic: eswin: Add eic770x_hsm and fix warm reset issues
Date: Mon,  2 Mar 2026 00:40:29 -0800
Message-Id: <20260302084029.428-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302084029.428-1-ganboing@gmail.com>
References: <20260302084029.428-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004235_223985_E70DBAB0 
X-CRM114-Status: GOOD (  25.32  )
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
 platform/generic/eswin/eic770x.c         | 105 ++++++++++++++++++++---
 platform/generic/eswin/hfp.c             |   4 +-
 platform/generic/include/eswin/eic770x.h |  20 +++--
 3 files changed, 113 insertions(+), 16 deletions(-)

diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index 7330df9f..237fb06d 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -10,14 +10,96 @@
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
@@ -28,23 +110,23 @@ static int eic770x_system_reset_check(u32 type, u32 reason)
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
@@ -145,7 +227,7 @@ static int eswin_eic7700_early_init(bool cold_boot)
 
 	if (board_reset)
 		sbi_system_reset_add_device(board_reset);
-	sbi_system_reset_add_device(&eic770x_reset);
+	sbi_system_reset_add_device(&eic7700_reset);
 
 	/* Enable bus blocker */
 	writel(1, (void*)EIC770X_TL64D2D_OUT);
@@ -231,6 +313,9 @@ static int eswin_eic7700_final_init(bool cold_boot)
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
index 67764ec0..fe7c1f58 100644
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
+#define EIC770X_SYSCRG_MCCLK(d) (EIC770X_SYSCRG(d) + 0x208UL)
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
