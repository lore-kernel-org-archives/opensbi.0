Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44535C7114A
	for <opensbi@archiver.kernel.org>; Sat, 14 Jun 2025 17:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GxJ1TBTK/WH9bFrTltxzykewDn89WRS1xvbD9N4WTik=; b=dL+NuL3/QdW/6w
	JA4tAVNudVBiT/dlDhSDuje2i5MDa4u2FPERiXXslCn76iVUoOnwnwcHowswZ3IF+CEn+Kn9xMDo0
	lZ8wcIiETa479gMuVs7ZxxoCMmSxZhbH5Nh1+arHOw/PDzyqQkwhgeXa2MHN29gDRbFm0kmRJ2at9
	QQJvUG7Us6Ag1mlPOJNrQbEl6MVH8eiJjs1H9b2GVT3KlScLpCwaF0LRxiO2Wqi96BLcUqV5mGCKD
	6gi0znHcb6YK9cMhu8K/FyizcU0QHNxyf1xjuYEMk4f3yLiLV675WBkfgksm//hIzZPT717lRN0uo
	+S5kbkdcY8O3YRgRPSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQUfq-00000001Zvs-219p;
	Sat, 14 Jun 2025 17:28:10 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQUfo-00000001ZvV-2ckU
	for opensbi@lists.infradead.org;
	Sat, 14 Jun 2025 17:28:09 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so2525066a91.3
        for <opensbi@lists.infradead.org>; Sat, 14 Jun 2025 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749922087; x=1750526887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EuQevSh9VZ+CLWHrFoNSNr3N8UWpH+Fc48OTbtyGNXs=;
        b=oy8o10IrEghr0q5AYb7p+nE2aET6pkaxcjRoa180SUWAwHgXBBo6HtUvlUDoZsOFt7
         ZhdJ8/7mHJEeVQiX10F2ootZdjvxdWP7ha3wXrmRSMDIOBysd8mnJ4nQEaKun8Omr/Bb
         L/TL7xDhplKlbn7mjZBYv22J5S7O8e31jdxnKIwdcdC7vR3cx/BMFgUvteG0sOZNecZi
         BR9/GhJU19M5O54cOBGUgdLBld79QwY+SnTah+jHjV7dBexuDK9lERXoj26TSC744J+z
         G3fFxDY4ZLSQ9NHIl9ATne4Cq/gkXzdenaXlOJS6zA52uKOjIzHN0MICfvBQjJwlDfon
         /aIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749922087; x=1750526887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuQevSh9VZ+CLWHrFoNSNr3N8UWpH+Fc48OTbtyGNXs=;
        b=IYXIYZUtxPBczEcoAWXpRnfw5sMTQQ4S93G4VWjyq7GGcAIj/qDMZ4kqWTrc7umgBz
         e4rqbBBbCKpbfJ0GnYFhClXMHmN+wyejQL4rj0JmVsv1SH7bDF5NM3DOb2K0hExdKPmu
         rr3myKKSIr6DsmlH6ksD1n0iY2jfO+oHnzrDs72Q3X8eZ4U0Gqzpz9LpX2NwOpD/pWh6
         K61OWGUz/4WHxakJwuI+VnUI3AuY/x8ZSOVJJxJzlQCd2D7p5JtrcJAGqala27PFDcrl
         oe6q9iKcl1aiQJ5etNWz/nOPQ41lkLP7HftS0l0XRkbaCBExLO1hDJA1P7XYmRYCVnyX
         FVQA==
X-Forwarded-Encrypted: i=1; AJvYcCV1RbcMbAMMAXLvDficP497v+0+Becj93UCDDzSdrGWqmKbbnoTJOC7rj+w40QpOGdlnlXwByOF@lists.infradead.org
X-Gm-Message-State: AOJu0YywK5Jfrj3PLfixkGm7pdZ0eEQrWwde5TzyhEiNCDlks1sDhMFL
	t2G6JkOUPLaxny2Yj/ET5ChXJreQEyaTqOTrfWK6ThH2VK3zqQCKQNng6lWfEi7Jlag=
X-Gm-Gg: ASbGncsAFXab69vdjxMumEpPMefkGa00WILEUlw0PRyTnkCwv3mhph76shf8l7IknrJ
	DGTLXvm5/GAW9wFR1FAnYj+UfK6WyPRJw591BZP0d4oaCFkHGNPDCpKTLJmiyUzcSiMPSAsIQmR
	nFyMw8Wai/nPy0IliQIJ6kcp26iNgZFZQzt244eWhKJWUKpkaN68ljuWSHIXU6z//6IDN8WA6ii
	TuArUKijcBiWqc8kDAm6APLPsT0j15Xcce17AZjGoG9jbbThqU2UMeQcVgXd++9l3BxH47Cx0mt
	R4kEIoyLhELBEloLeJAfXDXom7Wk4jJZQYAx4Dqf/3F+U/R/dbwlaJkLADtqLy2Nl1La8thrqKs
	t6hMurcTfERAj8gqEgFjin/M=
X-Google-Smtp-Source: AGHT+IH2mAdh3yvz8CwHiXWNyrZU23T+2yCkR74ZzvtsZnEXO70Nkr/xpzGNrFLOyuWk5cgDgXh5TA==
X-Received: by 2002:a17:90b:134f:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-313f1c00e26mr6381236a91.10.1749922087082;
        Sat, 14 Jun 2025 10:28:07 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.48.99.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm6015356a91.2.2025.06.14.10.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 10:28:06 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Chao-ying Fu <cfu@wavecomp.com>,
	Chao-ying Fu <cfu@mips.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] lib: sbi_platform: Add platform specific pmp_set() and pmp_disable()
Date: Sat, 14 Jun 2025 22:57:56 +0530
Message-ID: <20250614172756.153902-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_102808_670614_40E3B225 
X-CRM114-Status: GOOD (  16.33  )
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

From: Chao-ying Fu <cfu@wavecomp.com>

Allow platforms to implement platform specific PMP setup and
PMP disable functions which are called before actual PMP CSRs
are configured.

Also, implement pmp_set() and pmp_disable() for MIPS P8700.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_platform.h    | 39 +++++++++++++++
 lib/sbi/sbi_domain_context.c  |  2 +
 lib/sbi/sbi_hart.c            | 10 ++++
 platform/generic/mips/p8700.c | 93 +++++++++++++++++++++++++++++++++++
 4 files changed, 144 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 08ece320..c6d30080 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -142,6 +142,13 @@ struct sbi_platform_operations {
 	/** platform specific handler to fixup store fault */
 	int (*emulate_store)(int wlen, unsigned long addr,
 			     union sbi_ldst_data in_val);
+
+	/** platform specific pmp setup on current HART */
+	void (*pmp_set)(unsigned int n, unsigned long flags,
+			unsigned long prot, unsigned long addr,
+			unsigned long log2len);
+	/** platform specific pmp disable on current HART */
+	void (*pmp_disable)(unsigned int n);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
@@ -644,6 +651,38 @@ static inline int sbi_platform_emulate_store(const struct sbi_platform *plat,
 	return SBI_ENOTSUPP;
 }
 
+/**
+ * Platform specific PMP setup on current HART
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param n index of the pmp entry
+ * @param flags domain memregion flags
+ * @param prot attribute of the pmp entry
+ * @param addr address of the pmp entry
+ * @param log2len size of the pmp entry as power-of-2
+ */
+static inline void sbi_platform_pmp_set(const struct sbi_platform *plat,
+					unsigned int n, unsigned long flags,
+					unsigned long prot, unsigned long addr,
+					unsigned long log2len)
+{
+	if (plat && sbi_platform_ops(plat)->pmp_set)
+		sbi_platform_ops(plat)->pmp_set(n, flags, prot, addr, log2len);
+}
+
+/**
+ * Platform specific PMP disable on current HART
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param n index of the pmp entry
+ */
+static inline void sbi_platform_pmp_disable(const struct sbi_platform *plat,
+					    unsigned int n)
+{
+	if (plat && sbi_platform_ops(plat)->pmp_disable)
+		sbi_platform_ops(plat)->pmp_disable(n);
+}
+
 #endif
 
 #endif
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 2b19fcc7..fb04d81d 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -15,6 +15,7 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_domain_context.h>
+#include <sbi/sbi_platform.h>
 #include <sbi/sbi_trap.h>
 
 /** Context representation for a hart within a domain */
@@ -115,6 +116,7 @@ static void switch_to_next_domain_context(struct hart_context *ctx,
 
 	/* Reconfigure PMP settings for the new domain */
 	for (int i = 0; i < pmp_count; i++) {
+		sbi_platform_pmp_disable(sbi_platform_thishart_ptr(), i);
 		pmp_disable(i);
 	}
 	sbi_hart_pmp_configure(scratch);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 74ccdd84..054a405c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -375,6 +375,9 @@ static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 	unsigned long pmp_addr = reg->base >> PMP_SHIFT;
 
 	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
+		sbi_platform_pmp_set(sbi_platform_ptr(scratch),
+				     pmp_idx, reg->flags, pmp_flags,
+				     reg->base, reg->order);
 		pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
 	} else {
 		sbi_printf("Can not configure pmp for domain %s because"
@@ -492,6 +495,9 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 
 		pmp_addr = reg->base >> PMP_SHIFT;
 		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
+			sbi_platform_pmp_set(sbi_platform_ptr(scratch),
+					     pmp_idx, reg->flags, pmp_flags,
+					     reg->base, reg->order);
 			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
 		} else {
 			sbi_printf("Can not configure pmp for domain %s because"
@@ -532,6 +538,9 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 		}
 	}
 
+	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
+			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
+			     pmp_flags, base, order);
 	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
 
 	return SBI_OK;
@@ -544,6 +553,7 @@ int sbi_hart_unmap_saddr(void)
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		return SBI_OK;
 
+	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
 	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
 }
 
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 6b687179..888a45c6 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -16,6 +16,98 @@
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
 
+static unsigned long mips_csr_read_num(int csr_num)
+{
+#define switchcase_csr_read(__csr_num, __val)		\
+	case __csr_num:					\
+		__val = csr_read(__csr_num);		\
+		break;
+#define switchcase_csr_read_2(__csr_num, __val)		\
+	switchcase_csr_read(__csr_num + 0, __val)	\
+	switchcase_csr_read(__csr_num + 1, __val)
+#define switchcase_csr_read_4(__csr_num, __val)		\
+	switchcase_csr_read_2(__csr_num + 0, __val)	\
+	switchcase_csr_read_2(__csr_num + 2, __val)
+#define switchcase_csr_read_8(__csr_num, __val)		\
+	switchcase_csr_read_4(__csr_num + 0, __val)	\
+	switchcase_csr_read_4(__csr_num + 4, __val)
+#define switchcase_csr_read_16(__csr_num, __val)	\
+	switchcase_csr_read_8(__csr_num + 0, __val)	\
+	switchcase_csr_read_8(__csr_num + 8, __val)
+
+	unsigned long ret = 0;
+
+	switch(csr_num) {
+	switchcase_csr_read_16(CSR_MIPSPMACFG0, ret)
+
+	default:
+		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
+		break;
+	}
+
+	return ret;
+
+#undef switchcase_csr_read_16
+#undef switchcase_csr_read_8
+#undef switchcase_csr_read_4
+#undef switchcase_csr_read_2
+#undef switchcase_csr_read
+}
+
+static void mips_csr_write_num(int csr_num, unsigned long val)
+{
+#define switchcase_csr_write(__csr_num, __val)		\
+	case __csr_num:					\
+		csr_write(__csr_num, __val);		\
+		break;
+#define switchcase_csr_write_2(__csr_num, __val)	\
+	switchcase_csr_write(__csr_num + 0, __val)	\
+	switchcase_csr_write(__csr_num + 1, __val)
+#define switchcase_csr_write_4(__csr_num, __val)	\
+	switchcase_csr_write_2(__csr_num + 0, __val)	\
+	switchcase_csr_write_2(__csr_num + 2, __val)
+#define switchcase_csr_write_8(__csr_num, __val)	\
+	switchcase_csr_write_4(__csr_num + 0, __val)	\
+	switchcase_csr_write_4(__csr_num + 4, __val)
+#define switchcase_csr_write_16(__csr_num, __val)	\
+	switchcase_csr_write_8(__csr_num + 0, __val)	\
+	switchcase_csr_write_8(__csr_num + 8, __val)
+
+	switch(csr_num) {
+	switchcase_csr_write_16(CSR_MIPSPMACFG0, val)
+
+	default:
+		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
+		break;
+	}
+
+#undef switchcase_csr_write_16
+#undef switchcase_csr_write_8
+#undef switchcase_csr_write_4
+#undef switchcase_csr_write_2
+#undef switchcase_csr_write
+}
+
+static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
+			       unsigned long prot, unsigned long addr,
+			       unsigned long log2len)
+{
+	int pmacfg_csr, pmacfg_shift;
+	unsigned long cfgmask;
+	unsigned long pmacfg, cca;
+
+	pmacfg_csr = (CSR_MIPSPMACFG0 + (n >> 2)) & ~1;
+	pmacfg_shift = (n & 7) << 3;
+	cfgmask = ~(0xffUL << pmacfg_shift);
+
+	/* Read pmacfg to change cacheability */
+	pmacfg = (mips_csr_read_num(pmacfg_csr) & cfgmask);
+	cca = (flags & SBI_DOMAIN_MEMREGION_MMIO) ? CCA_CACHE_DISABLE :
+				  CCA_CACHE_ENABLE | PMA_SPECULATION;
+	pmacfg |= ((cca << pmacfg_shift) & ~cfgmask);
+	mips_csr_write_num(pmacfg_csr, pmacfg);
+}
+
 #if CLUSTERS_IN_PLATFORM > 1
 static void power_up_other_cluster(u32 hartid)
 {
@@ -255,6 +347,7 @@ static int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct f
 	generic_platform_ops.early_init = mips_p8700_early_init;
 	generic_platform_ops.final_init = mips_p8700_final_init;
 	generic_platform_ops.nascent_init = mips_p8700_nascent_init;
+	generic_platform_ops.pmp_set = mips_p8700_pmp_set;
 
 	return 0;
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
