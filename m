Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BB2D3B7EA
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UolpmECpz2Fwarr6nFaN2BK53DQZrMw0cPRNIuikRw=; b=OCk+LTAbkJAEC8
	AqGPlVAbipom7tws85M8Cogm8bF5Z6HCFtIRNwbTjPIGaMXFUUO4Ngvl8XA4fAYI+Jgg2TgsSpII3
	TQSJt7zF6pvbrgCG6LjrKtGHb8jsZTHGms8wo3l4hz/aYMnBi+3jAnAphnSyKBQiF09RI/2NVi6+y
	hMNX+qDk2OnuMbpTEhmPZ4FLe2sbKT6nmL4xcmfKFzjGJqy8S2kqEbsgRvmOAbcGRgfqzrURUhu2M
	gYMyq7LogB31IQn2rMRlCV2cGxYzS49HVUN6Tx0Cr4CfKchGOBZQuyskBg3TAAW0ORT18kPthOaTE
	wQ+tVLv9/u3GJPtGR+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy9R-0000000ELeP-06GQ;
	Tue, 09 Dec 2025 13:53:13 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy9P-0000000ELdU-1gAs
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 13:53:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so5730658b3a.1
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765288390; x=1765893190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8n4N7+tLQlLHmcFWABNHJ0VT/wLdHLfVVcxDTGQ9eEM=;
        b=RIWmWbDVhOWTDLcAbB64dq1V73QmaLclw4YDwy4YOW1zZNISEWIODPlpQ7YHri5pWR
         GHjAMJCov2GPm26pQ4M6KkqZUi3CNKKiFRAjhLjmNmCsdrH01QJAgokFROZR4Lp3bZoj
         jdr4GmdFm/P/0uL1ughnOzTuEhgSM/6yca5i/YaVtQpvgH17p6RwWtG8fTPvS68IeQJI
         zdxFKUGFViFC8tITZBQ87/CoAjnDPLJAOtK7dR0gBZbY2WFKIYLBH6jnGn7RFQHll+4D
         TsaJr2k+j6uhmhikvFb64f+ANVRjyYU+NLHi9+G5DDNtMjiJ/Ff1rP9NVMCgqzkmd9UZ
         ugJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288390; x=1765893190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8n4N7+tLQlLHmcFWABNHJ0VT/wLdHLfVVcxDTGQ9eEM=;
        b=IZrOBU1h+5H8iaHROKufXhPOGBzh4uBYr7e71Uo8Ulr3gbs16W2mKz+tLg2245Tb4Z
         Sb8oO5yitdU9tBO68mL7ZpP2B9zkJWYoB6acrSE9pNFlojvgBnVS9yrLi6XE1aXANSSq
         X4x0zSEeoi5Y2OH8UHkN75FQ3HNKGdSwuZvMKpdOuNK5vW59BMqugEyKs/Zms9PiBHRr
         L9NqXOfxRmpctYPcVUi/GmNkeAZZPVf7IQkeDEV613L/KlX9aXUqLNpBpQ/7lcbBh05b
         o+2baKc3li8+E/13b/xC0dr1RIKgLRtPXLbXBfljRZ7nVuPwO1ylH6RbtCQqEMl7bFCt
         KaDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCKvmTp2jKgI2jjJiE8M+YH36x5gKKZvG/2YE+zg/vEQqQaDrJ/SWzbSP10wV4OMaflqgSPtSX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8BBG+KZSsJQCjQTkyxSGwvl5c814/YU5NVj8ioyMuBHk1hb/K
	6ZVLCJ/HGkMfUBMe16xJANiDr0KdE2YruSpt+sBg13Y5sHatIwivYsZ9XIg3FwRVuqdKyhE141G
	rkgMj8PE=
X-Gm-Gg: ASbGncuQpVZBZV8WANOsle5TL2EvPxiWwMXAVdAO6+FURhGV4QLH0Cv3/lI+rwG7x3q
	e3wNraaTaKox2wuDngyVfFlZ+ZV9LHzBc2riPq57zfaGSwvIPK7sC6GQg6QtXF3n3GYdyWybcGC
	K3EwBSe9Rcaqm0BAJdhVbgJvMH+vki3XZ+z39VJjFsNtXSVqmTvNgxMaTdbTM2SWN9Ehx4blH6H
	xv2V6kjOSgZh3+l28OzwIIqO8CnctojCqMeyOGKrtQKpd99IPzclGe5AGDypqs53tX9YXEsI89t
	MnYiRtVXxstrVIyFItZQHxqi3bfN3pcrSGxfP9y6C12gg7tWyhdkoD95YT+MWvqsvU+Y8aNPmpf
	BLfAK7iYBYxtX9PJ125ZxcYZjjDfS26tHKUsVskrbOCCH9rKT32SEre62vsoY563nss2cRgP5TM
	gLAl9U3GAl3nsIF6a0NZt1ncPOPCwuEANhlQ+9hzTKntFtyMhs
X-Google-Smtp-Source: AGHT+IGy+ZVdgEjK3KU7Uz1VEAwWSDHBBi+Z1RhiV09+ZGZJODPQXaT1c95Ix9klvRFZ7jfy7emRGA==
X-Received: by 2002:a05:6a20:158b:b0:35d:e4b2:b381 with SMTP id adf61e73a8af0-36617e37d4emr9334409637.16.1765288390398;
        Tue, 09 Dec 2025 05:53:10 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf681738a34sm15023827a12.4.2025.12.09.05.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:53:07 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 4/5] lib: sbi: Replace sbi_hart_pmp_xyz() and sbi_hart_map/unmap_addr()
Date: Tue,  9 Dec 2025 19:22:34 +0530
Message-ID: <20251209135235.423391-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209135235.423391-1-apatel@ventanamicro.com>
References: <20251209135235.423391-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_055311_464436_CEAAA067 
X-CRM114-Status: GOOD (  20.09  )
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

The sbi_hart_pmp_xyz() and sbi_hart_map/unmap_addr() functions can
now be replaced by various sbi_hart_protection_xyz() functions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hart.h       |  8 ++------
 lib/sbi/sbi_dbtr.c           | 33 ++++++++++++++++++++-------------
 lib/sbi/sbi_domain_context.c |  5 +++--
 lib/sbi/sbi_ecall_dbcn.c     |  6 +++---
 lib/sbi/sbi_hart.c           | 34 +---------------------------------
 lib/sbi/sbi_init.c           | 16 ++++++++--------
 lib/sbi/sbi_mpxy.c           | 25 +++++++++++++------------
 lib/sbi/sbi_pmu.c            |  5 +++--
 lib/sbi/sbi_sse.c            |  9 +++++----
 9 files changed, 58 insertions(+), 83 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index d313527a..bbd8026e 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -117,8 +117,8 @@ enum sbi_hart_csrs {
  * When shared memory access is required, the physical address
  * should be programmed into the first PMP entry with R/W
  * permissions to the M-mode. Once the work is done, it should be
- * unmapped. sbi_hart_map_saddr/sbi_hart_unmap_saddr function
- * pair should be used to map/unmap the shared memory.
+ * unmapped. sbi_hart_protection_map_range/sbi_hart_protection_unmap_range
+ * function pair should be used to map/unmap the shared memory.
  */
 #define SBI_SMEPMP_RESV_ENTRY		0
 
@@ -149,10 +149,6 @@ unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
 bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
-int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
-void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch);
-int sbi_hart_map_saddr(unsigned long base, unsigned long size);
-int sbi_hart_unmap_saddr(void);
 int sbi_hart_priv_version(struct sbi_scratch *scratch);
 void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
 				   char *version_str, int nvstr);
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 656a6261..8bcb4312 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_dbtr.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_hart_protection.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/riscv_asm.h>
 
@@ -558,8 +559,8 @@ int sbi_dbtr_read_trig(unsigned long smode,
 
 	shmem_base = hart_shmem_base(hs);
 
-	sbi_hart_map_saddr((unsigned long)shmem_base,
-			   trig_count * sizeof(*entry));
+	sbi_hart_protection_map_range((unsigned long)shmem_base,
+				      trig_count * sizeof(*entry));
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		xmit = &entry->data;
 		trig = INDEX_TO_TRIGGER((_idx + trig_idx_base));
@@ -572,7 +573,8 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		xmit->tdata2 = cpu_to_lle(trig->tdata2);
 		xmit->tdata3 = cpu_to_lle(trig->tdata3);
 	}
-	sbi_hart_unmap_saddr();
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
 }
@@ -596,8 +598,8 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		return SBI_ERR_NO_SHMEM;
 
 	shmem_base = hart_shmem_base(hs);
-	sbi_hart_map_saddr((unsigned long)shmem_base,
-			   trig_count * sizeof(*entry));
+	sbi_hart_protection_map_range((unsigned long)shmem_base,
+				      trig_count * sizeof(*entry));
 
 	/* Check requested triggers configuration */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
@@ -606,20 +608,23 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
 			*out = _idx;
-			sbi_hart_unmap_saddr();
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
 
 		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
 			*out = _idx;
-			sbi_hart_unmap_saddr();
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
 	}
 
 	if (hs->available_trigs < trig_count) {
 		*out = hs->available_trigs;
-		sbi_hart_unmap_saddr();
+		sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+					       trig_count * sizeof(*entry));
 		return SBI_ERR_FAILED;
 	}
 
@@ -639,7 +644,9 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		xmit->idx = cpu_to_lle(trig->index);
 
 	}
-	sbi_hart_unmap_saddr();
+
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
 }
@@ -712,23 +719,23 @@ int sbi_dbtr_update_trig(unsigned long smode,
 		return SBI_ERR_BAD_RANGE;
 
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
+		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
 		trig_idx = entry->id.idx;
 
 		if (trig_idx >= hs->total_trigs) {
-			sbi_hart_unmap_saddr();
+			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_INVALID_PARAM;
 		}
 
 		trig = INDEX_TO_TRIGGER(trig_idx);
 
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
-			sbi_hart_unmap_saddr();
+			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
 
 		dbtr_trigger_setup(trig, &entry->data);
-		sbi_hart_unmap_saddr();
+		sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
 		dbtr_trigger_enable(trig);
 	}
 
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index adfd271b..158f4990 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -10,6 +10,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
@@ -122,8 +123,8 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	spin_unlock(&target_dom->assigned_harts_lock);
 
 	/* Reconfigure PMP settings for the new domain */
-	sbi_hart_pmp_unconfigure(scratch);
-	sbi_hart_pmp_configure(scratch);
+	sbi_hart_protection_unconfigure(scratch);
+	sbi_hart_protection_configure(scratch);
 
 	/* Save current CSR context and restore target domain's CSR context */
 	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index 1b0aebdc..75c8455d 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -14,7 +14,7 @@
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/riscv_asm.h>
-#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
 
 static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 				  struct sbi_trap_regs *regs,
@@ -46,12 +46,12 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 					regs->a1, regs->a0, smode,
 					SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
 			return SBI_ERR_INVALID_PARAM;
-		sbi_hart_map_saddr(regs->a1, regs->a0);
+		sbi_hart_protection_map_range(regs->a1, regs->a0);
 		if (funcid == SBI_EXT_DBCN_CONSOLE_WRITE)
 			out->value = sbi_nputs((const char *)regs->a1, regs->a0);
 		else
 			out->value = sbi_ngets((char *)regs->a1, regs->a0);
-		sbi_hart_unmap_saddr();
+		sbi_hart_protection_unmap_range(regs->a1, regs->a0);
 		return 0;
 	case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
 		sbi_putc(regs->a0);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 20ad3c6a..59e846db 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -561,39 +561,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
 	return 0;
 }
 
-int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
-{
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-
-	/* If Smepmp is not supported no special mapping is required */
-	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
-		return SBI_OK;
-
-	return sbi_hart_smepmp_map_range(scratch, addr, size);
-}
-
-int sbi_hart_unmap_saddr(void)
-{
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-
-	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
-		return SBI_OK;
-
-	return sbi_hart_smepmp_unmap_range(scratch, 0, 0);
-}
-
-int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
-{
-	if (!sbi_hart_pmp_count(scratch))
-		return 0;
-
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
-		return sbi_hart_smepmp_configure(scratch);
-	else
-		return sbi_hart_oldpmp_configure(scratch);
-}
-
-void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
+static void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
 {
 	int i, pmp_count = sbi_hart_pmp_count(scratch);
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index b161d1c1..e01d26bf 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -389,12 +389,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	}
 
 	/*
-	 * Configure PMP at last because if SMEPMP is detected,
-	 * M-mode access to the S/U space will be rescinded.
+	 * Configure hart isolation at last because if SMEPMP is,
+	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
-	rc = sbi_hart_pmp_configure(scratch);
+	rc = sbi_hart_protection_configure(scratch);
 	if (rc) {
-		sbi_printf("%s: PMP configure failed (error %d)\n",
+		sbi_printf("%s: hart isolation configure failed (error %d)\n",
 			   __func__, rc);
 		sbi_hart_hang();
 	}
@@ -468,10 +468,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 		sbi_hart_hang();
 
 	/*
-	 * Configure PMP at last because if SMEPMP is detected,
-	 * M-mode access to the S/U space will be rescinded.
+	 * Configure hart isolation at last because if SMEPMP is,
+	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
-	rc = sbi_hart_pmp_configure(scratch);
+	rc = sbi_hart_protection_configure(scratch);
 	if (rc)
 		sbi_hart_hang();
 
@@ -492,7 +492,7 @@ static void __noreturn init_warm_resume(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_pmp_configure(scratch);
+	rc = sbi_hart_protection_configure(scratch);
 	if (rc)
 		sbi_hart_hang();
 
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 681cfbe9..a83cf16c 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_mpxy.h>
@@ -375,10 +376,10 @@ int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
 	if (flags == SBI_EXT_MPXY_SHMEM_FLAG_OVERWRITE_RETURN) {
 		ret_buf = (unsigned long *)(ulong)SHMEM_PHYS_ADDR(shmem_phys_hi,
 								  shmem_phys_lo);
-		sbi_hart_map_saddr((unsigned long)ret_buf, mpxy_shmem_size);
+		sbi_hart_protection_map_range((unsigned long)ret_buf, mpxy_shmem_size);
 		ret_buf[0] = cpu_to_lle(ms->shmem.shmem_addr_lo);
 		ret_buf[1] = cpu_to_lle(ms->shmem.shmem_addr_hi);
-		sbi_hart_unmap_saddr();
+		sbi_hart_protection_unmap_range((unsigned long)ret_buf, mpxy_shmem_size);
 	}
 
 	/** Setup the new shared memory */
@@ -407,7 +408,7 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_map_saddr((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	/** number of channel ids which can be stored in shmem adjusting
 	 * for remaining and returned fields */
@@ -434,7 +435,7 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 	shmem_base[0] = cpu_to_le32(remaining);
 	shmem_base[1] = cpu_to_le32(returned);
 
-	sbi_hart_unmap_saddr();
+	sbi_hart_protection_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	return SBI_SUCCESS;
 }
@@ -465,7 +466,7 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	shmem_base = hart_shmem_base(ms);
 	end_id = base_attr_id + attr_count - 1;
 
-	sbi_hart_map_saddr((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	/* Standard attributes range check */
 	if (mpxy_is_std_attr(base_attr_id)) {
@@ -504,7 +505,7 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 					       base_attr_id, attr_count);
 	}
 out:
-	sbi_hart_unmap_saddr();
+	sbi_hart_protection_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 	return ret;
 }
 
@@ -616,7 +617,7 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	shmem_base = hart_shmem_base(ms);
 	end_id = base_attr_id + attr_count - 1;
 
-	sbi_hart_map_saddr((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	mem_ptr = (u32 *)shmem_base;
 
@@ -673,7 +674,7 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 					       base_attr_id, attr_count);
 	}
 out:
-	sbi_hart_unmap_saddr();
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
 	return ret;
 }
 
@@ -705,7 +706,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_map_saddr((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (resp_data_len) {
 		resp_buf = shmem_base;
@@ -722,7 +723,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 							     msg_data_len);
 	}
 
-	sbi_hart_unmap_saddr();
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (ret == SBI_ERR_TIMEOUT || ret == SBI_ERR_IO)
 		return ret;
@@ -752,12 +753,12 @@ int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 		return SBI_ERR_NOT_SUPPORTED;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_map_saddr((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 	eventsbuf = shmem_base;
 	ret = channel->get_notification_events(channel, eventsbuf,
 					       mpxy_shmem_size,
 					       events_len);
-	sbi_hart_unmap_saddr();
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (ret)
 		return ret;
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e24e485d..2ccf23cb 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
@@ -1053,7 +1054,7 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
-	sbi_hart_map_saddr(shmem_phys_lo, shmem_size);
+	sbi_hart_protection_map_range(shmem_phys_lo, shmem_size);
 
 	einfo = (struct sbi_pmu_event_info *)(shmem_phys_lo);
 	for (i = 0; i < num_events; i++) {
@@ -1087,7 +1088,7 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 		}
 	}
 
-	sbi_hart_unmap_saddr();
+	sbi_hart_protection_unmap_range(shmem_phys_lo, shmem_size);
 
 	return 0;
 }
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 986b7701..a14754f8 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -15,6 +15,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_fifo.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_ipi.h>
@@ -1036,7 +1037,7 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
 	if (ret)
 		return ret;
 
-	sbi_hart_map_saddr(output_phys_lo, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_map_range(output_phys_lo, sizeof(unsigned long) * attr_count);
 
 	/*
 	 * Copy all attributes at once since struct sse_event_attrs is matching
@@ -1049,7 +1050,7 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
 	attrs = (unsigned long *)output_phys_lo;
 	copy_attrs(attrs, &e_attrs[base_attr_id], attr_count);
 
-	sbi_hart_unmap_saddr();
+	sbi_hart_protection_unmap_range(output_phys_lo, sizeof(unsigned long) * attr_count);
 
 	sse_event_put(e);
 
@@ -1064,7 +1065,7 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	uint32_t id, end_id = base_attr_id + attr_count;
 	unsigned long *attrs = (unsigned long *)input_phys;
 
-	sbi_hart_map_saddr(input_phys, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_map_range(input_phys, sizeof(unsigned long) * attr_count);
 
 	for (id = base_attr_id; id < end_id; id++) {
 		val = attrs[attr++];
@@ -1080,7 +1081,7 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	}
 
 out:
-	sbi_hart_unmap_saddr();
+	sbi_hart_protection_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
 
 	return ret;
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
