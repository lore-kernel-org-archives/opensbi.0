From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 24 Feb 2021 16:01:55 +0530
Subject: [RFC PATCH v2 03/11] lib: sbi: Rename sbi_hsm_hart_started_mask()
 function
In-Reply-To: <20210224103203.246229-1-anup.patel@wdc.com>
References: <20210224103203.246229-1-anup.patel@wdc.com>
Message-ID: <20210224103203.246229-4-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A hart can take interrupt in the new HSM states introduced by the
SBI HSM suspend function (such as SUSPENDED state) so we rename
sbi_hsm_hart_started_mask() to something more generic such as
sbi_hsm_hart_interruptible_mask().

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_hsm.h      | 4 ++--
 lib/sbi/sbi_ecall_legacy.c | 4 ++--
 lib/sbi/sbi_hsm.c          | 4 ++--
 lib/sbi/sbi_ipi.c          | 4 ++--
 lib/sbi/sbi_system.c       | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index 69ddee7..4250515 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -23,8 +23,8 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		       u32 hartid, ulong saddr, ulong smode, ulong priv);
 int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
 int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
-int sbi_hsm_hart_started_mask(const struct sbi_domain *dom,
-			      ulong hbase, ulong *out_hmask);
+int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
+				    ulong hbase, ulong *out_hmask);
 void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid);
 
 #endif
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 1a7fe26..e20de76 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -34,8 +34,8 @@ static int sbi_load_hart_mask_unpriv(ulong *pmask, ulong *hmask,
 		if (uptrap->cause)
 			return SBI_ETRAP;
 	} else {
-		sbi_hsm_hart_started_mask(sbi_domain_thishart_ptr(),
-					  0, &mask);
+		sbi_hsm_hart_interruptible_mask(sbi_domain_thishart_ptr(),
+						0, &mask);
 	}
 	*hmask = mask;
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 1f54c9d..a81b821 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -70,8 +70,8 @@ static bool sbi_hsm_hart_started(const struct sbi_domain *dom, u32 hartid)
  * @return 0 on success and SBI_Exxx (< 0) on failure
  * Note: the output HART mask will be set to zero on failure as well.
  */
-int sbi_hsm_hart_started_mask(const struct sbi_domain *dom,
-			      ulong hbase, ulong *out_hmask)
+int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
+				    ulong hbase, ulong *out_hmask)
 {
 	ulong i, hmask, dmask;
 	ulong hend = sbi_scratch_last_hartid() + 1;
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 4347832..a3a6ce6 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -82,7 +82,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (hbase != -1UL) {
-		rc = sbi_hsm_hart_started_mask(dom, hbase, &m);
+		rc = sbi_hsm_hart_interruptible_mask(dom, hbase, &m);
 		if (rc)
 			return rc;
 		m &= hmask;
@@ -94,7 +94,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 		}
 	} else {
 		hbase = 0;
-		while (!sbi_hsm_hart_started_mask(dom, hbase, &m)) {
+		while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
 			/* Send IPIs */
 			for (i = hbase; m; i++, m >>= 1) {
 				if (m & 1UL)
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index 08a8b47..10915b4 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -35,7 +35,7 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	/* Send HALT IPI to every hart other than the current hart */
-	while (!sbi_hsm_hart_started_mask(dom, hbase, &hmask)) {
+	while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &hmask)) {
 		if (hbase <= cur_hartid)
 			hmask &= ~(1UL << (cur_hartid - hbase));
 		if (hmask)
-- 
2.25.1


