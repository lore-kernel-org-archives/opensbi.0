Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D76FCE064
	for <opensbi@archiver.kernel.org>; Thu, 26 Feb 2026 12:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kx9TsQGPK5SNa8r2tPtHdMW/cd5RRB6J+IM/3z6WH58=; b=SLZ7IWYaJn3vuy
	kSWwJliwQCVCWTWDekLYSSSNKH7/j2gmmTljh4lkBl4WOKphJ3J3FAdhJOve6ezlYFKiOsXBsPgcX
	qTvg001xZ4b/0ggxcDmvzzvfmWPgETodam7YkW0l79jJpSTUPxEdiv9lKt33XFNRl2Ar+isBU/sw+
	nY46sOP7zksvxhXEWrHQ5O/GBk9Zc+SXGDIDF1d5BKZ4eVd9PHohoabo3aytzHCIoamU6Xt1j0B51
	bnS0lcZgE4ftfGqAP4AZWiS3RYN6fdlp7txVj3/En0KQ4WD7sB6c4MvmwLl469RVodo3/AFKhnnW4
	p84R/PKD2u2Ot2zwmvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaZy-0000000680Q-21KH;
	Thu, 26 Feb 2026 12:34:54 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaZv-000000067z3-3vCN
	for opensbi@lists.infradead.org;
	Thu, 26 Feb 2026 12:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772109285; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=KD6SbR15x8iq04qI1v/B80VAyqAup77HpbElkCsXMe4=;
	b=DEeKNMhDodiFJ8ILtZYk0kX9gpHDzFO3fvDnBfdOK6nUPIsHFsBLRxlMfeix2Oj87e6USaRRovTkzLfi0zoHBgkjKHr++V+PR37dB+WKj8Wzt++h+q80tlAdiNAnSHhijK9dbg2Q+dj4G6++mJg92nMvzpXxX86En+ezFYBchWQ=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WzrCT5r_1772109280 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Feb 2026 20:34:40 +0800
From: cp0613@linux.alibaba.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	samuel.holland@sifive.com,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH v2 1/2] lib: sbi: Introduce sbi_hart_pmp_fence_vma
Date: Thu, 26 Feb 2026 20:34:07 +0800
Message-ID: <20260226123408.1597-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226123408.1597-1-cp0613@linux.alibaba.com>
References: <20260226123408.1597-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_043452_135011_D4B0B5B9 
X-CRM114-Status: GOOD (  12.77  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

The original sbi_hart_pmp_fence implementation actually flushes all address
translation cache entries. The sbi_hart_pmp_fence_vma is introduced to flush
only the entries corresponding to a given address and size.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 include/sbi/sbi_hart_pmp.h       |  3 ++-
 lib/sbi/sbi_hart_pmp.c           | 30 +++++++++++++++++++++++++++---
 platform/generic/eswin/eic770x.c |  2 +-
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/include/sbi/sbi_hart_pmp.h b/include/sbi/sbi_hart_pmp.h
index a7765d17..5d359764 100644
--- a/include/sbi/sbi_hart_pmp.h
+++ b/include/sbi/sbi_hart_pmp.h
@@ -15,7 +15,8 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
-void sbi_hart_pmp_fence(void);
+void sbi_hart_pmp_fence_all(void);
+void sbi_hart_pmp_fence_vma(unsigned long start, unsigned long size);
 int sbi_hart_pmp_init(struct sbi_scratch *scratch);
 
 #endif
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index 02a3b3c4..80407110 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -62,7 +62,7 @@ bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx)
 	return bitmap_test(fw_smepmp_ids, pmp_idx) ? true : false;
 }
 
-void sbi_hart_pmp_fence(void)
+void sbi_hart_pmp_fence_all(void)
 {
 	/*
 	 * As per section 3.7.2 of privileged specification v1.12,
@@ -86,6 +86,30 @@ void sbi_hart_pmp_fence(void)
 	}
 }
 
+void sbi_hart_pmp_fence_vma(unsigned long start, unsigned long size)
+{
+	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
+		sbi_hart_pmp_fence_all();
+	} else {
+		/* Flush TLB entries for the specified address range */
+		if (misa_extension('S')) {
+			unsigned long i;
+			for (i = 0; i < size; i += PAGE_SIZE) {
+				__asm__ __volatile__("sfence.vma %0"
+							:
+							: "r"(start + i)
+							: "memory");
+			}
+
+			if (misa_extension('H')) {
+				for (i = 0; i < size; i += PAGE_SIZE) {
+					__sbi_hfence_gvma_gpa((start + i) >> 2);
+				}
+			}
+		}
+	}
+}
+
 static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				struct sbi_domain *dom,
 				struct sbi_domain_memregion *reg,
@@ -213,7 +237,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch)
 	 * Keep the RLB bit so that dynamic mappings can be done.
 	 */
 
-	sbi_hart_pmp_fence();
+	sbi_hart_pmp_fence_all();
 	return 0;
 }
 
@@ -293,7 +317,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
 	for(; pmp_idx < pmp_count; pmp_idx++)
 		pmp_disable(pmp_idx);
 
-	sbi_hart_pmp_fence();
+	sbi_hart_pmp_fence_all();
 	return 0;
 }
 
diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index 7330df9f..d5564d35 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -347,7 +347,7 @@ static int eswin_eic7700_pmp_configure(struct sbi_scratch *scratch)
 	while (pmp_idx < pmp_max)
 		pmp_disable(pmp_idx++);
 
-	sbi_hart_pmp_fence();
+	sbi_hart_pmp_fence_all();
 	return 0;
 no_more_pmp:
 	sbi_printf("%s: insufficient PMP entries\n", __func__);
-- 
2.50.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
