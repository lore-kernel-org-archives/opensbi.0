From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  4 Sep 2023 09:33:44 +0530
Subject: [PATCH 6/8] lib: sbi: Remove sbi_scratch_last_hartid() macro
In-Reply-To: <20230904040346.118604-1-apatel@ventanamicro.com>
References: <20230904040346.118604-1-apatel@ventanamicro.com>
Message-ID: <20230904040346.118604-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_scratch_last_hartid() macro is not of much use on platforms
with really sparse hartids so let us replace use of this macro with
other approaches.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_scratch.h |  6 ------
 lib/sbi/sbi_hsm.c         | 28 +++++++++++++---------------
 lib/sbi/sbi_init.c        | 10 ++++++----
 lib/sbi/sbi_scratch.c     |  5 +----
 4 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 9a4dce1..e6a33ba 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -244,12 +244,6 @@ u32 sbi_hartid_to_hartindex(u32 hartid);
 #define sbi_hartid_to_scratch(__hartid) \
 	sbi_hartindex_to_scratch(sbi_hartid_to_hartindex(__hartid))
 
-/** Last HART id having a sbi_scratch pointer */
-extern u32 last_hartid_having_scratch;
-
-/** Get last HART id having a sbi_scratch pointer */
-#define sbi_scratch_last_hartid()	last_hartid_having_scratch
-
 /** Check whether particular HART id is valid or not */
 #define sbi_hartid_valid(__hartid)	\
 	sbi_hartindex_valid(sbi_hartid_to_hartindex(__hartid))
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 814130e..147f954 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -115,23 +115,21 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 {
 	int hstate;
 	ulong i, hmask, dmask;
-	ulong hend = sbi_scratch_last_hartid() + 1;
 
 	*out_hmask = 0;
-	if (hend <= hbase)
+	if (!sbi_hartid_valid(hbase))
 		return SBI_EINVAL;
-	if (BITS_PER_LONG < (hend - hbase))
-		hend = hbase + BITS_PER_LONG;
 
 	dmask = sbi_domain_get_assigned_hartmask(dom, hbase);
-	for (i = hbase; i < hend; i++) {
-		hmask = 1UL << (i - hbase);
-		if (dmask & hmask) {
-			hstate = __sbi_hsm_hart_get_state(i);
-			if (hstate == SBI_HSM_STATE_STARTED ||
-			    hstate == SBI_HSM_STATE_SUSPENDED)
-				*out_hmask |= hmask;
-		}
+	for (i = 0; i < BITS_PER_LONG; i++) {
+		hmask = 1UL << i;
+		if (!(dmask & hmask))
+			continue;
+
+		hstate = __sbi_hsm_hart_get_state(hbase + i);
+		if (hstate == SBI_HSM_STATE_STARTED ||
+		    hstate == SBI_HSM_STATE_SUSPENDED)
+			*out_hmask |= hmask;
 	}
 
 	return 0;
@@ -249,15 +247,15 @@ int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 			return SBI_ENOMEM;
 
 		/* Initialize hart state data for every hart */
-		for (i = 0; i <= sbi_scratch_last_hartid(); i++) {
-			rscratch = sbi_hartid_to_scratch(i);
+		for (i = 0; i <= sbi_scratch_last_hartindex(); i++) {
+			rscratch = sbi_hartindex_to_scratch(i);
 			if (!rscratch)
 				continue;
 
 			hdata = sbi_scratch_offset_ptr(rscratch,
 						       hart_data_offset);
 			ATOMIC_INIT(&hdata->state,
-				    (i == hartid) ?
+				    (sbi_hartindex_to_hartid(i) == hartid) ?
 				    SBI_HSM_STATE_START_PENDING :
 				    SBI_HSM_STATE_STOPPED);
 			ATOMIC_INIT(&hdata->start_ticket, 0);
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a6d96e6..e723553 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -242,6 +242,8 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 {
+	u32 i, hartindex = sbi_hartid_to_hartindex(hartid);
+
 	/* Mark coldboot done */
 	__smp_store_release(&coldboot_done, 1);
 
@@ -249,10 +251,10 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 	spin_lock(&coldboot_lock);
 
 	/* Send an IPI to all HARTs waiting for coldboot */
-	for (u32 i = 0; i <= sbi_scratch_last_hartid(); i++) {
-		if ((i != hartid) &&
-		    sbi_hartmask_test_hartid(i, &coldboot_wait_hmask))
-			sbi_ipi_raw_send(sbi_hartid_to_hartindex(i));
+	sbi_hartmask_for_each_hartindex(i, &coldboot_wait_hmask) {
+		if (i == hartindex)
+			continue;
+		sbi_ipi_raw_send(i);
 	}
 
 	/* Release coldboot lock */
diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index d2abc89..6aeb0ca 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -14,7 +14,6 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 
-u32 last_hartid_having_scratch = SBI_HARTMASK_MAX_BITS - 1;
 u32 last_hartindex_having_scratch = 0;
 u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
 struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
@@ -45,10 +44,8 @@ int sbi_scratch_init(struct sbi_scratch *scratch)
 		hartindex_to_hartid_table[i] = h;
 		hartindex_to_scratch_table[i] =
 			((hartid2scratch)scratch->hartid_to_scratch)(h, i);
-		if (hartindex_to_scratch_table[i]) {
-			last_hartid_having_scratch = h;
+		if (hartindex_to_scratch_table[i])
 			last_hartindex_having_scratch = i;
-		}
 	}
 
 	return 0;
-- 
2.34.1


