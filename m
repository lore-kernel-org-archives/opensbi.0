From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 28 Aug 2020 09:10:12 +0530
Subject: [PATCH v3 5/5] lib: sbi: Improve HPM CSR read/write emulation
In-Reply-To: <20200828034012.144048-1-anup.patel@wdc.com>
References: <20200828034012.144048-1-anup.patel@wdc.com>
Message-ID: <20200828034012.144048-6-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We improve HPM CSR read/write emulation as follows:
1. Fail for unimplemented counters so that trap is redirected
   to S-mode which can further help debugging S-mode software.
2. Check permissions in both MCOUNTEREN and SCOUNTEREN for
   HS-mode and U-mode.
3. Don't check permissions for TIME CSR because we emulate
   TIME CSR for both Host (HS/U-mode) and Guest (VS/VU-mode).
   Also, faster TIME CSR read is very helpful for good
   performance of S-mode software.
4. Don't emulate S-mode CSR read/write to M-mode HPM CSRs
   because these should not be accessible to S-mode software.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/sbi/sbi_emulate_csr.c | 147 +++++++++++++++++++-------------------
 1 file changed, 75 insertions(+), 72 deletions(-)

diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
index 62c21a6..bee7761 100644
--- a/lib/sbi/sbi_emulate_csr.c
+++ b/lib/sbi/sbi_emulate_csr.c
@@ -13,14 +13,31 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_emulate_csr.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_trap.h>
 
+static bool hpm_allowed(int hpm_num, ulong prev_mode, bool virt)
+{
+	ulong cen = -1UL;
+
+	if (prev_mode <= PRV_S) {
+		cen &= csr_read(CSR_MCOUNTEREN);
+		if (virt)
+			cen &= csr_read(CSR_HCOUNTEREN);
+	}
+	if (prev_mode == PRV_U)
+		cen &= csr_read(CSR_SCOUNTEREN);
+
+	return ((cen >> hpm_num) & 1) ? TRUE : FALSE;
+}
+
 int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 			 ulong *csr_val)
 {
 	int ret = 0;
-	ulong cen = -1UL;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
 #if __riscv_xlen == 32
 	bool virt = (regs->mstatusH & MSTATUSH_MPV) ? TRUE : FALSE;
@@ -28,9 +45,6 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 	bool virt = (regs->mstatus & MSTATUS_MPV) ? TRUE : FALSE;
 #endif
 
-	if (prev_mode == PRV_U)
-		cen = csr_read(CSR_SCOUNTEREN);
-
 	switch (csr_num) {
 	case CSR_HTIMEDELTA:
 		if (prev_mode == PRV_S && !virt)
@@ -39,31 +53,27 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 			ret = SBI_ENOTSUPP;
 		break;
 	case CSR_CYCLE:
-		if (!((cen >> (CSR_CYCLE - CSR_CYCLE)) & 1))
-			return -1;
+		if (!hpm_allowed(csr_num - CSR_CYCLE, prev_mode, virt))
+			return SBI_ENOTSUPP;
 		*csr_val = csr_read(CSR_MCYCLE);
 		break;
 	case CSR_TIME:
-		if (!((cen >> (CSR_TIME - CSR_CYCLE)) & 1))
-			return -1;
+		/*
+		 * We emulate TIME CSR for both Host (HS/U-mode) and
+		 * Guest (VS/VU-mode).
+		 *
+		 * Faster TIME CSR reads are critical for good performance
+		 * in S-mode software so we don't check CSR permissions.
+		 */
 		*csr_val = (virt) ? sbi_timer_virt_value():
 				    sbi_timer_value();
 		break;
 	case CSR_INSTRET:
-		if (!((cen >> (CSR_INSTRET - CSR_CYCLE)) & 1))
-			return -1;
+		if (!hpm_allowed(csr_num - CSR_CYCLE, prev_mode, virt))
+			return SBI_ENOTSUPP;
 		*csr_val = csr_read(CSR_MINSTRET);
 		break;
-	case CSR_MHPMCOUNTER3:
-		if (!((cen >> (3 + CSR_MHPMCOUNTER3 - CSR_MHPMCOUNTER3)) & 1))
-			return -1;
-		*csr_val = csr_read(CSR_MHPMCOUNTER3);
-		break;
-	case CSR_MHPMCOUNTER4:
-		if (!((cen >> (3 + CSR_MHPMCOUNTER4 - CSR_MHPMCOUNTER3)) & 1))
-			return -1;
-		*csr_val = csr_read(CSR_MHPMCOUNTER4);
-		break;
+
 #if __riscv_xlen == 32
 	case CSR_HTIMEDELTAH:
 		if (prev_mode == PRV_S && !virt)
@@ -72,38 +82,61 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 			ret = SBI_ENOTSUPP;
 		break;
 	case CSR_CYCLEH:
-		if (!((cen >> (CSR_CYCLE - CSR_CYCLE)) & 1))
-			return -1;
+		if (!hpm_allowed(csr_num - CSR_CYCLEH, prev_mode, virt))
+			return SBI_ENOTSUPP;
 		*csr_val = csr_read(CSR_MCYCLEH);
 		break;
 	case CSR_TIMEH:
-		if (!((cen >> (CSR_TIME - CSR_CYCLE)) & 1))
-			return -1;
+		/* Refer comments on TIME CSR above. */
 		*csr_val = (virt) ? sbi_timer_virt_value() >> 32:
 				    sbi_timer_value() >> 32;
 		break;
 	case CSR_INSTRETH:
-		if (!((cen >> (CSR_INSTRET - CSR_CYCLE)) & 1))
-			return -1;
+		if (!hpm_allowed(csr_num - CSR_CYCLEH, prev_mode, virt))
+			return SBI_ENOTSUPP;
 		*csr_val = csr_read(CSR_MINSTRETH);
 		break;
-	case CSR_MHPMCOUNTER3H:
-		if (!((cen >> (3 + CSR_MHPMCOUNTER3 - CSR_MHPMCOUNTER3)) & 1))
-			return -1;
-		*csr_val = csr_read(CSR_MHPMCOUNTER3H);
-		break;
-	case CSR_MHPMCOUNTER4H:
-		if (!((cen >> (3 + CSR_MHPMCOUNTER4 - CSR_MHPMCOUNTER3)) & 1))
-			return -1;
-		*csr_val = csr_read(CSR_MHPMCOUNTER4H);
-		break;
 #endif
-	case CSR_MHPMEVENT3:
-		*csr_val = csr_read(CSR_MHPMEVENT3);
-		break;
-	case CSR_MHPMEVENT4:
-		*csr_val = csr_read(CSR_MHPMEVENT4);
-		break;
+
+#define switchcase_hpm(__uref, __mref, __csr)				\
+	case __csr:							\
+		if ((sbi_hart_mhpm_count(scratch) + 3) <= (__csr - __uref))\
+			return SBI_ENOTSUPP;				\
+		if (!hpm_allowed(__csr - __uref, prev_mode, virt))	\
+			return SBI_ENOTSUPP;				\
+		*csr_val = csr_read(__mref + __csr - __uref);		\
+		break;
+#define switchcase_hpm_2(__uref, __mref, __csr)			\
+	switchcase_hpm(__uref, __mref, __csr + 0)			\
+	switchcase_hpm(__uref, __mref, __csr + 1)
+#define switchcase_hpm_4(__uref, __mref, __csr)			\
+	switchcase_hpm_2(__uref, __mref, __csr + 0)			\
+	switchcase_hpm_2(__uref, __mref, __csr + 2)
+#define switchcase_hpm_8(__uref, __mref, __csr)			\
+	switchcase_hpm_4(__uref, __mref, __csr + 0)			\
+	switchcase_hpm_4(__uref, __mref, __csr + 4)
+#define switchcase_hpm_16(__uref, __mref, __csr)			\
+	switchcase_hpm_8(__uref, __mref, __csr + 0)			\
+	switchcase_hpm_8(__uref, __mref, __csr + 8)
+
+	switchcase_hpm(CSR_CYCLE, CSR_MCYCLE, CSR_HPMCOUNTER3)
+	switchcase_hpm_4(CSR_CYCLE, CSR_MCYCLE, CSR_HPMCOUNTER4)
+	switchcase_hpm_8(CSR_CYCLE, CSR_MCYCLE, CSR_HPMCOUNTER8)
+	switchcase_hpm_16(CSR_CYCLE, CSR_MCYCLE, CSR_HPMCOUNTER16)
+
+#if __riscv_xlen == 32
+	switchcase_hpm(CSR_CYCLEH, CSR_MCYCLEH, CSR_HPMCOUNTER3H)
+	switchcase_hpm_4(CSR_CYCLEH, CSR_MCYCLEH, CSR_HPMCOUNTER4H)
+	switchcase_hpm_8(CSR_CYCLEH, CSR_MCYCLEH, CSR_HPMCOUNTER8H)
+	switchcase_hpm_16(CSR_CYCLEH, CSR_MCYCLEH, CSR_HPMCOUNTER16H)
+#endif
+
+#undef switchcase_hpm_16
+#undef switchcase_hpm_8
+#undef switchcase_hpm_4
+#undef switchcase_hpm_2
+#undef switchcase_hpm
+
 	default:
 		ret = SBI_ENOTSUPP;
 		break;
@@ -134,18 +167,6 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
 		else
 			ret = SBI_ENOTSUPP;
 		break;
-	case CSR_CYCLE:
-		csr_write(CSR_MCYCLE, csr_val);
-		break;
-	case CSR_INSTRET:
-		csr_write(CSR_MINSTRET, csr_val);
-		break;
-	case CSR_MHPMCOUNTER3:
-		csr_write(CSR_MHPMCOUNTER3, csr_val);
-		break;
-	case CSR_MHPMCOUNTER4:
-		csr_write(CSR_MHPMCOUNTER4, csr_val);
-		break;
 #if __riscv_xlen == 32
 	case CSR_HTIMEDELTAH:
 		if (prev_mode == PRV_S && !virt)
@@ -153,25 +174,7 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
 		else
 			ret = SBI_ENOTSUPP;
 		break;
-	case CSR_CYCLEH:
-		csr_write(CSR_MCYCLEH, csr_val);
-		break;
-	case CSR_INSTRETH:
-		csr_write(CSR_MINSTRETH, csr_val);
-		break;
-	case CSR_MHPMCOUNTER3H:
-		csr_write(CSR_MHPMCOUNTER3H, csr_val);
-		break;
-	case CSR_MHPMCOUNTER4H:
-		csr_write(CSR_MHPMCOUNTER4H, csr_val);
-		break;
 #endif
-	case CSR_MHPMEVENT3:
-		csr_write(CSR_MHPMEVENT3, csr_val);
-		break;
-	case CSR_MHPMEVENT4:
-		csr_write(CSR_MHPMEVENT4, csr_val);
-		break;
 	default:
 		ret = SBI_ENOTSUPP;
 		break;
-- 
2.25.1


