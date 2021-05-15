From: Charles Papon <charles.papon.90@gmail.com>
Date: Sat, 15 May 2021 14:06:45 +0200
Subject: Fwd: lib: fix GET_FXX_REG assembly
In-Reply-To: <CAMabmMKe_NtVyDZzdb0tCtHOe5odtVVq-kZr_=1LdtrF8xC7eA@mail.gmail.com>
References: <CAMabmMKe_NtVyDZzdb0tCtHOe5odtVVq-kZr_=1LdtrF8xC7eA@mail.gmail.com>
Message-ID: <CAMabmMKLPgJnXTPXVB2Go4vNJrAkZ=KqarvAph0964QAPpY_Kw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The previous implementation was producing some broken assembly. See
github #212 for more details

PR : https://github.com/riscv/opensbi/pull/214

---
 include/sbi/riscv_fp.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h
index a685884..b2c0636 100644
--- a/include/sbi/riscv_fp.h
+++ b/include/sbi/riscv_fp.h
@@ -21,14 +21,14 @@

 #ifdef __riscv_flen

-#define GET_F32_REG(insn, pos, regs)
                                  \
- ({
                           \
- register s32 value asm("a0") =
                   \
- SHIFT_RIGHT(insn, (pos)-3) & 0xf8;
           \
- ulong tmp;
                   \
- asm("1: auipc %0, %%pcrel_hi(get_f32_reg); add %0, %0, %1; jalr t0,
%0, %%pcrel_lo(1b)" \
-    : "=&r"(tmp), "+&r"(value)::"t0");
                  \
- value;
                   \
+#define GET_F32_REG(insn, pos, regs)
                                   \
+ ({
                                \
+ register ulong rf_address asm("a0") = SHIFT_RIGHT(insn, (pos)-3) &
0xf8;                         \
+ ulong tmp;
                            \
+ volatile u32 value;
                            \
+ asm volatile("1: auipc %0, %%pcrel_hi(get_f32_reg); add %0, %0, %2;
jalr t0, %0, %%pcrel_lo(1b)" \
+ : "=&r"(tmp) : "r"(&value), "r"(rf_address)  :"t0");
                        \
+ value;
                            \
  })
 #define SET_F32_REG(insn, pos, regs, val)
                                      \
  ({
                               \
@@ -42,14 +42,14 @@
  : "t0");
               \
  })
 #define init_fp_reg(i) SET_F32_REG((i) << 3, 3, 0, 0)
-#define GET_F64_REG(insn, pos, regs)
                                  \
- ({
                           \
- register ulong value asm("a0") =
                   \
- SHIFT_RIGHT(insn, (pos)-3) & 0xf8;
           \
- ulong tmp;
                   \
- asm("1: auipc %0, %%pcrel_hi(get_f64_reg); add %0, %0, %1; jalr t0,
%0, %%pcrel_lo(1b)" \
-    : "=&r"(tmp), "+&r"(value)::"t0");
                  \
- sizeof(ulong) == 4 ? *(int64_t *)value : (int64_t)value;
                   \
+#define GET_F64_REG(insn, pos, regs)
                                    \
+ ({
                                 \
+ register ulong rf_address asm("a0") = SHIFT_RIGHT(insn, (pos)-3) &
0xf8;                          \
+ ulong tmp;
                             \
+ volatile u64 value;
                             \
+ asm volatile("1: auipc %0, %%pcrel_hi(get_f64_reg); add %0, %0, %2;
jalr t0, %0, %%pcrel_lo(1b)"  \
+ : "=&r"(tmp) : "r"(&value), "r"(rf_address)  :"t0");
                         \
+ value;
                             \
  })
 #define SET_F64_REG(insn, pos, regs, val)
                                      \
  ({
                               \
-- 
2.17.1

