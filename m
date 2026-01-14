Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C95D31A2A
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Js1+oQEN9yhZYp2hd/WEK7aTi9JVxJI2VQdi1Nk8gY=; b=AODFy8v8wU6fGs
	0WAaNmPK3EO7FDnRVBYghNXXtQ4WWfsNA3YHuosBcIQET3WtYh/uzE3M8rdNf+8AN5kAZgllMLyDU
	Is6plGMe7diTXhPeF3WSNUt3bizU13YBmLmEn2XvmrPFO56rCOPU4unBOu+5XOoVLpiYxJIE3iNsY
	9lkSpteGJlxsCrhHYD+Z3AhKYS4lHYk2zQfrrfnKs3zuanDP6Y5RLsCxBUki0tDMo/I/4YAjHFSyg
	awDj/LWE2LSZp3g7U2PDZCp7g67ik3FBdydXe6Nevc3cd7B6pVO6D8ol03vKYf0Mqcv+LwKYBMOZ7
	9QjOMTp/JSV1/47aBbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4V-00000008Vxb-2aAc;
	Wed, 14 Jan 2026 09:21:47 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4O-00000008Vdm-0KLc
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382499; x=1799918499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R7BxKP2g/JnGY9re4cIZlBUXp2PtZ/NTsel+VtWS53Q=;
  b=D/wCVv/fFRMSb1+Alo6voLeivbNu0qgxAkFlydGH4O/UaEnRzWSsarjC
   g5wDZuEoWmKQ2t079/HyWcgYN32neeBkGNwNa18FcTLNo90pZKB9qPCvO
   GR57W9QT2yPLNXwZhRuMSvcsMVWV0qhVsBhGV9wbfo+TbWJZ863s2m06O
   EsMDPzXbXeGmQMxvsTnZiljH+mo7r1RO4OtBTF70reX3y6AQi0cD53R34
   RxhNIt8vDpRNlGvSmP+CfYZGxXFJp5UXgI0t8Z2E2SV8TIzMPy+ATNfIM
   WcSFzjGzcuD/Se4+tbP2cgznNbM1pvVDqSxLTmhe4MBrQxGNLClq30xcz
   g==;
X-CSE-ConnectionGUID: Fi5jE+wlQrK2V2arXC2B4A==
X-CSE-MsgGUID: ULBkyUdMQ5eQTsqR+kIxzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:37 +0200
X-CSE-ConnectionGUID: cK/AKlNER1mFvfsP/tG62A==
X-CSE-MsgGUID: A6pBMZhwSo6Qj+30t5TysA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 14 Jan 2026 11:23:21 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:36 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 15/22] platform: generic: mips eyeq7h: deassert accelerator cluster resets
Date: Wed, 14 Jan 2026 11:21:11 +0200
Message-ID: <20260114092118.1315581-16-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012140_417907_23AAD8FA 
X-CRM114-Status: GOOD (  11.38  )
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
index 24eb149d2433..63f831dfd611 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -34,6 +34,10 @@
 #define MIPS_CTL0_SW_RESET_N	BIT(17)
 #define MIPS_CTL0_CORE_CLK_STS(n)	BIT(28 + (n)) // n = 0..3
 
+#define OLB_ACC0		0x45000000
+#define OLB_ACC1		0x65000000
+#define OLB_XNN0		0x43600000
+#define OLB_XNN1		0x63600000
 #define OLB_WEST		0x48600000
 #define OLB_WEST_TSTCSR		0x60
 #define TSTCSR_PALLADIUM	BIT(0)
@@ -161,15 +165,27 @@ static void eyeq7h_acc_clusters_do_fixup(struct fdt_general_fixup *f, void *fdt)
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
