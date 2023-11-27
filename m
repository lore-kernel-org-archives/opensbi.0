From: Xiang W <wxjstz@126.com>
Date: Mon, 27 Nov 2023 20:39:11 +0800
Subject: [PATCH] lib: sbi: Improve sbi_hsm_hart_interruptible_mask
Message-ID: <20231127123933.48851-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Improve bit scanning with for_each_set_bit.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_hsm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 147f954..bffac27 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -114,22 +114,18 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 				    ulong hbase, ulong *out_hmask)
 {
 	int hstate;
-	ulong i, hmask, dmask;
+	ulong i, dmask;
 
 	*out_hmask = 0;
 	if (!sbi_hartid_valid(hbase))
 		return SBI_EINVAL;
 
 	dmask = sbi_domain_get_assigned_hartmask(dom, hbase);
-	for (i = 0; i < BITS_PER_LONG; i++) {
-		hmask = 1UL << i;
-		if (!(dmask & hmask))
-			continue;
-
+	for_each_set_bit(i, &dmask, BITS_PER_LONG) {
 		hstate = __sbi_hsm_hart_get_state(hbase + i);
 		if (hstate == SBI_HSM_STATE_STARTED ||
 		    hstate == SBI_HSM_STATE_SUSPENDED)
-			*out_hmask |= hmask;
+			*out_hmask |= 1UL << i;
 	}
 
 	return 0;
-- 
2.42.0


