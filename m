From: gagachang <vivahavey@gmail.com>
Date: Fri, 15 Jul 2022 01:29:41 +0800
Subject: [PATCH v2] lib: sbi_hart: Shorten the code to set MPV bit
Message-ID: <20220714172941.2967-1-vivahavey@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

MPV bit is set when the value of next_virt boolean variable equals
true. Since the value of next_virt is either 0 or 1, we can set
MPV bit without if-else logic.

Signed-off-by: Che-Chia Chang <alvinga@andestech.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

--
Change since v1:
- Drop the unnecessary brackets
---
 lib/sbi/sbi_hart.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index de86fee..67b685a 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -769,19 +769,12 @@ sbi_hart_switch_mode(unsigned long arg0, unsigned long arg1,
 #if __riscv_xlen == 32
 	if (misa_extension('H')) {
 		valH = csr_read(CSR_MSTATUSH);
-		if (next_virt)
-			valH = INSERT_FIELD(valH, MSTATUSH_MPV, 1);
-		else
-			valH = INSERT_FIELD(valH, MSTATUSH_MPV, 0);
+		valH = INSERT_FIELD(valH, MSTATUSH_MPV, next_virt);
 		csr_write(CSR_MSTATUSH, valH);
 	}
 #else
-	if (misa_extension('H')) {
-		if (next_virt)
-			val = INSERT_FIELD(val, MSTATUS_MPV, 1);
-		else
-			val = INSERT_FIELD(val, MSTATUS_MPV, 0);
-	}
+	if (misa_extension('H'))
+		val = INSERT_FIELD(val, MSTATUS_MPV, next_virt);
 #endif
 	csr_write(CSR_MSTATUS, val);
 	csr_write(CSR_MEPC, next_addr);
-- 
2.25.1


