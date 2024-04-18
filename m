From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 18 Apr 2024 15:54:17 +0200
Subject: [RFC PATCH 1/4] lib: sbi: factorize previous virtualization mode read from regs
In-Reply-To: <20240418135421.1452709-1-cleger@rivosinc.com>
References: <20240418135421.1452709-1-cleger@rivosinc.com>
Message-ID: <20240418135421.1452709-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The same pattern is used at multiple places to verify in which mode
the exception was actually taken. Factorize it.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_trap.h    |  9 +++++++++
 lib/sbi/sbi_emulate_csr.c | 12 ++----------
 lib/sbi/sbi_trap.c        |  6 +-----
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index f7c170e..b0c47ce 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -236,6 +236,15 @@ static inline unsigned long sbi_regs_gva(const struct sbi_trap_regs *regs)
 #endif
 }
 
+static inline bool sbi_regs_from_virt(const struct sbi_trap_regs *regs)
+{
+#if __riscv_xlen == 32
+	return (regs->mstatusH & MSTATUSH_MPV) ? true : false;
+#else
+	return (regs->mstatus & MSTATUS_MPV) ? true : false;
+#endif
+}
+
 int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		      const struct sbi_trap_info *trap);
 
diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
index 5f3b111..4036946 100644
--- a/lib/sbi/sbi_emulate_csr.c
+++ b/lib/sbi/sbi_emulate_csr.c
@@ -48,11 +48,7 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 	int ret = 0;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
-#if __riscv_xlen == 32
-	bool virt = (regs->mstatusH & MSTATUSH_MPV) ? true : false;
-#else
-	bool virt = (regs->mstatus & MSTATUS_MPV) ? true : false;
-#endif
+	bool virt = sbi_regs_from_virt(regs);
 
 	switch (csr_num) {
 	case CSR_HTIMEDELTA:
@@ -163,11 +159,7 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
 {
 	int ret = 0;
 	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
-#if __riscv_xlen == 32
-	bool virt = (regs->mstatusH & MSTATUSH_MPV) ? true : false;
-#else
-	bool virt = (regs->mstatus & MSTATUS_MPV) ? true : false;
-#endif
+	bool virt = sbi_regs_from_virt(regs);
 
 	switch (csr_num) {
 	case CSR_HTIMEDELTA:
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index b4f3a17..8bd2183 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -103,11 +103,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		      const struct sbi_trap_info *trap)
 {
 	ulong hstatus, vsstatus, prev_mode;
-#if __riscv_xlen == 32
-	bool prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? true : false;
-#else
-	bool prev_virt = (regs->mstatus & MSTATUS_MPV) ? true : false;
-#endif
+	bool prev_virt = sbi_regs_from_virt(regs);
 	/* By default, we redirect to HS-mode */
 	bool next_virt = false;
 
-- 
2.43.0


