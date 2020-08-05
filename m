From: Hongzheng-Li <ethan.lee.qnl@gmail.com>
Date: Wed,  5 Aug 2020 11:29:44 +0800
Subject: [PATCH] lib: add Enhanced PMP support
Message-ID: <20200805032944.936-1-Ethan.Lee.QNL@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hongzheng-Li <ethan.lee.qnl@gmail.com>

The Enhanced PMP(ePMP) is used for memory access and execution prevention
on Machine mode.
The latest spec can be found here: https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8/edit?pli=1#heading=h.ab3kl2ch725u

Signed-off-by: Hongzheng-Li <ethan.lee.qnl@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
---
 include/sbi/riscv_asm.h      |  4 ++++
 include/sbi/riscv_encoding.h |  1 +
 include/sbi/sbi_hart.h       |  9 ++++++---
 lib/sbi/riscv_asm.c          | 30 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           | 27 +++++++++++++++++++++++++++
 lib/sbi/sbi_init.c           |  1 +
 6 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index 6e093ca..badd8af 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -182,6 +182,10 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *size);
 
+int epmp_set(int rlb, int mmwp, int mml);
+
+int epmp_get(int *rlb, int *mmwp, int *mml);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif
diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 827c86c..2052925 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -279,6 +279,7 @@
 #define CSR_PMPADDR13			0x3bd
 #define CSR_PMPADDR14			0x3be
 #define CSR_PMPADDR15			0x3bf
+#define CSR_MSECCFG			0x390
 #define CSR_TSELECT			0x7a0
 #define CSR_TDATA1			0x7a1
 #define CSR_TDATA2			0x7a2
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 51c2c35..4ed882f 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -16,12 +16,14 @@
 enum sbi_hart_features {
 	/** Hart has PMP support */
 	SBI_HART_HAS_PMP = (1 << 0),
+	/** enhanced PMP */
+	SBI_HART_HAS_EPMP = (1 << 1),
 	/** Hart has S-mode counter enable */
-	SBI_HART_HAS_SCOUNTEREN = (1 << 1),
+	SBI_HART_HAS_SCOUNTEREN = (1 << 2),
 	/** Hart has M-mode counter enable */
-	SBI_HART_HAS_MCOUNTEREN = (1 << 2),
+	SBI_HART_HAS_MCOUNTEREN = (1 << 3),
 	/** HART has timer csr implementation in hardware */
-	SBI_HART_HAS_TIME = (1 << 3),
+	SBI_HART_HAS_TIME = (1 << 4),
 
 	/** Last index of Hart features*/
 	SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_TIME,
@@ -43,6 +45,7 @@ int sbi_hart_pmp_get(struct sbi_scratch *scratch, unsigned int n,
 		     unsigned long *prot_out, unsigned long *addr_out,
 		     unsigned long *size);
 void sbi_hart_pmp_dump(struct sbi_scratch *scratch);
+void sbi_hart_epmp_dump(struct sbi_scratch *scratch);
 int  sbi_hart_pmp_check_addr(struct sbi_scratch *scratch, unsigned long daddr,
 			     unsigned long attr);
 bool sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long feature);
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 6dfebd9..4621f70 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -349,3 +349,33 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 
 	return 0;
 }
+
+int epmp_set(int rlb, int mmwp, int mml)
+{
+	unsigned long mseccfg;
+
+	if ((rlb | mmwp | mml) & ~1)
+		return SBI_EINVAL;
+
+#if __riscv_xlen == 32 || __riscv_xlen == 64
+	mseccfg = rlb << 2 | mmwp << 1 | mml;
+#else
+	mseccfg = -1;
+#endif
+	if (mseccfg < 0)
+		return SBI_ENOTSUPP;
+
+	csr_write(CSR_MSECCFG, mseccfg);
+
+	return 0;
+}
+
+int epmp_get(int *rlb, int *mmwp, int *mml)
+{
+	unsigned long mseccfg = csr_read(CSR_MSECCFG);
+	*rlb = (mseccfg >> 2) & 1;
+	*mmwp = (mseccfg >> 1) & 1;
+	*mml = mseccfg & 1;
+
+	return 0;
+}
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index fa20bd2..c1c6957 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -184,6 +184,18 @@ void sbi_hart_pmp_dump(struct sbi_scratch *scratch)
 	}
 }
 
+void sbi_hart_epmp_dump(struct sbi_scratch *scratch)
+{
+	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_EPMP))
+		return;
+
+	int rlb, mmwp, mml;
+
+	epmp_get(&rlb, &mmwp, &mml);
+	sbi_printf("ePMP: RLB = %d, MMWP = %d, MML = %d\n",
+				rlb, mmwp, mml);
+}
+
 int sbi_hart_pmp_check_addr(struct sbi_scratch *scratch, unsigned long addr,
 			    unsigned long attr)
 {
@@ -239,6 +251,9 @@ static int pmp_init(struct sbi_scratch *scratch, u32 hartid)
 	 */
 	pmp_set(pmp_idx++, PMP_R | PMP_W | PMP_X, 0, __riscv_xlen);
 
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_EPMP))
+		epmp_set(0, 0, 0);
+
 	return 0;
 }
 
@@ -288,6 +303,9 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
 	case SBI_HART_HAS_TIME:
 		fstr = "time";
 		break;
+	case SBI_HART_HAS_EPMP:
+		fstr = "epmp";
+		break;
 	default:
 		break;
 	}
@@ -397,6 +415,15 @@ static void hart_detect_features(struct sbi_scratch *scratch)
 			hfeatures->features |= SBI_HART_HAS_MCOUNTEREN;
 	}
 
+	/* Detect if hart supports EPMP(enhanced PMP) feature */
+	trap.cause = 0;
+	val = csr_read_allowed(CSR_MSECCFG, (unsigned long)&trap);
+	if (!trap.cause) {
+		csr_write_allowed(CSR_MSECCFG, (unsigned long)&trap, val);
+		if (!trap.cause)
+			hfeatures->features |= SBI_HART_HAS_EPMP;
+	}
+
 	/* Detect if hart supports time CSR */
 	trap.cause = 0;
 	csr_read_allowed(CSR_TIME, (unsigned long)&trap);
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a7fb848..1ced76b 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -82,6 +82,7 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_hart_delegation_dump(scratch);
 	sbi_hart_pmp_dump(scratch);
+	sbi_hart_epmp_dump(scratch);
 }
 
 static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER;
-- 
2.24.1.windows.2


