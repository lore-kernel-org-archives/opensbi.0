Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467A1C55822
	for <opensbi@archiver.kernel.org>; Wed,  5 Aug 2026 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/z0hnP4X43ruLTHAxhI3Ml5bGy2mqlkWbbHBtpzCMTI=; b=UapG4p6R0qTopr
	Va6+9oOCeSzyak0dECctaGtfOe3ksL8/56JVeOCRMJVgVVUFNB5qUEF5iXPvyfEr2KNCwdSTMrBwb
	Ys6+SYAUfPSVVtqy+gB+iFGsqQYEA0gDROKDdwlKOgPhGUk9MvZDKnGq8VfPXhrZKcrM2oqCL+BKc
	eGClMeO2tL9P/I+0Jdy+lA/Mkxl+jWNLq+1kMMntlKJIX5dzrEnhl3JYCnoNM48lSZnOoYJ3BKsMC
	TsvDMA0IfPuddDh3rSf4JE6j8lOkvolsrc2SI2HljYh3ZfWoQa5a6fZ/cP+bOwIYeHHLdqzVEKHRe
	K1eYB5rTqnf2bNYNvg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY1G-00000003dHd-2vpU;
	Wed, 05 Aug 2026 09:34:38 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY1E-00000003dGi-0pCE
	for opensbi@lists.infradead.org;
	Wed, 05 Aug 2026 09:34:37 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 6759YPRw073933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Wed, 5 Aug 2026 17:34:25 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Aug
 2026 17:34:25 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH] lib: sbi: respect scounteren when emulating timeh
Date: Wed, 5 Aug 2026 17:33:54 +0800
Message-ID: <20260805093354.1022980-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 6759YPRw073933
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_023436_584746_4D2C52DC 
X-CRM114-Status: UNSURE (   8.83  )
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

beef2f693785 ("lib: sbi: Respect scounteren when emulating the time
CSR") restored it for TIME only, so on RV32 supervisor software still
cannot restrict U-mode or VS-mode access to time: rdtime traps as
intended while rdtimeh keeps returning the upper half.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 lib/sbi/sbi_emulate_csr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
index c2253c82c527..4558abffb81a 100644
--- a/lib/sbi/sbi_emulate_csr.c
+++ b/lib/sbi/sbi_emulate_csr.c
@@ -90,7 +90,8 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 		*csr_val = csr_read(CSR_MCYCLEH);
 		break;
 	case CSR_TIMEH:
-		/* Refer comments on TIME CSR above. */
+		if (!hpm_allowed(csr_num - CSR_CYCLEH, prev_mode, virt))
+			return SBI_ENOTSUPP;
 		*csr_val = (virt) ? sbi_timer_virt_value() >> 32:
 				    sbi_timer_value() >> 32;
 		break;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
