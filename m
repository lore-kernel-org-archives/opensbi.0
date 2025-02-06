From: Raj Vishwanathan <raj.vishwanathan@gmail.com>
Date: Thu,  6 Feb 2025 11:22:40 -0800
Subject: [PATCH v2] Align SBI trap registers to a nice boundary for performance reasons.
In-Reply-To: <20250109235219.2568-1-cfu@mips.com>
References: <20250109235219.2568-1-cfu@mips.com>
Message-ID: <20250206192240.142107-1-Raj.Vishwanathan@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Align SBI_TRAP_CONTEXT_SIZE to a multiple of 16 bytes. If it is not
aligned to 16 bytes for RV64, it can create performance problems.
Aligning it correctly can fix the performance issues.

Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
--
Test: Performance issues seen and fix Verified on FPGA.
Other methods.
   Run qemu with monitor to check the SP during cpu_in
   and cpu_out.
   Add sbi_printf to the function sbi_trap_handler to check
   the alignment of sbi_trap_context
---
 include/sbi/sbi_trap.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index d5182bf..82e9c08 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -112,13 +112,16 @@
 /** Size (in bytes) of sbi_trap_info */
 #define SBI_TRAP_INFO_SIZE SBI_TRAP_INFO_OFFSET(last)
 
+/** Stack pointer is aligned to 16 bytes */
+#define STACK_BOUNDARY            16
+#define ALIGN_TO_BOUNDARY(x,a) (((x) + (a) - 1) & ~((a) - 1))
+
 /** Size (in bytes) of sbi_trap_context */
-#define SBI_TRAP_CONTEXT_SIZE (SBI_TRAP_REGS_SIZE + \
-			       SBI_TRAP_INFO_SIZE + \
-			       __SIZEOF_POINTER__)
+#define SBI_TRAP_CONTEXT_SIZE ALIGN_TO_BOUNDARY((SBI_TRAP_REGS_SIZE + \
+                               SBI_TRAP_INFO_SIZE + \
+                               __SIZEOF_POINTER__),STACK_BOUNDARY)
 
 #ifndef __ASSEMBLER__
-
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_scratch.h>
 
-- 
2.43.0


