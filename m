Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20693CAC59A
	for <opensbi@archiver.kernel.org>; Thu, 18 Sep 2025 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5WfQ57nJETlL7KYV3eZQHynE1Xt7Mmd96+8N21LXOQ=; b=LSaX4wLcRxvlRx
	TZpXrwnrdY8Fa/8h10e0OK6CfZN6zyXr4MIe7lXCNmPSm5jlwkp/p+RHiNG+OXQX2YsEcmAoW79gN
	6TabWVEOiw6xc6DWEZc0pSUn8D/BYbSFgkJQGaTMAbF3JLuK0iaEtxWy1vdia8cthc4qbrDQAK5yj
	5v94FEc1D/dXliEUj29PrQwBB/GjFONo0UhUqZHfjp/p3Z7yFFaexlqU8sQcYt02VHsLa53S0HqRX
	8RhE+5kYJNxfQ2J6dQFgnBAUsN6iNAT0pJ+tnpBYCaM0IBj7MV83eSQp2zCAzv4jjjZgUG/lmuau/
	Mnr+1RTd2WQfYwDoTHoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAcI-0000000GoSQ-1QHi;
	Thu, 18 Sep 2025 09:07:50 +0000
Received: from m.syntacore.com ([178.249.69.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAcG-0000000GoQP-1HyX
	for opensbi@lists.infradead.org;
	Thu, 18 Sep 2025 09:07:49 +0000
Received: from MRN-SC-KSMG-01.corp.syntacore.com (localhost [127.0.0.1])
	by m.syntacore.com (Postfix) with ESMTP id AB9E91A0007
	for <opensbi@lists.infradead.org>; Thu, 18 Sep 2025 09:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.syntacore.com AB9E91A0007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=m;
	t=1758186466; bh=UrxkFRQ1/Oz+KFkQS2RJx5GK1p6R4PdQkecKjv1VZ8M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ZJ9TeayBDoEuovSP99WXrPIrJtwx0vYy5+iYsQIlR7wt8NG/jbxrslqjt66NlNwMo
	 yfTJWd6hRUJuWcYGZ2z0iCM1R2uZ5rXkA3q1LNyhgeLbRIPGbZ2zD45yBkERJe2qAY
	 AqVMmmcBsz3brea9dfheWm+O5ABVilPCY6t9fPGlWYEUU0TuzxBBRB6DT9JJayI2rU
	 M8WSkwVo4KHRhtlhiRX9r5aQ3pLTy2QRwPOJaXZi0e88er0S3HeCp/sIkwJNmKquCm
	 F3nXt63P3tgc+SlrXn/zzITZEYim8sv56IUbIBxw4l/bzcwsegbN9EpzDTpPEH71c4
	 b4zN0KGrV5UWw==
Received: from S-SC-EXCH-01.corp.syntacore.com (exchange.syntacore.com [10.76.202.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by m.syntacore.com (Postfix) with ESMTPS
	for <opensbi@lists.infradead.org>; Thu, 18 Sep 2025 09:07:46 +0000 (UTC)
Received: from alex-HP-ProBook-440-G7.corp.yadro.com (10.178.116.193) by
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 12:06:55 +0300
From: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
To: <opensbi@lists.infradead.org>
CC: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
Subject: [PATCH 3/3] lib: sbi: sbi_pmu: added checks for ctr_idx in match
Date: Thu, 18 Sep 2025 12:07:06 +0300
Message-ID: <20250918090706.2217603-4-alexander.chuprunov@syntacore.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918090706.2217603-1-alexander.chuprunov@syntacore.com>
References: <20250918090706.2217603-1-alexander.chuprunov@syntacore.com>
MIME-Version: 1.0
X-Originating-IP: [10.178.116.193]
X-ClientProxiedBy: S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) To
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20)
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/09/18 08:29:00 #27829917
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_020748_504856_E046CB68 
X-CRM114-Status: GOOD (  15.18  )
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

Previously, in sbi_pmu_ctr_cfg_match() function, ctr_idx was used immediately
after pmu_ctr_find_fw() or pmu_ctr_find_hw() calls. In first case, array index
was (ctr_idx - num_hw_ctrs), in second - ctr_idx. But pmu_ctr_find_fw() and
pmu_ctr_find_hw() functions can return negative value, in which case writing
in arrays with such indexes would corrupt sbi_pmu_hart_state structure.
To avoid this situation, direct ctr_idx value check added.

Signed-off-by: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
---
 lib/sbi/sbi_pmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 5d98a532..f76236e1 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -877,13 +877,14 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 		/* Any firmware counter can be used track any firmware event */
 		ctr_idx = pmu_ctr_find_fw(phs, cidx_base, cidx_mask,
 					  event_code, event_data);
-		if (event_code == SBI_PMU_FW_PLATFORM)
+		if ((event_code == SBI_PMU_FW_PLATFORM) && (ctr_idx >= num_hw_ctrs))
 			phs->fw_counters_data[ctr_idx - num_hw_ctrs] =
 								event_data;
 	} else {
 		ctr_idx = pmu_ctr_find_hw(phs, cidx_base, cidx_mask, flags,
 					  event_idx, event_data);
-		phs->hw_counters_data[ctr_idx] = event_data;
+		if (ctr_idx >= 0)
+			phs->hw_counters_data[ctr_idx] = event_data;
 	}
 
 	if (ctr_idx < 0)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
