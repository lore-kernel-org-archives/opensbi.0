Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBB1D10F5A
	for <opensbi@archiver.kernel.org>; Wed, 26 Nov 2025 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8UmT9CipvaCTUdPazvji4JsXn9w2Wq1Kz/wDwCvVS/4=; b=txNoyqjTB0qdwd
	waBI4zEPs2dRQz6kqh58cCIpBIJM9ZrZ0doFeCSYckuA7SrsFgrIL8/J5nRZEhZaTIWUycga+0hh/
	jCXJvJqMyPKySP1B+M6n1kRO9/4nbRDjdk6QPFSQZpyMCjF09oaF5q3gepgIB2h9HGKeocwhVM4Rt
	qHbidoK5hOCXuqGAh+3qHZvr95Ain3tCwd6y8IyTbdA3tijJDvlnR1r96dJgmNUfSu87FQkKDtgWH
	R3uj7VjQuYaCUT6mQXpvkbI+dU7ziB7irpbeoXOLzva1hrzDMzN3G3feY7BgNAUNmV9TyQxuFzCHM
	1Az8a0VTTwKDQ+yfTvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMT-0000000F5nU-0dmT;
	Wed, 26 Nov 2025 14:19:13 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMQ-0000000F5mG-0x1N
	for opensbi@lists.infradead.org;
	Wed, 26 Nov 2025 14:19:11 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so4599868a12.0
        for <opensbi@lists.infradead.org>; Wed, 26 Nov 2025 06:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764166749; x=1764771549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmxqJuR9o/clGg+StXObN7Rf2CS6g+0NtkkBgutMzqQ=;
        b=LYEmZL82lp32C1pre7J1pwN0RBvPpPq1TrUV6c2/uJoDBI3eg6azTFcJJfSRnH3/Nm
         e/F8kk5v0lkwaM+9lCyNPtTDb4gGKPuuWKHYjgCxlCLxWNUFqhI+MKYpQkXDvAxL2BaS
         VXEiCM5Vj1suU0w3LJuHnZDV818+gyTYerY8PRS1DngtCsxtfgc1zcAUJwqZNg44ICPi
         H4LMGZtHAajO9RzUhKgSTRnPePel0sPoHAy3lx2ZTZs3VEr1nUqowk/suXtVSapVlIAx
         yWSp5r0s3PoWw+Dlu2FM8xIE7E4gK1mjLsjl99uthe0n2kG4j33UL833LbHG43rSoVdx
         rKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166749; x=1764771549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jmxqJuR9o/clGg+StXObN7Rf2CS6g+0NtkkBgutMzqQ=;
        b=PSiZ4+slQVmsrH9vCImjav/Yl6v4rul9YvV8vDg6zI2pTJtgsCAKg5HcYAuvSmNLMe
         CHp7D0ibOXwiN724f5gay+ORzHO+rPJUMayxsoffBfEkmb8L3hIJlcQV/bNIxd6dWLHf
         Ke3jRmsGvTC5+NKxM5BlInpO5mmCpJ2FzRJFmDc1ljbQUtLCNqNWExd21xwvVivlg9UR
         YViUHZOBa/O7On49Xmy//Mk9NIa0iQUJ1B3CGrDHRg6Jyt8hFqBVmwu5wGDBk9iCPAT6
         0sHI5iUr9PDGauCrgZCLF/zluBR1EVk5hoBr6+C4UHjmSe5lavO9xBkosEXum7MPMzJw
         ZGvg==
X-Forwarded-Encrypted: i=1; AJvYcCV4d36lGiZE3TikG2bHF0iLhbZWmvZbNRTU4AvP3opPpcM6qTU3sbBxMlZvzDIz5Z1kRZY5gM/z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9vHMxwptoO61rC6K1Rm+nAe3w5v7Lsm8tFJwiq6mI87Atk0I6
	SHjGYJZMllJ2UaRRIdIcjRgIz+3dfXZdB3VE1535ahyeXwNprt+Uqud8zQbw0mZw/K0=
X-Gm-Gg: ASbGncvnVa5UT1+QJFI8YgWg7OAmQoH8TepV7D9ocymkqhmgQPl0Sq913Me8JspOTie
	vnBpN7DRoK24qM6xkxX3BgGGFX6o97RG2gR6nkaIOigFXzBphjh6ABsnqQM9xs0Fj771H/rjbvY
	229k84T0Q/BDzMIitV9jw/bIJWPtIEVz+6zmzw81ThoYijnTcRbrj2aqwj53efhfjVP8iAnQsyT
	Nn1wQ2s670FxAqDGqgbzjfVwRCBM7EcHgu4acfFWgc0ijSqHKkFQ0poixxahVzBZFpF/OeocwiV
	PUdfyl39bTTfNIoqmxlA93BQXbkPbDyXTqJK66orN4QfLWbF7HEcsOd3mQII+o6WZxR+Mqz/EWL
	iLXIs+ezI97SzpqxMHWI8yZxmjizcg30CHLu24lde+911jbHfU9bYrvwFK76JUXPXEBACGcNCUc
	v5aibbJ6UiI09RBhbbcOUiKbVoBcwpdfCrBAl7ChSAQcn7ea4sSxLL1JGqmZnT
X-Google-Smtp-Source: AGHT+IELQjOmE5TRLpjotDj+bxPcELXQEFvJSIIft6FIWEBieUqs7gHvkKXx80MuNTLCBOpbebOYMg==
X-Received: by 2002:a05:7300:106:b0:2a4:630b:c789 with SMTP id 5a478bee46e88-2a7192da0e8mr8690991eec.37.1764166748994;
        Wed, 26 Nov 2025 06:19:08 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm103679339eec.2.2025.11.26.06.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:19:08 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/5] lib: sbi: Replace sbi_hart_pmp_xyz() and sbi_hart_map/unmap_addr()
Date: Wed, 26 Nov 2025 19:48:43 +0530
Message-ID: <20251126141845.248697-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126141845.248697-1-apatel@ventanamicro.com>
References: <20251126141845.248697-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_061910_293174_881480DF 
X-CRM114-Status: GOOD (  20.19  )
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
index 93682880..539f95de 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -115,8 +115,8 @@ enum sbi_hart_csrs {
  * When shared memory access is required, the physical address
  * should be programmed into the first PMP entry with R/W
  * permissions to the M-mode. Once the work is done, it should be
- * unmapped. sbi_hart_map_saddr/sbi_hart_unmap_saddr function
- * pair should be used to map/unmap the shared memory.
+ * unmapped. sbi_hart_protection_map_range/sbi_hart_protection_unmap_range
+ * function pair should be used to map/unmap the shared memory.
  */
 #define SBI_SMEPMP_RESV_ENTRY		0
 
@@ -147,10 +147,6 @@ unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
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
index 8cf47323..f12be049 100644
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
@@ -120,8 +121,8 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
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
index 8869839d..3fdf1047 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -556,39 +556,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
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
index 70c49abc..b943d99c 100644
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
@@ -1034,7 +1035,7 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
-	sbi_hart_map_saddr(shmem_phys_lo, shmem_size);
+	sbi_hart_protection_map_range(shmem_phys_lo, shmem_size);
 
 	einfo = (struct sbi_pmu_event_info *)(shmem_phys_lo);
 	for (i = 0; i < num_events; i++) {
@@ -1068,7 +1069,7 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
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
