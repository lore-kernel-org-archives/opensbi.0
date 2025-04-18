Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145FAC369CA
	for <opensbi@archiver.kernel.org>; Fri, 18 Apr 2025 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2dDfyn1uhQXaZ0ltToq6LBvMxuGeHKXLe1HgXPhS40=; b=YHMVBMZDYGKAGg
	Grvwcu+prtE9Tz1QX2utFb5u3szKsmux0ejV5bun1b1qkV8A/oQjki/KpX9grB3j7rQ5Ei0uFJ++E
	G7RpRcV+alHbazTH2SQNMgHR2VX0ruNbD0Ce3MscKLMHo1/EGiUVteKWcg2yz7ugb0XGcPNRfRlbx
	6e6QaQvCjPyLltOesnqMM1MnNzRgbB8MJUs0xDyY+bkDhXoW9MepAb2L5t0rn5//FQm/Pcm4qKxaf
	R3R+INkaK8pqffUI6/tF1i0bQg1kNc2fLwc0WkRxsHC2EX2E+PXM0v5BLHuY0rRF8KrPR4vi/H1tE
	C8SNU+cu0H/icIJgNWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n2l-0000000GVTW-3zjb;
	Fri, 18 Apr 2025 14:50:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n0t-0000000GV0h-1heV
	for opensbi@lists.infradead.org;
	Fri, 18 Apr 2025 14:48:21 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2A04525D2C;
	Fri, 18 Apr 2025 16:48:14 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5XAuN6_ZBFu; Fri, 18 Apr 2025 16:48:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744987693; bh=reFTHb9KvI8hnsScp4b4+yVAtcZIG0vaLJO+k2OYKho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ewec58JKvkALQuZmoJFrRrD7vl3hzxxHtIENFASlHdL7aI1JmldwDtvN95c/DyCiJ
	 89yeYcuK8mshjd1FJnvoGquI3Ur8KON/aAkmaDLtBvdKQiuHvg3eB5n+cnKxgHPSaQ
	 P0GRm3cSCimSs1nUnpsbkbidyUlqW4Ssmwbjs/MmEHoAocLrUnvZuBoD/gc/S1GBTk
	 fcLGDdUt5Ql/BkAnPBqAHxBzgeACmdONRho7RwSCmrFKhQyaa6eQEwFMHX0KKZ9pdF
	 kA9xvSgl7f6Jqeh6hK5ND2nM4zcHfjlCCoOzLlfcleqeFiHmHvEuRXmxVudMMxVtV+
	 5c9lGg4JDR0EA==
From: Yao Zi <ziyao@disroot.org>
To: opensbi@lists.infradead.org
Cc: Yao Zi <ziyao@disroot.org>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 1/2] lib: sbi: hart: Detect existence of cycle and instret CSRs for Zicntr
Date: Fri, 18 Apr 2025 14:47:57 +0000
Message-ID: <20250418144758.2633-2-ziyao@disroot.org>
In-Reply-To: <20250418144758.2633-1-ziyao@disroot.org>
References: <20250418144758.2633-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_074819_718170_5A7919EF 
X-CRM114-Status: GOOD (  13.74  )
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
 include/sbi/sbi_hart.h |  9 +++++++++
 lib/sbi/sbi_hart.c     | 35 ++++++++++++++++++++++++++++-------
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index c3a7feb..48edafe 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -91,6 +91,13 @@ struct sbi_hart_ext_data {
 
 extern const struct sbi_hart_ext_data sbi_hart_ext[];
 
+/** CSRs should be detected by access and trapping */
+enum sbi_hart_csrs {
+	SBI_HART_CSR_CYCLE = 0,
+	SBI_HART_CSR_TIME,
+	SBI_HART_CSR_INSTRET,
+};
+
 /*
  * Smepmp enforces access boundaries between M-mode and
  * S/U-mode. When it is enabled, the PMPs are programmed
@@ -110,6 +117,7 @@ struct sbi_hart_features {
 	bool detected;
 	int priv_version;
 	unsigned long extensions[BITS_TO_LONGS(SBI_HART_EXT_MAX)];
+	unsigned long csrs;
 	unsigned int pmp_count;
 	unsigned int pmp_addr_bits;
 	unsigned int pmp_log2gran;
@@ -148,6 +156,7 @@ bool sbi_hart_has_extension(struct sbi_scratch *scratch,
 			    enum sbi_hart_extensions ext);
 void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
 				 char *extension_str, int nestr);
+bool sbi_hart_has_csr(struct sbi_scratch *scratch, enum sbi_hart_csrs csr);
 
 void __attribute__((noreturn)) sbi_hart_hang(void);
 
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c343805..f98b6b0 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -733,6 +733,20 @@ void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
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
+	return (hfeatures->csrs >> csr) & 1UL;
+}
+
 static unsigned long hart_pmp_get_allowed_addr(void)
 {
 	unsigned long val = 0;
@@ -789,7 +803,6 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	struct sbi_hart_features *hfeatures =
 		sbi_scratch_offset_ptr(scratch, hart_features_offset);
 	unsigned long val, oldval;
-	bool has_zicntr = false;
 	int rc;
 
 	/* If hart features already detected then do nothing */
@@ -798,6 +811,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 
 	/* Clear hart features */
 	sbi_memset(hfeatures->extensions, 0, sizeof(hfeatures->extensions));
+	hfeatures->csrs = 0;
 	hfeatures->pmp_count = 0;
 	hfeatures->mhpm_mask = 0;
 	hfeatures->priv_version = SBI_HART_PRIV_VER_UNKNOWN;
@@ -924,9 +938,6 @@ __pmp_skip:
 	/* Detect if hart supports sscofpmf */
 	__check_ext_csr(SBI_HART_PRIV_VER_1_11,
 			CSR_SCOUNTOVF, SBI_HART_EXT_SSCOFPMF);
-	/* Detect if hart supports time CSR */
-	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
-			CSR_TIME, SBI_HART_EXT_ZICNTR);
 	/* Detect if hart has AIA local interrupt CSRs */
 	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
 			CSR_MTOPI, SBI_HART_EXT_SMAIA);
@@ -945,8 +956,16 @@ __pmp_skip:
 
 #undef __check_ext_csr
 
-	/* Save trap based detection of Zicntr */
-	has_zicntr = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR);
+#define __check_csr_existence(__csr, __csr_id)				\
+	csr_read_allowed(__csr, &trap);					\
+	if (!trap.cause)						\
+		hfeatures->csrs |= 1 << __csr_id;
+
+	__check_csr_existence(CSR_CYCLE, SBI_HART_CSR_CYCLE);
+	__check_csr_existence(CSR_TIME, SBI_HART_CSR_TIME);
+	__check_csr_existence(CSR_INSTRET, SBI_HART_CSR_INSTRET);
+
+#undef __check_csr_existence
 
 	/* Let platform populate extensions */
 	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
@@ -956,7 +975,9 @@ __pmp_skip:
 
 	/* Zicntr should only be detected using traps */
 	__sbi_hart_update_extension(hfeatures, SBI_HART_EXT_ZICNTR,
-				    has_zicntr);
+			    (hfeatures->csrs & BIT(SBI_HART_CSR_CYCLE))	&&
+			    (hfeatures->csrs & BIT(SBI_HART_CSR_TIME))	&&
+			    (hfeatures->csrs & BIT(SBI_HART_CSR_INSTRET)));
 
 	/* Extensions implied by other extensions and features */
 	if (hfeatures->mhpm_mask)
-- 
2.49.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
