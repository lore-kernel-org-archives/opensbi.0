Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF599CCD185
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oL2VbGegrovv82qUHLyybAabp8sUI26oj7t2KwSJ7lA=; b=mlWPzCfDeLEscY
	gz5s8D6CipT1vZXhnKCDq+B6R10NALbG1tG03WB4Og7bHt/RDT3dzB/1mHvyLm7SlTxOZrIaoIKzS
	PtF+EJhmMiFmDA8OZqVxl865Fxh3zbB1LE0Fmuv4i9evhIe7bsAWqHj3cRI86e0xReL3GDLbsWSNR
	7JNgAeT6rXfTY+wkLc+1E/z7PrCRNSEp8knO+4TQNbU/2cT7IjtIBss+iWDycgLE4Sf0E6Y+N7OV0
	df3oSvHBAJN0uUx6IPeQa53iJ+6WbZgj4P8/4ZRnCIYbutAYREW0TYJWrnrD/+ijCi6RSjW97rilM
	MdcAAkxcoXdHM/Wlqb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnH-00000003UaG-3auZ;
	Wed, 08 Oct 2025 08:45:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnE-00000003UWU-3BGQ
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 08:45:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-279e2554b5fso5585125ad.1
        for <opensbi@lists.infradead.org>; Wed, 08 Oct 2025 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759913104; x=1760517904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mv5rAxzj4VCmywQWfexQ3kIXzqoimDhGwEwee4N1hBI=;
        b=fHckr4m1keTFCeD5FhoTYrqlMbW/E0YqarLVOdVOqCA5uk7OgM1jfiubYYyn8estdI
         ZswhPdjgdya5du2dPlxchVZUTPAr4NY2MZQLvCcgIJIJzJgh5H3E2kuSzns+IfSdgqb/
         4qNrgV1+8iDXBkzrWcoHlHkb3xki82jWhKoTo2rTOHikvBWZFMJ1SKuCKHxrVSKZyV+H
         +locODjrqHDcZQ1Wg8EYHLcBCDdJQt7+cXTfqMPiBVHg98CLZiPi1vKZHfVRceQJ6JO2
         vau+tXzurNI5eqh8myBfP+x0HMfz1YGKmCtGnWwHpOkE8SOUdoUFlC4XPDMVwX6zt+3A
         F+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913104; x=1760517904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mv5rAxzj4VCmywQWfexQ3kIXzqoimDhGwEwee4N1hBI=;
        b=LgeAn0E0+xCqCef0rkhtwv9d/q9+Jnu6mohtF318gIepLWgWW6sG0GeMJ/rGPSVuD1
         lqtlXoMOgFALWjD65uIwRJu8ngXew15om/VqLnGZTzcR1j3KNqZKT9hjf+9cvnqVySgP
         iFpHy6tCNsAbPQLh0e2B9tUQREBN1tqjeFcWtD7MenicraOUAiEDYfq+pBc+41G82Wyn
         pNvMU43WaY+3HVIRJ9CUkPCH5wk1vdpv77vSUPHJ4h7hatwLCi9rldH59hBVwgBf+Ol2
         2my4FqYntlrawTYOB9mzZfVtd460bYKZE8nQSOKXsnMM0E70ZxXCGhERa4NmPh7cH/LZ
         K21g==
X-Gm-Message-State: AOJu0YyC4fOeBrOfXpN5Yc3IYUAw4kh4KjMg8/7jmNNUHoUkIaAIGa5Z
	oEvnh+7YeGUeTna6pPYvofsWAz5LeyAaFjacDEItC/CDG3na7WVkqNkHJUiBMmCKON+RqETVkq8
	DOWcDj/QkLgNEGIOLo5whrFYj1eNCvK4+kmVCVkl8URFOgSUN1LDQtqrww3Xrqljm00It+RUisX
	o0v5JdycmdbZy2KGY+mMXm8nrmxBV5M9fEWvY/QMs7E8v8SQZ76Yo=
X-Gm-Gg: ASbGncszmY3dnV/COZeXkrn2TgPODJwv38/rqXLTuGkm+PwThRAnUGe7Swi/tEyvems
	rZEVgbyNlg63x8aRe77auWnjo0qImmGucp14aPYDws5M+R/Rf3SxxeXX5t8N3CY80tn7m9LJRxy
	NRHnFNyUeyBLQjw2bCuEmv9++F5gn8WesFdCeARz5mZyxaaYCblMHvDMpPt0Os0OLmlhDf24F6G
	d8dCa0GljXLOejSzohma5mPUc7u3lAn3sJVBN6l51J+sZ3eIM2IqC7s+YO/UJPb+6LXHb9nINmO
	+Ug2LuU6ck937+fy3XI3lcXkFZK1JxC9B/5BIyRXJE0LLTugS7swHb4yVMmBhqskYSE4A20Wpbq
	dHxMt7MKjzZoHyQqGDVK/x07P6nQXq0s+cbHGT8KuD7CDyCd/ej2RAlQR9ESfxrW0auBxSnSYrQ
	1QsqMYbIAKKTtPvSQeVJ873aM4Hmo/1/gZQp28h8mxa16BWsAFi3HsCGLJ
X-Google-Smtp-Source: AGHT+IElKF/10HFolUpK4IBGldtKsRFCqIb0ed0onDEvxQej6Y/6eo8RcprkwWlvI9J09CQ5UGyYrw==
X-Received: by 2002:a17:902:f788:b0:274:506d:7fcc with SMTP id d9443c01a7336-28ec9c0c7e1mr92640695ad.6.1759913103616;
        Wed, 08 Oct 2025 01:45:03 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ecaefd60fsm51327255ad.93.2025.10.08.01.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:45:03 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	alvinga@andestech.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 7/8] lib: sbi: sbi_hart: track firmware PMP entries when configuring SmePMP
Date: Wed,  8 Oct 2025 16:44:43 +0800
Message-ID: <20251008084444.3525615-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008084444.3525615-1-peter.lin@sifive.com>
References: <20251008084444.3525615-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014504_800471_11AC06AC 
X-CRM114-Status: GOOD (  12.92  )
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

Add fw_smepmp_ids bitmap to track PMP entries that protect firmware
regions. Allow us to preserve these critical entries across domain
transitions and check inconsistent firmware entry allocation.

Also add sbi_hart_pmp_is_fw_region() helper function to query
whether a given PMP entry protects firmware regions.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_hart.h |  1 +
 lib/sbi/sbi_hart.c     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 82b19dcf..6db4fed7 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -142,6 +142,7 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
+bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
 int sbi_hart_map_saddr(unsigned long base, unsigned long size);
 int sbi_hart_unmap_saddr(void);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 032f7dc1..abab8b73 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -30,6 +30,8 @@ extern void __sbi_expected_trap_hext(void);
 void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
 
 static unsigned long hart_features_offset;
+static DECLARE_BITMAP(fw_smepmp_ids, PMP_COUNT);
+static bool fw_smepmp_ids_inited;
 
 static void mstatus_init(struct sbi_scratch *scratch)
 {
@@ -301,6 +303,17 @@ unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
 	return hfeatures->mhpm_bits;
 }
 
+bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx)
+{
+	if (!fw_smepmp_ids_inited) {
+		sbi_printf("%s: ERR: fw_smepmp_ids uninitialized\n",
+			   __func__);
+		return false;
+	}
+
+	return bitmap_test(fw_smepmp_ids, pmp_idx) ? true : false;
+}
+
 static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				struct sbi_domain *dom,
 				struct sbi_domain_memregion *reg,
@@ -367,12 +380,32 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 			continue;
 		}
 
+		/*
+		 * Track firmware PMP entries to preserve them during
+		 * domain switches. Under SmePMP, M-mode requires
+		 * explicit PMP entries to access firmware code/data.
+		 * These entries must remain enabled across domain
+		 * context switches to prevent M-mode access faults.
+		 */
+		if (SBI_DOMAIN_MEMREGION_IS_FIRMWARE(reg->flags)) {
+			if (fw_smepmp_ids_inited) {
+				/* Check inconsistent firmware region */
+				if (!sbi_hart_smepmp_is_fw_region(pmp_idx))
+					return SBI_EINVAL;
+			} else {
+				bitmap_set(fw_smepmp_ids, pmp_idx, 1);
+			}
+		}
+
 		pmp_flags = sbi_domain_get_smepmp_flags(reg);
 
 		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
 				    pmp_log2gran, pmp_addr_max);
+
 	}
 
+	fw_smepmp_ids_inited = true;
+
 	/* Set the MML to enforce new encoding */
 	csr_set(CSR_MSECCFG, MSECCFG_MML);
 
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
