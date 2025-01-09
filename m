From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu,  9 Jan 2025 15:52:19 -0800
Subject: [PATCH] Add a dummy register to sbi_trap_regs
Message-ID: <20250109235219.2568-1-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI_TRAP_CONTEXT_SIZE becomes a multiple of 8 bytes for RV32
or 16 bytes for RV64, so we have sp aligned to 8 or 16 bytes
to have better performance on some platforms,
---
 include/sbi/sbi_trap.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index d5182bf..df99d8e 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -84,8 +84,10 @@
 #define SBI_TRAP_REGS_mstatus			33
 /** Index of mstatusH member in sbi_trap_regs */
 #define SBI_TRAP_REGS_mstatusH			34
+/** Index of a dummy register */
+#define SBI_TRAP_REGS_dummy			35
 /** Last member index in sbi_trap_regs */
-#define SBI_TRAP_REGS_last			35
+#define SBI_TRAP_REGS_last			36
 
 /** Index of cause member in sbi_trap_info */
 #define SBI_TRAP_INFO_cause			0
@@ -194,6 +196,8 @@ struct sbi_trap_regs {
 	unsigned long mstatus;
 	/** mstatusH register state (only for 32-bit) */
 	unsigned long mstatusH;
+	/** a dummy register */
+	unsigned long dummy;
 };
 
 /** Representation of trap details */
-- 
2.47.1


