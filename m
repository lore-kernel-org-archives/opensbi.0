From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:37 -0700
Subject: [PATCH v2 08/15] lib: sbi: Use csr_read/write_num to read/update PMU
 counters
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-9-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, csr_read/write_num functions are used to read/write PMP related
CSRs where CSR value is decided at runtime. Expand this function to include
PMU related CSRs as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/riscv_asm.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 8c54c11147e7..4c24a5132195 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -118,6 +118,21 @@ unsigned long csr_read_num(int csr_num)
 	switch (csr_num) {
 	switchcase_csr_read_16(CSR_PMPCFG0, ret)
 	switchcase_csr_read_64(CSR_PMPADDR0, ret)
+	switchcase_csr_read(CSR_MCYCLE, ret)
+	switchcase_csr_read(CSR_MINSTRET, ret)
+	switchcase_csr_read(CSR_MHPMCOUNTER3, ret)
+	switchcase_csr_read_4(CSR_MHPMCOUNTER4, ret)
+	switchcase_csr_read_8(CSR_MHPMCOUNTER8, ret)
+	switchcase_csr_read_16(CSR_MHPMCOUNTER16, ret)
+#if __riscv_xlen == 32
+	switchcase_csr_read(CSR_MCYCLEH, ret)
+	switchcase_csr_read(CSR_MINSTRETH, ret)
+	switchcase_csr_read(CSR_MHPMCOUNTER3H, ret)
+	switchcase_csr_read_4(CSR_MHPMCOUNTER4H, ret)
+	switchcase_csr_read_8(CSR_MHPMCOUNTER8H, ret)
+	switchcase_csr_read_16(CSR_MHPMCOUNTER16H, ret)
+#endif
+
 	default:
 		break;
 	};
@@ -161,6 +176,26 @@ void csr_write_num(int csr_num, unsigned long val)
 	switch (csr_num) {
 	switchcase_csr_write_16(CSR_PMPCFG0, val)
 	switchcase_csr_write_64(CSR_PMPADDR0, val)
+	switchcase_csr_write(CSR_MCYCLE, val)
+	switchcase_csr_write(CSR_MINSTRET, val)
+	switchcase_csr_write(CSR_MHPMCOUNTER3, val)
+	switchcase_csr_write_4(CSR_MHPMCOUNTER4, val)
+	switchcase_csr_write_8(CSR_MHPMCOUNTER8, val)
+	switchcase_csr_write_16(CSR_MHPMCOUNTER16, val)
+#if __riscv_xlen == 32
+	switchcase_csr_write(CSR_MCYCLEH, val)
+	switchcase_csr_write(CSR_MINSTRETH, val)
+	switchcase_csr_write(CSR_MHPMCOUNTER3H, val)
+	switchcase_csr_write_4(CSR_MHPMCOUNTER4H, val)
+	switchcase_csr_write_8(CSR_MHPMCOUNTER8H, val)
+	switchcase_csr_write_16(CSR_MHPMCOUNTER16H, val)
+#endif
+	switchcase_csr_write(CSR_MCOUNTINHIBIT, val)
+	switchcase_csr_write(CSR_MHPMEVENT3, val)
+	switchcase_csr_write_4(CSR_MHPMEVENT4, val)
+	switchcase_csr_write_8(CSR_MHPMEVENT8, val)
+	switchcase_csr_write_16(CSR_MHPMEVENT16, val)
+
 	default:
 		break;
 	};
-- 
2.25.1


