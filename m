From: dramforever <dramforever@live.com>
Date: Wed,  3 Aug 2022 13:16:51 +0800
Subject: [RFC PATCH 2/3] lib: sbi_trap: Save mstatus.GVA in trap->gva
In-Reply-To: <TYYP286MB143914043D5A77C568CDDE57C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB143914043D5A77C568CDDE57C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <TYYP286MB1439B21E7C1944F2D3BB9441C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

---
 include/sbi/sbi_trap.h      |  6 +++++-
 lib/sbi/sbi_expected_trap.S | 14 ++++++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index d205056..fe3640a 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -95,8 +95,10 @@
 #define SBI_TRAP_INFO_tval2			3
 /** Index of tinst member in sbi_trap_info */
 #define SBI_TRAP_INFO_tinst			4
+/** Index of gva member in sbi_trap_info */
+#define SBI_TRAP_INFO_gva			5
 /** Last member index in sbi_trap_info */
-#define SBI_TRAP_INFO_last			5
+#define SBI_TRAP_INFO_last			6
 
 /* clang-format on */
 
@@ -200,6 +202,8 @@ struct sbi_trap_info {
 	unsigned long tval2;
 	/** tinst Trap instruction */
 	unsigned long tinst;
+	/** gva Guest virtual address in tval flag */
+	unsigned long gva;
 };
 
 int sbi_trap_redirect(struct sbi_trap_regs *regs,
diff --git a/lib/sbi/sbi_expected_trap.S b/lib/sbi/sbi_expected_trap.S
index 24891c7..ae03b9e 100644
--- a/lib/sbi/sbi_expected_trap.S
+++ b/lib/sbi/sbi_expected_trap.S
@@ -22,7 +22,7 @@
 	.align 3
 	.global __sbi_expected_trap
 __sbi_expected_trap:
-	/* Without H-extension so, MTVAL2 and MTINST CSRs not available */
+	/* Without H-extension so, MTVAL2 and MTINST CSRs and GVA not available */
 	csrr	a4, CSR_MEPC
 	REG_S	a4, SBI_TRAP_INFO_OFFSET(epc)(a3)
 	csrr	a4, CSR_MCAUSE
@@ -31,6 +31,7 @@ __sbi_expected_trap:
 	REG_S	a4, SBI_TRAP_INFO_OFFSET(tval)(a3)
 	REG_S	zero, SBI_TRAP_INFO_OFFSET(tval2)(a3)
 	REG_S	zero, SBI_TRAP_INFO_OFFSET(tinst)(a3)
+	REG_S	zero, SBI_TRAP_INFO_OFFSET(gva)(a3)
 	csrr	a4, CSR_MEPC
 	addi	a4, a4, 4
 	csrw	CSR_MEPC, a4
@@ -39,7 +40,7 @@ __sbi_expected_trap:
 	.align 3
 	.global __sbi_expected_trap_hext
 __sbi_expected_trap_hext:
-	/* With H-extension so, MTVAL2 and MTINST CSRs available */
+	/* With H-extension so, MTVAL2 and MTINST CSRs and GVA available */
 	csrr	a4, CSR_MEPC
 	REG_S	a4, SBI_TRAP_INFO_OFFSET(epc)(a3)
 	csrr	a4, CSR_MCAUSE
@@ -50,6 +51,15 @@ __sbi_expected_trap_hext:
 	REG_S	a4, SBI_TRAP_INFO_OFFSET(tval2)(a3)
 	csrr	a4, CSR_MTINST
 	REG_S	a4, SBI_TRAP_INFO_OFFSET(tinst)(a3)
+#if __riscv_xlen == 32
+	csrr	a4, CSR_MSTATUSH
+	srli	a4, a4, MSTATUSH_GVA_SHIFT
+#else
+	csrr	a4, CSR_MSTATUS
+	srli	a4, a4, MSTATUS_GVA_SHIFT
+#endif
+	andi	a4, a4, 1
+	REG_S	a4, SBI_TRAP_INFO_OFFSET(gva)(a3)
 	csrr	a4, CSR_MEPC
 	addi	a4, a4, 4
 	csrw	CSR_MEPC, a4
-- 
2.37.1


