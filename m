From: Icenowy Zheng <uwu@icenowy.me>
Date: Fri,  9 Dec 2022 15:01:19 +0800
Subject: [PATCH 2/3] lib: utils/timer: mtimer: add a quirk for lacking mtime register
In-Reply-To: <20221209070120.944152-1-uwu@icenowy.me>
References: <20221209070120.944152-1-uwu@icenowy.me>
Message-ID: <20221209070120.944152-3-uwu@icenowy.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

T-Head developers surely have a different understanding of time CSR and
CLINT's mtime register with SiFive ones, that they did not implement
the mtime register at all -- as shown in openC906 source code, their
time CSR value is just exposed at the top of their processor IP block
and expects an external continous counter, which makes it not
overrideable, and thus mtime register is not implemented, even not for
reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
extended CSR, these systems still rely on the mtimecmp registers to
generate timer interrupts. This makes it necessary to implement T-Head
C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
reading mtime register and falls back to default code that reads time
CSR.

Add a quirk into MTIMER driver, which represents a mtime register is
lacking and time CSR value should be used instead.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 include/sbi_utils/timer/aclint_mtimer.h |  1 +
 lib/utils/timer/aclint_mtimer.c         | 19 +++++++++++-----
 lib/utils/timer/fdt_timer_mtimer.c      | 29 +++++++++++++++++--------
 3 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
index 6ab8799..9724f53 100644
--- a/include/sbi_utils/timer/aclint_mtimer.h
+++ b/include/sbi_utils/timer/aclint_mtimer.h
@@ -35,6 +35,7 @@ struct aclint_mtimer_data {
 	u32 hart_count;
 	bool has_64bit_mmio;
 	bool has_shared_mtime;
+	bool has_mtime;
 	/* Private details (initialized and used by ACLINT MTIMER library) */
 	struct aclint_mtimer_data *time_delta_reference;
 	unsigned long time_delta_computed;
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 3f00c21..f99857b 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -95,7 +95,7 @@ void aclint_mtimer_sync(struct aclint_mtimer_data *mt)
 	struct aclint_mtimer_data *reference;
 
 	/* Sync-up non-shared MTIME if reference is available */
-	if (mt->has_shared_mtime || !mt->time_delta_reference)
+	if (!mt->has_mtime || mt->has_shared_mtime || !mt->time_delta_reference)
 		return;
 
 	reference = mt->time_delta_reference;
@@ -149,10 +149,10 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 	int rc;
 
 	/* Sanity checks */
-	if (!mt || !mt->mtime_size ||
+	if (!mt || (mt->has_mtime && !mt->mtime_size) ||
 	    (mt->hart_count && !mt->mtimecmp_size) ||
-	    (mt->mtime_addr & (ACLINT_MTIMER_ALIGN - 1)) ||
-	    (mt->mtime_size & (ACLINT_MTIMER_ALIGN - 1)) ||
+	    (mt->has_mtime && (mt->mtime_addr & (ACLINT_MTIMER_ALIGN - 1))) ||
+	    (mt->has_mtime && (mt->mtime_size & (ACLINT_MTIMER_ALIGN - 1))) ||
 	    (mt->mtimecmp_addr & (ACLINT_MTIMER_ALIGN - 1)) ||
 	    (mt->mtimecmp_size & (ACLINT_MTIMER_ALIGN - 1)) ||
 	    (mt->first_hartid >= SBI_HARTMASK_MAX_BITS) ||
@@ -179,7 +179,16 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 		mtimer_hartid2data[mt->first_hartid + i] = mt;
 
 	/* Add MTIMER regions to the root domain */
-	if (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
+	if (!mt->has_mtime) {
+		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
+						mt->mtimecmp_size, MTIMER_REGION_ALIGN,
+						SBI_DOMAIN_MEMREGION_MMIO);
+		if (rc)
+			return rc;
+
+		/* Disable reading mtime when mtime is not available */
+		mtimer.timer_value = NULL;
+	} else if (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
 		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
 					mt->mtime_size + mt->mtimecmp_size,
 					MTIMER_REGION_ALIGN,
diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index 7b8546b..7ec3907 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -18,6 +18,7 @@
 struct timer_mtimer_quirks {
 	unsigned int	mtime_offset;
 	bool		has_64bit_mmio;
+	bool		without_mtime;
 };
 
 static unsigned long mtimer_count = 0;
@@ -53,14 +54,19 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 		/* Set CLINT addresses */
 		mt->mtimecmp_addr = addr[0] + ACLINT_DEFAULT_MTIMECMP_OFFSET;
 		mt->mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE;
-		mt->mtime_addr = addr[0] + ACLINT_DEFAULT_MTIME_OFFSET;
-		mt->mtime_size = size[0] - mt->mtimecmp_size;
+		if (!quirks->without_mtime) {
+			mt->mtime_addr = addr[0] + ACLINT_DEFAULT_MTIME_OFFSET;
+			mt->mtime_size = size[0] - mt->mtimecmp_size;
+		}
 		/* Adjust MTIMER address and size for CLINT device */
-		mt->mtime_addr += quirks->mtime_offset;
+		if (!quirks->without_mtime) {
+			mt->mtime_addr += quirks->mtime_offset;
+			mt->mtime_size -= quirks->mtime_offset;
+		}
 		mt->mtimecmp_addr += quirks->mtime_offset;
-		mt->mtime_size -= quirks->mtime_offset;
 		/* Apply additional CLINT quirks */
 		mt->has_64bit_mmio = quirks->has_64bit_mmio;
+		mt->has_mtime = !quirks->without_mtime;
 	} else { /* RISC-V ACLINT MTIMER */
 		/* Set ACLINT MTIMER addresses */
 		mt->mtime_addr = addr[0];
@@ -70,12 +76,17 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 	}
 
 	/* Check if MTIMER device has shared MTIME address */
-	mt->has_shared_mtime = false;
-	for (i = 0; i < mtimer_count; i++) {
-		if (mtimer[i].mtime_addr == mt->mtime_addr) {
-			mt->has_shared_mtime = true;
-			break;
+	if (mt->has_mtime) {
+		mt->has_shared_mtime = false;
+		for (i = 0; i < mtimer_count; i++) {
+			if (mtimer[i].mtime_addr == mt->mtime_addr) {
+				mt->has_shared_mtime = true;
+				break;
+			}
 		}
+	} else {
+		/* Assume shared time CSR */
+		mt->has_shared_mtime = true;
 	}
 
 	/* Initialize the MTIMER device */
-- 
2.38.1


