Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B32C87FD1
	for <opensbi@archiver.kernel.org>; Wed,  6 Aug 2025 01:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	References:In-Reply-To:Date:Message-Id:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S1vD687p/Gd+dMCFziHSmcEbx8gOHM59sT11jUBdFcw=; b=LEdT6wM8MrS6RytqBgXwgCggBU
	Qg8PezQ3UXmYTDSPgSHNFktUZ9NrBks30Byh2EYJDKmtSlKhr1dtZpms7IZQldaFEUa25SYtxkDVe
	LQJKn1f9lI+g8gcngw8d5zN+Ddorabpw5H3UxKna2hytvu/KhutwWhySpja8yhfBwF9HIXejKZ6PW
	0wVQLtsU4pbz8ae8ApdX/NwMcGtrEq1d3O68N/lTgZut8fNp1X2k9aucOH5Y2x0E/5DLzo9AkyUX+
	Q1hcAI4mG5xvgwtQQE84MHUCAn40bq8oNQVei9hR1/UR1e7y7EBtcQcG6qHLDNxFlk9vhEu+ZwM0t
	QD8CeJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSeV-0000000E6Cu-3Pqo;
	Wed, 06 Aug 2025 01:09:11 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujScF-0000000E66G-2FTp
	for opensbi@lists.infradead.org;
	Wed, 06 Aug 2025 01:06:52 +0000
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bxXF35w1lz5B13X
	for <opensbi@lists.infradead.org>; Wed, 06 Aug 2025 09:06:47 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 57616maD072614
	for <opensbi@lists.infradead.org>; Wed, 6 Aug 2025 09:06:48 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202508060106.57616maD072614@mse-db.zte.com.cn>
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl2.zte.com.cn with SMTP id 576139om006645
	for <opensbi@lists.infradead.org>; Wed, 6 Aug 2025 09:04:35 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app08[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 6 Aug 2025 09:04:36 +0800 (CST)
Date: Wed, 6 Aug 2025 09:04:36 +0800 (CST)
X-Zmail-TransId: 2b006892aa247ea-9c889
X-Mailer: Zmail v1.0
In-Reply-To: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn>
References: 20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <opensbi@lists.infradead.org>
Cc: <wu.fei9@sanechips.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDMvM10gaW5jbHVkZTogc2JpOiBMaWZ0IHRoZSBtYXhpbXVtIGhhcnRzIHRvIDEwMjQ=?=
X-MAIL: mse-db.zte.com.cn 57616maD072614
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.131 unknown Wed, 06 Aug 2025 09:06:47 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6892AAA7.002/4bxXF35w1lz5B13X
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_180651_756948_1BB44125 
X-CRM114-Status: UNSURE (   7.78  )
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

It is expected to have riscv server boards with many cores very soon.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 include/sbi/sbi_hartmask.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
index 200ab6e..2f94f39 100644
--- a/include/sbi/sbi_hartmask.h
+++ b/include/sbi/sbi_hartmask.h
@@ -20,7 +20,7 @@
  * also represents the maximum number of HART ids generic OpenSBI
  * can handle.
  */
-#define SBI_HARTMASK_MAX_BITS          128
+#define SBI_HARTMASK_MAX_BITS          1024

 /** Representation of hartmask */
 struct sbi_hartmask {
--
2.43.0

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
