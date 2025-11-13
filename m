Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF9CCD4F50
	for <opensbi@archiver.kernel.org>; Thu, 13 Nov 2025 08:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GunPyHa8D8oHpzpDQk3syeMxH9ArEpUo6R15HBe5HIU=; b=RhoYzGjtVlM/HA
	zjAzKUS0+blKK4Xuy0shSM/Tq/KpmjhIHtwy3JVFWHhssaPxn/fS04j+bthGBBpgba9ucxmGUJEeR
	HQQi2oZL1bTNI/f2931lJc8bXS9oPaVooEeTsRUaxm+3LsnUIN2NeERyBjVb0X0NIgcYHa9nCgSbT
	ks93UBWW5yoXOGeJfR3uPp86YxSX8Ct2dxfVeRGcdn0oFmxoitNhkUU95peVQ4utp0b1dAVO482JR
	hHOINCI2now1POFwA1uAsqywNlKME8577t1/8rzhvCbXnOkUqnwERcqRU2p9gwAKaRdUJEYROPXZy
	Wj6LY0m886tfr9hUrowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSVp-0000000A5F1-363d;
	Thu, 13 Nov 2025 08:17:01 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSVk-0000000A5Ea-0aiU
	for opensbi@lists.infradead.org;
	Thu, 13 Nov 2025 08:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1763021816; x=1794557816;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LjEMpp0YeMCZqbJ+tbZJtY7t5Bli8o9hQG53t74JBjg=;
  b=QgqOKTWjPC+Vhnll+GmnZCdyv/bqRZNcn3v7u2m3hj3sokvmfr/X2OrM
   PN5ANBTcaxvNW96XpVIAa6pmQS6tE4dS3oUoWpG4KQ8Mq9ozX0yfqn5Hn
   K1ZfzRsxxDsBVqhjcMEg7qs3cd2mb4dFt/oC2wWfEwmbVIqor1k5R4D0j
   HT0Id1GuEsQ12bBqAXl8Z0w5iprMdFj/fgYtOIhm8Um4MM+P7/9gfyEj7
   LZa+FrNEHpxIlxoRcOYPakAXYpMD5ig/AZTGBMOc3/Jg42HzxdcWK3Y1L
   IcXGP4IF1ZQxjEksqjzbWxHbcxLRBkYGRHzCDAkhxFjhmXYDvheFzFF1b
   g==;
X-CSE-ConnectionGUID: 2b+rZYkFRX+924nwaHjUnA==
X-CSE-MsgGUID: OjRAGk2SQPencDrPdOtZJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 10:16:52 +0200
X-CSE-ConnectionGUID: yDFu8sSgQ62mR/IfK2M4tg==
X-CSE-MsgGUID: PjkJm6GkQFCidJ2oGOufXQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 13 Nov 2025 10:17:19 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 13 Nov 2025 10:16:50 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: vladimir.kondratiev@mobileye.com,
	opensbi@lists.infradead.org
Subject: [PATCH] Makefile: define C language standard to "gnu11"
Date: Thu, 13 Nov 2025 10:16:48 +0200
Message-ID: <20251113081648.2708990-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_001656_645695_411EEAD3 
X-CRM114-Status: UNSURE (   8.63  )
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

C language standard was not specified, implying default that is
depending on the compiler version. Force "gnu11", same as for the
Linux kernel

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 398eabe8c964..9aa7f060f51c 100644
--- a/Makefile
+++ b/Makefile
@@ -374,6 +374,7 @@ GENFLAGS	+=	$(firmware-genflags-y)
 CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
 CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
 CFLAGS		+=	-fno-asynchronous-unwind-tables -fno-unwind-tables
+CFLAGS		+=	-std=gnu11
 CFLAGS		+=	$(REPRODUCIBLE_FLAGS)
 # Optionally supported flags
 ifeq ($(CC_SUPPORT_VECTOR),y)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
