From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Fri, 30 Dec 2022 00:41:11 +0530
Subject: [PATCH] lib: sbi: Check pmp index for overflow before programming
Message-ID: <20221229191111.29041-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Check the current pmp index if it overflows the number of
pmp entries present. If so, skip the programming but
print debug information about the region, domain and
the last index of pmp programmed.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 5447c52..2782c0d 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -313,9 +313,17 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 			pmp_flags |= PMP_L;
 
 		pmp_addr =  reg->base >> PMP_SHIFT;
-		if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max)
+		if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max) {
+			if (pmp_idx+1 >= pmp_count) {
+				sbi_printf("Cannot program pmp region: 0x%lx (order: 0x%lx) for domain %s.\n",
+					   reg->base, reg->order, dom->name);
+				sbi_printf("Reason: No free PMP entry left. "
+					   "Number of PMP entries: %d Last PMP Index written: %d\n",
+					   pmp_count, pmp_idx);
+				break;
+			}
 			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
-		else {
+		} else {
 			sbi_printf("Can not configure pmp for domain %s", dom->name);
 			sbi_printf(" because memory region address %lx or size %lx is not in range\n",
 				    reg->base, reg->order);
-- 
2.39.0


