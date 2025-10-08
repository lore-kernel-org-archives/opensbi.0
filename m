Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50008CCD186
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzOv/FRzOttDnyKRJQOz4LlhhTvjRlCp6++sW5ltqHY=; b=UjvC0zSFnki4ST
	3xaKXaqycEsCrwPpJEbqahWGwLmNw8TbLalNELR7lJjX1Hbl4OuPcj6p0EwuL8sNCF3M/GkkcoXct
	jklwS9tWVIEGtXhJ7L6wQiW5lrfx4UT8cd/MbepM1K8DUmBzpsqIWIEpDQn/6CrZ+/6Y4aEjoleLf
	BO/m145s4CdBiSlEzeQpRpcOsh35m/wSVGXOjN19wWpzbVodFBa6uzhBAUMjYDtYoaYsUtGENb+mj
	rXHkNG1GChBYX3d3bnfyqw+s39V/wXLttr5UDPyAXzAbCRZXaL57Y5QJOaoc5XsC/v2dWyePCVa0K
	YE5cagBkts9IEJYUR4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnC-00000003UUo-2pbq;
	Wed, 08 Oct 2025 08:45:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pn9-00000003URh-1knN
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 08:45:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-269639879c3so66030105ad.2
        for <opensbi@lists.infradead.org>; Wed, 08 Oct 2025 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759913098; x=1760517898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SctYrUpkixmBlorK/EcysuiSLEwDoZu2CpGMbkwEFOk=;
        b=G9Mw93yGb/QfhN7/0s7PRLnLkHevA5Sp0MNUEbSF6aQ9khQt/5D64pKU3AMtodd7Zs
         fXccfQE+kHKtH//MhMmuV3bfZMlg+YOKaXiPlWbpNQ+h+2DTUywy3dTJEnB06NgvfQoM
         4DyzWeKvI+GLtPyOdwvglQaNW1o1AGRC9bDe7w7HO/hEsFfpk37PjpapjrXMGCH4ctV+
         ZvGp/X2go+xW+fhklEUXdZngYB2C/UPdCsnmYjhAoPpmmNQVqzP3QFv+8VrZ9/FxzbVj
         1MP2g6PcypkpieG+C7C7L3BQ7pcVrr6GE+IU8w2qBTz/WTTYMwbANvW5w+I6lhuR5fzc
         cr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913098; x=1760517898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SctYrUpkixmBlorK/EcysuiSLEwDoZu2CpGMbkwEFOk=;
        b=AN47IKxwIbByfg3GECbEtFmq3dajloT8YgnHGFrvV9Oqcn/5zjN48t1xyLMm+lz2sH
         YSx0jmwUYtAG1rzV/1MgTea0FckEgvZAt3YG74AZQs92bxL1SaAuSryI2chPQl7yV1lD
         QMTnkBlZ6YUqSL8XOaDbcLXld+Wr7Q0gvgcfdrBdVGuuawHrKcjxCJRhJHxC6F9cvR41
         GoQv0ZRKV6ayy9PAdXTtxYLPJ9BPk5u7Y55yzWGXJDCkxkpsrWCKmW9nnHs8IO8EtCTv
         DdPVDDSa/StMkXC7Tk/HXvKVkyxJvuTfz/5d7Tzc9AjGx9ao2WujjQ5SDk8Mnh21mwUO
         J5NA==
X-Gm-Message-State: AOJu0YxIdEsHIFdFtaPNlJPf7MEBMkuKyeTT5zS5AvddDVkyAM2/13RZ
	gVtQPoJpEP54Givcu+s3V9audcqaqW30G2ngN3bpexqj1MGqQ+NjaMu22Nm2Cw2u9FH1p5OucXv
	HiNfLX415Ct/gDNIvb3q83yrAyUUPP4EF4TV6CAGSpM+aykhRkyxafJ7DNkJljsXdl3gnS9RZmR
	HxA2dx+c/Fcq52+J19SMY2lGZ8BJnKSzpke0gvuC1so4xmsAxiQNo=
X-Gm-Gg: ASbGncsCICQRGyqTsi5l8mNsRfDH3UKTqAR14o38VzMwehi2alFGhWUkfPtW6iFZ2h2
	UehUEMiYpOrW/YUSedTIgWDW/sm2e5L0WFm8VagxPRcVC+DZdz+efP5vqE9d1rHF9zlUDscZQlQ
	H3nIWsP3sWot7J9SJYXhZNCmHIMgelyn1zqh9X7+OyjFyyj2cJz8e0FOVY+EJD+W5dZdTVej3gL
	6xtT1/aroeGh9xKDYdOlZwmoc8tQYSvlmhLp+VecarMPgawFV4clvZ4B8ssqwxMJjE6QgOEHuTG
	+XXvtcM3IzMMvXA6DQDJaAWUACCer5/PcnncSVqhfUQspssaUIuafLqcg2V/Y0KmXgEJS41Yf8l
	Lbqcl65G9Mn/oWPvJKgvFMQ2ZGZBmXYksgweaSiAPRVRENNJMrAVEeCpMhdcBG0P3fUUTDe80Sy
	aRfm9dlKdnCDB1ZapwNQQ0Z9z7aejrMIj4OszmOC9duAD+zExRp0qF3NQp
X-Google-Smtp-Source: AGHT+IEh2PlIYSo7/oFN/QzaWlou+Qnct6uDMdjuIhwHe0NPV6B5qnf1AnAZuZkAkzeaSAb6BwkSdA==
X-Received: by 2002:a17:903:1b0b:b0:269:91b2:e9d6 with SMTP id d9443c01a7336-29027402c3cmr35282335ad.46.1759913098287;
        Wed, 08 Oct 2025 01:44:58 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ecaefd60fsm51327255ad.93.2025.10.08.01.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:44:57 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	alvinga@andestech.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 4/8] lib: sbi_hart: return error when insufficient PMP entries available
Date: Wed,  8 Oct 2025 16:44:40 +0800
Message-ID: <20251008084444.3525615-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008084444.3525615-1-peter.lin@sifive.com>
References: <20251008084444.3525615-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014459_459165_E431A883 
X-CRM114-Status: GOOD (  12.06  )
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

Previously, when memory regions exceed available PMP entries,
some regions were silently ignored. If the last entry that covers
the full 64-bit address space is not added to a domain, the next
stage S-mode software won't have permission to access and fetch
instructions from its memory. So return early with error message
to catch such situation.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_hart.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d018619b..032f7dc1 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -324,6 +324,16 @@ static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 	}
 }
 
+static bool is_valid_pmp_idx(unsigned int pmp_count, unsigned int pmp_idx)
+{
+	if (pmp_count > pmp_idx)
+		return true;
+
+	sbi_printf("ERR: insufficient PMP entries\n");
+
+	return false;
+}
+
 static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 				     unsigned int pmp_count,
 				     unsigned int pmp_log2gran,
@@ -348,8 +358,8 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 		/* Skip reserved entry */
 		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
 			pmp_idx++;
-		if (pmp_count <= pmp_idx)
-			break;
+		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
+			return SBI_EFAIL;
 
 		/* Skip shared and SU-only regions */
 		if (!SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
@@ -372,8 +382,8 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 		/* Skip reserved entry */
 		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
 			pmp_idx++;
-		if (pmp_count <= pmp_idx)
-			break;
+		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
+			return SBI_EFAIL;
 
 		/* Skip M-only regions */
 		if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
@@ -407,8 +417,8 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 	unsigned long pmp_addr;
 
 	sbi_domain_for_each_memregion(dom, reg) {
-		if (pmp_count <= pmp_idx)
-			break;
+		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
+			return SBI_EFAIL;
 
 		pmp_flags = 0;
 
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
