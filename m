From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 12 Dec 2023 15:29:21 +0530
Subject: [PATCH v2 1/6] lib: sbi_tlb: Reduce size of struct sbi_tlb_info
In-Reply-To: <20231212095926.13371-1-apatel@ventanamicro.com>
References: <20231212095926.13371-1-apatel@ventanamicro.com>
Message-ID: <20231212095926.13371-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let us reduce the size of struct sbi_tlb_info by doing the
following:
1) Change the data type of asid and vmid fields to uint16_t
2) Replace local_fn() function pointer with an enum

Based on the above, the size of struct sbi_tlb_info is reduced
by 16 bytes on RV64 and 4 bytes on RV32.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_tlb.h      | 29 ++++++++------
 lib/sbi/sbi_ecall_legacy.c |  8 ++--
 lib/sbi/sbi_ecall_rfence.c | 16 ++++----
 lib/sbi/sbi_tlb.c          | 81 ++++++++++++++++++++++++--------------
 4 files changed, 77 insertions(+), 57 deletions(-)

diff --git a/include/sbi/sbi_tlb.h b/include/sbi/sbi_tlb.h
index 55dcab0..2c50fe8 100644
--- a/include/sbi/sbi_tlb.h
+++ b/include/sbi/sbi_tlb.h
@@ -22,30 +22,33 @@
 
 struct sbi_scratch;
 
+enum sbi_tlb_type {
+	SBI_TLB_FENCE_I = 0,
+	SBI_TLB_SFENCE_VMA,
+	SBI_TLB_SFENCE_VMA_ASID,
+	SBI_TLB_HFENCE_GVMA_VMID,
+	SBI_TLB_HFENCE_GVMA,
+	SBI_TLB_HFENCE_VVMA_ASID,
+	SBI_TLB_HFENCE_VVMA,
+	SBI_TLB_TYPE_MAX,
+};
+
 struct sbi_tlb_info {
 	unsigned long start;
 	unsigned long size;
-	unsigned long asid;
-	unsigned long vmid;
-	void (*local_fn)(struct sbi_tlb_info *tinfo);
+	uint16_t asid;
+	uint16_t vmid;
+	enum sbi_tlb_type type;
 	struct sbi_hartmask smask;
 };
 
-void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo);
-void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo);
-void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo);
-void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo);
-void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo);
-void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo);
-void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo);
-
-#define SBI_TLB_INFO_INIT(__p, __start, __size, __asid, __vmid, __lfn, __src) \
+#define SBI_TLB_INFO_INIT(__p, __start, __size, __asid, __vmid, __type, __src) \
 do { \
 	(__p)->start = (__start); \
 	(__p)->size = (__size); \
 	(__p)->asid = (__asid); \
 	(__p)->vmid = (__vmid); \
-	(__p)->local_fn = (__lfn); \
+	(__p)->type = (__type); \
 	SBI_HARTMASK_INIT_EXCEPT(&(__p)->smask, (__src)); \
 } while (0)
 
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 99e862e..556f629 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -80,8 +80,7 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 						&hmask, out_trap);
 		if (ret != SBI_ETRAP) {
 			SBI_TLB_INFO_INIT(&tlb_info, 0, 0, 0, 0,
-					  sbi_tlb_local_fence_i,
-					  source_hart);
+					  SBI_TLB_FENCE_I, source_hart);
 			ret = sbi_tlb_request(hmask, 0, &tlb_info);
 		}
 		break;
@@ -90,8 +89,7 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 						&hmask, out_trap);
 		if (ret != SBI_ETRAP) {
 			SBI_TLB_INFO_INIT(&tlb_info, regs->a1, regs->a2, 0, 0,
-					  sbi_tlb_local_sfence_vma,
-					  source_hart);
+					  SBI_TLB_SFENCE_VMA, source_hart);
 			ret = sbi_tlb_request(hmask, 0, &tlb_info);
 		}
 		break;
@@ -101,7 +99,7 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 		if (ret != SBI_ETRAP) {
 			SBI_TLB_INFO_INIT(&tlb_info, regs->a1,
 					  regs->a2, regs->a3, 0,
-					  sbi_tlb_local_sfence_vma_asid,
+					  SBI_TLB_SFENCE_VMA_ASID,
 					  source_hart);
 			ret = sbi_tlb_request(hmask, 0, &tlb_info);
 		}
diff --git a/lib/sbi/sbi_ecall_rfence.c b/lib/sbi/sbi_ecall_rfence.c
index 22c6652..4b74d41 100644
--- a/lib/sbi/sbi_ecall_rfence.c
+++ b/lib/sbi/sbi_ecall_rfence.c
@@ -33,43 +33,41 @@ static int sbi_ecall_rfence_handler(unsigned long extid, unsigned long funcid,
 	switch (funcid) {
 	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
 		SBI_TLB_INFO_INIT(&tlb_info, 0, 0, 0, 0,
-				  sbi_tlb_local_fence_i, source_hart);
+				  SBI_TLB_FENCE_I, source_hart);
 		ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
 		SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, 0,
-				  sbi_tlb_local_hfence_gvma, source_hart);
+				  SBI_TLB_HFENCE_GVMA, source_hart);
 		ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
 		SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, regs->a4,
-				  sbi_tlb_local_hfence_gvma_vmid,
-				  source_hart);
+				  SBI_TLB_HFENCE_GVMA_VMID, source_hart);
 		ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
 		vmid = (csr_read(CSR_HGATP) & HGATP_VMID_MASK);
 		vmid = vmid >> HGATP_VMID_SHIFT;
 		SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, vmid,
-				  sbi_tlb_local_hfence_vvma, source_hart);
+				  SBI_TLB_HFENCE_VVMA, source_hart);
 		ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
 		vmid = (csr_read(CSR_HGATP) & HGATP_VMID_MASK);
 		vmid = vmid >> HGATP_VMID_SHIFT;
 		SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, regs->a4,
-				  vmid, sbi_tlb_local_hfence_vvma_asid,
-				  source_hart);
+				  vmid, SBI_TLB_HFENCE_VVMA_ASID, source_hart);
 		ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
 		SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, 0, 0,
-				  sbi_tlb_local_sfence_vma, source_hart);
+				  SBI_TLB_SFENCE_VMA, source_hart);
 		ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
 		SBI_TLB_INFO_INIT(&tlb_info, regs->a2, regs->a3, regs->a4, 0,
-				  sbi_tlb_local_sfence_vma_asid, source_hart);
+				  SBI_TLB_SFENCE_VMA_ASID, source_hart);
 		ret = sbi_tlb_request(regs->a0, regs->a1, &tlb_info);
 		break;
 	default:
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index d3ed56d..cca319f 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -34,7 +34,7 @@ static void tlb_flush_all(void)
 	__asm__ __volatile("sfence.vma");
 }
 
-void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo)
+static void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo)
 {
 	unsigned long start = tinfo->start;
 	unsigned long size  = tinfo->size;
@@ -59,7 +59,7 @@ done:
 	csr_write(CSR_HGATP, hgatp);
 }
 
-void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo)
+static void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo)
 {
 	unsigned long start = tinfo->start;
 	unsigned long size  = tinfo->size;
@@ -77,7 +77,7 @@ void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo)
 	}
 }
 
-void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
+static void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
 {
 	unsigned long start = tinfo->start;
 	unsigned long size  = tinfo->size;
@@ -98,7 +98,7 @@ void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
 	}
 }
 
-void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo)
+static void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo)
 {
 	unsigned long start = tinfo->start;
 	unsigned long size  = tinfo->size;
@@ -124,7 +124,7 @@ done:
 	csr_write(CSR_HGATP, hgatp);
 }
 
-void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
+static void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
 {
 	unsigned long start = tinfo->start;
 	unsigned long size  = tinfo->size;
@@ -143,7 +143,7 @@ void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
 	}
 }
 
-void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
+static void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
 {
 	unsigned long start = tinfo->start;
 	unsigned long size  = tinfo->size;
@@ -169,32 +169,43 @@ void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
 	}
 }
 
-void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo)
+static void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo)
 {
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_FENCE_I_RECVD);
 
 	__asm__ __volatile("fence.i");
 }
 
-static void tlb_pmu_incr_fw_ctr(struct sbi_tlb_info *data)
+static void tlb_entry_local_process(struct sbi_tlb_info *data)
 {
 	if (unlikely(!data))
 		return;
 
-	if (data->local_fn == sbi_tlb_local_fence_i)
-		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_FENCE_I_SENT);
-	else if (data->local_fn == sbi_tlb_local_sfence_vma)
-		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_SENT);
-	else if (data->local_fn == sbi_tlb_local_sfence_vma_asid)
-		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_SENT);
-	else if (data->local_fn == sbi_tlb_local_hfence_gvma)
-		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_SENT);
-	else if (data->local_fn == sbi_tlb_local_hfence_gvma_vmid)
-		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_VMID_SENT);
-	else if (data->local_fn == sbi_tlb_local_hfence_vvma)
-		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_SENT);
-	else if (data->local_fn == sbi_tlb_local_hfence_vvma_asid)
-		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
+	switch (data->type) {
+	case SBI_TLB_FENCE_I:
+		sbi_tlb_local_fence_i(data);
+		break;
+	case SBI_TLB_SFENCE_VMA:
+		sbi_tlb_local_sfence_vma(data);
+		break;
+	case SBI_TLB_SFENCE_VMA_ASID:
+		sbi_tlb_local_sfence_vma_asid(data);
+		break;
+	case SBI_TLB_HFENCE_GVMA_VMID:
+		sbi_tlb_local_hfence_gvma_vmid(data);
+		break;
+	case SBI_TLB_HFENCE_GVMA:
+		sbi_tlb_local_hfence_gvma(data);
+		break;
+	case SBI_TLB_HFENCE_VVMA_ASID:
+		sbi_tlb_local_hfence_vvma_asid(data);
+		break;
+	case SBI_TLB_HFENCE_VVMA:
+		sbi_tlb_local_hfence_vvma(data);
+		break;
+	default:
+		break;
+	};
 }
 
 static void tlb_entry_process(struct sbi_tlb_info *tinfo)
@@ -203,7 +214,7 @@ static void tlb_entry_process(struct sbi_tlb_info *tinfo)
 	struct sbi_scratch *rscratch = NULL;
 	atomic_t *rtlb_sync = NULL;
 
-	tinfo->local_fn(tinfo);
+	tlb_entry_local_process(tinfo);
 
 	sbi_hartmask_for_each_hartindex(rindex, &tinfo->smask) {
 		rscratch = sbi_hartindex_to_scratch(rindex);
@@ -305,12 +316,12 @@ static int tlb_update_cb(void *in, void *data)
 	curr = (struct sbi_tlb_info *)data;
 	next = (struct sbi_tlb_info *)in;
 
-	if (next->local_fn == sbi_tlb_local_sfence_vma_asid &&
-	    curr->local_fn == sbi_tlb_local_sfence_vma_asid) {
+	if (next->type == SBI_TLB_SFENCE_VMA_ASID &&
+	    curr->type == SBI_TLB_SFENCE_VMA_ASID) {
 		if (next->asid == curr->asid)
 			ret = tlb_range_check(curr, next);
-	} else if (next->local_fn == sbi_tlb_local_sfence_vma &&
-		   curr->local_fn == sbi_tlb_local_sfence_vma) {
+	} else if (next->type == SBI_TLB_SFENCE_VMA &&
+		   curr->type == SBI_TLB_SFENCE_VMA) {
 		ret = tlb_range_check(curr, next);
 	}
 
@@ -332,7 +343,7 @@ static int tlb_update(struct sbi_scratch *scratch,
 	 * then just do a local flush and return;
 	 */
 	if (sbi_hartindex_to_hartid(remote_hartindex) == curr_hartid) {
-		tinfo->local_fn(tinfo);
+		tlb_entry_local_process(tinfo);
 		return SBI_IPI_UPDATE_BREAK;
 	}
 
@@ -370,9 +381,19 @@ static struct sbi_ipi_event_ops tlb_ops = {
 
 static u32 tlb_event = SBI_IPI_EVENT_MAX;
 
+static const u32 tlb_type_to_pmu_fw_event[SBI_TLB_TYPE_MAX] = {
+	[SBI_TLB_FENCE_I] = SBI_PMU_FW_FENCE_I_SENT,
+	[SBI_TLB_SFENCE_VMA] = SBI_PMU_FW_SFENCE_VMA_SENT,
+	[SBI_TLB_SFENCE_VMA_ASID] = SBI_PMU_FW_SFENCE_VMA_ASID_SENT,
+	[SBI_TLB_HFENCE_GVMA_VMID] = SBI_PMU_FW_HFENCE_GVMA_VMID_SENT,
+	[SBI_TLB_HFENCE_GVMA] = SBI_PMU_FW_HFENCE_GVMA_SENT,
+	[SBI_TLB_HFENCE_VVMA_ASID] = SBI_PMU_FW_HFENCE_VVMA_ASID_SENT,
+	[SBI_TLB_HFENCE_VVMA] = SBI_PMU_FW_HFENCE_VVMA_SENT,
+};
+
 int sbi_tlb_request(ulong hmask, ulong hbase, struct sbi_tlb_info *tinfo)
 {
-	if (!tinfo->local_fn)
+	if (tinfo->type < 0 || tinfo->type >= SBI_TLB_TYPE_MAX)
 		return SBI_EINVAL;
 
 	/*
@@ -385,7 +406,7 @@ int sbi_tlb_request(ulong hmask, ulong hbase, struct sbi_tlb_info *tinfo)
 		tinfo->size = SBI_TLB_FLUSH_ALL;
 	}
 
-	tlb_pmu_incr_fw_ctr(tinfo);
+	sbi_pmu_ctr_incr_fw(tlb_type_to_pmu_fw_event[tinfo->type]);
 
 	return sbi_ipi_send_many(hmask, hbase, tlb_event, tinfo);
 }
-- 
2.34.1


