Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C2BCF6BE2
	for <opensbi@archiver.kernel.org>; Wed,  7 Jan 2026 03:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ugMtbFSBamIgFxI3XUuHDjr0vTCiWgIjkUEp8rSIUcY=; b=ns8G8Hdi1Lln+W
	NlA4LB+tkxhvRC/i3wneSjD5ViI6jvxy15hd7SQBmgOB+NpIJIhDCkUB++o5yxUtFzpJXbR1V0fmu
	q7sP1dhN2S2He2e65Khatp2nyffQA3fWKt7unFIN6dMnMdr3FCuc5hQAXDZ0U9y7SpS18j+sBXrij
	hDCivg1lGDcWq/CG4gce4/H7+d+0ViWLWsNfoGGjEhHcGojcKjUnipziASldJll6pXIQR0vaU+ele
	bEggYzN0KZAhIJzGLMSP62nj1bJZUifPfGT9JEp9CpehNnSJlvi0H/BFYb0uncxdsLF97V/Kmtxe6
	HdpxdlPfkwNbOWzSFEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdKBn-0000000E7eP-3dg1;
	Wed, 07 Jan 2026 03:26:27 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdKBj-0000000E7cx-1U2P
	for opensbi@lists.infradead.org;
	Wed, 07 Jan 2026 03:26:26 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 6073Q8W8028763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Wed, 7 Jan 2026 11:26:08 +0800 (+08)
	(envelope-from ycliang@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Jan
 2026 11:26:08 +0800
From: Leo Yu-Chi Liang <ycliang@andestech.com>
To: <opensbi@lists.infradead.org>
CC: <ycliang@andestech.com>
Subject: [PATCH 1/1] include: sbi_scratch: fix typo sbi_scratch -> HART id
Date: Wed, 7 Jan 2026 11:26:02 +0800
Message-ID: <20260107032602.1143819-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 6073Q8W8028763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_192623_745444_D036CB72 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

Fix "sbi_scratch" to "HART id" to better reflect its purpose.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 include/sbi/sbi_scratch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index f1b4155d..58d54628 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -186,7 +186,7 @@ extern u32 sbi_scratch_hart_count;
 /** HART index to HART id table */
 extern u32 hartindex_to_hartid_table[];
 
-/** Get sbi_scratch from HART index */
+/** Get HART id from HART index */
 #define sbi_hartindex_to_hartid(__hartindex)		\
 ({							\
 	((__hartindex) < SBI_HARTMASK_MAX_BITS) ?	\
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
