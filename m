From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Sat, 29 May 2021 21:54:29 +0200
Subject: [PATCH 1/1] lib: sbi_scratch: remove owner from
 sbi_scratch_alloc_offset
Message-ID: <20210529195429.7707-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The parameter owner of function sbi_scratch_alloc_offset() is never used.
The scratch memory is small. We should not use it for debug information in
future. Hence eliminate the parameter.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 include/sbi/sbi_scratch.h | 2 +-
 lib/sbi/sbi_hart.c        | 3 +--
 lib/sbi/sbi_hsm.c         | 3 +--
 lib/sbi/sbi_init.c        | 3 +--
 lib/sbi/sbi_ipi.c         | 3 +--
 lib/sbi/sbi_scratch.c     | 2 +-
 lib/sbi/sbi_timer.c       | 3 +--
 lib/sbi/sbi_tlb.c         | 9 +++------
 8 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index e83b234..186a40c 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -98,7 +98,7 @@ int sbi_scratch_init(struct sbi_scratch *scratch);
  * @return zero on failure and non-zero (>= SBI_SCRATCH_EXTRA_SPACE_OFFSET)
  * on success
  */
-unsigned long sbi_scratch_alloc_offset(unsigned long size, const char *owner);
+unsigned long sbi_scratch_alloc_offset(unsigned long size);

 /** Free-up extra space in sbi_scratch */
 void sbi_scratch_free_offset(unsigned long offset);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index de59b14..56878b4 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -451,8 +451,7 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 			sbi_hart_expected_trap = &__sbi_expected_trap_hext;

 		hart_features_offset = sbi_scratch_alloc_offset(
-						sizeof(struct hart_features),
-						"HART_FEATURES");
+						sizeof(struct hart_features));
 		if (!hart_features_offset)
 			return SBI_ENOMEM;
 	}
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 4662150..67890f3 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -185,8 +185,7 @@ int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 	struct sbi_hsm_data *hdata;

 	if (cold_boot) {
-		hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata),
-							    "HART_DATA");
+		hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata));
 		if (!hart_data_offset)
 			return SBI_ENOMEM;

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 3f44a2b..b158314 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -233,8 +233,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();

-	init_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__,
-						     "INIT_COUNT");
+	init_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
 	if (!init_count_offset)
 		sbi_hart_hang();

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index bfaf4e9..75f86d8 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -227,8 +227,7 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
 	struct sbi_ipi_data *ipi_data;

 	if (cold_boot) {
-		ipi_data_off = sbi_scratch_alloc_offset(sizeof(*ipi_data),
-							"IPI_DATA");
+		ipi_data_off = sbi_scratch_alloc_offset(sizeof(*ipi_data));
 		if (!ipi_data_off)
 			return SBI_ENOMEM;
 		ret = sbi_ipi_event_create(&ipi_smode_ops);
diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index 96bae5b..7cf5b43 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -40,7 +40,7 @@ int sbi_scratch_init(struct sbi_scratch *scratch)
 	return 0;
 }

-unsigned long sbi_scratch_alloc_offset(unsigned long size, const char *owner)
+unsigned long sbi_scratch_alloc_offset(unsigned long size)
 {
 	u32 i;
 	void *ptr;
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 63e8ea9..77d6f95 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -121,8 +121,7 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);

 	if (cold_boot) {
-		time_delta_off = sbi_scratch_alloc_offset(sizeof(*time_delta),
-							  "TIME_DELTA");
+		time_delta_off = sbi_scratch_alloc_offset(sizeof(*time_delta));
 		if (!time_delta_off)
 			return SBI_ENOMEM;

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 73f59e8..2ba1b7b 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -380,19 +380,16 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);

 	if (cold_boot) {
-		tlb_sync_off = sbi_scratch_alloc_offset(sizeof(*tlb_sync),
-							"IPI_TLB_SYNC");
+		tlb_sync_off = sbi_scratch_alloc_offset(sizeof(*tlb_sync));
 		if (!tlb_sync_off)
 			return SBI_ENOMEM;
-		tlb_fifo_off = sbi_scratch_alloc_offset(sizeof(*tlb_q),
-							"IPI_TLB_FIFO");
+		tlb_fifo_off = sbi_scratch_alloc_offset(sizeof(*tlb_q));
 		if (!tlb_fifo_off) {
 			sbi_scratch_free_offset(tlb_sync_off);
 			return SBI_ENOMEM;
 		}
 		tlb_fifo_mem_off = sbi_scratch_alloc_offset(
-				SBI_TLB_FIFO_NUM_ENTRIES * SBI_TLB_INFO_SIZE,
-				"IPI_TLB_FIFO_MEM");
+				SBI_TLB_FIFO_NUM_ENTRIES * SBI_TLB_INFO_SIZE);
 		if (!tlb_fifo_mem_off) {
 			sbi_scratch_free_offset(tlb_fifo_off);
 			sbi_scratch_free_offset(tlb_sync_off);
--
2.30.2


