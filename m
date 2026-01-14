Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB971D31A36
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeByENb6ONoo+gjA4K5XWUk7D41wdH5fa5J2zxPrKjs=; b=KIo8RGr5JpAp6Q
	C3yolpCSMIK7yUXBvbX+Qo1jmqL2CjKR2nxSQ2rdcE910MuE1DVpzNPSIDBV26xndq1NkVJjejcjm
	wROuueBsxKQov11sXjkK0tHJ43fbcdLLbVPK+LQVORbBkfwLnKicQ5ckrh52Rm2Jwx+u32SsC2LOR
	fbDjeVevyldc34NxBLB6J/ENRy0ciTQoM79+JAJz0Jqo5epWdxU5wBcGsq+4d75NyvqAddmTEBr6F
	cavE8NDEMx0/vIHI2IsOssdEJYuqLNab1wa/e+npqHW5J3wN0gzrJEjDHT7N0dVV8m9TfmsyycPZM
	j3rfNlApdZa+xZblm/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBM-00000008YTQ-2Z95;
	Wed, 14 Jan 2026 09:28:52 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBI-00000008YO6-2Qmo
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382928; x=1799918928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=drba4itfQ+5i4dn+Wwnhst75fWY83WhLUmqcmIgRm/A=;
  b=OEDLjvEjOoc6gWfCvQNzRhAC7VDGhPtNFq3lcKWmfzMUgsLde7IvX8wE
   uJ6Hevr9oSpdTjqzddgbiPYfuLOne3StOYU0hYj9mRY1IMJVON+5pHgbU
   WE1p8JlGAu8C3rb40KcpN5hEqvnnkAuTRIqGwL9X7vGQ6d1taUYtPu5U9
   JgGDXD7dBHKNGGP8KIopVN16lVEqvuSF7Jwo+0o+XgA3HhRgu4Rg04WFv
   xTPEJ4bOXzX2eBu7PeHBEvqaW4UNmw5Mud71PBipSwHm0FMnLxf+Xhej4
   TQL7nYd3xZNL+bo5bpWgU19GEclapxzJX9M7NG7uwsYLBntnRep6BbFiE
   A==;
X-CSE-ConnectionGUID: DT3BXtSOQS6/IJHKl1UGIg==
X-CSE-MsgGUID: F4fDefc+Ts6qfIJw8JiAVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:43 +0200
X-CSE-ConnectionGUID: 624pt69ySBimNwLMlFWaSw==
X-CSE-MsgGUID: LNhur/JST8KCcl1oxYqSaQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:33 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:42 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 21/22] platform: generic: mips eyeq7h: fix NCORE registers access from clusters 1..2
Date: Wed, 14 Jan 2026 11:21:17 +0200
Message-ID: <20260114092118.1315581-22-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012849_216548_A310D949 
X-CRM114-Status: GOOD (  11.74  )
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

CPU clusters 1 and 2 cannot access NCORE registers through AUX ports.
AUX ports of clusters 1 and 2 are connected to NCORE through east port.
East port has no access to NCORE registers address space.

Re-route NCORE registers range to MEM port by re-configuring MMIO
regions in the GCR. REsulting map is as below. Mind a gap between
regions [1] and [2]; this gap covering NCORE registers now routed
to the default MEM port
Cluster 0: 4 MMIO regions
  [0] : 0x0000000000000000-0x000000001fff0000 AUX0 UC|UCA
  [1] : 0x0000000020000000-0x00000000677f0000 AUX0    ANY
  [2] : 0x0000000080000000-0x0000001fffff0000 AUX0 UC|UCA
  [3] : --disabled--
Cluster 1: 4 MMIO regions
  [0] : 0x0000000000000000-0x000000001fff0000 AUX0 UC|UCA
  [1] : 0x0000000020000000-0x00000000677f0000 AUX0    ANY
  [2] : 0x0000000080000000-0x0000001fffff0000 AUX0 UC|UCA
  [3] : --disabled--
Cluster 2: 4 MMIO regions
  [0] : 0x0000000000000000-0x000000001fff0000 AUX0 UC|UCA
  [1] : 0x0000000020000000-0x00000000677f0000 AUX0    ANY
  [2] : 0x0000000080000000-0x0000001fffff0000 AUX0 UC|UCA
  [3] : --disabled--

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h | 18 ++++++++++++++++++
 platform/generic/mips/eyeq7h.c        |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 067563556558..6071ddd2d0ad 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -144,6 +144,24 @@ extern const struct p8700_cm_info *p8700_cm_info;
 #define L2SM_COP_RESULT_ABORT_OK	3
 #define L2SM_COP_RESULT_ABORT_ERROR	4
 #define GCR_L2SM_COP_PRESENT		BIT(31)
+/* MMIO regions. Actual count in GCR_GLOBAL_CONFIG.GCR_GC_NUM_MMIOS */
+#define GCR_MMIO_BOTTOM(n)		(0x700 + (n) * 0x10) // n = 0..7
+#define GCR_MMIO_TOP(n)			(0x708 + (n) * 0x10) // n = 0..7
+#define GCR_MMIO_ADDR			GENMASK(47, 16) // both top and bottom
+#define GCR_MMIO_BOTTOM_CCA		GENMASK(9, 8)
+#define GCR_MMIO_BOTTOM_FORCE_NC	BIT(6)
+/*
+ * 15:12 - reserved
+ * 11 - AUX3
+ * 10 - AUX2
+ * 9  - AUX1
+ * 8  - AUX0
+ * 7:1 - reserved
+ * 0  - Main memory port; MEM
+ */
+#define GCR_MMIO_BOTTOM_PORT		GENMASK(5, 2)
+#define GCR_MMIO_BOTTOM_DIS_RQ_LIM	BIT(1)
+#define GCR_MMIO_BOTTOM_EN		BIT(0)
 
 /* CPC Block offsets */
 #define CPC_PWRUP_CTL		0x0030
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 2d4a81d7b335..70d90e2d9201 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -38,6 +38,7 @@
 #define OLB_ACC1		0x65000000
 #define OLB_XNN0		0x43600000
 #define OLB_XNN1		0x63600000
+#define NCORE			0x67800000
 #define OLB_WEST		0x48600000
 #define OLB_WEST_TSTCSR		0x60
 #define TSTCSR_PALLADIUM	BIT(0)
@@ -414,6 +415,12 @@ static int eyeq7h_nascent_init(void)
 			     (void *)(cm_base + L2_PFT_CONTROL_OFFSET));
 		__raw_writel(0x15ff,
 			     (void *)(cm_base + L2_PFT_CONTROL_B_OFFSET));
+		/*
+		 * Remove access to NCORE CSRs from mmio region 1
+		 * which is routed to AUX. NCORE to use default route through MEM.
+		 */
+		__raw_writeq(NCORE-1, (void *)(cm_base + GCR_MMIO_TOP(1)));
+		mb();
 	}
 
 	/* Per core set up */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
