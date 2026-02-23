Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA60EA4FD0
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+VXJTC/mrtZaXC2Nx+UYUDwiJcpSYkKVekb7FxaQHA=; b=KKtTWXkYBz79q5
	qnb8qkhv+EUBpNFLBRo3UY7RKb2lb45a1RBxpnLXVPUXvpt2ObM52MzmW7+zuESIRma9V6FvMOTIe
	OdIi7wBluVeIvzLm6HLeIy+qFgLwNJBjHUVyP/bw2qTyKJroKI9BnvnE2Rs5GK8wN1PvCunFUWq+n
	l2NXSPoohGvhP9FgBNiVjWAYyP1dUQEiU8gbOvJhazZULUK5vskIiMuyyQnnS4NKcLhrq/rpqupAm
	v9sfbylNgF/FYtjNNkiL3FKpsAoPa1R8syyiX3xnhY7WNzFM4Wr6ZMo1j6X/sE7aFJEQwuTbZcVn/
	w+TyKnrJxYXGhoBK17rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLj-00000000W6Z-35F7;
	Mon, 23 Feb 2026 14:55:51 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLf-00000000VVL-2xq7
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858547; x=1803394547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BN6BgzSCuBNNWvE4hM0coGNrfh4Tu3eN5AUUTypv9TM=;
  b=TSuOFbnUU1dj+H2zE5cs4gMna20LEZl1wuCLNJMut7v8XBJ3PDm7dhnd
   WnjowNq9Yst6X0Beir9kblItypmrt0Cm8pc3eBhiSS3vf8Axr/32Q2AiN
   wv4cVweXry5JFNCF8PPE8IPSmeRrrcZ0cdRNSbKcsAzH6ICbKjtig05A0
   J+XJxDEttBpDr3JKiJtVwZ7c69OZTjEI6xKm8di6f8vJ9gegyP7VPB4uI
   5ALrXxR5+IIFP0SRj0SF+iLf/rNG2Rwu2UnHhTgW4FOxYIhqPVOmpSIVs
   4hcBPUDBRrYbm/iF0gTIfggGbz58mlT9U3CM+ZCeNgXN6wlHUKeGnsxD9
   w==;
X-CSE-ConnectionGUID: ZuIz/U3nQlaiL3pKRXRY+A==
X-CSE-MsgGUID: SdRnOp2jSqaq2KWD1bvanQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:46 +0200
X-CSE-ConnectionGUID: +D01BNMBQJK7kzrPrf7ugA==
X-CSE-MsgGUID: kRRh6/CVTxe9bk+lNaLc7A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:28 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:45 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 23/23] platform: generic: eyeq7h: enable ECC on L1 cache
Date: Mon, 23 Feb 2026 16:55:02 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-23-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065548_042352_D673BC93 
X-CRM114-Status: UNSURE (   7.25  )
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

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/eyeq7h.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index f09ec5f0fae4abec29ec9c15080411b0da7bbbde..242cbb3ce32706cf4d894649b9cf227932658936 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -436,6 +436,8 @@ static int eyeq7h_nascent_init(void)
 	/* Per hart set up */
 	/* Enable AMO and RDTIME illegal instruction exceptions. */
 	csr_set(CSR_MIPSCONFIG6, (1<<2)|(1<<1));
+	/* enable ECC for L1 I/D and FTLB */
+	csr_set(CSR_MIPSERRCTL, MIPSERRCTL_PE);
 
 	return 0;
 }

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
