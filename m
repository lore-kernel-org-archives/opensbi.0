From: Anup Patel <anup.patel@wdc.com>
Date: Tue, 20 Oct 2020 15:09:23 +0530
Subject: [PATCH v4 09/16] lib: sbi: Optimize sbi_hsm_hart_started_mask()
 implementation
In-Reply-To: <20201020093930.2551352-1-anup.patel@wdc.com>
References: <20201020093930.2551352-1-anup.patel@wdc.com>
Message-ID: <20201020093930.2551352-10-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of calling sbi_hsm_hart_get_state() in a loop, we can simply
call a new inline __sbi_hsm_hart_get_state() which only takes "hartid"
and enforce domain checks using sbi_domain_assigned_hartmask().

This patch optimizes sbi_hsm_hart_started_mask() as-per above.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_hsm.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 8121efb..e1b2b2c 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -57,20 +57,27 @@ int sbi_hsm_hart_state_to_status(int state)
 	return ret;
 }
 
-int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
+static inline int __sbi_hsm_hart_get_state(u32 hartid)
 {
 	struct sbi_hsm_data *hdata;
 	struct sbi_scratch *scratch;
 
 	scratch = sbi_hartid_to_scratch(hartid);
-	if (!scratch || !sbi_domain_is_assigned_hart(dom, hartid))
+	if (!scratch)
 		return SBI_HART_UNKNOWN;
 
 	hdata = sbi_scratch_offset_ptr(scratch, hart_data_offset);
-
 	return atomic_read(&hdata->state);
 }
 
+int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
+{
+	if (!sbi_domain_is_assigned_hart(dom, hartid))
+		return SBI_HART_UNKNOWN;
+
+	return __sbi_hsm_hart_get_state(hartid);
+}
+
 static bool sbi_hsm_hart_started(const struct sbi_domain *dom, u32 hartid)
 {
 	if (sbi_hsm_hart_get_state(dom, hartid) == SBI_HART_STARTED)
@@ -90,18 +97,21 @@ static bool sbi_hsm_hart_started(const struct sbi_domain *dom, u32 hartid)
 int sbi_hsm_hart_started_mask(const struct sbi_domain *dom,
 			      ulong hbase, ulong *out_hmask)
 {
-	ulong i;
-	ulong hcount = sbi_scratch_last_hartid() + 1;
+	ulong i, hmask, dmask;
+	ulong hend = sbi_scratch_last_hartid() + 1;
 
 	*out_hmask = 0;
-	if (hcount <= hbase)
+	if (hend <= hbase)
 		return SBI_EINVAL;
-	if (BITS_PER_LONG < (hcount - hbase))
-		hcount = BITS_PER_LONG;
-
-	for (i = hbase; i < hcount; i++) {
-		if (sbi_hsm_hart_get_state(dom, i) == SBI_HART_STARTED)
-			*out_hmask |= 1UL << (i - hbase);
+	if (BITS_PER_LONG < (hend - hbase))
+		hend = hbase + BITS_PER_LONG;
+
+	dmask = sbi_domain_get_assigned_hartmask(dom, hbase);
+	for (i = hbase; i < hend; i++) {
+		hmask = 1UL << (i - hbase);
+		if ((dmask & hmask) &&
+		    (__sbi_hsm_hart_get_state(i) == SBI_HART_STARTED))
+			*out_hmask |= hmask;
 	}
 
 	return 0;
-- 
2.25.1


