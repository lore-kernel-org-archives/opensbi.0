From: Anup Patel <anup.patel@wdc.com>
Date: Sat, 12 Jun 2021 10:01:31 +0530
Subject: [PATCH v3] lib: sbi: Fix GET_F64_REG inline assembly
Message-ID: <20210612043131.156280-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Charles Papon <charles.papon.90@gmail.com>

Current, GET_F64_REG() macro does not generate correct inline
assembly for the RV32 systems. This patch provides separate
definitions of GET_F64_REG() macro for RV32 and RV64 systems.

Signed-off-by: Charles Papon <charles.papon.90@gmail.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/riscv_fp.h | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h
index a685884..b3dc08b 100644
--- a/include/sbi/riscv_fp.h
+++ b/include/sbi/riscv_fp.h
@@ -42,15 +42,28 @@
 			: "t0");                                                                            \
 	})
 #define init_fp_reg(i) SET_F32_REG((i) << 3, 3, 0, 0)
+
+#if __riscv_xlen == 64
 #define GET_F64_REG(insn, pos, regs)                                                                    \
 	({                                                                                              \
-		register ulong value asm("a0") =                                                        \
-			SHIFT_RIGHT(insn, (pos)-3) & 0xf8;                                              \
+		register ulong value asm("a0") = SHIFT_RIGHT(insn, (pos)-3) & 0xf8;                     \
 		ulong tmp;                                                                              \
 		asm("1: auipc %0, %%pcrel_hi(get_f64_reg); add %0, %0, %1; jalr t0, %0, %%pcrel_lo(1b)" \
 		    : "=&r"(tmp), "+&r"(value)::"t0");                                                  \
-		sizeof(ulong) == 4 ? *(int64_t *)value : (int64_t)value;                                \
+		value;                                                                                  \
 	})
+#else
+#define GET_F64_REG(insn, pos, regs)                                                                     \
+	({                                                                                               \
+		u64 value;                                                                               \
+		ulong offset = SHIFT_RIGHT(insn, (pos)-3) & 0xf8;                                        \
+		register ulong ptr asm("a0") = (ulong)&value;                                            \
+		asm ("1: auipc t1, %%pcrel_hi(get_f64_reg); add t1, t1, %2; jalr t0, t1, %%pcrel_lo(1b)" \
+		    : "=m"(value) : "r"(ptr), "r"(offset) : "t0", "t1");                                 \
+		value;                                                                                   \
+	})
+#endif
+
 #define SET_F64_REG(insn, pos, regs, val)                                                                   \
 	({                                                                                                  \
 		uint64_t __val = (val);                                                                     \
-- 
2.25.1


