Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCECC3ABAA
	for <opensbi@archiver.kernel.org>; Sat,  3 May 2025 10:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMct6gmKpyobW83Cqs2rI1Ruwt/36TtLvxpb19ZmV80=; b=BK3zc0skjewPyt
	xDa5/7bg3p41e8kMC1KhaDo913xOEElOtylMEBuL4fVJ8iBjaGHp4q1i8nnVKlZxQ4SqZY9NC2ldt
	47GC/ie5Eueby0uFhJZRLU4IgtJEiGlY++1o0oqWZs6CPF7aqJ0XpVmGrMl2tjLla9t9acoht2Ugd
	+HGrANeQzt2UUCV6KpYMVPEONS85xBSu0THhhPAVQuD+Q5yzATD6ShRwIok04yfia9YOZYL/x2tke
	gYxVfmbZmtX9YkcUq3zMKU1bhEnYB7v6HZXq2Z3TGHvMnMpYhaHWaKaA1r/WKnZSBsN9ZIBmQA5o+
	Zq8Tydy2H1f3PxcpETYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAZX-00000003mKD-2xOl;
	Sat, 03 May 2025 10:58:19 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAZT-00000003mIi-25Dy
	for opensbi@lists.infradead.org;
	Sat, 03 May 2025 10:58:18 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4607C25DB1;
	Sat,  3 May 2025 12:58:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhqFSHZhoewi; Sat,  3 May 2025 12:58:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746269887; bh=Oaxq0kuaYsIdzT3DKWUDCncl81q7vpIFa+Psfm1gCV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P1WCNjNktIB2XAxerne1aGtCJf9a8LRr+XW7RKP36KX362ezct9XZ+uPVQmvQ2Af7
	 ykR/pWyf0jVlHK+zaZ+pJfr3v3x5hrcDulI4G6LRJIZZOLjVUDC2w4OwCvRGG/UAMb
	 c7F1kf86caCG+Wy0ZLmh5DVatSyjAkiqIh0UdGwhWfbqnFCLiF/n/F2iuZaJA6IZxc
	 U5FnBFSrToNxHXZZqdKuPxdHx1IgnLWEU82XbxUDvlsJEKE0mZgmxxzHHA0YFwF2Qv
	 8n4cPv1LaxTymOJbenIiuJx6OPAgbRms4hlhVXVy5pIlbd0cTtNdcJCEm5+qhHUc4O
	 7FGEvpszrrRbg==
From: Yao Zi <ziyao@disroot.org>
To: opensbi@lists.infradead.org
Cc: Yao Zi <ziyao@disroot.org>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v3 1/2] lib: sbi: hart: Detect existence of cycle and instret CSRs for Zicntr
Date: Sat,  3 May 2025 10:57:15 +0000
Message-ID: <20250503105715.16990-3-ziyao@disroot.org>
In-Reply-To: <20250503105715.16990-2-ziyao@disroot.org>
References: <20250503105715.16990-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_035816_057034_F2381197 
X-CRM114-Status: GOOD (  14.36  )
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

Zicntr extension specifies three read-only CSRs, time, cycle and
instret. It isn't sufficient to report Zicntr is fully supported with
only time CSR detected.

This patch introduces a bitmap to sbi_hart_features to record
availability of these CSRs, which are detected using traps. Zicntr is
reported as present if and only if three CSRs are all available on the
HARTs.

Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 include/sbi/sbi_hart.h | 10 ++++++++++
 lib/sbi/sbi_hart.c     | 35 ++++++++++++++++++++++++++++-------
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index bce88c5..dfbe8e4 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -93,6 +93,14 @@ struct sbi_hart_ext_data {
 
 extern const struct sbi_hart_ext_data sbi_hart_ext[];
 
+/** CSRs should be detected by access and trapping */
+enum sbi_hart_csrs {
+	SBI_HART_CSR_CYCLE = 0,
+	SBI_HART_CSR_TIME,
+	SBI_HART_CSR_INSTRET,
+	SBI_HART_CSR_MAX,
+};
+
 /*
  * Smepmp enforces access boundaries between M-mode and
  * S/U-mode. When it is enabled, the PMPs are programmed
@@ -112,6 +120,7 @@ struct sbi_hart_features {
 	bool detected;
 	int priv_version;
 	unsigned long extensions[BITS_TO_LONGS(SBI_HART_EXT_MAX)];
+	unsigned long csrs[BITS_TO_LONGS(SBI_HART_CSR_MAX)];
 	unsigned int pmp_count;
 	unsigned int pmp_addr_bits;
 	unsigned int pmp_log2gran;
@@ -150,6 +159,7 @@ bool sbi_hart_has_extension(struct sbi_scratch *scratch,
 			    enum sbi_hart_extensions ext);
 void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
 				 char *extension_str, int nestr);
+bool sbi_hart_has_csr(struct sbi_scratch *scratch, enum sbi_hart_csrs csr);
 
 void __attribute__((noreturn)) sbi_hart_hang(void);
 
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index fc4925b..74ccdd8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -747,6 +747,20 @@ void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
 		sbi_strncpy(extensions_str, "none", nestr);
 }
 
+/**
+ * Check whether a particular CSR is present on the HART
+ *
+ * @param scratch pointer to the HART scratch space
+ * @param csr the CSR number to check
+ */
+bool sbi_hart_has_csr(struct sbi_scratch *scratch, enum sbi_hart_csrs csr)
+{
+	struct sbi_hart_features *hfeatures =
+			sbi_scratch_offset_ptr(scratch, hart_features_offset);
+
+	return __test_bit(csr, hfeatures->csrs);
+}
+
 static unsigned long hart_pmp_get_allowed_addr(void)
 {
 	unsigned long val = 0;
@@ -803,7 +817,6 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	struct sbi_hart_features *hfeatures =
 		sbi_scratch_offset_ptr(scratch, hart_features_offset);
 	unsigned long val, oldval;
-	bool has_zicntr = false;
 	int rc;
 
 	/* If hart features already detected then do nothing */
@@ -812,6 +825,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 
 	/* Clear hart features */
 	sbi_memset(hfeatures->extensions, 0, sizeof(hfeatures->extensions));
+	sbi_memset(hfeatures->csrs, 0, sizeof(hfeatures->csrs));
 	hfeatures->pmp_count = 0;
 	hfeatures->mhpm_mask = 0;
 	hfeatures->priv_version = SBI_HART_PRIV_VER_UNKNOWN;
@@ -938,9 +952,6 @@ __pmp_skip:
 	/* Detect if hart supports sscofpmf */
 	__check_ext_csr(SBI_HART_PRIV_VER_1_11,
 			CSR_SCOUNTOVF, SBI_HART_EXT_SSCOFPMF);
-	/* Detect if hart supports time CSR */
-	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
-			CSR_TIME, SBI_HART_EXT_ZICNTR);
 	/* Detect if hart has AIA local interrupt CSRs */
 	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
 			CSR_MTOPI, SBI_HART_EXT_SMAIA);
@@ -962,8 +973,16 @@ __pmp_skip:
 
 #undef __check_ext_csr
 
-	/* Save trap based detection of Zicntr */
-	has_zicntr = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR);
+#define __check_csr_existence(__csr, __csr_id)				\
+	csr_read_allowed(__csr, &trap);					\
+	if (!trap.cause)						\
+		__set_bit(__csr_id, hfeatures->csrs);
+
+	__check_csr_existence(CSR_CYCLE, SBI_HART_CSR_CYCLE);
+	__check_csr_existence(CSR_TIME, SBI_HART_CSR_TIME);
+	__check_csr_existence(CSR_INSTRET, SBI_HART_CSR_INSTRET);
+
+#undef __check_csr_existence
 
 	/* Let platform populate extensions */
 	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
@@ -973,7 +992,9 @@ __pmp_skip:
 
 	/* Zicntr should only be detected using traps */
 	__sbi_hart_update_extension(hfeatures, SBI_HART_EXT_ZICNTR,
-				    has_zicntr);
+			    sbi_hart_has_csr(scratch, SBI_HART_CSR_CYCLE) &&
+			    sbi_hart_has_csr(scratch, SBI_HART_CSR_TIME)  &&
+			    sbi_hart_has_csr(scratch, SBI_HART_CSR_INSTRET));
 
 	/* Extensions implied by other extensions and features */
 	if (hfeatures->mhpm_mask)
-- 
2.49.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
