Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12013106FD7E
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvQLksRzgcmFQGQwHHTOvRD274OmaW7MEEEvykfwnLs=; b=qLqH/TyjiBOs7A
	9y6gKwyU5XaNuDpOwx5B7oPH0d+PJc/LNddXhdc57PqILSYHs/yIWrzJcAGAt1zjJrFItn2WF3OxR
	3SkGwcqGA9RW2sDosUIwrDb4MmXxSqSEeuHii7BS4Pah2YvnB1lR+1wS7MB3TbrzAQXtMQYUqink9
	mi7s/T05OpuRiRi30Pry5CKkL4uiCNtJjyNugy8c0cxj3N0FPugzCVtj43Jha+4VTVXABPlIU949e
	6+LB4NKnItlpE4S0qwgGRm8zLLAQk419IcP5IFa23CyIj/FIwwTYoPK/xnrcUXtSui72mh8UHZOp1
	MKE+7zsysFTLWyZtW/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxQ-0000000Gcck-2qDI;
	Fri, 13 Mar 2026 05:21:08 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxL-0000000GcUY-2Pqo
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:21:06 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso1144041a91.3
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379262; x=1773984062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96Xy3pE59hv+mlh3IA51V/CZ+fzhOt1U3e6HFLDgrU4=;
        b=mTPCTeiezkIdxs+QLORBZQiGn2O9kv7xkRu/eneiciXE8WNgNsZv4SpbZy6zWGdgDw
         Qd3dUHiVPUuK8+zjJyQRHqdiDokFSJDLVsskKycrF8dM1w+Rp22f3CO0bQEecrMiN5QL
         nqZvpszyNFcDKULjb3cvcaEH/1zLKVQZdNgO+wbk70ByPWWb6CmObzJGZOXiO1IiRQUE
         ZXI2C0g03dP1oZ6Z1GknRqcMUWDztbatphaxnIw6GiZgDzNOSnPhLS/u8VrFB3l/oCDC
         +CKZf7MuidmWKS08oeSeuYlaNMYrhTH/Fo9/IfQ7REBl0ocxSvlTCpswyJ2xun+svd43
         T4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379262; x=1773984062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96Xy3pE59hv+mlh3IA51V/CZ+fzhOt1U3e6HFLDgrU4=;
        b=lVeuJGwjvLy06lhp+DW5vA2uAfsz3pQZcHfwxyTO/Gw7SZAygu7ZGWJqpVJv+KBfSv
         4t0BJxNecyP2f1dxVkcm+L2lXfAlEEp8bJkexYOvtrOT41TMP14nHF+3+0PWsjZ+v7E8
         Y2/R2Bl8poKazWm9VzIiUSPwPiHqXxPqLpcV1uVMQrIVtK9vsgDFTD/MoBWfYaACw09L
         1T1eZNJdmk2pM6otwa1H/l5ywolam36cXf8esvGiOQhp8W0N4hIwmuT1LN1/5HG7ULmT
         YmJu8LN8ZlLBUz+qARZu8c/YEz0CAIEv3b/8SQJwwQ4navLjsjmb1y3lc+LsJWYjWVNl
         zdWw==
X-Gm-Message-State: AOJu0YzQyezOr33PE1xkyWfbZXLq4bfMk3aWJ1ZJXTqg2FXrELt389pD
	wHFEakW+bgU2Ko5i/WHwJFkmUC3usr7ifqgyikuvSL5Djm/+rMcNEJDXeZtYSg==
X-Gm-Gg: ATEYQzxbtS/pkKJOCzKT9f0fEuie8l3nBZMFGNPa5sNFaDs6Owl/oqdHhYRqSacUeKy
	DMyPtcxIZsuhXDgRBwXdhK2miZD4thp2ditgo24iL/Cf+kbKc014jMf67ebL+RDaRTelUGFJI7/
	HrlZsZjlndtOOTehAwhC+qHwSlhilVmM+7hGcuwg02dv1JaM+4Rw8e5NULVY6w3dzftkEAdkFZp
	v0mchF6EZYNY4iaY7gQ9kgbihMKgLh/orbbrT1au9omghXkMuJShdhLGrQmm9w3MvmR6PW5a9CZ
	xgz+sCfCDkSL9JZ2UtXLsbr5cNxBuyPkwSxjgnYxhv4NaUzglqwetFJ1M8S2r5XfmzBVCXlBMTJ
	RhDd9yks/yIZ6cpTUFGr+RAmsy5BZACkgeF5NbPKSpfO+YxohaMR08mO01zELrkWpqsoezFDWIj
	zxWUQwSpeyEwVJpX1bEtSNkSXn6djgc+unZxJGV6fsHDkvH/tceHKV+TrQOb+Q1JxBL0Hd
X-Received: by 2002:a17:90b:2496:b0:359:8727:6448 with SMTP id 98e67ed59e1d1-35a21fd7193mr1167045a91.17.1773379262156;
        Thu, 12 Mar 2026 22:21:02 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:21:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 14/18] dbtr: Decouple dbtr trigger index from hardware trigger number
Date: Fri, 13 Mar 2026 15:19:43 +1000
Message-ID: <20260313051948.4017134-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222103_655127_9A8E13DC 
X-CRM114-Status: GOOD (  22.13  )
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

Some Sdtrig implementations have heterogeneous triggers, which require
the dbtr trigger index be decoupled from the hardware trigger allocated
to it.

The SBI interface supports this, prepare the implementation by creating
a new sbi_hw_trigger data structure that is mapped by the
sbi_dbtr_trigger with its HW_INDEX field.

The dbtr and hw triggers are still fixed to the same number.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/sbi_dbtr.h | 14 ++++++-
 lib/sbi/sbi_dbtr.c     | 87 ++++++++++++++++++++++++++++++------------
 2 files changed, 76 insertions(+), 25 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index b8b5c9ab..c0b9369e 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -48,9 +48,14 @@ struct sbi_dbtr_shmem {
 	unsigned long phys_hi;
 };
 
+struct sbi_hw_trigger {
+	unsigned long index;
+	bool inuse; /* Allocated for a DBTR trigger */
+	unsigned long type_mask; /* Types supported by this trigger */
+};
+
 struct sbi_dbtr_trigger {
 	unsigned long index;
-	unsigned long type_mask;
 	unsigned long state;
 	unsigned long tdata1;
 	unsigned long tdata2;
@@ -69,6 +74,7 @@ struct sbi_dbtr_id_msg {
 };
 
 struct sbi_dbtr_hart_triggers_state {
+	struct sbi_hw_trigger hw_triggers[RV_MAX_TRIGGERS];
 	struct sbi_dbtr_trigger triggers[RV_MAX_TRIGGERS];
 	struct sbi_dbtr_shmem shmem;
 	u32 total_trigs;
@@ -89,6 +95,12 @@ struct sbi_dbtr_hart_triggers_state {
 			   & RV_DBTR_BIT_MASK(TS, HW_IDX));	\
 	}while (0);
 
+#define GET_TRIG_HW_INDEX(_state)				\
+	({							\
+		(_state & RV_DBTR_BIT_MASK(TS, HW_IDX))		\
+			    >> RV_DBTR_BIT(TS, HW_IDX);		\
+	})
+
 /** SBI shared mem messages layout */
 union sbi_dbtr_shmem_entry {
 	struct sbi_dbtr_data_msg data;
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 3aea486e..74b114b8 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_csr_detect.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_byteorder.h>
+#include <sbi/sbi_string.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_trap.h>
@@ -43,6 +44,15 @@ static unsigned long hart_state_ptr_offset;
 		(__trg);						\
 	})
 
+#define INDEX_TO_HW_TRIGGER(_index)					\
+	({								\
+		struct sbi_hw_trigger *__trg = NULL;			\
+		struct sbi_dbtr_hart_triggers_state *__hs = NULL;	\
+		__hs = dbtr_get_hart_state_ptr(sbi_scratch_thishart_ptr()); \
+		__trg = &__hs->hw_triggers[_index];			\
+		(__trg);						\
+	})
+
 #define for_each_trig_entry(_base, _max, _etype, _entry)		\
 	for (int _idx = 0; _entry = ((_etype *)_base + _idx),		\
 	     _idx < _max;						\
@@ -75,17 +85,6 @@ static inline void *hart_shmem_base(
 			hs->shmem.phys_hi, hs->shmem.phys_lo));
 }
 
-static void sbi_trigger_init(struct sbi_dbtr_trigger *trig,
-			     unsigned long type_mask, unsigned long idx)
-{
-	trig->type_mask = type_mask;
-	trig->state = 0;
-	trig->tdata1 = 0;
-	trig->tdata2 = 0;
-	trig->tdata3 = 0;
-	trig->index = idx;
-}
-
 static inline struct sbi_dbtr_trigger *sbi_alloc_trigger(void)
 {
 	int i;
@@ -126,6 +125,16 @@ static inline void sbi_free_trigger(struct sbi_dbtr_trigger *trig)
 	if (!hart_state)
 		return;
 
+	if (trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) {
+		unsigned long hw_index = GET_TRIG_HW_INDEX(trig->state);
+		struct sbi_hw_trigger *hw_trig = INDEX_TO_HW_TRIGGER(hw_index);
+		if (!hw_trig->inuse)
+			sbi_printf("DBTR error: Hardware trigger was not marked inuse\n");
+		if (hw_index != hw_trig->index)
+			sbi_printf("DBTR error: HW index mismatch\n");
+		hw_trig->inuse = false;
+	}
+
 	trig->state = 0;
 	trig->tdata1 = 0;
 	trig->tdata2 = 0;
@@ -136,10 +145,15 @@ static inline void sbi_free_trigger(struct sbi_dbtr_trigger *trig)
 
 static bool sbi_hw_trigger_probe(int i)
 {
+	struct sbi_hw_trigger *hw_trig = INDEX_TO_HW_TRIGGER(i);
 	struct sbi_trap_info trap = {0};
 	unsigned long tdata1;
 	unsigned long val;
 
+	sbi_memset(hw_trig, 0, sizeof(*hw_trig));
+
+	hw_trig->index = i;
+
 	csr_write_allowed(CSR_TSELECT, &trap, i);
 	if (trap.cause)
 		return false;
@@ -172,12 +186,12 @@ static bool sbi_hw_trigger_probe(int i)
 		if (type == 0)
 			return false;
 
-		sbi_trigger_init(INDEX_TO_TRIGGER(i), BIT(type), i);
+		hw_trig->type_mask = BIT(type);
 	} else {
 		if (val == 1)
 			return false;
 
-		sbi_trigger_init(INDEX_TO_TRIGGER(i), val, i);
+		hw_trig->type_mask = val;
 	}
 
 	return true;
@@ -213,6 +227,17 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 	if (hart_state->probed)
 		goto _probed;
 
+	/*
+	 * dbtr triggers are what is exposed to the supervisor. hw triggers
+	 * are what is selected by tselect. For now these are tied to the
+	 * same index.
+	 */
+	for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+		struct sbi_dbtr_trigger *trig = INDEX_TO_TRIGGER(i);
+		sbi_memset(trig, 0, sizeof(*trig));
+		trig->index = i;
+	}
+
 	for (i = 0; i < RV_MAX_TRIGGERS; i++) {
 		if (sbi_hw_trigger_probe(i))
 			hart_state->total_trigs++;
@@ -304,6 +329,7 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 }
 
 static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
+			       struct sbi_hw_trigger *hw_trig,
 			       struct sbi_dbtr_data_msg *recv)
 {
 	unsigned long tdata1;
@@ -321,7 +347,9 @@ static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
 
 	__set_bit(RV_DBTR_BIT(TS, MAPPED), &trig->state);
 
-	SET_TRIG_HW_INDEX(trig->state, trig->index);
+	SET_TRIG_HW_INDEX(trig->state, hw_trig->index);
+
+	hw_trig->inuse = true;
 
 	switch (TDATA1_GET_TYPE(tdata1)) {
 	case RISCV_DBTR_TRIG_MCONTROL:
@@ -423,7 +451,7 @@ static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
 	 * where tdata2 and tdata3 can be written with any value that makes
 	 * sense for any trigger type supported by this trigger.
 	 */
-	csr_write(CSR_TSELECT, trig->index);
+	csr_write(CSR_TSELECT, GET_TRIG_HW_INDEX(state));
 	csr_write(CSR_TDATA1, 0x0);
 	csr_write(CSR_TDATA2, trig->tdata2);
 	csr_write(CSR_TDATA1, trig->tdata1);
@@ -459,7 +487,7 @@ static void dbtr_trigger_disable(struct sbi_dbtr_trigger *trig)
 		break;
 	}
 
-	csr_write(CSR_TSELECT, trig->index);
+	csr_write(CSR_TSELECT, GET_TRIG_HW_INDEX(trig->state));
 	csr_write(CSR_TDATA1, trig->tdata1);
 }
 
@@ -468,7 +496,7 @@ static void dbtr_trigger_clear(struct sbi_dbtr_trigger *trig)
 	if (!trig || !(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
 		return;
 
-	csr_write(CSR_TSELECT, trig->index);
+	csr_write(CSR_TSELECT, GET_TRIG_HW_INDEX(trig->state));
 	csr_write(CSR_TDATA1, 0x0);
 	csr_write(CSR_TDATA2, 0x0);
 }
@@ -527,7 +555,7 @@ int sbi_dbtr_num_trig(unsigned long data, unsigned long *out)
 	unsigned long type = TDATA1_GET_TYPE(data);
 	u32 hartid = current_hartid();
 	unsigned long total = 0;
-	struct sbi_dbtr_trigger *trig;
+	struct sbi_hw_trigger *hw_trig;
 	int i;
 	struct sbi_dbtr_hart_triggers_state *hs;
 
@@ -541,9 +569,9 @@ int sbi_dbtr_num_trig(unsigned long data, unsigned long *out)
 	}
 
 	for (i = 0; i < hs->total_trigs; i++) {
-		trig = INDEX_TO_TRIGGER(i);
+		hw_trig = INDEX_TO_HW_TRIGGER(i);
 
-		if (__test_bit(type, &trig->type_mask))
+		if (__test_bit(type, &hw_trig->type_mask))
 			total++;
 	}
 
@@ -589,7 +617,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 
 		xmit->tstate = cpu_to_lle(trig->state);
 		if (trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) {
-			csr_write(CSR_TSELECT, trig->index);
+			csr_write(CSR_TSELECT, GET_TRIG_HW_INDEX(trig->state));
 			trig->tdata1 = csr_read(CSR_TDATA1);
 			trig->tdata2 = csr_read_allowed(CSR_TDATA2, &trap);
 			trig->tdata3 = csr_read_allowed(CSR_TDATA3, &trap);
@@ -666,6 +694,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 	/* Install triggers */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		struct sbi_hw_trigger *hw_trig;
 		/*
 		 * Since we have already checked if enough triggers are
 		 * available, trigger allocation must succeed.
@@ -675,10 +704,18 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
 
-		dbtr_trigger_setup(trig,  recv);
+		hw_trig = INDEX_TO_HW_TRIGGER(trig->index); /* 1:1 trig / HW idx */
+		if (hw_trig->inuse) {
+			*out = hs->available_trigs;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+					trig_count * sizeof(*entry));
+			sbi_printf("DBTR error: Hardware trigger already inuse\n");
+			return SBI_ERR_FAILED;
+		}
+
+		dbtr_trigger_setup(trig, hw_trig, recv);
 		dbtr_trigger_enable(trig);
 		xmit->idx = cpu_to_lle(trig->index);
-
 	}
 
 	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
@@ -771,6 +808,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			 unsigned long trig_count, unsigned long *out)
 {
 	struct sbi_dbtr_trigger *trig;
+	struct sbi_hw_trigger *hw_trig;
 	union sbi_dbtr_shmem_entry *entry;
 	struct sbi_dbtr_data_msg *recv;
 	void *shmem_base = NULL;
@@ -835,7 +873,8 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	/* Update triggers */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		trig = INDEX_TO_TRIGGER(entry->id.idx);
-		dbtr_trigger_setup(trig, &entry->data);
+		hw_trig = INDEX_TO_HW_TRIGGER(GET_TRIG_HW_INDEX(trig->state));
+		dbtr_trigger_setup(trig, hw_trig, &entry->data);
 		dbtr_trigger_enable(trig);
 	}
 
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
