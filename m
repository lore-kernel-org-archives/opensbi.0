Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77524CCF9E3
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 03:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Pfzmb3vRImujuz5T21kQZKlZ8q66BLIcmiar/OP2jY=; b=W90tpEu3dab29b
	2Q3ys05wiqwI+C5MHSrhNwGCENFOvYmc+ANr0pSu2P/USBBmsbkjh0+U46bD8cSiJaCYV8w0ZqlMW
	7a2O/bOFhqJ7v7VSm99G5Pci2WHxb7RCBMcYzTTPCbIcvICy9K9+KZ1Dc7TuZcAcrHQt8Pwj8pNlV
	mpsSvzW6W2SpSvHQapuGePuatylGag3BzlXgabmZBudrXCXWsmsFTJIUDv/Jh/OIOL5/p8OBcUbFt
	R/3it+Cu09wZt57/0BE5acNyjikQNl1dIfGkY9kv/JiHog2cYEIltlzLlQb9B//v1wfWN5t78w8UE
	p9EIpBIRFvDRcHsA+Yyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHJ-00000006SNd-1cBf;
	Tue, 11 Nov 2025 03:42:45 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHH-00000006SMP-04UJ
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 03:42:44 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3438231df5fso2335846a91.2
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 19:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762832561; x=1763437361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxhMMXh+PnnoDUpNv46GKdaps2PVncOtr+qOqd1JwA0=;
        b=kGNPTFNS9YgvVet7klto7RbDzOM5YWRp7u/o8HfM8YDEnfSYZKKcDx8TcSRyUXTkWv
         Dco+i495P0eLgqHG1DmLWODkTBTRGDtbaTj6ARNh/ilvbl1Sl/6rFtju+PbwAghvsoWc
         NW0jhv39f1du0jgsItj9+4kIK3cRYvIk1lfXFPhCSEADzwic3EVaCHw8TlzoV6/aG4Un
         hnpX2y99Qi61L8zcbC4Kyf5zcFOAEHof+/eFSKvplRUrxI0l6ZNseL+48FXVobAjB/vu
         6eHAv17hgZv8DDLjVOD42IXF+gu0f7Gu+gE3RhuRcSYqPdVgEa8DWgFFUgnpclDS8Q1u
         +vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762832561; x=1763437361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxhMMXh+PnnoDUpNv46GKdaps2PVncOtr+qOqd1JwA0=;
        b=rVmjcif8few2uWQL+lkBurp4ZVEWkk4y97YIf8ymfQSSHynK9PTK9DyPqNitowoawR
         t4rpqiEk6hNNDUBGxubHSESW6+WBAJ1QIRGxkcBOCf4UwAsVDEwb7TH2d5JWuW2Of9AG
         mterkYK5ZQQqd73zB9OKoYRVIR7X7aL0dxnKUyNb20u0sDiGEBsg3aAa36c7EEqP4GD0
         MEU06+fPUc6Yx3wzIBEH+b+ePU3hMVwbsE7bchoUjrE//5nI/VpY9J4qIaEvdC1uzyIr
         njToFXiH2JAt6z0I3+xRcvhswAdDtJ4XSeBIgpbJP39j+i3sYDifUTiljnJCGrf+ZAtN
         kGAA==
X-Gm-Message-State: AOJu0YwX/VLiZvKNLdod9yYoUiih0YU+28kdiGWGSNbujL4wnkhHMNFL
	js0zM+8D6Oy/RWyMh2nkUqJVIq71QhdWDRw+VCl3RPIHBl1QL10JGAOGxpN6Ig==
X-Gm-Gg: ASbGncvVSvf9j+QV7pyco4UarKIrqM7TzRqDaQCcmQqtltlCwCQ7m5UUj0bQ6i5+aRV
	sdnH3lsMCe9pkJU616oE+H6mglrtty0jLX7nQY2lEQ19Ikyjq6LKJrg9VbTSTtuQBN/5pNzZIhV
	DCWdFxoGzwa++0Rf725FjI8AZJVUM/LhHjpainUNvpzPlesQwFJqsyxvLPbbrom5urIhEMfv3WW
	0Wa25E43A5ukpehoyBz4Bga6ERsr24PKFdB8CvRxzKIfXGts9/fDRYUz4bvU4zVBiR9JGcnX4zK
	rlZb9dDYoMfH211rpoCUwx2ynFOU6CGNbMDStC/39HMpGAp9zLyy18SGgFZD+o1zDH9re0otnY4
	kM+P1TwhIi//KTDMZfv9UPxxjp7F2QclbY4/28ElJl3YYoTfykkQD/HXbkObWzjpEuONVI/44bh
	OxH2RnWcf64nX7
X-Google-Smtp-Source: AGHT+IEu9R3ZHIzlpjcc4ZyqlvZrpdcG+odg1HwrB43uO8WHT2qJrRFcaakPfkSlaJfpq7DT444QNQ==
X-Received: by 2002:a17:90b:254b:b0:341:88c1:6a7d with SMTP id 98e67ed59e1d1-3436cbb3db9mr11917622a91.18.1762832561578;
        Mon, 10 Nov 2025 19:42:41 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68bf37bsm19434060a91.7.2025.11.10.19.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 19:42:41 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org
Subject: [PATCH 1/3] lib: sbi: allow platform to override PMP configuration
Date: Mon, 10 Nov 2025 19:41:09 -0800
Message-Id: <20251111034111.43973-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111034111.43973-1-ganboing@gmail.com>
References: <20251111034111.43973-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_194243_066399_8D2E0EC2 
X-CRM114-Status: GOOD (  17.39  )
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

Platform sometimes wants to override the entire PMP configuration phase,
not just performing additional work for each individual PMP entry. This
allows platforms to insert SoC/core specific PMP entries in a way that
works together with the existing ones set by lib/ code, not conflicting.
platform can also choose to merge or skip memory regions in a reasonable
way in case there's a shortage of PMP entries.

In addition, `sbi_hart_oldpmp_configure` is made public and a callback
function `skip` is added, so platform code can built on top of it to
simplify PMP configuration override.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_hart.h     |  9 +++++++++
 include/sbi/sbi_platform.h | 33 +++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c         | 27 +++++++++++++++++++--------
 3 files changed, 61 insertions(+), 8 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index e66dd52f..e5a221bd 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -133,6 +133,7 @@ struct sbi_hart_features {
 };
 
 struct sbi_scratch;
+struct sbi_domain_memregion;
 
 int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
@@ -148,6 +149,14 @@ unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
 bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
+int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
+			      unsigned int pmp_start,
+			      unsigned int pmp_count,
+			      unsigned int pmp_log2gran,
+			      unsigned long pmp_addr_max,
+			      bool (*skip)(struct sbi_domain_memregion *reg,
+					   void *data),
+			      void *data);
 int sbi_hart_map_saddr(unsigned long base, unsigned long size);
 int sbi_hart_unmap_saddr(void);
 int sbi_hart_priv_version(struct sbi_scratch *scratch);
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index d75c12de..c6fc137f 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -146,6 +146,11 @@ struct sbi_platform_operations {
 			unsigned long log2len);
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
+
+	/** platform pmp configure override on current HART */
+	int (*pmp_configure)(unsigned int pmp_count,
+			     unsigned int pmp_log2gran,
+			     unsigned long pmp_addr_max);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
@@ -666,6 +671,34 @@ static inline void sbi_platform_pmp_disable(const struct sbi_platform *plat,
 		sbi_platform_ops(plat)->pmp_disable(n);
 }
 
+/**
+ * Check if platform wants to override PMP configuration
+ *
+ * @param plat pointer to struct sbi_platform
+ */
+static inline bool sbi_platform_pmp_override(const struct sbi_platform *plat)
+{
+	return plat && sbi_platform_ops(plat)->pmp_configure;
+}
+
+/**
+ * Platform PMP configuration override
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param pmp_count number of PMP entries
+ * @param pmp_log2gran PMP granularity
+ * @param pmp_addr_max largest value pmpaddr(x) can hold
+ */
+static inline int sbi_platform_pmp_configure(const struct sbi_platform *plat,
+					     unsigned int pmp_count,
+					     unsigned int pmp_log2gran,
+					     unsigned long pmp_addr_max)
+{
+	return sbi_platform_ops(plat)->pmp_configure(pmp_count,
+						     pmp_log2gran,
+						     pmp_addr_max);
+}
+
 #endif
 
 #endif
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index a91703b4..4425f36b 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -433,18 +433,24 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	return 0;
 }
 
-static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
-				     unsigned int pmp_count,
-				     unsigned int pmp_log2gran,
-				     unsigned long pmp_addr_max)
+int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
+			      unsigned int pmp_start,
+			      unsigned int pmp_count,
+			      unsigned int pmp_log2gran,
+			      unsigned long pmp_addr_max,
+			      bool (*skip)(struct sbi_domain_memregion *reg,
+					   void *data),
+			      void *data)
 {
 	struct sbi_domain_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	unsigned int pmp_idx = 0;
+	unsigned int pmp_idx = pmp_start;
 	unsigned int pmp_flags;
 	unsigned long pmp_addr;
 
 	sbi_domain_for_each_memregion(dom, reg) {
+		if (skip && skip(reg, data))
+			continue;
 		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
 			return SBI_EFAIL;
 
@@ -534,6 +540,7 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 	unsigned int pmp_bits, pmp_log2gran;
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 	unsigned long pmp_addr_max;
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (!pmp_count)
 		return 0;
@@ -542,12 +549,16 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
 	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
 
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
+	if (sbi_platform_pmp_override(plat))
+		rc = sbi_platform_pmp_configure(plat, pmp_count,
+						pmp_log2gran, pmp_addr_max);
+	else if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		rc = sbi_hart_smepmp_configure(scratch, pmp_count,
 						pmp_log2gran, pmp_addr_max);
 	else
-		rc = sbi_hart_oldpmp_configure(scratch, pmp_count,
-						pmp_log2gran, pmp_addr_max);
+		rc = sbi_hart_oldpmp_configure(scratch, 0, pmp_count,
+						pmp_log2gran, pmp_addr_max,
+						NULL, NULL);
 
 	/*
 	 * As per section 3.7.2 of privileged specification v1.12,
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
