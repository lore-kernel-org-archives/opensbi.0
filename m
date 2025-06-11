Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F0DC71141
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goxNbpWpSRB5wvmlq2bSR6u9ymZo4+5nKruOoeMHHxs=; b=BsZp13tFQBZLNV
	4jvsgOvEY5I2l0zR73Po/xA12DeU8bjAsbxLYTHCZW3sofDSsuz47n0bOaVvUwgSrbavd50PDbFEd
	edl4NEvetUVB5wiiXp1g/ybrBhOjo3D2o2ejuFFNORBUsxCSBG8X94c6z8SXoDXTLZeYBPP0a4LpB
	rc9mb+LVYNn5ybYIGMDT/JE8Y1FwZsO0Cgu/pogt8xJveVO2vKhFP3qz91x2+CQ9EQDXIqmp49omv
	rPwcaHSiyNN6xV264erhL3fUbtobsyQIVL1EF/jLMPQ50I0Af2NudRrB9RGTyzVY0EQUqC1WownPP
	FGzrHLgwdnzwaSRxFoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL7-0000000ANmk-1NUv;
	Wed, 11 Jun 2025 15:26:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKG-00000009p1m-2Ud1
	for opensbi@bombadil.infradead.org;
	Wed, 11 Jun 2025 12:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3qQzkNBDjQjS2uyA2HkSpMsYcWXFPmbNrdO8S/0iLYk=; b=geNurkgmRnnedTOUx/8dXqx8ls
	E8P2RxPnOSrK6bm0ZmNjkl8maZ1VoEr2OVuSvRhL+3tvd1pFlw8fOoJF/0+XEtwkHeqw8Eh8AUz6d
	HN4v1rChDCdX3RRrruGIq0rYO/E6Z6UI3EX/Poh0kyq7DCX5lxxMS1ElANg2MYc7r3wed2FamA0f9
	PC8JEBL1eY23Q7WAfbwNTJi+7THTqLGNIYjgORtlXTtgkBFAUnjwCIXxioMHlkY3e2IUxZ63VfpP4
	s6bNwWjWK7QWrmoQwvoH7C7lYCRrjmsWr4QIj8j1GaEYi8rJR0GDyHkBP1AaUvLNtbtZvCSVDARLD
	osXtUgBw==;
Received: from m16.mail.126.com ([117.135.210.6])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKE-00000002NeZ-1bl3
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3q
	QzkNBDjQjS2uyA2HkSpMsYcWXFPmbNrdO8S/0iLYk=; b=YQd71dLlC9MZJpR8Q8
	HOE8+DEFhnHRfUORu+xgq9Nf6I/QGfjC1na8TiCs4EC812SiNUBgbPTYkJmh9X5E
	JgrFNBk/OrBQBINhUC9s3R3ECqcchOveg5Y3mjG1KYeQzSKCv+KWEatWYe0SuZRC
	xpcPTZT3JJoXIwGN8MEx6fpGg=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S4;
	Wed, 11 Jun 2025 20:12:41 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 02/12] lib: sbi: Optimise the boot sequence
Date: Wed, 11 Jun 2025 20:12:19 +0800
Message-ID: <20250611121236.937455-3-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S4
X-Coremail-Antispam: 1Uf129KBjvJXoWfXr17GF4xJryruFWrWrykKrg_yoWDKrykpF
	y5KF9FyrWvv3ykK3srGa1Uur1fGFWkKwn7Gry7Ary8ZayDAF15Gr12kw1avayDKrWFya43
	ArZIvFy8GF1UZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziySoJUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5AZpOmhJaY15twAAs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131302_950380_B3E6B7AC 
X-CRM114-Status: GOOD (  14.76  )
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

Originally init_coldboot/init_warm_startup were very similar, and
adding new code needed to be consistent in order. Now merge
init_coldboot/init_warm_startup and rename to init_startup.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_init.c | 275 ++++++++++++++++-----------------------------
 1 file changed, 96 insertions(+), 179 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a227cb53..a8983f4d 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -212,42 +212,69 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch)
 	__smp_store_release(&coldboot_done, 1);
 }
 
+static void __noreturn init_warm_resume(struct sbi_scratch *scratch, u32 hartid)
+{
+	int rc;
+
+	sbi_hsm_hart_resume_start(scratch);
+
+	rc = sbi_hart_reinit(scratch);
+	if (rc)
+		sbi_hart_hang();
+
+	rc = sbi_hart_pmp_configure(scratch);
+	if (rc)
+		sbi_hart_hang();
+
+	sbi_hsm_hart_resume_finish(scratch, hartid);
+}
+
 static unsigned long entry_count_offset;
 static unsigned long init_count_offset;
 
-static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
+static void __noreturn init_startup(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 {
 	int rc;
+	int hstate;
 	unsigned long *count;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
-	/* Note: This has to be first thing in coldboot init sequence */
-	rc = sbi_scratch_init(scratch);
-	if (rc)
-		sbi_hart_hang();
+	if (cold_boot) {
+		/* Note: This has to be first thing in coldboot init sequence */
+		rc = sbi_scratch_init(scratch);
+		if (rc)
+			sbi_hart_hang();
 
-	/* Note: This has to be second thing in coldboot init sequence */
-	rc = sbi_heap_init(scratch);
-	if (rc)
-		sbi_hart_hang();
+		/* Note: This has to be second thing in coldboot init sequence */
+		rc = sbi_heap_init(scratch);
+		if (rc)
+			sbi_hart_hang();
 
-	/* Note: This has to be the third thing in coldboot init sequence */
-	rc = sbi_domain_init(scratch, hartid);
-	if (rc)
-		sbi_hart_hang();
+		/* Note: This has to be the third thing in coldboot init sequence */
+		rc = sbi_domain_init(scratch, hartid);
+		if (rc)
+			sbi_hart_hang();
 
-	entry_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
-	if (!entry_count_offset)
-		sbi_hart_hang();
+		entry_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
+		init_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
+	} else {
+		wait_for_coldboot(scratch);
 
-	init_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
-	if (!init_count_offset)
+		hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(), hartid);
+		if (hstate < 0)
+			sbi_hart_hang();
+		if (hstate == SBI_HSM_STATE_SUSPENDED)
+			init_warm_resume(scratch, hartid);
+		sbi_ipi_raw_clear();
+	}
+
+	if (!entry_count_offset || !init_count_offset)
 		sbi_hart_hang();
 
 	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
 	(*count)++;
 
-	rc = sbi_hsm_init(scratch, true);
+	rc = sbi_hsm_init(scratch, cold_boot);
 	if (rc)
 		sbi_hart_hang();
 
@@ -257,63 +284,65 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * have these HARTs busy spin in wait_for_coldboot() until coldboot
 	 * path is completed.
 	 */
-	wake_coldboot_harts(scratch);
+	if (cold_boot)
+		wake_coldboot_harts(scratch);
 
-	rc = sbi_platform_early_init(plat, true);
+	rc = sbi_platform_early_init(plat, cold_boot);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_init(scratch, true);
+	rc = sbi_hart_init(scratch, cold_boot);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_pmu_init(scratch, true);
+	rc = sbi_pmu_init(scratch, cold_boot);
 	if (rc) {
 		sbi_printf("%s: pmu init failed (error %d)\n",
 			   __func__, rc);
 		sbi_hart_hang();
 	}
 
-	rc = sbi_dbtr_init(scratch, true);
+	rc = sbi_dbtr_init(scratch, cold_boot);
 	if (rc)
 		sbi_hart_hang();
 
-	sbi_boot_print_banner(scratch);
+	if (cold_boot)
+		sbi_boot_print_banner(scratch);
 
-	sbi_double_trap_init(scratch, true);
+	sbi_double_trap_init(scratch, cold_boot);
 
-	rc = sbi_irqchip_init(scratch, true);
+	rc = sbi_irqchip_init(scratch, cold_boot);
 	if (rc) {
 		sbi_printf("%s: irqchip init failed (error %d)\n",
 			   __func__, rc);
 		sbi_hart_hang();
 	}
 
-	rc = sbi_ipi_init(scratch, true);
+	rc = sbi_ipi_init(scratch, cold_boot);
 	if (rc) {
 		sbi_printf("%s: ipi init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
 	}
 
-	rc = sbi_tlb_init(scratch, true);
+	rc = sbi_tlb_init(scratch, cold_boot);
 	if (rc) {
 		sbi_printf("%s: tlb init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
 	}
 
-	rc = sbi_timer_init(scratch, true);
+	rc = sbi_timer_init(scratch, cold_boot);
 	if (rc) {
 		sbi_printf("%s: timer init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
 	}
 
-	rc = sbi_fwft_init(scratch, true);
+	rc = sbi_fwft_init(scratch, cold_boot);
 	if (rc) {
 		sbi_printf("%s: fwft init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
 	}
 
-	rc = sbi_mpxy_init(scratch, true);
+	rc = sbi_mpxy_init(scratch, cold_boot);
 	if (rc) {
 		sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
@@ -324,7 +353,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * Note: Finalize domains before HART PMP configuration so
 	 * that we use correct domain for configuring PMP.
 	 */
-	rc = sbi_domain_finalize(scratch, true);
+	rc = sbi_domain_finalize(scratch, cold_boot);
 	if (rc) {
 		sbi_printf("%s: domain finalize failed (error %d)\n",
 			   __func__, rc);
@@ -336,7 +365,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * domains so that it sees correct domain assignment and PMP
 	 * configuration for FDT fixups.
 	 */
-	rc = sbi_platform_final_init(plat, true);
+	rc = sbi_platform_final_init(plat, cold_boot);
 	if (rc) {
 		sbi_printf("%s: platform final init failed (error %d)\n",
 			   __func__, rc);
@@ -347,40 +376,42 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * Note: SSE events callbacks can be registered by other drivers so
 	 * sbi_sse_init() needs to be called after all drivers have been probed.
 	 */
-	rc = sbi_sse_init(scratch, true);
+	rc = sbi_sse_init(scratch, cold_boot);
 	if (rc) {
 		sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
 	}
 
-	/*
-	 * Note: Ecall initialization should be after platform final
-	 * initialization so that all available platform devices are
-	 * already registered.
-	 */
-	rc = sbi_ecall_init();
-	if (rc) {
-		sbi_printf("%s: ecall init failed (error %d)\n", __func__, rc);
-		sbi_hart_hang();
-	}
-
-	sbi_boot_print_general(scratch);
-
-	sbi_boot_print_domains(scratch);
-
-	sbi_boot_print_hart(scratch, hartid);
-
-	run_all_tests();
-
-	/*
-	 * Note: Startup domains after all initialization are done
-	 * otherwise boot HART of non-root domain can crash.
-	 */
-	rc = sbi_domain_startup(scratch, hartid);
-	if (rc) {
-		sbi_printf("%s: domain startup failed (error %d)\n",
-			   __func__, rc);
-		sbi_hart_hang();
+	if (cold_boot) {
+		/*
+		* Note: Ecall initialization should be after platform final
+		* initialization so that all available platform devices are
+		* already registered.
+		*/
+		rc = sbi_ecall_init();
+		if (rc) {
+			sbi_printf("%s: ecall init failed (error %d)\n", __func__, rc);
+			sbi_hart_hang();
+		}
+
+		sbi_boot_print_general(scratch);
+
+		sbi_boot_print_domains(scratch);
+
+		sbi_boot_print_hart(scratch, hartid);
+
+		run_all_tests();
+
+		/*
+		* Note: Startup domains after all initialization are done
+		* otherwise boot HART of non-root domain can crash.
+		*/
+		rc = sbi_domain_startup(scratch, hartid);
+		if (rc) {
+			sbi_printf("%s: domain startup failed (error %d)\n",
+				__func__, rc);
+			sbi_hart_hang();
+		}
 	}
 
 	/*
@@ -400,118 +431,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	sbi_hsm_hart_start_finish(scratch, hartid);
 }
 
-static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
-					 u32 hartid)
-{
-	int rc;
-	unsigned long *count;
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
-
-	if (!entry_count_offset || !init_count_offset)
-		sbi_hart_hang();
-
-	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
-	(*count)++;
-
-	/* Note: This has to be first thing in warmboot init sequence */
-	rc = sbi_hsm_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_platform_early_init(plat, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_hart_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_pmu_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_dbtr_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_irqchip_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_ipi_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_tlb_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_timer_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_fwft_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_platform_final_init(plat, false);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_sse_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
-	/*
-	 * Configure PMP at last because if SMEPMP is detected,
-	 * M-mode access to the S/U space will be rescinded.
-	 */
-	rc = sbi_hart_pmp_configure(scratch);
-	if (rc)
-		sbi_hart_hang();
-
-	count = sbi_scratch_offset_ptr(scratch, init_count_offset);
-	(*count)++;
-
-	sbi_hsm_hart_start_finish(scratch, hartid);
-}
-
-static void __noreturn init_warm_resume(struct sbi_scratch *scratch,
-					u32 hartid)
-{
-	int rc;
-
-	sbi_hsm_hart_resume_start(scratch);
-
-	rc = sbi_hart_reinit(scratch);
-	if (rc)
-		sbi_hart_hang();
-
-	rc = sbi_hart_pmp_configure(scratch);
-	if (rc)
-		sbi_hart_hang();
-
-	sbi_hsm_hart_resume_finish(scratch, hartid);
-}
-
-static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
-{
-	int hstate;
-
-	wait_for_coldboot(scratch);
-
-	hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(), hartid);
-	if (hstate < 0)
-		sbi_hart_hang();
-
-	if (hstate == SBI_HSM_STATE_SUSPENDED) {
-		init_warm_resume(scratch, hartid);
-	} else {
-		sbi_ipi_raw_clear();
-		init_warm_startup(scratch, hartid);
-	}
-}
-
 static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
 
 /**
@@ -573,10 +492,8 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 	if (sbi_platform_nascent_init(plat))
 		sbi_hart_hang();
 
-	if (coldboot)
-		init_coldboot(scratch, hartid);
-	else
-		init_warmboot(scratch, hartid);
+
+	init_startup(scratch, hartid, coldboot);
 }
 
 unsigned long sbi_entry_count(u32 hartindex)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
