From: Anup Patel <apatel@ventanamicro.com>
Date: Wed,  5 Jul 2023 12:15:15 +0530
Subject: [PATCH] lib: utils: Fix sbi_hartid_to_scratch() usage in ACLINT drivers
Message-ID: <20230705064515.1007478-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The cold_init() functions of ACLINT drivers should skip the HART
is sbi_hartid_to_scratch() returns NULL because we might be dealing
with a HART that is disabled in the device tree.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/ipi/aclint_mswi.c     | 7 ++++++-
 lib/utils/timer/aclint_mtimer.c | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index f47b3bc..140a49b 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -101,8 +101,13 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 	/* Update MSWI pointer in scratch space */
 	for (i = 0; i < mswi->hart_count; i++) {
 		scratch = sbi_hartid_to_scratch(mswi->first_hartid + i);
+		/*
+		 * We don't need to fail if scratch pointer is not available
+		 * because we might be dealing with hartid of a HART disabled
+		 * in the device tree.
+		 */
 		if (!scratch)
-			return SBI_ENOENT;
+			continue;
 		mswi_set_hart_data_ptr(scratch, mswi);
 	}
 
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 13af5d8..271e625 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -219,8 +219,13 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 	/* Update MTIMER pointer in scratch space */
 	for (i = 0; i < mt->hart_count; i++) {
 		scratch = sbi_hartid_to_scratch(mt->first_hartid + i);
+		/*
+		 * We don't need to fail if scratch pointer is not available
+		 * because we might be dealing with hartid of a HART disabled
+		 * in the device tree.
+		 */
 		if (!scratch)
-			return SBI_ENOENT;
+			continue;
 		mtimer_set_hart_data_ptr(scratch, mt);
 	}
 
-- 
2.34.1


