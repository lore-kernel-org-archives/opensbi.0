From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 17 Oct 2023 15:20:19 -0700
Subject: [PATCH] lib: sbi: Correctly limit flushes to a single ASID/VMID
Message-ID: <20231017222027.3668468-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Per the SBI specification, the effects of these functions are limited to
a specific ASID and/or VMID. This applies even when flushing the entire
address space.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
The SBI spec doesn't say anything about this `start == 0 && size == 0`
exception, so I wonder if it should be removed entirely.

 lib/sbi/sbi_tlb.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index ced2854..dad9508 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -111,12 +111,7 @@ void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo)
 	hgatp = csr_swap(CSR_HGATP,
 			 (vmid << HGATP_VMID_SHIFT) & HGATP_VMID_MASK);
 
-	if (start == 0 && size == 0) {
-		__sbi_hfence_vvma_all();
-		goto done;
-	}
-
-	if (size == SBI_TLB_FLUSH_ALL) {
+	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__sbi_hfence_vvma_asid(asid);
 		goto done;
 	}
@@ -138,12 +133,7 @@ void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD);
 
-	if (start == 0 && size == 0) {
-		__sbi_hfence_gvma_all();
-		return;
-	}
-
-	if (size == SBI_TLB_FLUSH_ALL) {
+	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__sbi_hfence_gvma_vmid(vmid);
 		return;
 	}
@@ -162,13 +152,8 @@ void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_RCVD);
 
-	if (start == 0 && size == 0) {
-		tlb_flush_all();
-		return;
-	}
-
 	/* Flush entire MM context for a given ASID */
-	if (size == SBI_TLB_FLUSH_ALL) {
+	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__asm__ __volatile__("sfence.vma x0, %0"
 				     :
 				     : "r"(asid)
-- 
2.41.0


