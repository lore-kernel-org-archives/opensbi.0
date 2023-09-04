From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  4 Sep 2023 09:33:40 +0530
Subject: [PATCH 2/8] lib: sbi: Remove sbi_platform_hart_index/invalid() functions
In-Reply-To: <20230904040346.118604-1-apatel@ventanamicro.com>
References: <20230904040346.118604-1-apatel@ventanamicro.com>
Message-ID: <20230904040346.118604-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hartid to hartindex mapping is now tracked in sbi_scratch so we
don't need sbi_platform_hart_index() and sbi_platform_hart_invalid()
functions hence let us remove them.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_platform.h | 28 ----------------------------
 lib/sbi/sbi_domain.c       |  5 ++---
 lib/sbi/sbi_init.c         | 12 +++++++++---
 lib/sbi/sbi_platform.c     | 17 -----------------
 4 files changed, 11 insertions(+), 51 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 3e9616f..5f81bb1 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -258,16 +258,6 @@ _Static_assert(
 #define sbi_platform_has_mfaults_delegation(__p) \
 	((__p)->features & SBI_PLATFORM_HAS_MFAULTS_DELEGATION)
 
-/**
- * Get HART index for the given HART
- *
- * @param plat pointer to struct sbi_platform
- * @param hartid HART ID
- *
- * @return 0 <= value < hart_count for valid HART otherwise -1U
- */
-u32 sbi_platform_hart_index(const struct sbi_platform *plat, u32 hartid);
-
 /**
  * Get the platform features in string format
  *
@@ -353,24 +343,6 @@ static inline u32 sbi_platform_hart_stack_size(const struct sbi_platform *plat)
 	return 0;
 }
 
-/**
- * Check whether given HART is invalid
- *
- * @param plat pointer to struct sbi_platform
- * @param hartid HART ID
- *
- * @return true if HART is invalid and false otherwise
- */
-static inline bool sbi_platform_hart_invalid(const struct sbi_platform *plat,
-					     u32 hartid)
-{
-	if (!plat)
-		return true;
-	if (plat->hart_count <= sbi_platform_hart_index(plat, hartid))
-		return true;
-	return false;
-}
-
 /**
  * Check whether given HART is allowed to do cold boot
  *
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index acd0f74..77d6ca4 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -277,7 +277,7 @@ static int sanitize_domain(const struct sbi_platform *plat,
 		return SBI_EINVAL;
 	}
 	sbi_hartmask_for_each_hart(i, dom->possible_harts) {
-		if (sbi_platform_hart_invalid(plat, i)) {
+		if (!sbi_hartid_valid(i)) {
 			sbi_printf("%s: %s possible HART mask has invalid "
 				   "hart %d\n", __func__, dom->name, i);
 			return SBI_EINVAL;
@@ -723,7 +723,6 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	int rc;
 	struct sbi_hartmask *root_hmask;
 	struct sbi_domain_memregion *root_memregs;
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (scratch->fw_rw_offset == 0 ||
 	    (scratch->fw_rw_offset & (scratch->fw_rw_offset - 1)) != 0) {
@@ -798,7 +797,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 
 	/* Root domain possible and assigned HARTs */
 	for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
-		if (sbi_platform_hart_invalid(plat, i))
+		if (!sbi_hartid_valid(i))
 			continue;
 		sbi_hartmask_set_hart(i, root_hmask);
 	}
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 252b41a..07be3d2 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -520,13 +520,19 @@ static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
  */
 void __noreturn sbi_init(struct sbi_scratch *scratch)
 {
+	u32 i, h;
+	bool hartid_valid		= false;
 	bool next_mode_supported	= false;
 	bool coldboot			= false;
 	u32 hartid			= current_hartid();
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
-	if ((SBI_HARTMASK_MAX_BITS <= hartid) ||
-	    sbi_platform_hart_invalid(plat, hartid))
+	for (i = 0; i < plat->hart_count; i++) {
+		h = (plat->hart_index2id) ? plat->hart_index2id[i] : i;
+		if (h == hartid)
+			hartid_valid = true;
+	}
+	if (SBI_HARTMASK_MAX_BITS <= hartid || !hartid_valid)
 		sbi_hart_hang();
 
 	switch (scratch->next_mode) {
@@ -623,7 +629,7 @@ void __noreturn sbi_exit(struct sbi_scratch *scratch)
 	u32 hartid			= current_hartid();
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
-	if (sbi_platform_hart_invalid(plat, hartid))
+	if (!sbi_hartid_valid(hartid))
 		sbi_hart_hang();
 
 	sbi_platform_early_exit(plat);
diff --git a/lib/sbi/sbi_platform.c b/lib/sbi/sbi_platform.c
index 445a8c1..43fc88a 100644
--- a/lib/sbi/sbi_platform.c
+++ b/lib/sbi/sbi_platform.c
@@ -71,20 +71,3 @@ done:
 	else
 		sbi_strncpy(features_str, "none", nfstr);
 }
-
-u32 sbi_platform_hart_index(const struct sbi_platform *plat, u32 hartid)
-{
-	u32 i;
-
-	if (!plat)
-		return -1U;
-	if (plat->hart_index2id) {
-		for (i = 0; i < plat->hart_count; i++) {
-			if (plat->hart_index2id[i] == hartid)
-				return i;
-		}
-		return -1U;
-	}
-
-	return hartid;
-}
-- 
2.34.1


