Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4762CA5FED
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HL5qdO2xtBKIb5yxvTlu8xWtIB/xPENMauhzMCB8a9U=; b=pguW7LYlLWY5sE
	yzUV8aN0ajZCPgAPEHBdsprlUAZkbJHhwMZVO6a+qRmRIn1fm5l18hv8a4ScjOqHTVZ9TFtF9mlZQ
	bpuHrReLnDQKi4krjvvSMVLB+VXtt4isScRDyoH2be23jH01hedGQksaR7p47kdGC0rFqDZU74BN5
	f/l833kbdOU/yujNG+kRw8dIX3vhasvK6AytAjy3HVJbj8lkxmQaET3PP2xvwgnzQABX240FJNdjo
	CBtVIruvaeIEvBfjc1j8s9VLalskXbBdTwHZDbwtBngUfBNFMWrKFvmKCJnBLjVLTnS4bPHS2tRCS
	DRIp7ExRx14Z3bF7muFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR79-0000000HTDm-0M5O;
	Sun, 18 Jan 2026 11:38:39 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR70-0000000HSzW-0kIp
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736310; x=1800272310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r4J+S4OpOBmU1XLDegJNEBm7gq2biXx4Sbz14Z5WlOc=;
  b=LVKFZ0R7CB/e34B5ZxlxnjNepyndFYTPD0sFEy2z8BFalkJ9aAxOdnW1
   12DvYrXPhPVcv85YGYXx5z/4UvQ34mPFcnroHyEacB2h2iSduCnFVu1G1
   tEhqm4D+5F26RST8exkerU4obpSFlninASjJleQHyStOq6vv4t+9Nbyo+
   rW3vVUm1JV1zwuW4JlZd4xvT9YGLWwixJApGAs46k0dMVDSmJIGMxeYHs
   Ef9I71ucCgZwF3T1wyEJ4kkM+v9m/FA2vUa4WVGX46A+B2mTZYhq4XtoF
   xDN7IUqzIDTuV1iz7fWwAGvUsXJxJ877VfWcm+UzcXkVEnMz9I33hlGsz
   g==;
X-CSE-ConnectionGUID: V4W46u45RnC3w+ikE6LKGQ==
X-CSE-MsgGUID: /xoZl19EQNG2waMrbqXeGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:26 +0200
X-CSE-ConnectionGUID: 3mGpiZ0RRlqaax6WWidQiA==
X-CSE-MsgGUID: I0EaAkeYTLaJmUZj2sEH9A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 18 Jan 2026 13:40:19 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:25 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 19/20] platform: generic: mips p8700: dump MMIO regions
Date: Sun, 18 Jan 2026 13:38:01 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-19-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033830_586533_E28246C9 
X-CRM114-Status: UNSURE (   8.66  )
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

Debug print MMIO regions

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h |  1 +
 platform/generic/mips/eyeq7h.c        |  1 +
 platform/generic/mips/p8700.c         | 63 +++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 6071ddd2d0adbe02268366d1997d8d56b6b781b9..59969376f5a249b807c7d715be9bc0bd70c6c79b 100644
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
index 9a3cccae9166c5760bc0f3d6a5fbe1b8909991d5..2fb498c1b8f47a5a16d74a2c78fd9dff6dda156c 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -374,6 +374,7 @@ static int eyeq7h_nascent_init(void)
 		 */
 		__raw_writeq(NCORE-1, (void *)(cm_base + GCR_MMIO_TOP(1)));
 		mb();
+		mips_p8700_dump_mmio();
 	}
 
 	/* Per core set up */
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 5ce6dacd42a361a6b2faaab67f740f239f1303fa..e62e58a17367ff48ec3c09eb204eb8ff84b14e3c 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -16,6 +16,69 @@
 
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
