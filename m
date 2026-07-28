Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECB2C53219
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ux0waj44DKjnka3FXOFuT1HEGM2e0SSIpDcqbUfVxZc=; b=2/L8pcRCmiFN0G
	FoWYZMGuAlf9vGhRnbcfNeY+FrRMc1DAmrTLE7HHQiXMjPUSjttiaNMPwXx0j1jLcl4L95RoN4pL5
	A/hZR/wI1QzqZKMZD8GuxPl1YwxrJCbUEebmVbaVL3hfTK6t2QHt+83Jkfp/fUTEvhn8FPfkCTmw/
	o9vhW4fV9GemOAq4ZysBtq9nqACNbpOIUoc3uaFNjp2XBRaKjYxe4/9nspMkZQ4JwXaNZmXj5OAMh
	8RsEreGfNjua22xVVsgyw/xuz5mhgXXbOXx/DJyCATIZ/MLMEMVj09bKge72RAmH4cT4+56J3q7UB
	LNf5m1JB8dTeekf9ek/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocuJ-00000004gby-2jQ2;
	Tue, 28 Jul 2026 08:11:23 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocuG-00000004gWj-3MP6
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 08:11:22 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 66S8B7x3069312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 16:11:07 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jul
 2026 16:11:07 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 7/7] lib: utils/andes: arm the SMU sleep command last
Date: Tue, 28 Jul 2026 16:10:41 +0800
Message-ID: <20260728081041.2724668-8-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728081041.2724668-1-ben717@andestech.com>
References: <20260728081041.2724668-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 66S8B7x3069312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_011121_205504_A2752D41 
X-CRM114-Status: GOOD (  16.61  )
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

Once the sleep command is written, the next WFI puts the core to sleep,
so everything that can fail has to run before it.

Also, use writel() so the command store cannot still be in flight at the
WFI.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c         |  4 +--
 lib/utils/suspend/fdt_suspend_andes_atcsmu.c | 31 +++++++++++++++-----
 platform/generic/andes/ae350.c               |  8 +++++
 platform/generic/include/andes/andes.h       |  1 +
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
index d57db8f881a6..2885a983c37d 100644
--- a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -56,7 +56,7 @@ bool atcsmu_support_sleep_mode(u32 sleep_type, u32 hartid)
 
 void atcsmu_set_command(u32 pcs_ctl, u32 hartid)
 {
-	writel_relaxed(pcs_ctl, (char *)atcsmu_base + PCSm_CTL_OFFSET(hartid));
+	writel(pcs_ctl, (char *)atcsmu_base + PCSm_CTL_OFFSET(hartid));
 }
 
 int atcsmu_set_reset_vector(u64 wakeup_addr, u32 hartid)
@@ -141,12 +141,12 @@ static int ae350_hart_stop(void)
 		atcsmu_set_command(LIGHT_SLEEP_CMD, hartid);
 	} else if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) {
 		/* Power-gated: SMU wakes it via cold reset, interrupts not needed */
-		atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
 		rc = atcsmu_set_reset_vector((ulong)ae350_enable_coherency_warmboot, hartid);
 		if (rc)
 			return SBI_EFAIL;
 
 		ae350_non_ret_save(sbi_scratch_thishart_ptr());
+		atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
 	}
 
 	ae350_disable_coherency();
diff --git a/lib/utils/suspend/fdt_suspend_andes_atcsmu.c b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
index 8d15346afcfe..86cdf95563ec 100644
--- a/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
+++ b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
@@ -57,9 +57,11 @@ static int ae350_system_suspend_check(u32 sleep_type)
 static int ae350_system_suspend(u32 sleep_type, unsigned long addr)
 {
 	u32 hartid = current_hartid();
+	unsigned long saved_mie;
 	int rc;
 
 	/* Prevent the core leaving the WFI mode unexpectedly */
+	saved_mie = csr_read(CSR_MIE);
 	csr_write(CSR_MIE, 0);
 
 	/* SMU wakes the primary hart on RTC alarm / UART2 */
@@ -68,7 +70,7 @@ static int ae350_system_suspend(u32 sleep_type, unsigned long addr)
 	if (sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP) {
 		rc = wait_secondary_harts_sleep(hartid, false);
 		if (rc)
-			return rc;
+			goto err_restore_mie;
 
 		/* Clock-gated only: enable SEI to resume past the WFI */
 		csr_set(CSR_MIE, MIP_SEIP);
@@ -76,18 +78,24 @@ static int ae350_system_suspend(u32 sleep_type, unsigned long addr)
 	} else if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) {
 		rc = wait_secondary_harts_sleep(hartid, true);
 		if (rc)
-			return rc;
+			goto err_restore_mie;
 
-		atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
 		rc = atcsmu_set_reset_vector((ulong)ae350_enable_coherency_warmboot, hartid);
 		if (rc)
-			return rc;
+			goto err_restore_mie;
 
 		ae350_non_ret_save(sbi_scratch_thishart_ptr());
-		fdt_cmo_llc_enable(false);
+
+		/* No LLC is fine; only fail on real errors */
+		rc = fdt_cmo_llc_enable(false);
+		if (rc && rc != SBI_ENODEV)
+			goto err_discard_save;
+
 		rc = fdt_cmo_llc_flush_all();
-		if (rc)
-			return rc;
+		if (rc && rc != SBI_ENODEV)
+			goto err_enable_llc;
+
+		atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
 	}
 
 	ae350_disable_coherency();
@@ -97,6 +105,15 @@ static int ae350_system_suspend(u32 sleep_type, unsigned long addr)
 	ae350_enable_coherency();
 
 	return SBI_OK;
+
+err_enable_llc:
+	fdt_cmo_llc_enable(true);
+err_discard_save:
+	ae350_non_ret_discard(sbi_scratch_thishart_ptr());
+err_restore_mie:
+	csr_write(CSR_MIE, saved_mie);
+
+	return rc;
 }
 
 static void ae350_system_resume(void)
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 4a053f434272..7aafe5455ab4 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -38,6 +38,14 @@ void ae350_non_ret_save(struct sbi_scratch *scratch)
 	andes_hdata->saved = true;
 }
 
+void ae350_non_ret_discard(struct sbi_scratch *scratch)
+{
+	struct andes_hart_data *andes_hdata = sbi_scratch_offset_ptr(scratch,
+								     andes_hart_data_offset);
+
+	andes_hdata->saved = false;
+}
+
 void ae350_non_ret_restore(struct sbi_scratch *scratch)
 {
 	struct andes_hart_data *andes_hdata = sbi_scratch_offset_ptr(scratch,
diff --git a/platform/generic/include/andes/andes.h b/platform/generic/include/andes/andes.h
index dae112ce741f..dfa9f3c11710 100644
--- a/platform/generic/include/andes/andes.h
+++ b/platform/generic/include/andes/andes.h
@@ -102,6 +102,7 @@ struct andes_hart_data {
 };
 
 void ae350_non_ret_save(struct sbi_scratch *scratch);
+void ae350_non_ret_discard(struct sbi_scratch *scratch);
 void ae350_non_ret_restore(struct sbi_scratch *scratch);
 void ae350_enable_coherency_warmboot(void);
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
