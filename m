Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B52FC53219
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAv3Q9odni0WHyhVKwsPPo7jk8YD6S3TfF0C17gSChM=; b=pkawAxBGw8t4av
	Fm+trMJXsLBlXXza+Y9nhPAEmb6W/G5AP2+DixLG/DVeSTZm23EOIgXR6EprA7xWZhfbw+Pt4MVDn
	EjzYEDfEeZqskSIdhXWogTK4HqTdM6pICCEoIP9zQh1c2TtOtkSzZE4CyebcsOPOf7efpZwedh1dt
	F8Y+sY5W8+69fWkxFRwTpfVlmqdZpUTQ3JsCtAWxn5DTAVdiuXgCBIH2cKSflXFVtMt0twsA6h07r
	RaFeH9ZudLQDZ12+2QyEJoBuR7GOiY4q6fS8xH0X4Ts1FCnwt8ilsMUVOTRuolp0rRniLv4Z8CVyG
	4bAVDpQI1MvZ/Cl+PTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocuE-00000004gVr-1hVO;
	Tue, 28 Jul 2026 08:11:18 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocuB-00000004gTA-30VB
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 08:11:17 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 66S8B5UF069310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 16:11:05 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jul
 2026 16:11:05 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 5/7] lib: utils/hsm: wake sleeping Andes harts with an IPI
Date: Tue, 28 Jul 2026 16:10:39 +0800
Message-ID: <20260728081041.2724668-6-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728081041.2724668-1-ben717@andestech.com>
References: <20260728081041.2724668-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 66S8B5UF069310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_011116_107116_99BE63A4 
X-CRM114-Status: GOOD (  14.38  )
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

An IPI wakes a hart from light sleep and, once MSIP is kept as an SMU
wakeup event, from deep sleep too. Drop the WAKEUP_CMD path and the boot
state, hart type and sleep type conditions that selected it.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h |  1 +
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c         | 21 +++++---------------
 lib/utils/suspend/fdt_suspend_andes_atcsmu.c |  8 +++-----
 3 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
index 5e71fab7c69e..20e6cea09379 100644
--- a/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
+++ b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
@@ -36,6 +36,7 @@
 #define PCS_WAKEUP_RTC_ALARM_MASK	BIT(2)
 #define PCS_WAKEUP_UART2_MASK		BIT(9)
 #define PCS_WAKEUP_MSIP_MASK		BIT(29)
+#define PCS_WAKEUP_MEIP_MASK		BIT(31)
 
 #define PCS0_CTL_OFFSET			0x94
 #define PCSm_CTL_OFFSET(i)		((i + 3) * 0x20 + PCS0_CTL_OFFSET)
diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
index ae1d88892f14..dfbb425cd2ad 100644
--- a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -116,20 +116,8 @@ bool atcsmu_pcs_is_sleep(u32 hartid, bool deep_sleep)
 static int ae350_hart_start(u32 hartid, ulong saddr)
 {
 	u32 hartindex = sbi_hartid_to_hartindex(hartid);
-	u32 sleep_type = atcsmu_get_sleep_type(hartid);
 
-	/*
-	 * Don't send wakeup command when:
-	 * 1) boot time
-	 * 2) the target hart is non-sleepable 25-series hart0
-	 * 3) light sleep
-	 */
-	if (!sbi_init_count(hartindex) || (is_andes(25) && hartid == 0) ||
-	    sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP)
-		return sbi_ipi_raw_send(hartindex, false);
-
-	atcsmu_set_command(WAKEUP_CMD, hartid);
-	return 0;
+	return sbi_ipi_raw_send(hartindex, false);
 }
 
 static int ae350_hart_stop(void)
@@ -152,12 +140,13 @@ static int ae350_hart_stop(void)
 	/* Prevent the core leaving the WFI mode unexpectedly */
 	csr_write(CSR_MIE, 0);
 
+	atcsmu_set_wakeup_events(PCS_WAKEUP_MSIP_MASK | PCS_WAKEUP_MEIP_MASK, hartid);
 	if (sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP) {
-		csr_write(CSR_MIE, MIP_MSIP);
-		atcsmu_set_wakeup_events(PCS_WAKEUP_MSIP_MASK, hartid);
+		/* Clock-gated only: needs MSI or MEI set to resume past the WFI */
+		csr_set(CSR_MIE, MIP_MSIP | MIP_MEIP);
 		atcsmu_set_command(LIGHT_SLEEP_CMD, hartid);
 	} else if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) {
-		atcsmu_set_wakeup_events(0x0, hartid);
+		/* Power-gated: SMU wakes it via cold reset, interrupts not needed */
 		atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
 		rc = atcsmu_set_reset_vector((ulong)ae350_enable_coherency_warmboot, hartid);
 		if (rc)
diff --git a/lib/utils/suspend/fdt_suspend_andes_atcsmu.c b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
index 6722b70f0e6e..ced0eb41d5b7 100644
--- a/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
+++ b/lib/utils/suspend/fdt_suspend_andes_atcsmu.c
@@ -47,11 +47,7 @@ static int ae350_system_suspend(u32 sleep_type, unsigned long addr)
 	/* Prevent the core leaving the WFI mode unexpectedly */
 	csr_write(CSR_MIE, 0);
 
-	/*
-	 * Only allow the S-mode external interrupts (UART2 and RTC alarm) to
-	 * wake up the primary hart
-	 */
-	csr_set(CSR_SIE, MIP_SEIP);
+	/* SMU wakes the primary hart on RTC alarm / UART2 */
 	atcsmu_set_wakeup_events(PCS_WAKEUP_RTC_ALARM_MASK | PCS_WAKEUP_UART2_MASK, hartid);
 
 	if (sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP) {
@@ -59,6 +55,8 @@ static int ae350_system_suspend(u32 sleep_type, unsigned long addr)
 		if (rc)
 			return rc;
 
+		/* Clock-gated only: enable SEI to resume past the WFI */
+		csr_set(CSR_MIE, MIP_SEIP);
 		atcsmu_set_command(LIGHT_SLEEP_CMD, hartid);
 	} else if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) {
 		rc = check_secondary_harts_sleep(hartid, true);
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
