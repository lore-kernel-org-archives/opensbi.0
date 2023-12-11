From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Dec 2023 23:37:37 +0530
Subject: [PATCH 4/5] lib: sbi: Allow ecall handlers to directly update register state
In-Reply-To: <20231211180738.891727-1-apatel@ventanamicro.com>
References: <20231211180738.891727-1-apatel@ventanamicro.com>
Message-ID: <20231211180738.891727-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some of the upcoming SBI extensions (such as SSE) will directly
update register state so improve the prototype of ecall handler
to accommodate this. Further, this flexibility allows us to
push the trap redirection from sbi_ecall_handler() to the
sbi_ecall_legacy_handler().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ecall.h                      | 12 +++++--
 include/sbi/sbi_platform.h                   | 19 ++++------
 lib/sbi/sbi_ecall.c                          | 13 +++----
 lib/sbi/sbi_ecall_base.c                     | 27 +++++++-------
 lib/sbi/sbi_ecall_cppc.c                     | 13 ++++---
 lib/sbi/sbi_ecall_dbcn.c                     |  9 +++--
 lib/sbi/sbi_ecall_hsm.c                      |  7 ++--
 lib/sbi/sbi_ecall_ipi.c                      |  5 ++-
 lib/sbi/sbi_ecall_legacy.c                   | 37 +++++++++++++++-----
 lib/sbi/sbi_ecall_pmu.c                      | 17 +++++----
 lib/sbi/sbi_ecall_rfence.c                   |  5 ++-
 lib/sbi/sbi_ecall_srst.c                     |  5 ++-
 lib/sbi/sbi_ecall_susp.c                     |  7 ++--
 lib/sbi/sbi_ecall_time.c                     |  5 ++-
 lib/sbi/sbi_ecall_vendor.c                   |  8 ++---
 platform/generic/andes/andes_sbi.c           |  7 ++--
 platform/generic/include/andes/andes_sbi.h   |  6 ++--
 platform/generic/include/platform_override.h |  6 ++--
 platform/generic/platform.c                  |  8 ++---
 19 files changed, 109 insertions(+), 107 deletions(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index 027213c..0bf42d1 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -20,6 +20,13 @@
 struct sbi_trap_regs;
 struct sbi_trap_info;
 
+struct sbi_ecall_return {
+	/* Return flag to skip register update */
+	bool skip_regs_update;
+	/* Return value */
+	unsigned long value;
+};
+
 struct sbi_ecall_extension {
 	/* head is used by the extension list */
 	struct sbi_dlist head;
@@ -62,9 +69,8 @@ struct sbi_ecall_extension {
 	 * never invoked with an invalid or unavailable extension ID.
 	 */
 	int (* handle)(unsigned long extid, unsigned long funcid,
-		       const struct sbi_trap_regs *regs,
-		       unsigned long *out_val,
-		       struct sbi_trap_info *out_trap);
+		       struct sbi_trap_regs *regs,
+		       struct sbi_ecall_return *out);
 };
 
 u16 sbi_ecall_version_major(void);
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 58b9069..2fb33e1 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -50,7 +50,7 @@
 #include <sbi/sbi_version.h>
 
 struct sbi_domain_memregion;
-struct sbi_trap_info;
+struct sbi_ecall_return;
 struct sbi_trap_regs;
 struct sbi_hart_features;
 
@@ -137,9 +137,8 @@ struct sbi_platform_operations {
 	bool (*vendor_ext_check)(void);
 	/** platform specific SBI extension implementation provider */
 	int (*vendor_ext_provider)(long funcid,
-				   const struct sbi_trap_regs *regs,
-				   unsigned long *out_value,
-				   struct sbi_trap_info *out_trap);
+				   struct sbi_trap_regs *regs,
+				   struct sbi_ecall_return *out);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
@@ -666,16 +665,12 @@ static inline bool sbi_platform_vendor_ext_check(
 static inline int sbi_platform_vendor_ext_provider(
 					const struct sbi_platform *plat,
 					long funcid,
-					const struct sbi_trap_regs *regs,
-					unsigned long *out_value,
-					struct sbi_trap_info *out_trap)
+					struct sbi_trap_regs *regs,
+					struct sbi_ecall_return *out)
 {
-	if (plat && sbi_platform_ops(plat)->vendor_ext_provider) {
+	if (plat && sbi_platform_ops(plat)->vendor_ext_provider)
 		return sbi_platform_ops(plat)->vendor_ext_provider(funcid,
-								regs,
-								out_value,
-								out_trap);
-	}
+								regs, out);
 
 	return SBI_ENOTSUPP;
 }
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 3eb4f0a..631c5dd 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -101,14 +101,12 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
 	struct sbi_ecall_extension *ext;
 	unsigned long extension_id = regs->a7;
 	unsigned long func_id = regs->a6;
-	struct sbi_trap_info trap = {0};
-	unsigned long out_val = 0;
+	struct sbi_ecall_return out = {0};
 	bool is_0_1_spec = 0;
 
 	ext = sbi_ecall_find_extension(extension_id);
 	if (ext && ext->handle) {
-		ret = ext->handle(extension_id, func_id,
-				  regs, &out_val, &trap);
+		ret = ext->handle(extension_id, func_id, regs, &out);
 		if (extension_id >= SBI_EXT_0_1_SET_TIMER &&
 		    extension_id <= SBI_EXT_0_1_SHUTDOWN)
 			is_0_1_spec = 1;
@@ -116,10 +114,7 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
 		ret = SBI_ENOTSUPP;
 	}
 
-	if (ret == SBI_ETRAP) {
-		trap.epc = regs->mepc;
-		sbi_trap_redirect(regs, &trap);
-	} else {
+	if (!out.skip_regs_update) {
 		if (ret < SBI_LAST_ERR ||
 		    (extension_id != SBI_EXT_0_1_CONSOLE_GETCHAR &&
 		     SBI_SUCCESS < ret)) {
@@ -140,7 +135,7 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
 		regs->mepc += 4;
 		regs->a0 = ret;
 		if (!is_0_1_spec)
-			regs->a1 = out_val;
+			regs->a1 = out.value;
 	}
 
 	return 0;
diff --git a/lib/sbi/sbi_ecall_base.c b/lib/sbi/sbi_ecall_base.c
index 74f05eb..b7178ea 100644
--- a/lib/sbi/sbi_ecall_base.c
+++ b/lib/sbi/sbi_ecall_base.c
@@ -33,37 +33,36 @@ static int sbi_ecall_base_probe(unsigned long extid, unsigned long *out_val)
 }
 
 static int sbi_ecall_base_handler(unsigned long extid, unsigned long funcid,
-				  const struct sbi_trap_regs *regs,
-				  unsigned long *out_val,
-				  struct sbi_trap_info *out_trap)
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out)
 {
 	int ret = 0;
 
 	switch (funcid) {
 	case SBI_EXT_BASE_GET_SPEC_VERSION:
-		*out_val = (SBI_ECALL_VERSION_MAJOR <<
-			   SBI_SPEC_VERSION_MAJOR_OFFSET) &
-			   (SBI_SPEC_VERSION_MAJOR_MASK <<
-			    SBI_SPEC_VERSION_MAJOR_OFFSET);
-		*out_val = *out_val | SBI_ECALL_VERSION_MINOR;
+		out->value = (SBI_ECALL_VERSION_MAJOR <<
+			      SBI_SPEC_VERSION_MAJOR_OFFSET) &
+			     (SBI_SPEC_VERSION_MAJOR_MASK <<
+			      SBI_SPEC_VERSION_MAJOR_OFFSET);
+		out->value = out->value | SBI_ECALL_VERSION_MINOR;
 		break;
 	case SBI_EXT_BASE_GET_IMP_ID:
-		*out_val = sbi_ecall_get_impid();
+		out->value = sbi_ecall_get_impid();
 		break;
 	case SBI_EXT_BASE_GET_IMP_VERSION:
-		*out_val = OPENSBI_VERSION;
+		out->value = OPENSBI_VERSION;
 		break;
 	case SBI_EXT_BASE_GET_MVENDORID:
-		*out_val = csr_read(CSR_MVENDORID);
+		out->value = csr_read(CSR_MVENDORID);
 		break;
 	case SBI_EXT_BASE_GET_MARCHID:
-		*out_val = csr_read(CSR_MARCHID);
+		out->value = csr_read(CSR_MARCHID);
 		break;
 	case SBI_EXT_BASE_GET_MIMPID:
-		*out_val = csr_read(CSR_MIMPID);
+		out->value = csr_read(CSR_MIMPID);
 		break;
 	case SBI_EXT_BASE_PROBE_EXT:
-		ret = sbi_ecall_base_probe(regs->a0, out_val);
+		ret = sbi_ecall_base_probe(regs->a0, &out->value);
 		break;
 	default:
 		ret = SBI_ENOTSUPP;
diff --git a/lib/sbi/sbi_ecall_cppc.c b/lib/sbi/sbi_ecall_cppc.c
index b54d54e..c26bb40 100644
--- a/lib/sbi/sbi_ecall_cppc.c
+++ b/lib/sbi/sbi_ecall_cppc.c
@@ -12,9 +12,8 @@
 #include <sbi/sbi_cppc.h>
 
 static int sbi_ecall_cppc_handler(unsigned long extid, unsigned long funcid,
-				  const struct sbi_trap_regs *regs,
-				  unsigned long *out_val,
-				  struct sbi_trap_info *out_trap)
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out)
 {
 	int ret = 0;
 	uint64_t temp;
@@ -22,14 +21,14 @@ static int sbi_ecall_cppc_handler(unsigned long extid, unsigned long funcid,
 	switch (funcid) {
 	case SBI_EXT_CPPC_READ:
 		ret = sbi_cppc_read(regs->a0, &temp);
-		*out_val = temp;
+		out->value = temp;
 		break;
 	case SBI_EXT_CPPC_READ_HI:
 #if __riscv_xlen == 32
 		ret = sbi_cppc_read(regs->a0, &temp);
-		*out_val = temp >> 32;
+		out->value = temp >> 32;
 #else
-		*out_val = 0;
+		out->value = 0;
 #endif
 		break;
 	case SBI_EXT_CPPC_WRITE:
@@ -38,7 +37,7 @@ static int sbi_ecall_cppc_handler(unsigned long extid, unsigned long funcid,
 	case SBI_EXT_CPPC_PROBE:
 		ret = sbi_cppc_probe(regs->a0);
 		if (ret >= 0) {
-			*out_val = ret;
+			out->value = ret;
 			ret = 0;
 		}
 		break;
diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index 18cd6c8..49a7713 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -17,9 +17,8 @@
 #include <sbi/sbi_hart.h>
 
 static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
-				  const struct sbi_trap_regs *regs,
-				  unsigned long *out_val,
-				  struct sbi_trap_info *out_trap)
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out)
 {
 	ulong smode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >>
 			MSTATUS_MPP_SHIFT;
@@ -49,9 +48,9 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 			return SBI_ERR_INVALID_PARAM;
 		sbi_hart_map_saddr(regs->a1, regs->a0);
 		if (funcid == SBI_EXT_DBCN_CONSOLE_WRITE)
-			*out_val = sbi_nputs((const char *)regs->a1, regs->a0);
+			out->value = sbi_nputs((const char *)regs->a1, regs->a0);
 		else
-			*out_val = sbi_ngets((char *)regs->a1, regs->a0);
+			out->value = sbi_ngets((char *)regs->a1, regs->a0);
 		sbi_hart_unmap_saddr();
 		return 0;
 	case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index 20705c3..93170b0 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -17,9 +17,8 @@
 #include <sbi/riscv_asm.h>
 
 static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
-				 const struct sbi_trap_regs *regs,
-				 unsigned long *out_val,
-				 struct sbi_trap_info *out_trap)
+				 struct sbi_trap_regs *regs,
+				 struct sbi_ecall_return *out)
 {
 	int ret = 0;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
@@ -47,7 +46,7 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 	}
 
 	if (ret >= 0) {
-		*out_val = ret;
+		out->value = ret;
 		ret = 0;
 	}
 
diff --git a/lib/sbi/sbi_ecall_ipi.c b/lib/sbi/sbi_ecall_ipi.c
index a40d6b8..50ef41d 100644
--- a/lib/sbi/sbi_ecall_ipi.c
+++ b/lib/sbi/sbi_ecall_ipi.c
@@ -15,9 +15,8 @@
 #include <sbi/sbi_ipi.h>
 
 static int sbi_ecall_ipi_handler(unsigned long extid, unsigned long funcid,
-				 const struct sbi_trap_regs *regs,
-				 unsigned long *out_val,
-				 struct sbi_trap_info *out_trap)
+				 struct sbi_trap_regs *regs,
+				 struct sbi_ecall_return *out)
 {
 	int ret = 0;
 
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 556f629..48bd227 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -43,13 +43,13 @@ static int sbi_load_hart_mask_unpriv(ulong *pmask, ulong *hmask,
 }
 
 static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
-				    const struct sbi_trap_regs *regs,
-				    unsigned long *out_val,
-				    struct sbi_trap_info *out_trap)
+				    struct sbi_trap_regs *regs,
+				    struct sbi_ecall_return *out)
 {
 	int ret = 0;
 	struct sbi_tlb_info tlb_info;
 	u32 source_hart = current_hartid();
+	struct sbi_trap_info trap = {0};
 	ulong hmask = 0;
 
 	switch (extid) {
@@ -71,37 +71,58 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 		break;
 	case SBI_EXT_0_1_SEND_IPI:
 		ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
-						&hmask, out_trap);
-		if (ret != SBI_ETRAP)
+						&hmask, &trap);
+		if (ret != SBI_ETRAP) {
 			ret = sbi_ipi_send_smode(hmask, 0);
+		} else {
+			ret = 0;
+			trap.epc = regs->mepc;
+			sbi_trap_redirect(regs, &trap);
+			out->skip_regs_update = true;
+		}
 		break;
 	case SBI_EXT_0_1_REMOTE_FENCE_I:
 		ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
-						&hmask, out_trap);
+						&hmask, &trap);
 		if (ret != SBI_ETRAP) {
 			SBI_TLB_INFO_INIT(&tlb_info, 0, 0, 0, 0,
 					  SBI_TLB_FENCE_I, source_hart);
 			ret = sbi_tlb_request(hmask, 0, &tlb_info);
+		} else {
+			ret = 0;
+			trap.epc = regs->mepc;
+			sbi_trap_redirect(regs, &trap);
+			out->skip_regs_update = true;
 		}
 		break;
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
 		ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
-						&hmask, out_trap);
+						&hmask, &trap);
 		if (ret != SBI_ETRAP) {
 			SBI_TLB_INFO_INIT(&tlb_info, regs->a1, regs->a2, 0, 0,
 					  SBI_TLB_SFENCE_VMA, source_hart);
 			ret = sbi_tlb_request(hmask, 0, &tlb_info);
+		} else {
+			ret = 0;
+			trap.epc = regs->mepc;
+			sbi_trap_redirect(regs, &trap);
+			out->skip_regs_update = true;
 		}
 		break;
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
 		ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
-						&hmask, out_trap);
+						&hmask, &trap);
 		if (ret != SBI_ETRAP) {
 			SBI_TLB_INFO_INIT(&tlb_info, regs->a1,
 					  regs->a2, regs->a3, 0,
 					  SBI_TLB_SFENCE_VMA_ASID,
 					  source_hart);
 			ret = sbi_tlb_request(hmask, 0, &tlb_info);
+		} else {
+			ret = 0;
+			trap.epc = regs->mepc;
+			sbi_trap_redirect(regs, &trap);
+			out->skip_regs_update = true;
 		}
 		break;
 	case SBI_EXT_0_1_SHUTDOWN:
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index c585911..40a63a6 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -18,9 +18,8 @@
 #include <sbi/riscv_asm.h>
 
 static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
-				 const struct sbi_trap_regs *regs,
-				 unsigned long *out_val,
-				 struct sbi_trap_info *out_trap)
+				 struct sbi_trap_regs *regs,
+				 struct sbi_ecall_return *out)
 {
 	int ret = 0;
 	uint64_t temp;
@@ -29,12 +28,12 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 	case SBI_EXT_PMU_NUM_COUNTERS:
 		ret = sbi_pmu_num_ctr();
 		if (ret >= 0) {
-			*out_val = ret;
+			out->value = ret;
 			ret = 0;
 		}
 		break;
 	case SBI_EXT_PMU_COUNTER_GET_INFO:
-		ret = sbi_pmu_ctr_get_info(regs->a0, out_val);
+		ret = sbi_pmu_ctr_get_info(regs->a0, &out->value);
 		break;
 	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
 #if __riscv_xlen == 32
@@ -45,21 +44,21 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_pmu_ctr_cfg_match(regs->a0, regs->a1, regs->a2,
 					    regs->a3, temp);
 		if (ret >= 0) {
-			*out_val = ret;
+			out->value = ret;
 			ret = 0;
 		}
 
 		break;
 	case SBI_EXT_PMU_COUNTER_FW_READ:
 		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
-		*out_val = temp;
+		out->value = temp;
 		break;
 	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
 #if __riscv_xlen == 32
 		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
-		*out_val = temp >> 32;
+		out->value = temp >> 32;
 #else
-		*out_val = 0;
+		out->value = 0;
 #endif
 		break;
 	case SBI_EXT_PMU_COUNTER_START:
diff --git a/lib/sbi/sbi_ecall_rfence.c b/lib/sbi/sbi_ecall_rfence.c
index 4b74d41..ded16c2 100644
--- a/lib/sbi/sbi_ecall_rfence.c
+++ b/lib/sbi/sbi_ecall_rfence.c
@@ -16,9 +16,8 @@
 #include <sbi/sbi_tlb.h>
 
 static int sbi_ecall_rfence_handler(unsigned long extid, unsigned long funcid,
-				    const struct sbi_trap_regs *regs,
-				    unsigned long *out_val,
-				    struct sbi_trap_info *out_trap)
+				    struct sbi_trap_regs *regs,
+				    struct sbi_ecall_return *out)
 {
 	int ret = 0;
 	unsigned long vmid;
diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
index dcd560d..46cfaca 100644
--- a/lib/sbi/sbi_ecall_srst.c
+++ b/lib/sbi/sbi_ecall_srst.c
@@ -15,9 +15,8 @@
 #include <sbi/sbi_system.h>
 
 static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
-				  const struct sbi_trap_regs *regs,
-				  unsigned long *out_val,
-				  struct sbi_trap_info *out_trap)
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out)
 {
 	if (funcid == SBI_EXT_SRST_RESET) {
 		if ((((u32)-1U) <= ((u64)regs->a0)) ||
diff --git a/lib/sbi/sbi_ecall_susp.c b/lib/sbi/sbi_ecall_susp.c
index 2bfd99a..7b66bfc 100644
--- a/lib/sbi/sbi_ecall_susp.c
+++ b/lib/sbi/sbi_ecall_susp.c
@@ -6,9 +6,8 @@
 #include <sbi/sbi_system.h>
 
 static int sbi_ecall_susp_handler(unsigned long extid, unsigned long funcid,
-				  const struct sbi_trap_regs *regs,
-				  unsigned long *out_val,
-				  struct sbi_trap_info *out_trap)
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out)
 {
 	int ret = SBI_ENOTSUPP;
 
@@ -16,7 +15,7 @@ static int sbi_ecall_susp_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_system_suspend(regs->a0, regs->a1, regs->a2);
 
 	if (ret >= 0) {
-		*out_val = ret;
+		out->value = ret;
 		ret = 0;
 	}
 
diff --git a/lib/sbi/sbi_ecall_time.c b/lib/sbi/sbi_ecall_time.c
index e79196f..5a2316e 100644
--- a/lib/sbi/sbi_ecall_time.c
+++ b/lib/sbi/sbi_ecall_time.c
@@ -15,9 +15,8 @@
 #include <sbi/sbi_timer.h>
 
 static int sbi_ecall_time_handler(unsigned long extid, unsigned long funcid,
-				  const struct sbi_trap_regs *regs,
-				  unsigned long *out_val,
-				  struct sbi_trap_info *out_trap)
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out)
 {
 	int ret = 0;
 
diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
index 700f475..ebebc58 100644
--- a/lib/sbi/sbi_ecall_vendor.c
+++ b/lib/sbi/sbi_ecall_vendor.c
@@ -23,13 +23,11 @@ static inline unsigned long sbi_ecall_vendor_id(void)
 }
 
 static int sbi_ecall_vendor_handler(unsigned long extid, unsigned long funcid,
-				    const struct sbi_trap_regs *regs,
-				    unsigned long *out_val,
-				    struct sbi_trap_info *out_trap)
+				    struct sbi_trap_regs *regs,
+				    struct sbi_ecall_return *out)
 {
 	return sbi_platform_vendor_ext_provider(sbi_platform_thishart_ptr(),
-						funcid, regs,
-						out_val, out_trap);
+						funcid, regs, out);
 }
 
 struct sbi_ecall_extension ecall_vendor;
diff --git a/platform/generic/andes/andes_sbi.c b/platform/generic/andes/andes_sbi.c
index 3e89fb9..267c663 100644
--- a/platform/generic/andes/andes_sbi.c
+++ b/platform/generic/andes/andes_sbi.c
@@ -33,14 +33,13 @@ static bool andes45_apply_iocp_sw_workaround(void)
 }
 
 int andes_sbi_vendor_ext_provider(long funcid,
-				  const struct sbi_trap_regs *regs,
-				  unsigned long *out_value,
-				  struct sbi_trap_info *out_trap,
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out,
 				  const struct fdt_match *match)
 {
 	switch (funcid) {
 	case SBI_EXT_ANDES_IOCP_SW_WORKAROUND:
-		*out_value = andes45_apply_iocp_sw_workaround();
+		out->value = andes45_apply_iocp_sw_workaround();
 		break;
 
 	default:
diff --git a/platform/generic/include/andes/andes_sbi.h b/platform/generic/include/andes/andes_sbi.h
index e5dc250..1288af8 100644
--- a/platform/generic/include/andes/andes_sbi.h
+++ b/platform/generic/include/andes/andes_sbi.h
@@ -3,13 +3,13 @@
 #ifndef _RISCV_ANDES_SBI_H
 #define _RISCV_ANDES_SBI_H
 
+#include <sbi/sbi_ecall.h>
 #include <sbi/sbi_trap.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
 int andes_sbi_vendor_ext_provider(long funcid,
-				  const struct sbi_trap_regs *regs,
-				  unsigned long *out_value,
-				  struct sbi_trap_info *out_trap,
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out,
 				  const struct fdt_match *match);
 
 #endif /* _RISCV_ANDES_SBI_H */
diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index f2a4327..b0585c2 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -10,6 +10,7 @@
 #ifndef __PLATFORM_OVERRIDE_H__
 #define __PLATFORM_OVERRIDE_H__
 
+#include <sbi/sbi_ecall.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_trap.h>
@@ -30,9 +31,8 @@ struct platform_override {
 	int (*pmu_init)(const struct fdt_match *match);
 	void (*fw_init)(void *fdt, const struct fdt_match *match);
 	int (*vendor_ext_provider)(long funcid,
-				   const struct sbi_trap_regs *regs,
-				   unsigned long *out_value,
-				   struct sbi_trap_info *out_trap,
+				   struct sbi_trap_regs *regs,
+				   struct sbi_ecall_return *out,
 				   const struct fdt_match *match);
 };
 
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 8507227..bfd7d31 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -203,12 +203,10 @@ static bool generic_vendor_ext_check(void)
 }
 
 static int generic_vendor_ext_provider(long funcid,
-				       const struct sbi_trap_regs *regs,
-				       unsigned long *out_value,
-				       struct sbi_trap_info *out_trap)
+				       struct sbi_trap_regs *regs,
+				       struct sbi_ecall_return *out)
 {
-	return generic_plat->vendor_ext_provider(funcid, regs,
-						 out_value, out_trap,
+	return generic_plat->vendor_ext_provider(funcid, regs, out,
 						 generic_plat_match);
 }
 
-- 
2.34.1


