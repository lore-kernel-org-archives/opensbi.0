From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu,  9 Jan 2025 15:32:41 -0800
Subject: [PATCH] Convert hartid to hart index to get scratch.
Message-ID: <20250109233241.2491-1-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hartid may not be sequential, so we need to use index to get scratch.
---
 lib/utils/ipi/aclint_mswi.c     | 2 +-
 lib/utils/timer/aclint_mtimer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 9e55078..e22903f 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -87,7 +87,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 
 	/* Update MSWI pointer in scratch space */
 	for (i = 0; i < mswi->hart_count; i++) {
-		scratch = sbi_hartid_to_scratch(mswi->first_hartid + i);
+		scratch = sbi_hartindex_to_scratch(sbi_hartid_to_hartindex(mswi->first_hartid) + i);
 		/*
 		 * We don't need to fail if scratch pointer is not available
 		 * because we might be dealing with hartid of a HART disabled
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 3db3c3b..eb80f24 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -206,7 +206,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 
 	/* Update MTIMER pointer in scratch space */
 	for (i = 0; i < mt->hart_count; i++) {
-		scratch = sbi_hartid_to_scratch(mt->first_hartid + i);
+		scratch = sbi_hartindex_to_scratch(sbi_hartid_to_hartindex(mt->first_hartid) + i);
 		/*
 		 * We don't need to fail if scratch pointer is not available
 		 * because we might be dealing with hartid of a HART disabled
-- 
2.47.1


