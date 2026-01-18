Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9906D4A5F4
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS6C1FgmTrDU+mH/bv+SNY95mwKoIBmgKEuhgiLVAR4=; b=b1O6Q9XH0jQG9Q
	rDNkjr4OUcHQjEjt8i7jCpAnQFTSWNA9Fol4QQJ6dm9NziaoPRhilM5d8Q+Fs5dbT+bHwtKanohlO
	c/WhDkTxNMs95aDiKngYo5hJjEXS8PSHt0diQAKEiEDI+UEGUp9sxozNKtReFTfkFTlnWU9o7EMDG
	FwYOFUaY80fuM37bWmlepgq65rT2AWStxKLCKQMg+0qlbRCaYEZCM6UwtjyDHDlaTTO3jRm8+XFDw
	8ATPclKYIfPVXoB/nftKNa9paunjODtUHd0e5gis5rTZcRIPdp/xIjyaT/VU0iXRs3KYWQK/hMXaR
	CpOZfVcPTSRkPP2LVSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR78-0000000HTCa-0bjE;
	Sun, 18 Jan 2026 11:38:38 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6y-0000000HSzW-0IeP
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736308; x=1800272308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6fsXGXiUTS9Woj3JLNXwlSxszSzaIgq6Nxa9/UmiP9Q=;
  b=p9olliohORWrPEy1c1KvSerG2r8jQw7qDKybAv9jZFz4xUsajzu8UCso
   tDCi0HNow6l+y43ZCJq4iYT6XiTW/GIYNZ6Dn0/GC/qUfNuFS5bO3Datk
   fB8ujUCkyHpwAxseU8hZnLbL5pu+e52SX7RfTDUjuOK0tU1cQ8shaWUct
   RELBLFATGpdP7PfGdXodwTXaNyqaoMFMW6rX0dLup9OcShk421HusjcTr
   erf7SJu5mBrZ1G2WtOT3mlIJi9QkOYq8bB7gRlMxoOIN1FRQ58HFd+jE1
   /vwaRjEX6Su/BfMOLWoQMSy4SlJG27zHXdkcg37imuATYLv5jQhp0T6YS
   Q==;
X-CSE-ConnectionGUID: V4W46u45RnC3w+ikE6LKGQ==
X-CSE-MsgGUID: nAWqXWFvSJex8+JLMvExDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:26 +0200
X-CSE-ConnectionGUID: /5Ap2asEQH+SjL/wz4qbBA==
X-CSE-MsgGUID: S6TuMWrgSXmibRdDyEUcEw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces01_data.me-corp.lan with SMTP; 18 Jan 2026 13:40:17 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:24 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 18/20] platform: generic: mips eyeq7h: fix NCORE
 registers access from clusters 1..2
Date: Sun, 18 Jan 2026 13:38:00 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-18-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033828_482434_D5F45600 
X-CRM114-Status: UNSURE (   9.40  )
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
index 0675635565589105594c231505be8b094ca4a25a..6071ddd2d0adbe02268366d1997d8d56b6b781b9 100644
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
index fb4cccc2bf4de4914b650e3934fa04418e594e58..9a3cccae9166c5760bc0f3d6a5fbe1b8909991d5 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -37,6 +37,7 @@
 #define OLB_ACC1		0x65000000
 #define OLB_XNN0		0x43600000
 #define OLB_XNN1		0x63600000
+#define NCORE			0x67800000
 #define OLB_WEST		0x48600000
 #define OLB_WEST_TSTCSR		0x60
 #define TSTCSR_PALLADIUM	BIT(0)
@@ -367,6 +368,12 @@ static int eyeq7h_nascent_init(void)
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
