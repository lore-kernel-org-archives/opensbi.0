Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D17ECA0EE4
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 14:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJ8vYtmazi4p50vcnOM8qwIGFDPMkea14Ic0FmB40vE=; b=SsI0TEb9q1PYsF
	M+xwH1yrYu02uP99hhH6PJLRxJFDV5iPwjdJhY8N0cr3l4FnLPHg2ucZE/MIcj4PjHLs6LfYXzko8
	4VjSl/0T5w5WefTJRtx60jHYCSyQhrXA/SNC6zPjuccbHa9uM0b1KPmZDCw3goA8F5RLCW2QZrOvo
	2GBxWSE7sduURGQpzx3sHdaD1/uQCZENDWCE1recKYf4kp0Dig2UlVaZOlnS4VYxpgffqTGdvvb0p
	4/G4IbNDamN6F9ZSq0I/ENPTZjLWdveSHgdynEAbN6autDqnCPXSJOlFn0b3ocsG7zGuYBFxSr4VW
	kRDC+sGByTjv+QF5MXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYl9-0000000HDCn-3YqL;
	Thu, 14 Aug 2025 14:16:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVly-0000000Gi24-2BQE
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:05:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-244582738b5so6490095ad.3
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169529; x=1755774329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDfQUdWmSC8hmiBcPW+er2yJCWoqPj2LkuOoHp15fNQ=;
        b=SaCBvpJsCc/69AfSvwBgpm2+syrZrRNISNlE806XOLwbj3Z0EBspv6+5Mt6+xlJ6+1
         h64nShA72wNQ40WMZLBjsi378kCPS6A5C2AOsKRUaphEyd6EhE6378zxv5QCt3BRTQXw
         nub+z8+gwLkjKWQZa75VYpDuXCjV6yPfXP2jMXJsatBvVQyCFBcrKpCgicMTT/GMOEmW
         hLkUrWfoDCdhftmIQQ/nCNE6yZe+8hV5APbxDDubrgK4gfvm7jGn5vHsn04ClCklvTRd
         JKg9lNUsBK2YNNig0TCDguGxCaqr4wmIN22xrDkFtyWKFlJlGbaJw02l/yPgTicSns0k
         bM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169529; x=1755774329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDfQUdWmSC8hmiBcPW+er2yJCWoqPj2LkuOoHp15fNQ=;
        b=lkIlxSPM4VOQDInTrERGpmI3cDAuCWsiKGAkBwIXUMb6/hVUAGBakGwW6CMlOQFFtt
         MrNZfT1wktrk6nX+6kgQixVMkDceit3Muaj3kCPJ+mtC14H8u2bWUZgvg1g/QEa5Zops
         PEJVS08DmrBkV+dt5IGAXzlL7HBf5TweWEDrX+Jt9khEUUMbC/L3ZhpDMK9cq1EYTEpP
         zKSlKfMePGoEUYsoDxQBN+xPGKyDu4S+pvcElUEDzzyz+7F3X0OKiYwS3YAWgfpJvvnK
         j7tCg17MnN/XvHwFmuX3NBe1l1vnGbzGLHbK4/7KBHxgsVJJ47HV1wV46Y+pv92Y/Exf
         Oovw==
X-Gm-Message-State: AOJu0YzSMmprKDAapnFwRAc3ptTs3AiJaZIkGqugs1AYuMB0zF7OHj/V
	65RKY3yzctLwPofI94PgWKuEgWbHNOLfLTBNHvKHuXpJw/JxU8kcqpiFMAiBklYVBknjvauuHyK
	VpXw5Uw3lK0M/RPZRRA7onOwRs6sipW3bVcKFaLAl0LAsOfQExnFvxxZ8lnhSpfpzlRNk1GIT04
	tKAkMbseR5IghLfNXFGMTvg9CMCyp6tmGZ9Ajs9QSP5LVA5G0nM4fipA==
X-Gm-Gg: ASbGncteV7U4JCbx1K7BUHtoge+8I2k9IH3zNI1RuTiQVIDRdUldXuZGfS9cndE0JTN
	nEpKR/PBxB1waGq0jHB1vQwQzOa+mqBHFXsdG6a2agWRTdHYQh78SNhN3+MaKKxXQOvZ4qAulID
	hRVMc730Clc8cjJVp7nvuRXLT5tFpeEuPc2PG1/Wf1IoSUvp5kcFsmyuJyLmWZDdhvtKMVabvkG
	NwC/zJaca1NVSMyQwFVDNmBJsEO838t7ebvBVo68q8LbKu8Aaaxfukaf87rQY9ccOta9ytxu++p
	NUN5Jal9q5d/bPeODQf36YEuVzZxEFZ9Vmmu3cfsPHsiE0cWy/l7WPMGisjf/eOUHI6hxFuIDkg
	sHdTs/dTJsGFaRFkVaDoWvsUrx515XfD4Kxotrpot7FEDfZE=
X-Google-Smtp-Source: AGHT+IGbyXj6Ft1NSpm5rvGDMVqTRyflwL45Fe9G1VpAUd990bpLd5U4+qSowFuqaHzmsnTX7Bxibw==
X-Received: by 2002:a17:903:32c1:b0:23f:df56:c74c with SMTP id d9443c01a7336-244584da738mr32718985ad.14.1755169529183;
        Thu, 14 Aug 2025 04:05:29 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4683722179sm9624755a12.13.2025.08.14.04.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:05:28 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	alvinga@andestech.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 1/8] lib: sbi_hart: move sbi_hart_get_smepmp_flags() to sbi_domain
Date: Thu, 14 Aug 2025 19:05:15 +0800
Message-ID: <20250814110522.18809-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250814110522.18809-1-peter.lin@sifive.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_040530_558876_5A975851 
X-CRM114-Status: GOOD (  17.73  )
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

Move sbi_hart_get_smepmp_flags() from sbi_hart.c to sbi_domain.c and
rename it to sbi_domain_get_smepmp_flags() to better reflect its
purpose of converting domain memory region flags to PMP configuration.

The function's original parameters (scratch and dom) were unused, so
this refactoring also makes the function cleaner.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_domain.h |  7 +++++
 lib/sbi/sbi_domain.c     | 58 ++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c       | 67 ++--------------------------------------
 3 files changed, 67 insertions(+), 65 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index e9cff0b1..8a51f289 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -249,6 +249,13 @@ void sbi_domain_memregion_init(unsigned long addr,
 				unsigned long flags,
 				struct sbi_domain_memregion *reg);
 
+/*
+ * Returns Smepmp pmpcfg.LRWX encoding for a given region flag.
+ *
+ * @param reg pointer to memory region with flags encoded with permissions
+ */
+unsigned int sbi_domain_get_smepmp_flags(struct sbi_domain_memregion *reg);
+
 /**
  * Check whether we can access specified address for given mode and
  * memory region flags under a domain
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 461c7e53..1fa56b6a 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -122,6 +122,64 @@ void sbi_domain_memregion_init(unsigned long addr,
 	}
 }
 
+unsigned int sbi_domain_get_smepmp_flags(struct sbi_domain_memregion *reg)
+{
+	unsigned int pmp_flags = 0;
+
+	if (SBI_DOMAIN_MEMREGION_IS_SHARED(reg->flags)) {
+		/* Read only for both M and SU modes */
+		if (SBI_DOMAIN_MEMREGION_IS_SUR_MR(reg->flags))
+			pmp_flags = (PMP_L | PMP_R | PMP_W | PMP_X);
+
+		/* Execute for SU but Read/Execute for M mode */
+		else if (SBI_DOMAIN_MEMREGION_IS_SUX_MRX(reg->flags))
+			/* locked region */
+			pmp_flags = (PMP_L | PMP_W | PMP_X);
+
+		/* Execute only for both M and SU modes */
+		else if (SBI_DOMAIN_MEMREGION_IS_SUX_MX(reg->flags))
+			pmp_flags = (PMP_L | PMP_W);
+
+		/* Read/Write for both M and SU modes */
+		else if (SBI_DOMAIN_MEMREGION_IS_SURW_MRW(reg->flags))
+			pmp_flags = (PMP_W | PMP_X);
+
+		/* Read only for SU mode but Read/Write for M mode */
+		else if (SBI_DOMAIN_MEMREGION_IS_SUR_MRW(reg->flags))
+			pmp_flags = (PMP_W);
+	} else if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+		/*
+		 * When smepmp is supported and used, M region cannot have RWX
+		 * permissions on any region.
+		 */
+		if ((reg->flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK)
+		    == SBI_DOMAIN_MEMREGION_M_RWX) {
+			sbi_printf("%s: M-mode only regions cannot have"
+				   "RWX permissions\n", __func__);
+			return 0;
+		}
+
+		/* M-mode only access regions are always locked */
+		pmp_flags |= PMP_L;
+
+		if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
+			pmp_flags |= PMP_R;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
+			pmp_flags |= PMP_W;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+			pmp_flags |= PMP_X;
+	} else if (SBI_DOMAIN_MEMREGION_SU_ONLY_ACCESS(reg->flags)) {
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+			pmp_flags |= PMP_R;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+			pmp_flags |= PMP_W;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+			pmp_flags |= PMP_X;
+	}
+
+	return pmp_flags;
+}
+
 bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			   unsigned long addr, unsigned long mode,
 			   unsigned long access_flags)
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6a2d7d6f..c5c3ecb4 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -301,69 +301,6 @@ unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
 	return hfeatures->mhpm_bits;
 }
 
-/*
- * Returns Smepmp flags for a given domain and region based on permissions.
- */
-static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
-					      struct sbi_domain *dom,
-					      struct sbi_domain_memregion *reg)
-{
-	unsigned int pmp_flags = 0;
-
-	if (SBI_DOMAIN_MEMREGION_IS_SHARED(reg->flags)) {
-		/* Read only for both M and SU modes */
-		if (SBI_DOMAIN_MEMREGION_IS_SUR_MR(reg->flags))
-			pmp_flags = (PMP_L | PMP_R | PMP_W | PMP_X);
-
-		/* Execute for SU but Read/Execute for M mode */
-		else if (SBI_DOMAIN_MEMREGION_IS_SUX_MRX(reg->flags))
-			/* locked region */
-			pmp_flags = (PMP_L | PMP_W | PMP_X);
-
-		/* Execute only for both M and SU modes */
-		else if (SBI_DOMAIN_MEMREGION_IS_SUX_MX(reg->flags))
-			pmp_flags = (PMP_L | PMP_W);
-
-		/* Read/Write for both M and SU modes */
-		else if (SBI_DOMAIN_MEMREGION_IS_SURW_MRW(reg->flags))
-			pmp_flags = (PMP_W | PMP_X);
-
-		/* Read only for SU mode but Read/Write for M mode */
-		else if (SBI_DOMAIN_MEMREGION_IS_SUR_MRW(reg->flags))
-			pmp_flags = (PMP_W);
-	} else if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
-		/*
-		 * When smepmp is supported and used, M region cannot have RWX
-		 * permissions on any region.
-		 */
-		if ((reg->flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK)
-		    == SBI_DOMAIN_MEMREGION_M_RWX) {
-			sbi_printf("%s: M-mode only regions cannot have"
-				   "RWX permissions\n", __func__);
-			return 0;
-		}
-
-		/* M-mode only access regions are always locked */
-		pmp_flags |= PMP_L;
-
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
-			pmp_flags |= PMP_R;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
-			pmp_flags |= PMP_W;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
-			pmp_flags |= PMP_X;
-	} else if (SBI_DOMAIN_MEMREGION_SU_ONLY_ACCESS(reg->flags)) {
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
-			pmp_flags |= PMP_R;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
-			pmp_flags |= PMP_W;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
-			pmp_flags |= PMP_X;
-	}
-
-	return pmp_flags;
-}
-
 static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				struct sbi_domain *dom,
 				struct sbi_domain_memregion *reg,
@@ -420,7 +357,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 			continue;
 		}
 
-		pmp_flags = sbi_hart_get_smepmp_flags(scratch, dom, reg);
+		pmp_flags = sbi_domain_get_smepmp_flags(reg);
 		if (!pmp_flags)
 			return 0;
 
@@ -446,7 +383,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 			continue;
 		}
 
-		pmp_flags = sbi_hart_get_smepmp_flags(scratch, dom, reg);
+		pmp_flags = sbi_domain_get_smepmp_flags(reg);
 		if (!pmp_flags)
 			return 0;
 
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
