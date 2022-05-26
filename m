From: Xiang W <wxjstz@126.com>
Date: Thu, 26 May 2022 20:37:12 +0800
Subject: [PATCH] lib: sbi: Improve csr read and write
Message-ID: <20220526123712.290855-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reduce the overhead of csr read and write code by producing a small
piece of code to perform csr read and write.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/riscv_asm.c | 142 ++++----------------------------------------
 1 file changed, 10 insertions(+), 132 deletions(-)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index a09cf78..9cd8882 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -91,144 +91,22 @@ void misa_string(int xlen, char *out, unsigned int out_sz)
 		out[pos++] = '\0';
 }
 
+static uint32_t opcode_buff[2];
+
 unsigned long csr_read_num(int csr_num)
 {
-#define switchcase_csr_read(__csr_num, __val)		\
-	case __csr_num:					\
-		__val = csr_read(__csr_num);		\
-		break;
-#define switchcase_csr_read_2(__csr_num, __val)	\
-	switchcase_csr_read(__csr_num + 0, __val)	\
-	switchcase_csr_read(__csr_num + 1, __val)
-#define switchcase_csr_read_4(__csr_num, __val)	\
-	switchcase_csr_read_2(__csr_num + 0, __val)	\
-	switchcase_csr_read_2(__csr_num + 2, __val)
-#define switchcase_csr_read_8(__csr_num, __val)	\
-	switchcase_csr_read_4(__csr_num + 0, __val)	\
-	switchcase_csr_read_4(__csr_num + 4, __val)
-#define switchcase_csr_read_16(__csr_num, __val)	\
-	switchcase_csr_read_8(__csr_num + 0, __val)	\
-	switchcase_csr_read_8(__csr_num + 8, __val)
-#define switchcase_csr_read_32(__csr_num, __val)	\
-	switchcase_csr_read_16(__csr_num + 0, __val)	\
-	switchcase_csr_read_16(__csr_num + 16, __val)
-#define switchcase_csr_read_64(__csr_num, __val)	\
-	switchcase_csr_read_32(__csr_num + 0, __val)	\
-	switchcase_csr_read_32(__csr_num + 32, __val)
-
-	unsigned long ret = 0;
-
-	switch (csr_num) {
-	switchcase_csr_read_16(CSR_PMPCFG0, ret)
-	switchcase_csr_read_64(CSR_PMPADDR0, ret)
-	switchcase_csr_read(CSR_MCYCLE, ret)
-	switchcase_csr_read(CSR_MINSTRET, ret)
-	switchcase_csr_read(CSR_MHPMCOUNTER3, ret)
-	switchcase_csr_read_4(CSR_MHPMCOUNTER4, ret)
-	switchcase_csr_read_8(CSR_MHPMCOUNTER8, ret)
-	switchcase_csr_read_16(CSR_MHPMCOUNTER16, ret)
-	switchcase_csr_read(CSR_MCOUNTINHIBIT, ret)
-	switchcase_csr_read(CSR_MHPMEVENT3, ret)
-	switchcase_csr_read_4(CSR_MHPMEVENT4, ret)
-	switchcase_csr_read_8(CSR_MHPMEVENT8, ret)
-	switchcase_csr_read_16(CSR_MHPMEVENT16, ret)
-#if __riscv_xlen == 32
-	switchcase_csr_read(CSR_MCYCLEH, ret)
-	switchcase_csr_read(CSR_MINSTRETH, ret)
-	switchcase_csr_read(CSR_MHPMCOUNTER3H, ret)
-	switchcase_csr_read_4(CSR_MHPMCOUNTER4H, ret)
-	switchcase_csr_read_8(CSR_MHPMCOUNTER8H, ret)
-	switchcase_csr_read_16(CSR_MHPMCOUNTER16H, ret)
-	/**
-	 * The CSR range MHPMEVENT[3-16]H are available only if sscofpmf
-	 * extension is present. The caller must ensure that.
-	 */
-	switchcase_csr_read(CSR_MHPMEVENT3H, ret)
-	switchcase_csr_read_4(CSR_MHPMEVENT4H, ret)
-	switchcase_csr_read_8(CSR_MHPMEVENT8H, ret)
-	switchcase_csr_read_16(CSR_MHPMEVENT16H, ret)
-#endif
-
-	default:
-		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
-		break;
-	};
-
-	return ret;
-
-#undef switchcase_csr_read_64
-#undef switchcase_csr_read_32
-#undef switchcase_csr_read_16
-#undef switchcase_csr_read_8
-#undef switchcase_csr_read_4
-#undef switchcase_csr_read_2
-#undef switchcase_csr_read
+	typedef unsigned long (*read_f)(void);
+	opcode_buff[0] = (csr_num << 20) | 0x00002573; /* csrr a0, csr */
+	opcode_buff[1] = 0x00008067; /* ret */
+	return ((read_f)opcode_buff)();
 }
 
 void csr_write_num(int csr_num, unsigned long val)
 {
-#define switchcase_csr_write(__csr_num, __val)		\
-	case __csr_num:					\
-		csr_write(__csr_num, __val);		\
-		break;
-#define switchcase_csr_write_2(__csr_num, __val)	\
-	switchcase_csr_write(__csr_num + 0, __val)	\
-	switchcase_csr_write(__csr_num + 1, __val)
-#define switchcase_csr_write_4(__csr_num, __val)	\
-	switchcase_csr_write_2(__csr_num + 0, __val)	\
-	switchcase_csr_write_2(__csr_num + 2, __val)
-#define switchcase_csr_write_8(__csr_num, __val)	\
-	switchcase_csr_write_4(__csr_num + 0, __val)	\
-	switchcase_csr_write_4(__csr_num + 4, __val)
-#define switchcase_csr_write_16(__csr_num, __val)	\
-	switchcase_csr_write_8(__csr_num + 0, __val)	\
-	switchcase_csr_write_8(__csr_num + 8, __val)
-#define switchcase_csr_write_32(__csr_num, __val)	\
-	switchcase_csr_write_16(__csr_num + 0, __val)	\
-	switchcase_csr_write_16(__csr_num + 16, __val)
-#define switchcase_csr_write_64(__csr_num, __val)	\
-	switchcase_csr_write_32(__csr_num + 0, __val)	\
-	switchcase_csr_write_32(__csr_num + 32, __val)
-
-	switch (csr_num) {
-	switchcase_csr_write_16(CSR_PMPCFG0, val)
-	switchcase_csr_write_64(CSR_PMPADDR0, val)
-	switchcase_csr_write(CSR_MCYCLE, val)
-	switchcase_csr_write(CSR_MINSTRET, val)
-	switchcase_csr_write(CSR_MHPMCOUNTER3, val)
-	switchcase_csr_write_4(CSR_MHPMCOUNTER4, val)
-	switchcase_csr_write_8(CSR_MHPMCOUNTER8, val)
-	switchcase_csr_write_16(CSR_MHPMCOUNTER16, val)
-#if __riscv_xlen == 32
-	switchcase_csr_write(CSR_MCYCLEH, val)
-	switchcase_csr_write(CSR_MINSTRETH, val)
-	switchcase_csr_write(CSR_MHPMCOUNTER3H, val)
-	switchcase_csr_write_4(CSR_MHPMCOUNTER4H, val)
-	switchcase_csr_write_8(CSR_MHPMCOUNTER8H, val)
-	switchcase_csr_write_16(CSR_MHPMCOUNTER16H, val)
-	switchcase_csr_write(CSR_MHPMEVENT3H, val)
-	switchcase_csr_write_4(CSR_MHPMEVENT4H, val)
-	switchcase_csr_write_8(CSR_MHPMEVENT8H, val)
-	switchcase_csr_write_16(CSR_MHPMEVENT16H, val)
-#endif
-	switchcase_csr_write(CSR_MCOUNTINHIBIT, val)
-	switchcase_csr_write(CSR_MHPMEVENT3, val)
-	switchcase_csr_write_4(CSR_MHPMEVENT4, val)
-	switchcase_csr_write_8(CSR_MHPMEVENT8, val)
-	switchcase_csr_write_16(CSR_MHPMEVENT16, val)
-
-	default:
-		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
-		break;
-	};
-
-#undef switchcase_csr_write_64
-#undef switchcase_csr_write_32
-#undef switchcase_csr_write_16
-#undef switchcase_csr_write_8
-#undef switchcase_csr_write_4
-#undef switchcase_csr_write_2
-#undef switchcase_csr_write
+	typedef void (*write_f)(unsigned long val);
+	opcode_buff[0] = (csr_num << 20) | 0x00051073; /* csrw csr, a0 */
+	opcode_buff[1] = 0x00008067; /* ret */
+	((write_f)opcode_buff)(val);
 }
 
 static unsigned long ctz(unsigned long x)
-- 
2.30.2


