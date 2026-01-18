Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D60CA5FE1
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09Ofmp6mSk0zJInOu8Xv7fn4qv6r3MHfuB/vjEiOMmA=; b=NL8scCGdoP+xLj
	kv/LGIXKSQORXmsc9nnPm/iF6fGlYeFXbPtXEd1+Nr5AOwLlZ+1BrnZxsumaAjvTzEvQzgv5txJyL
	/5f4JKbCYbjF/Xv+9ukQOGL01s7HnYKJ8V4xXfBzzryHAC/SAKtzgsBl5+7UlpQNTEmf23KPM2gE8
	8cPMVsXetHoKcW+EOoCpkFMmLYxEGrrxAbHvrj6q8id7j/JGXgvwDuNXLVAR3CXNR6FffZFT9Q/aE
	UtJiXsvtL4Pp8YO1Rlx9beIz6b3SeQuOVqhzd0/k/9xg2S6NsU7lShzln7qRqlATkbmxtOr9ph3/G
	/popAoaln7ZmL0TXg++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6z-0000000HT2c-08WN;
	Sun, 18 Jan 2026 11:38:29 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6p-0000000HSrn-3eqB
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736299; x=1800272299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tM/vkWzRe4qfON9ABKW9x60/j4KQJCKtBuvE++KQnCA=;
  b=bfVvuloxP4paqWRiiVaEpEm6edvNrOIZYqCw1fNPHG+geVzc2rsn6pnD
   5rcd3Spl7e0PJVEgxVIYkit0bbLQxwDMp0ZkyGx/TQ4j103rSv5erv/eo
   Wh3a17iulFQezGHTsd1fcHUk0UqNrMeW4B0rjo6/HG93f0dxpFHpa6KIn
   uv/EaiuTSK7b9pfKAhlDNxm3TQuU2p+PzDshT/1/iMWJNdCTU/Zi4lI82
   Y7NZpbwB55p5VndVHy4t6DfBylc5VTujoWvFE7R6Z8g8pnTGCZ13QUAb3
   lrXPt5UbNkF24nOojkItFQjbOFg7eavCe8JnsWeQAl5H++S2she4UXwaM
   A==;
X-CSE-ConnectionGUID: JRf4+NX5R0SI0/i0OhA2XQ==
X-CSE-MsgGUID: vE5eZyCmSe+hfqVy8S65Jg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:17 +0200
X-CSE-ConnectionGUID: tYQS8QhNTReHQwE4L3hF6Q==
X-CSE-MsgGUID: oWA1buYISFis1DsfnyaWaw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 18 Jan 2026 13:40:10 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:17 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 12/20] platform: generic: mips eyeq7h: deassert
 accelerator cluster resets
Date: Sun, 18 Jan 2026 13:37:54 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-12-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033820_243737_15242CFF 
X-CRM114-Status: UNSURE (   8.79  )
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

On the EyeQ7H board, there's cluster level resets found in the
accelerator OLBs. These resets should be deasserted once on boot
and never used after

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/eyeq7h.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index fb4282f4a9b85b58bc0b8921caf47425ebcf059f..76ce0c0ab07a83de22bc7834d4f992a1a1f78b9b 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -33,6 +33,10 @@
 #define MIPS_CTL0_SW_RESET_N	BIT(17)
 #define MIPS_CTL0_CORE_CLK_STS(n)	BIT(28 + (n)) // n = 0..3
 
+#define OLB_ACC0		0x45000000
+#define OLB_ACC1		0x65000000
+#define OLB_XNN0		0x43600000
+#define OLB_XNN1		0x63600000
 #define OLB_WEST		0x48600000
 #define OLB_WEST_TSTCSR		0x60
 #define TSTCSR_PALLADIUM	BIT(0)
@@ -138,15 +142,27 @@ static void eyeq7h_acc_clusters_do_fixup(struct fdt_general_fixup *f, void *fdt)
 		    YN[acc01_present & BIT(0)],
 		    YN[(acc01_present >> 1) & BIT(0)]);
 
+	/* if accelerators present, correspondend OLBS present too */
+	/* deassert cluster resets for accelerators and XNN */
 	if (!(acc01_present & BIT(0))) {
 		sbi_dprintf("Disable ACC0\n");
 		fdt_disable_by_compat(fdt, "mobileye,eyeq7h-acc0-olb");
 		fdt_disable_by_compat(fdt, "mobileye,eyeq7h-xnn0-olb");
+	} else {
+		writel(0xff, (void*)OLB_ACC0 + 0x60);
+		writel(0xff, (void*)OLB_ACC0 + 0x64);
+		writel(0x7f, (void*)OLB_XNN0 + 0x60);
+		writel(0x7f, (void*)OLB_XNN0 + 0x64);
 	}
 	if (!(acc01_present & BIT(1))) {
 		sbi_dprintf("Disable ACC1\n");
 		fdt_disable_by_compat(fdt, "mobileye,eyeq7h-acc1-olb");
 		fdt_disable_by_compat(fdt, "mobileye,eyeq7h-xnn1-olb");
+	} else {
+		writel(0xff, (void*)OLB_ACC1 + 0x60);
+		writel(0xff, (void*)OLB_ACC1 + 0x64);
+		writel(0x7f, (void*)OLB_XNN1 + 0x60);
+		writel(0x7f, (void*)OLB_XNN1 + 0x64);
 	}
 }
 

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
