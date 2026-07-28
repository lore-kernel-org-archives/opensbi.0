Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D516FC54F53
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMmeCdAWwO+GL4D//YKPbai5qI9Hbgg4OM6AMfo9S4M=; b=v9liBffPjxTpNl
	oLf1xzOwlPov6V3xbkb4SxE/6vr9qa+BF89ffd+kHhDRmC7OMcy+EA2v3QCuun+sXzDaEdgPgYi1M
	3EqCErDaF6EeV+p0CSHQH+M51yrXXtCOf4bNFKPYn/K+D0Omr+OTX+U6E6c0Vif3pfltau25/hO0m
	YAiTwGcvnH54WUX1A+OXRELz3p5N2yiv0CPw44fCy5mACq8ulPeVVCbk3NkR7FSo0brpD6fZfhvmA
	4qlKXV1N4NaLPI9pypT2bdCHgp9i5EYFKaA0DwXQYsbVeKFeCIkBUU8wAKgrWYKkiaLKuuVpVsdMm
	4FC54CvHOWn2VaBCwbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woctz-00000004gPG-13W7;
	Tue, 28 Jul 2026 08:11:03 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woctw-00000004gN6-2odS
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 08:11:02 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 66S8AklR069150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 16:10:46 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jul
 2026 16:10:46 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 3/7] platform: generic/andes: pair non-retentive CSR save/restore with a flag
Date: Tue, 28 Jul 2026 16:10:37 +0800
Message-ID: <20260728081041.2724668-4-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728081041.2724668-1-ben717@andestech.com>
References: <20260728081041.2724668-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 66S8AklR069150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_011101_074891_CB48F571 
X-CRM114-Status: GOOD (  13.46  )
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

The restore was gated on sbi_init_count() and the current sleep type,
which is only a proxy for "did this hart actually save its CSRs". Track
it explicitly instead, so restore is self-guarding and the call site
needs no conditions.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 platform/generic/andes/ae350.c         | 18 ++++++++++++------
 platform/generic/include/andes/andes.h |  3 +++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 4cf7e26def54..4a053f434272 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -34,6 +34,8 @@ void ae350_non_ret_save(struct sbi_scratch *scratch)
 	andes_hdata->pmacfg2 = csr_read_num(CSR_PMACFG0 + 2);
 	for (int i = 0; i < 16; i++)
 		andes_hdata->pmaaddrX[i] = csr_read_num(CSR_PMAADDR0 + i);
+
+	andes_hdata->saved = true;
 }
 
 void ae350_non_ret_restore(struct sbi_scratch *scratch)
@@ -41,6 +43,9 @@ void ae350_non_ret_restore(struct sbi_scratch *scratch)
 	struct andes_hart_data *andes_hdata = sbi_scratch_offset_ptr(scratch,
 								     andes_hart_data_offset);
 
+	if (!andes_hdata->saved)
+		return;
+
 	csr_write(CSR_MCACHE_CTL, andes_hdata->mcache_ctl);
 	csr_write(CSR_MMISC_CTL, andes_hdata->mmisc_ctl);
 	csr_write(CSR_MPFT_CTL, andes_hdata->mpft_ctl);
@@ -52,6 +57,8 @@ void ae350_non_ret_restore(struct sbi_scratch *scratch)
 	csr_write_num(CSR_PMACFG0 + 2, andes_hdata->pmacfg2);
 	for (int i = 0; i < 16; i++)
 		csr_write_num(CSR_PMAADDR0 + i, andes_hdata->pmaaddrX[i]);
+
+	andes_hdata->saved = false;
 }
 
 void ae350_enable_coherency_warmboot(void)
@@ -62,18 +69,17 @@ void ae350_enable_coherency_warmboot(void)
 
 static int ae350_early_init(bool cold_boot)
 {
-	u32 hartid = current_hartid();
-	u32 sleep_type = atcsmu_get_sleep_type(hartid);
-
 	if (cold_boot) {
 		andes_hart_data_offset = sbi_scratch_alloc_offset(sizeof(struct andes_hart_data));
 		if (!andes_hart_data_offset)
 			return SBI_ENOMEM;
 	}
 
-	/* Don't restore Andes CSRs during boot or wake up from light sleep */
-	if (sbi_init_count(current_hartindex()) && sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND)
-		ae350_non_ret_restore(sbi_scratch_thishart_ptr());
+	/*
+	 * This is a no-op unless this hart actually saved them, so it is safe
+	 * to call on every path.
+	 */
+	ae350_non_ret_restore(sbi_scratch_thishart_ptr());
 
 	return generic_early_init(cold_boot);
 }
diff --git a/platform/generic/include/andes/andes.h b/platform/generic/include/andes/andes.h
index dd2451718d00..dae112ce741f 100644
--- a/platform/generic/include/andes/andes.h
+++ b/platform/generic/include/andes/andes.h
@@ -96,6 +96,9 @@ struct andes_hart_data {
 	unsigned long pmacfg0;
 	unsigned long pmacfg2;
 	unsigned long pmaaddrX[16];
+
+	/* Set when the CSRs above hold a saved copy awaiting restore */
+	bool saved;
 };
 
 void ae350_non_ret_save(struct sbi_scratch *scratch);
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
