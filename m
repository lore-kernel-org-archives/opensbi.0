Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81692D31A33
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EG0cgtSGFSlPr4QKi9LedRvtav4i80m1frfh34/gPNA=; b=mwpkrFt8bN+n2E
	m81i6NoCQnIXuHFa+ZqkNPA53gMGYAMqKRGMV+vfe1BUmsPSgmFqec3+GA81ILCs6oyhMjO3L+Nyv
	/b7JXvXpWvdzDWxuxuRFAR8/NYxo+sAHi4kyEF5dMX3KviLd4U7Xe8XxkhKyTji53iajoSIrVBU9R
	Rj83ZIVpUeC9hbl+DHF2i3/nfJaWQu1LItLcwlKXU6umNGm5ObPg7GmIRRQ3Np2WjPbPZEr9K9fJK
	EAczsm75z6cpjqjkv5nq95PxnepxJwTlyX46G66gDv5/oriWDRXRIC/cmodyKud/DaYkKz3evVgdi
	D1Umt+tbSgD1lY52vlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBT-00000008YWe-1FVU;
	Wed, 14 Jan 2026 09:28:59 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBK-00000008YMh-21HF
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382930; x=1799918930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D1mg9TyMPXNTHnCMsl2hGOAApKLxEYBrgqA2BfBr3zc=;
  b=ZH+AK5IOIzG0I7KPaFCLZz1nxwseBZ7/e+sOvpfh79VPcgWTFcSVQm20
   RuOf77tPzemLVe/Td/rw7hdrUBN3nLAyJLad3OY9yY8q7ZW1uGMu4HZmY
   OTtkjXatPmeNr9KdBgxX2h/bhznL2gT+tl9cnR7d7luNtUWjsOAcFm0Sn
   oFV6Rn6eWIBFHra4dStfwkMsY1HF9gpZY1iDUQX6Z5mIFnn5fWVkwHPAi
   lCsslogptjpkyq1DpJJERgCXD6hh8K/QbW0IBUDQc/lD6cysMgBBY6ntH
   jsg/j+Lsd5EQvNsTi0ejecsbQMY2f9aON5CFJeDnNWmIPjariuAPGQ/t+
   w==;
X-CSE-ConnectionGUID: DT3BXtSOQS6/IJHKl1UGIg==
X-CSE-MsgGUID: A29F+79TQRK5MxuJbkhPRA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:44 +0200
X-CSE-ConnectionGUID: 5Qq7t404RrCXGqeKQfigjA==
X-CSE-MsgGUID: 1FTq6/jcTw6vDNS5eWrowg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:34 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:43 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 22/22] platform: generic: mips p8700: dump MMIO regions
Date: Wed, 14 Jan 2026 11:21:18 +0200
Message-ID: <20260114092118.1315581-23-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012850_822570_5925F39A 
X-CRM114-Status: GOOD (  11.58  )
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

Debug print MMIO regions

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h |  1 +
 platform/generic/mips/eyeq7h.c        |  1 +
 platform/generic/mips/p8700.c         | 63 +++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 6071ddd2d0ad..59969376f5a2 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -188,6 +188,7 @@ extern const struct p8700_cm_info *p8700_cm_info;
 #define CPC_Cx_STAT_CONF_SEQ_STATE_U6	7
 
 extern const struct p8700_cm_info *p8700_cm_info;
+void mips_p8700_dump_mmio(void);
 void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 			unsigned long prot, unsigned long addr,
 			unsigned long log2len);
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 70d90e2d9201..0242749e4e12 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -421,6 +421,7 @@ static int eyeq7h_nascent_init(void)
 		 */
 		__raw_writeq(NCORE-1, (void *)(cm_base + GCR_MMIO_TOP(1)));
 		mb();
+		mips_p8700_dump_mmio();
 	}
 
 	/* Per core set up */
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 46d3d446cae3..e7fb0271539b 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -17,6 +17,69 @@
 
 const struct p8700_cm_info *p8700_cm_info;
 
+void mips_p8700_dump_mmio(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned hartid = current_hartid();
+	unsigned cl = cpu_cluster(hartid);
+	unsigned long cm_base = p8700_cm_info->gcr_base[cl];
+	u64 gcr_config = readq((void*)cm_base + GCR_GLOBAL_CONFIG);
+	int num_mmios = EXTRACT_FIELD(gcr_config, GCR_GC_NUM_MMIOS);
+	static const char *ports[16] = {
+		[0] = "MEM",
+		[1] = "? 1",
+		[2] = "? 2",
+		[3] = "? 3",
+		[4] = "? 4",
+		[5] = "? 5",
+		[6] = "? 6",
+		[7] = "? 7",
+		[8]  = "AUX0",
+		[9]  = "AUX1",
+		[10] = "AUX2",
+		[11] = "AUX3",
+		[12] = "? 12",
+		[13] = "? 13",
+		[14] = "? 14",
+		[15] = "? 15",
+	};
+	static const char *ccas[4] = {
+		[0] = "ANY",
+		[1] = "UC",
+		[2] = "UCA",
+		[3] = "UC|UCA",
+	};
+	static const char *ncs[2] = {
+		[0] = "  ",
+		[1] = "NC",
+	};
+	static const char *dis_rqs[2] = {
+		[0] = "          ",
+		[1] = "DIS_RQ_LIM",
+	};
+	if (!(scratch->options & SBI_SCRATCH_DEBUG_PRINTS))
+		return;
+
+	sbi_printf("Cluster %d: %d MMIO regions\n", cl, num_mmios);
+	for (int i = 0; i < num_mmios; i++) {
+		u64 b = readq((void*)cm_base + GCR_MMIO_BOTTOM(i));
+		u64 t = readq((void*)cm_base + GCR_MMIO_TOP(i));
+		if (b & GCR_MMIO_BOTTOM_EN) {
+			ulong ta = EXTRACT_FIELD(t, GCR_MMIO_ADDR) << 16;
+			ulong ba = EXTRACT_FIELD(b, GCR_MMIO_ADDR) << 16;
+			int cca = EXTRACT_FIELD(b, GCR_MMIO_BOTTOM_CCA);
+			int nc = EXTRACT_FIELD(b, GCR_MMIO_BOTTOM_FORCE_NC);
+			int port = EXTRACT_FIELD(b, GCR_MMIO_BOTTOM_PORT);
+			int dis_rq_lim = EXTRACT_FIELD(b, GCR_MMIO_BOTTOM_DIS_RQ_LIM);
+
+			sbi_printf("  [%d] : 0x%016lx-0x%016lx %4s %6s %s %s\n", i,
+				   ba, ta, ports[port], ccas[cca], ncs[nc], dis_rqs[dis_rq_lim]);
+		} else {
+			sbi_printf("  [%d] : --disabled--\n", i);
+		}
+	}
+}
+
 void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 			unsigned long prot, unsigned long addr,
 			unsigned long log2len)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
