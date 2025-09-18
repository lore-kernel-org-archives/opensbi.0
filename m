Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4CCAC5A9
	for <opensbi@archiver.kernel.org>; Thu, 18 Sep 2025 09:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hRYYKQ6TWGzmTrNv2ES9BaNTEv/dKLjWP3NIOQdi1qY=; b=CV0JIHM6LRWXmP
	EqnKC6fEwG+7+AbkKVKJDBDg0kW1zjQt+XtnNl9mHjWNWOpFaT3jLJ3LsiibIc1s5FlfGbMxoLXNx
	To5+7Wv9nii1TGX8HVbutzeIrPwGIJ63AhBL4LSJx4skIX16lsEpIUAP8GHllYqj9guwHnBPiVGaP
	M/Wt0rUpGg2rVHPllq9q3k6Jvvlny0eZsuHUjYjwoOBTzEMtmuF+kejHGsfftnlaulveGe4PD0uMx
	/SoGWdas1aHOQ6qJjTVngccyvJqCNni893BkZDbVIfxBuThUoKBMlKaYM6OIwauwKPxAhCa4dGdoF
	h2mpR0b3k6hqS7UVDG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAcG-0000000GoRA-21FZ;
	Thu, 18 Sep 2025 09:07:48 +0000
Received: from m.syntacore.com ([178.249.69.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAcD-0000000GoQ6-3wgz
	for opensbi@lists.infradead.org;
	Thu, 18 Sep 2025 09:07:47 +0000
Received: from MRN-SC-KSMG-01.corp.syntacore.com (localhost [127.0.0.1])
	by m.syntacore.com (Postfix) with ESMTP id EE8A51A0003
	for <opensbi@lists.infradead.org>; Thu, 18 Sep 2025 09:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.syntacore.com EE8A51A0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=m;
	t=1758186461; bh=qvs5sv+geosNX0BZvskbI5qHhAHmSTNUieYJ2XBthWs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=R7KpGnGwTfK2/Oj+CrkZgzEW5L722WmC2k4yxM0SDfVjZGoWauKOKHdNEabZWu4rR
	 fSU7bGKs37VhYo2TcYpk2fOo4Z4eOceUGfIwB+vapfnuSzoQIyY7A7W2Zj4OIRyeKS
	 ytvZSItNryYTzMzk8TMPXPqlFBpFgVRA8JCA/1Qu/PBtVpJMJ2R32+baCdf6MlwWuI
	 tcRH3aB5lzhobgcLE1tY92QAn3KLEU4o+7UXU997aZgLKIQD9XPX10+nHtboIvAuC1
	 U1vpaRylB1fGLQBTA+ztBNKOyaykEU+v4fa6hz1RFUZgs581KCA7W1vGOzJ0WMiH3U
	 78iIGs47gOWLQ==
Received: from S-SC-EXCH-01.corp.syntacore.com (mail.syntacore.com [10.76.202.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by m.syntacore.com (Postfix) with ESMTPS
	for <opensbi@lists.infradead.org>; Thu, 18 Sep 2025 09:07:41 +0000 (UTC)
Received: from alex-HP-ProBook-440-G7.corp.yadro.com (10.178.116.193) by
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 12:06:50 +0300
From: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
To: <opensbi@lists.infradead.org>
CC: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
Subject: [PATCH 0/3] Restore hw counters after deep hart suspend
Date: Thu, 18 Sep 2025 12:07:03 +0300
Message-ID: <20250918090706.2217603-1-alexander.chuprunov@syntacore.com>
X-Mailer: git-send-email 2.43.0
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
X-CRM114-CacheID: sfid-20250918_020746_138654_DFCFB500 
X-CRM114-Status: UNSURE (   8.25  )
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

- Restore hw counters after deep hart suspend
- Minor alignment fix
- Additional sanity check

Alexander Chuprunov (3):
  lib: sbi: sbi_pmu: fixed hw counters start for hart suspend
  lib: sbi: sbi_pmu: fixed alignment
  lib: sbi: sbi_pmu: added checks for ctr_idx in match function

 lib/sbi/sbi_pmu.c | 135 +++++++++++++++++++++++++---------------------
 1 file changed, 75 insertions(+), 60 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
