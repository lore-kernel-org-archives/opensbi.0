Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E064CAC5A8
	for <opensbi@archiver.kernel.org>; Thu, 18 Sep 2025 09:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0R9O0jEU2fMaLKKBwGU6Gr6xSjp3NgApqO/yB7D4SSE=; b=3+/pYGrV9gov5m
	okcjiPStxtLogDKo+DohaAmaky0APMoxvhBqrwV9RJ3uHmhxTRGUWVHTib6pVqCRp8lhXH1JGpLiz
	lTtWIvIYzA6lCPHKowYX2w3eBgxgsNpDTGdyzVaRb8K9f42k9131TrkBdoZO4/DwCp1toQC05NbfL
	PsDNBFygVSoX3dR0Jbg2MtgyPTDCOqZ/zZVlml6fPd43VoVDX/lIrZqRE28V/aIOi5b7y9SAANjUs
	YXcZAugPFk+72AnlW/TIKdhIHtZfMo7EoE7F7EPnrQwUqi3QOmTJfCs+7cADOXMdMxiL2CjUdFY01
	H/oeEFOIMCBb9+pRlrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAcI-0000000GoS9-0Hr2;
	Thu, 18 Sep 2025 09:07:50 +0000
Received: from m.syntacore.com ([178.249.69.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAcF-0000000GoQB-1bWG
	for opensbi@lists.infradead.org;
	Thu, 18 Sep 2025 09:07:49 +0000
Received: from MRN-SC-KSMG-01.corp.syntacore.com (localhost [127.0.0.1])
	by m.syntacore.com (Postfix) with ESMTP id BC1A11A0006
	for <opensbi@lists.infradead.org>; Thu, 18 Sep 2025 09:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.syntacore.com BC1A11A0006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=m;
	t=1758186465; bh=TRt+yZN60/YlveTxFJrxnvztM6ayPNpI37y9owDq0QU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=qgrbjsHgzIe5w0EhCcoghCgzP7zC+VKmbS980EU9q/y5Am4wfRuBvtU2UrpP/OR0q
	 xAxXOlHIR4V2fMbYgE2g3pi8XINmzB37YHsw4I5Sl5t5L0yNEdkQhPoWkJvjxXtm+x
	 AZ06YmhUr8hGERwrAm0u0TsCSkkQPXO+6ZSoelAyDcIRh09vQTVhFBviNSDfYAiMTs
	 VnjL13cScodHjXq30hVmoUzRU1ZrTmFRD9ufFbXF6CTFrBO6YdC+p4OitgdwTqT+sT
	 FYpLhJOOxJKgCI5FATedKFe+Fr6J9K7VynerCTIA7HTS+6DVuR6rjjSyMyr0VB6EgP
	 IbjX4sl6jwLbQ==
Received: from S-SC-EXCH-01.corp.syntacore.com (mail.syntacore.com [10.76.202.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by m.syntacore.com (Postfix) with ESMTPS
	for <opensbi@lists.infradead.org>; Thu, 18 Sep 2025 09:07:45 +0000 (UTC)
Received: from alex-HP-ProBook-440-G7.corp.yadro.com (10.178.116.193) by
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 12:06:54 +0300
From: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
To: <opensbi@lists.infradead.org>
CC: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
Subject: [PATCH 2/3] lib: sbi: sbi_pmu: fixed alignment
Date: Thu, 18 Sep 2025 12:07:05 +0300
Message-ID: <20250918090706.2217603-3-alexander.chuprunov@syntacore.com>
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
X-CRM114-CacheID: sfid-20250918_020747_580404_F6984270 
X-CRM114-Status: GOOD (  12.74  )
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

Deleted spaces before brace in pmu_ctr_start_fw() for correct alignment.

Signed-off-by: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
---
 lib/sbi/sbi_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 0718b3ed..5d98a532 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -432,7 +432,7 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 		    !pmu_dev->fw_counter_write_value ||
 		    !pmu_dev->fw_counter_start) {
 			return SBI_EINVAL;
-		    }
+		}
 
 		if (ival_update)
 			pmu_dev->fw_counter_write_value(phs->hartid,
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
