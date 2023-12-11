From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Dec 2023 23:37:38 +0530
Subject: [PATCH 5/5] lib: sbi: Remove the SBI_ETRAP error code
In-Reply-To: <20231211180738.891727-1-apatel@ventanamicro.com>
References: <20231211180738.891727-1-apatel@ventanamicro.com>
Message-ID: <20231211180738.891727-6-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI_ETRAP error code was introduced only for doing trap
redirection in generic sbi_ecall_handler(). Now the trap
redirection is moved into sbi_ecall_legacy.c and SBI_ETRAP
error code is only used in this source file so let us remove
it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_error.h    |  5 ++---
 lib/sbi/sbi_ecall_legacy.c | 32 ++++++++++++--------------------
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/include/sbi/sbi_error.h b/include/sbi/sbi_error.h
index 7f97506..a77e3f8 100644
--- a/include/sbi/sbi_error.h
+++ b/include/sbi/sbi_error.h
@@ -32,9 +32,8 @@
 #define SBI_EILL		-1004
 #define SBI_ENOSPC		-1005
 #define SBI_ENOMEM		-1006
-#define SBI_ETRAP		-1007
-#define SBI_EUNKNOWN		-1008
-#define SBI_ENOENT		-1009
+#define SBI_EUNKNOWN		-1007
+#define SBI_ENOENT		-1008
 
 /* clang-format on */
 
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 48bd227..14913c9 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -24,22 +24,22 @@
 #include <sbi/sbi_unpriv.h>
 #include <sbi/sbi_hart.h>
 
-static int sbi_load_hart_mask_unpriv(ulong *pmask, ulong *hmask,
-				     struct sbi_trap_info *uptrap)
+static bool sbi_load_hart_mask_unpriv(ulong *pmask, ulong *hmask,
+				      struct sbi_trap_info *uptrap)
 {
 	ulong mask = 0;
 
 	if (pmask) {
 		mask = sbi_load_ulong(pmask, uptrap);
 		if (uptrap->cause)
-			return SBI_ETRAP;
+			return false;
 	} else {
 		sbi_hsm_hart_interruptible_mask(sbi_domain_thishart_ptr(),
 						0, &mask);
 	}
 	*hmask = mask;
 
-	return 0;
+	return true;
 }
 
 static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
@@ -70,56 +70,48 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 		sbi_ipi_clear_smode();
 		break;
 	case SBI_EXT_0_1_SEND_IPI:
-		ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
-						&hmask, &trap);
-		if (ret != SBI_ETRAP) {
+		if (sbi_load_hart_mask_unpriv((ulong *)regs->a0,
+						&hmask, &trap)) {
 			ret = sbi_ipi_send_smode(hmask, 0);
 		} else {
-			ret = 0;
 			trap.epc = regs->mepc;
 			sbi_trap_redirect(regs, &trap);
 			out->skip_regs_update = true;
 		}
 		break;
 	case SBI_EXT_0_1_REMOTE_FENCE_I:
-		ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
-						&hmask, &trap);
-		if (ret != SBI_ETRAP) {
+		if (sbi_load_hart_mask_unpriv((ulong *)regs->a0,
+						&hmask, &trap)) {
 			SBI_TLB_INFO_INIT(&tlb_info, 0, 0, 0, 0,
 					  SBI_TLB_FENCE_I, source_hart);
 			ret = sbi_tlb_request(hmask, 0, &tlb_info);
 		} else {
-			ret = 0;
 			trap.epc = regs->mepc;
 			sbi_trap_redirect(regs, &trap);
 			out->skip_regs_update = true;
 		}
 		break;
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
-		ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
-						&hmask, &trap);
-		if (ret != SBI_ETRAP) {
+		if (sbi_load_hart_mask_unpriv((ulong *)regs->a0,
+						&hmask, &trap)) {
 			SBI_TLB_INFO_INIT(&tlb_info, regs->a1, regs->a2, 0, 0,
 					  SBI_TLB_SFENCE_VMA, source_hart);
 			ret = sbi_tlb_request(hmask, 0, &tlb_info);
 		} else {
-			ret = 0;
 			trap.epc = regs->mepc;
 			sbi_trap_redirect(regs, &trap);
 			out->skip_regs_update = true;
 		}
 		break;
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
-		ret = sbi_load_hart_mask_unpriv((ulong *)regs->a0,
-						&hmask, &trap);
-		if (ret != SBI_ETRAP) {
+		if (sbi_load_hart_mask_unpriv((ulong *)regs->a0,
+						&hmask, &trap)) {
 			SBI_TLB_INFO_INIT(&tlb_info, regs->a1,
 					  regs->a2, regs->a3, 0,
 					  SBI_TLB_SFENCE_VMA_ASID,
 					  source_hart);
 			ret = sbi_tlb_request(hmask, 0, &tlb_info);
 		} else {
-			ret = 0;
 			trap.epc = regs->mepc;
 			sbi_trap_redirect(regs, &trap);
 			out->skip_regs_update = true;
-- 
2.34.1


