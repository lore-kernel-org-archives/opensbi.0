From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  4 Sep 2023 09:33:46 +0530
Subject: [PATCH 8/8] include: sbi: Remove sbi_hartmask_for_each_hart() macro
In-Reply-To: <20230904040346.118604-1-apatel@ventanamicro.com>
References: <20230904040346.118604-1-apatel@ventanamicro.com>
Message-ID: <20230904040346.118604-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_hartmask_for_each_hart() macro is slow and has only one user
so let us completely remove the sbi_hartmask_for_each_hart() macro.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hartmask.h | 13 -------------
 lib/sbi/sbi_system.c       |  3 ++-
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
index 105653e..bcfa50d 100644
--- a/include/sbi/sbi_hartmask.h
+++ b/include/sbi/sbi_hartmask.h
@@ -169,19 +169,6 @@ static inline void sbi_hartmask_xor(struct sbi_hartmask *dstp,
 		   sbi_hartmask_bits(src2p), SBI_HARTMASK_MAX_BITS);
 }
 
-/**
- * Iterate over each HART in hartmask
- * __h hart id
- * __i hart index
- * __m hartmask
-*/
-#define sbi_hartmask_for_each_hart(__h, __i, __m) \
-	for((__i) = find_first_bit((__m)->bits, SBI_HARTMASK_MAX_BITS), \
-		(__h) = sbi_hartindex_to_hartid(__i); \
-		(__i) < SBI_HARTMASK_MAX_BITS; \
-		(__i) = find_next_bit((__m)->bits, SBI_HARTMASK_MAX_BITS, (__i) + 1), \
-		(__h) = sbi_hartindex_to_hartid(__i))
-
 /**
  * Iterate over each HART index in hartmask
  * __i hart index
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index bae9730..d1fa349 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -170,7 +170,8 @@ int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
 	if (prev_mode != PRV_S && prev_mode != PRV_U)
 		return SBI_EFAIL;
 
-	sbi_hartmask_for_each_hart(i, j, &dom->assigned_harts) {
+	sbi_hartmask_for_each_hartindex(j, &dom->assigned_harts) {
+		i = sbi_hartindex_to_hartid(j);
 		if (i == hartid)
 			continue;
 		if (__sbi_hsm_hart_get_state(i) != SBI_HSM_STATE_STOPPED)
-- 
2.34.1


