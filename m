Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EB0EA4FCE
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FvMaiJJcpA3TbKs2yA+IdntJ3/hSWbBOrWkyHdwZxM=; b=WW6ycA1cdNgoJd
	k7mre/AIy+56JXemz8ZLq8wAb2wioC7DU+f8oeTajWYe4Ze7zVfrtV2KcPHUf2EE/F6maXpVsXxz/
	HmAG82piLxOcFjbFaeopmwR6b/4fN6Z5Axb55J/jcKb6ISPTnK2xNAfqeC9EWcOqvgG/QD1NxxjHN
	d2G0PhQtPL7XH8HwpsIXVChT9WyRmO8E2WwYPBMok0B0yMZ9RW7ErduK9pxhbwl4oDSFsII0OKmUH
	6kM4kFp5O7ivGTfkscxF+XC30tY8wtJV3F/xE6UOBiATg1yMYe2uSvxMbZ+jA51fsZbC8MJ/vcJVA
	yjlL1DWw3HEzf6LE5zsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLh-00000000W25-0121;
	Mon, 23 Feb 2026 14:55:49 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLc-00000000Vow-3cCY
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858542; x=1803394542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JRK3FNMweJzRE0Y685rPHFo7KGgUnzI4RZ4UC9F8TsI=;
  b=ULfiQ064KB6UPlfcxe04FATiG/TNG47kd8nB6PGY4FcjPrFAROb0k1/u
   OBZKiNjUDcupWQmAKwY0z9NZK/Z6eqjAvzBiBS/qVlHandvqKoJ1ETe9M
   zuFs22W40jFbPOM+XR78O0h1GHGUjCFIyoZj9eDzLANo6kiEdFxYxLhOb
   MKPrwuy7GzJcK1W7JgOQ/aw6AORrQJWompKOEWVV+1LDjDKAqGerJ98vL
   8JlTeliD0MueBHo2Gp6JnfznZwM0oL2LkG/yI3QevSnBE3qWqT06CVRc5
   1aatdDpZa7aV8fzQCBa4P792Sijs1eZXVx252+I2nU3KmUUAxqE/3yE7x
   w==;
X-CSE-ConnectionGUID: qI7r+ZoDSMW1Btie+JMykQ==
X-CSE-MsgGUID: wxLrHKErQQuj7b7By2NmdQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:41 +0200
X-CSE-ConnectionGUID: FdQRMpi+RkuAK/5/ZM1r1Q==
X-CSE-MsgGUID: 7mYZdDuURzCHiSYs2piDgQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:16 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:42 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 20/23] platform: generic: mips p8700: dump MMIO regions
Date: Mon, 23 Feb 2026 16:54:59 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-20-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065545_235018_66227D50 
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
index 3752bdf2b3ddc967dae32ee449bf77e9c6d64b06..d23d1d34724710e91f4812b845e9cf2f5dad0249 100644
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
index b7bffad7b1fb63a5e0e858313bca8ddc57db94c5..04ab5286ed95284f737b7a1dd0ba035d42e58949 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -376,6 +376,7 @@ static int eyeq7h_nascent_init(void)
 		 */
 		__raw_writeq(NCORE-1, (void *)(cm_base + GCR_MMIO_TOP(1)));
 		mb();
+		mips_p8700_dump_mmio();
 	}
 
 	/* Per core set up */
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index ffc8520f7c5a2c4cf7574291dd49c8acd4f0623a..ff13d37bf1fc962223ea99fcc2b183ccc427a6df 100644
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
