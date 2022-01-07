From: Atish Patra <atishp@rivosinc.com>
Date: Fri,  7 Jan 2022 10:54:09 -0800
Subject: [PATCH v1 3/3] lib: sbi: Disable interrupt and inhibit counting in
 M-mode during init
In-Reply-To: <20220107185409.1172221-1-atishp@rivosinc.com>
References: <20220107185409.1172221-1-atishp@rivosinc.com>
Message-ID: <20220107185409.1172221-4-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the mhpmevent CSRs are untouched during hart init during
cold/warm boot. Ideally, we should clear out all the bits except
overflow and MINH bit. That is required to disable overflow
interrupt and inhbit counting in M-mode to avoid any spurious
interrupts before perf start.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 lib/sbi/sbi_hart.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d9a15d994a6b..0a651752cdda 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -40,6 +40,9 @@ static unsigned long hart_features_offset;
 static void mstatus_init(struct sbi_scratch *scratch)
 {
 	unsigned long mstatus_val = 0;
+	int cidx;
+	unsigned int num_mhpm = sbi_hart_mhpm_count(scratch);
+	uint64_t mhpmevent_init_val = 0;
 
 	/* Enable FPU */
 	if (misa_extension('D') || misa_extension('F'))
@@ -68,6 +71,21 @@ static void mstatus_init(struct sbi_scratch *scratch)
 	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
 		csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
 
+	/**
+	 * The mhpmeventn[h] CSR should be initialized with interrupt disabled
+	 * and inhibited running in M-mode during init.
+	 * To keep it simple, only contiguous mhpmcounters are supported as a
+	 * platform with discontiguous mhpmcounters may not make much sense.
+	 */
+	mhpmevent_init_val |= (MHPMEVENT_OF | MHPMEVENT_MINH);
+	for (cidx = 0; cidx < num_mhpm; cidx++) {
+#if __riscv_xlen == 32
+		csr_write_num(CSR_MHPMEVENT3 + cidx, mhpmevent_init_val & 0xFFFFFFFF);
+		csr_write_num(CSR_MHPMEVENT3H + cidx, mhpmevent_init_val >> BITS_PER_LONG);
+#else
+		csr_write_num(CSR_MHPMEVENT3 + cidx, mhpmevent_init_val);
+#endif
+	}
 	/* Disable all interrupts */
 	csr_write(CSR_MIE, 0);
 
-- 
2.30.2


