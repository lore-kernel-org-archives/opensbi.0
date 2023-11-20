From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Nov 2023 23:19:15 +0530
Subject: [PATCH] lib: sbi: Fix PMP granularity handling in sbi_hart_map_saddr()
Message-ID: <20231120174915.812345-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_hart_map_saddr() must create PMP mapping of size greater
than or equal to PMP granularity otherwise PMP mapping does not
work when size parameter less than sbi_hart_pmp_granularity(scratch).

Fixes: 6e44ef686a9b ("lib: sbi: Add functions to map/unmap shared
memory")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 77eef49..bf8792a 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -508,7 +508,8 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
 		return SBI_ENOSPC;
 
-	for (order = log2roundup(size) ; order <= __riscv_xlen; order++) {
+	for (order = log2roundup(MAX(sbi_hart_pmp_granularity(scratch), size));
+	     order <= __riscv_xlen; order++) {
 		if (order < __riscv_xlen) {
 			base = addr & ~((1UL << order) - 1UL);
 			if ((base <= addr) &&
-- 
2.34.1


