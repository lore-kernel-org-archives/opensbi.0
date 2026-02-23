Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC688EA4FD0
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRDrDTkOhHXl5x0/cgD6vt2lWZ2WeiZ1YMrcrSEtJj0=; b=Yf8Nhc9rZHTXDB
	CoTO4qo+tgCp4deU9LPBJqs0haRRGm6PWwFnzVDz5Jbn5Dd6RqyTC0n8zY9UUNGqfTKTEv0RmDo87
	QJmDZqrStln7ikDIUPfZYN/8gadXPe0b0idMBaQ/TjeEhN2mZom4cIWwgygpS+ImIwqbZojLHx0Fc
	O+dDImi7bv8fz5fpgR407G9mkYtlE4CQkGdAeKEwFLr0jCAO0o7oZgIkm0J7dbvIxYwZavqBAcD/j
	xPTVYWkrGN5knqpUG+kVqPnfMGYhwL07Wa1zLybqRwIftzBhsiZzxtphJRthCk58SmoMOUVFXu6yS
	0vH/0TA0kdLo6Jqlua3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLX-00000000Vl3-34jC;
	Mon, 23 Feb 2026 14:55:39 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLV-00000000VVL-0Yqe
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858536; x=1803394536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UAM9bTe3F9GnMPeJzGCnun9mgjR3z/knvQljDsmklgU=;
  b=HJ//DvidIpFc5v1r7yoM07JQXW8jXNMK3nnD7O3I4C0rqFVdbf3auVq9
   U98CZkMrMcXBgOcaqE0qOmiybHL+C3RsqGbfhRl2GgH6Qed63huOFu22K
   JDyadO3KLpqtw61WxSZUFdLRKv1i1HVGjfKBsRHK+BQ+B5GkAO7NaMz9B
   B7VkIDlFqf+HVnDhU9G3wG4oEpmaVOPpyA00h6NAEJ+98EDTzMIiOX++1
   evRO3HZ5nmXYsLysxljoInGcFPWvHoylpBYAgAOJBDVWROPNn+TcaZJzo
   4oia4ScB9GF3UqWBG+ss74dU47e31f+34Skz7nkwsJPUad09Fdvgn80uH
   g==;
X-CSE-ConnectionGUID: ZuIz/U3nQlaiL3pKRXRY+A==
X-CSE-MsgGUID: cBS7dGUjS3WLgh+OwcSOcw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:36 +0200
X-CSE-ConnectionGUID: DANSjrhgRvCB+tknM+Dxnw==
X-CSE-MsgGUID: rA37Hml7TRCHKCDlGg0cRQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:18 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:35 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 13/23] platform: generic: mips eyeq7h: deassert
 accelerator cluster resets
Date: Mon, 23 Feb 2026 16:54:52 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-13-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065537_448721_46B01F82 
X-CRM114-Status: UNSURE (   8.60  )
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
index 874c9aafa5fc818762360aa6d1c3c37cb7726a65..5c74bc5e53923cbfda63eabeba56be39b3dea306 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -33,6 +33,10 @@
 #define MIPS_CTL0_SW_RESET_N	BIT(17)
 #define MIPS_CTL0_CORE_CLK_STS(n)	BIT(28 + (n)) /* n = 0..3 */
 
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
