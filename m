From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 25 Sep 2020 16:59:05 +0530
Subject: [PATCH 07/16] lib: sbi: Extend sbi_hsm_hart_started_mask() for domains
In-Reply-To: <20200925112914.725846-1-anup.patel@wdc.com>
References: <20200925112914.725846-1-anup.patel@wdc.com>
Message-ID: <20200925112914.725846-8-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_hsm_hart_started_mask() API should take one more parameter
to allow caller specify domain under which started_mask is being
generated. Further, the sbi_hsm_hart_started_mask() depends on
sbi_hsm_hart_get_state() which also should return HART state under
specified domain.

This patch updates both sbi_hsm_hart_started_mask() and
sbi_hsm_hart_get_state() as-per above.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_hsm.h      |  7 ++++---
 lib/sbi/sbi_ecall_hsm.c    |  4 +++-
 lib/sbi/sbi_ecall_legacy.c |  4 +++-
 lib/sbi/sbi_hsm.c          | 17 ++++++++++-------
 lib/sbi/sbi_ipi.c          |  6 ++++--
 lib/sbi/sbi_system.c       |  4 +++-
 6 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index 18d129b..296b267 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -19,6 +19,7 @@
 #define SBI_HART_STARTED	3
 #define SBI_HART_UNKNOWN	4
 
+struct sbi_domain;
 struct sbi_scratch;
 
 int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot);
@@ -27,10 +28,10 @@ void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch);
 int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
 		       ulong saddr, ulong smode, ulong priv);
 int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
-int sbi_hsm_hart_get_state(u32 hartid);
+int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
 int sbi_hsm_hart_state_to_status(int state);
-bool sbi_hsm_hart_started(u32 hartid);
-int sbi_hsm_hart_started_mask(ulong hbase, ulong *out_hmask);
+int sbi_hsm_hart_started_mask(const struct sbi_domain *dom,
+			      ulong hbase, ulong *out_hmask);
 void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid);
 
 #endif
diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index 992c93a..3698a41 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -7,6 +7,7 @@
  *   Atish Patra <atish.patra@wdc.com>
  */
 
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
@@ -34,7 +35,8 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_hsm_hart_stop(scratch, TRUE);
 		break;
 	case SBI_EXT_HSM_HART_GET_STATUS:
-		hstate = sbi_hsm_hart_get_state(args[0]);
+		hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(),
+						args[0]);
 		ret = sbi_hsm_hart_state_to_status(hstate);
 		break;
 	default:
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 3bfe749..909cbe3 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -10,6 +10,7 @@
 
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
@@ -33,7 +34,8 @@ static int sbi_load_hart_mask_unpriv(ulong *pmask, ulong *hmask,
 		if (uptrap->cause)
 			return SBI_ETRAP;
 	} else {
-		sbi_hsm_hart_started_mask(0, &mask);
+		sbi_hsm_hart_started_mask(sbi_domain_thishart_ptr(),
+					  0, &mask);
 	}
 	*hmask = mask;
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 8c1b7b0..1f8dadc 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -13,6 +13,7 @@
 #include <sbi/riscv_atomic.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_hart.h>
@@ -56,13 +57,13 @@ int sbi_hsm_hart_state_to_status(int state)
 	return ret;
 }
 
-int sbi_hsm_hart_get_state(u32 hartid)
+int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
 {
 	struct sbi_hsm_data *hdata;
 	struct sbi_scratch *scratch;
 
 	scratch = sbi_hartid_to_scratch(hartid);
-	if (!scratch)
+	if (!scratch || !sbi_domain_assigned_hart(dom, hartid))
 		return SBI_HART_UNKNOWN;
 
 	hdata = sbi_scratch_offset_ptr(scratch, hart_data_offset);
@@ -70,9 +71,9 @@ int sbi_hsm_hart_get_state(u32 hartid)
 	return atomic_read(&hdata->state);
 }
 
-bool sbi_hsm_hart_started(u32 hartid)
+static bool sbi_hsm_hart_started(const struct sbi_domain *dom, u32 hartid)
 {
-	if (sbi_hsm_hart_get_state(hartid) == SBI_HART_STARTED)
+	if (sbi_hsm_hart_get_state(dom, hartid) == SBI_HART_STARTED)
 		return TRUE;
 	else
 		return FALSE;
@@ -80,12 +81,14 @@ bool sbi_hsm_hart_started(u32 hartid)
 
 /**
  * Get ulong HART mask for given HART base ID
+ * @param dom the domain to be used for output HART mask
  * @param hbase the HART base ID
  * @param out_hmask the output ulong HART mask
  * @return 0 on success and SBI_Exxx (< 0) on failure
  * Note: the output HART mask will be set to zero on failure as well.
  */
-int sbi_hsm_hart_started_mask(ulong hbase, ulong *out_hmask)
+int sbi_hsm_hart_started_mask(const struct sbi_domain *dom,
+			      ulong hbase, ulong *out_hmask)
 {
 	ulong i;
 	ulong hcount = sbi_scratch_last_hartid() + 1;
@@ -97,7 +100,7 @@ int sbi_hsm_hart_started_mask(ulong hbase, ulong *out_hmask)
 		hcount = BITS_PER_LONG;
 
 	for (i = hbase; i < hcount; i++) {
-		if (sbi_hsm_hart_get_state(i) == SBI_HART_STARTED)
+		if (sbi_hsm_hart_get_state(dom, i) == SBI_HART_STARTED)
 			*out_hmask |= 1UL << (i - hbase);
 	}
 
@@ -259,7 +262,7 @@ int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
-	if (!sbi_hsm_hart_started(hartid))
+	if (!sbi_hsm_hart_started(sbi_domain_thishart_ptr(), hartid))
 		return SBI_EINVAL;
 
 	oldstate = atomic_cmpxchg(&hdata->state, SBI_HART_STARTED,
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index a27dea0..4347832 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -12,6 +12,7 @@
 #include <sbi/riscv_atomic.h>
 #include <sbi/riscv_barrier.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hsm.h>
@@ -77,10 +78,11 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 {
 	int rc;
 	ulong i, m;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (hbase != -1UL) {
-		rc = sbi_hsm_hart_started_mask(hbase, &m);
+		rc = sbi_hsm_hart_started_mask(dom, hbase, &m);
 		if (rc)
 			return rc;
 		m &= hmask;
@@ -92,7 +94,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 		}
 	} else {
 		hbase = 0;
-		while (!sbi_hsm_hart_started_mask(hbase, &m)) {
+		while (!sbi_hsm_hart_started_mask(dom, hbase, &m)) {
 			/* Send IPIs */
 			for (i = hbase; m; i++, m >>= 1) {
 				if (m & 1UL)
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index 6f7be14..a938003 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -10,6 +10,7 @@
 
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_platform.h>
@@ -21,10 +22,11 @@ void __noreturn sbi_system_reset(u32 platform_reset_type)
 {
 	ulong hbase = 0, hmask;
 	u32 cur_hartid = current_hartid();
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	/* Send HALT IPI to every hart other than the current hart */
-	while (!sbi_hsm_hart_started_mask(hbase, &hmask)) {
+	while (!sbi_hsm_hart_started_mask(dom, hbase, &hmask)) {
 		if (hbase <= cur_hartid)
 			hmask &= ~(1UL << (cur_hartid - hbase));
 		if (hmask)
-- 
2.25.1


