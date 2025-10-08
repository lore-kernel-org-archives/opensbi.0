Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A2DCAC5BB
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9SjYS1zY72kSolI+Q195d3cGy8S22fWIRMzvmwQbdk=; b=BM6GDWx5mP4aOS
	UJ6cxk2EfBH3eo4KjdS1U4TSMii6Dj3hQcj6SXevROH3rZywE0nkHNzJlGr5JTLHr15MPu8ojFvyf
	rzjI91c2N2W8TmuWTUt/SoWLe7Z+0Nf8/6PEr3IF0+cb+epF102sZwTNS3ZMUjoEFMJUfl9V56/xg
	PtwYQLDqs32IivhSNhEMKVl4of/SfUxaCola3noohDwgcK3Ek/uCbkLVyUwe6Of889ds8I3qQKHpT
	GABnQbl25GLR4O/kcWWBeNYU2aLkRooVgWx2lpeEmGNTMalZ8ko6/t3acueQ01HwTl4EnogJ7yyw3
	zq6dWAMDy/INcuCYvjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pn6-00000003UQG-2C8p;
	Wed, 08 Oct 2025 08:44:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pn3-00000003UPI-30IC
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 08:44:54 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-279e2554c8fso71001605ad.2
        for <opensbi@lists.infradead.org>; Wed, 08 Oct 2025 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759913093; x=1760517893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlRdAREeCzctmFFARIp9AmoWh2JDsDFuC7sezM8RDLY=;
        b=KrK6GjNWgaNksI9FrJyQHJ/9tDFZ+EsW3jKMiN1mOMziO/OznTprPZsOVtcVt/uLz2
         nYJK0pVzGwrITeSsErzF5FKtwlxjbZcBKXz9r6W56GYM51PNdzyMY9P+zipjrkjZYQIx
         Agg7Hh6rce/GTBJVa0DVxZOr2aM40wR1LoWjkfC+G/OXxYcJr0WqQEd2FuIodXPcnPT+
         oi/gd6RkXxR9WfYe7PD6sZ24uRHEhHm81mV1+GyhRA4bIApK1BYRzN4XOBwFujw/gv5e
         t4WrXUpCPLiKQj1nfsa65ClIKZPGcu6ttkwewST7BEsMUeWuAbnAtbt26hwccqc/ORQB
         kaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913093; x=1760517893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlRdAREeCzctmFFARIp9AmoWh2JDsDFuC7sezM8RDLY=;
        b=GPIo/+OYhcdJoQw3zsS+mvPkz+I/vKLbqsWPLaqW52cBjcbSfeRSyDqcXJ/9Hcl7GV
         q7lj3GIUcKcaTDGdL7swqv3sIjNYYFe5P3J+nauJp7B5LO08o1Oo+3jLIp1qB6XDi6Fc
         tZBw8GAEW3vciD3ukzMDpD3hMgIrOUzPiQiUsvfDVLIXVFa7VydzwBuesKnLR8Jq28Xj
         sRTsQ0eyzt1G6dcSAAzKW17jro6Cpe7N7thBhcltk5/YzSJsdU8sSPQ24gtLlY9R62si
         pPLzTrMajW2XGVCvvPdktb4Fr1/DxmkBb5JbxY9mh9g22zR9nwZqJoy+p7nUJ5wTJmCv
         ycNg==
X-Gm-Message-State: AOJu0YyxpeGR8S8G4NfwZdU79TAL/uBypNVLKMe5Has8D1PMtE7ZyY6H
	o9UpBVzvVoZ8QW7GoW0KWjTUQqoaB5ul+g2yjqjk87J8qIagnilCw0AP4loAZhRxRUhU4mcnZPY
	1a56DWqvDkU+BYy80lNlFVuslpa6xEw02ZTg4e3EWnqZEB07QHDhIABvAb4JgEu9C5LXRMN7+G1
	GL7I2FEzTvaXIDRTVzEQ16JoBmgmsjhE98A5+CeZV9D5UlxOnSVao=
X-Gm-Gg: ASbGncvdU91A22FdXZh6GTq3Um2G4h04KoZOyHz1+ScA37VNI6/B/zvc8EyFi1iUmQC
	+jh1DfZYkJWR91yyotcWq0S6TNEJQw/8Hn4vOj+if1JT+GYYjp/AV08bNzlTmBwSQTxY2UgmKBU
	GeytTKuwNZioU6IopoQntdVRwACfHU3k4tiI6kKzMaipYEfaU8dgMiBXFhVeEpMguS0aFjdgGVJ
	BpMsGJTyJY1JckzmZOxxetGn3UJ0Z+pF6+QYJEf8k/yY9v5tsojnaTd0GiRA8AoZKrnk+FKG5ou
	6Q+9lVlnEyrbKkJg6xI75DFrn4nhn/WXU7tCSXn5fdcGueHEFhEkQ2OpUJodsgHvkAFyd74oaSp
	TrYS3jUhGsCD6tKKjivQEkmudHUxRG/GyMfspagQkQIDSf81XaK5s2OJ62j1/NzFbyPJpP/qG3h
	nxI10iQe1DmGEaX9lm5eKv5s1u0rBjvbnr3uPW2URICTCwXYPM53IALkSAt+qRt86xQJo=
X-Google-Smtp-Source: AGHT+IH7vYvm/ToAr89wps6lIn2hn/gxcZbr1cNv98bfk/hzAc9ils7GMpxjhSa0yW+dEHHQ30Sd+Q==
X-Received: by 2002:a17:902:fc4d:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-290272c0729mr31523315ad.29.1759913092464;
        Wed, 08 Oct 2025 01:44:52 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ecaefd60fsm51327255ad.93.2025.10.08.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:44:52 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	alvinga@andestech.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 1/8] lib: sbi_hart: move sbi_hart_get_smepmp_flags() to sbi_domain
Date: Wed,  8 Oct 2025 16:44:37 +0800
Message-ID: <20251008084444.3525615-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008084444.3525615-1-peter.lin@sifive.com>
References: <20251008084444.3525615-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014453_759173_C99C862B 
X-CRM114-Status: GOOD (  18.27  )
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

Also removes unused parameters (scratch and dom).

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_domain.h |  7 +++++
 lib/sbi/sbi_domain.c     | 58 ++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c       | 67 ++--------------------------------------
 3 files changed, 67 insertions(+), 65 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index e9cff0b1..a6ee553b 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -249,6 +249,13 @@ void sbi_domain_memregion_init(unsigned long addr,
 				unsigned long flags,
 				struct sbi_domain_memregion *reg);
 
+/**
+ * Return the Smepmp pmpcfg LRWX encoding for the flags in @reg.
+ *
+ * @param reg pointer to memory region; its flags field encodes permissions.
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
index 1b50f671..2dca2699 100644
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
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
