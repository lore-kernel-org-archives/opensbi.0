From: Charles Papon <charles.papon.90@gmail.com>
Date: Sat, 15 May 2021 17:23:06 +0200
Subject: lib: fix GET_FXX_REG assembly
In-Reply-To: <8A96D44F-AC5D-4944-8C94-05BD993B585C@jrtc27.com>
References: <CAMabmMKe_NtVyDZzdb0tCtHOe5odtVVq-kZr_=1LdtrF8xC7eA@mail.gmail.com>
 <CAMabmMKLPgJnXTPXVB2Go4vNJrAkZ=KqarvAph0964QAPpY_Kw@mail.gmail.com>
 <8A96D44F-AC5D-4944-8C94-05BD993B585C@jrtc27.com>
Message-ID: <CAMabmMJERFPnCgNNf82WvYCp_ufdW6AD1h7PQ+1E3naDFF7HFA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hoo right, i forced a0 on the wrong variable. this was misleading. I
have a patch for that, but now i see that RV64 do not use the memory
to get the FPU register value :
# define get_f64(which) fmv.x.d a0, which; jr t0

So right, that patch isn't the good one XD

> The only bug in the existing code is that it needs to grow separate offset and __val variables like SET_F64_REG in order to handle RV32 correctly

What do you mean by grow ? stack allocation ?

On Sat, May 15, 2021 at 3:32 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 15 May 2021, at 13:06, Charles Papon <charles.papon.90@gmail.com> wrote:
> >
> > The previous implementation was producing some broken assembly. See
> > github #212 for more details
> >
> > PR : https://github.com/riscv/opensbi/pull/214
> >
> > ---
> > include/sbi/riscv_fp.h | 32 ++++++++++++++++----------------
> > 1 file changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h
> > index a685884..b2c0636 100644
> > --- a/include/sbi/riscv_fp.h
> > +++ b/include/sbi/riscv_fp.h
> > @@ -21,14 +21,14 @@
> >
> > #ifdef __riscv_flen
> >
> > -#define GET_F32_REG(insn, pos, regs)
> >                                  \
> > - ({
> >                           \
> > - register s32 value asm("a0") =
> >                   \
> > - SHIFT_RIGHT(insn, (pos)-3) & 0xf8;
> >           \
> > - ulong tmp;
> >                   \
> > - asm("1: auipc %0, %%pcrel_hi(get_f32_reg); add %0, %0, %1; jalr t0,
> > %0, %%pcrel_lo(1b)" \
> > -    : "=&r"(tmp), "+&r"(value)::"t0");
> >                  \
> > - value;
> >                   \
> > +#define GET_F32_REG(insn, pos, regs)
> >                                   \
> > + ({
> >                                \
> > + register ulong rf_address asm("a0") = SHIFT_RIGHT(insn, (pos)-3) &
> > 0xf8;                         \
> > + ulong tmp;
> >                            \
> > + volatile u32 value;
> >                            \
> > + asm volatile("1: auipc %0, %%pcrel_hi(get_f32_reg); add %0, %0, %2;
> > jalr t0, %0, %%pcrel_lo(1b)" \
> > + : "=&r"(tmp) : "r"(&value), "r"(rf_address)  :"t0");
> >                        \
> > + value;
> >                            \
> >  })
> > #define SET_F32_REG(insn, pos, regs, val)
> >                                      \
> >  ({
> >                               \
> > @@ -42,14 +42,14 @@
> >  : "t0");
> >               \
> >  })
> > #define init_fp_reg(i) SET_F32_REG((i) << 3, 3, 0, 0)
> > -#define GET_F64_REG(insn, pos, regs)
> >                                  \
> > - ({
> >                           \
> > - register ulong value asm("a0") =
> >                   \
> > - SHIFT_RIGHT(insn, (pos)-3) & 0xf8;
> >           \
> > - ulong tmp;
> >                   \
> > - asm("1: auipc %0, %%pcrel_hi(get_f64_reg); add %0, %0, %1; jalr t0,
> > %0, %%pcrel_lo(1b)" \
> > -    : "=&r"(tmp), "+&r"(value)::"t0");
> >                  \
> > - sizeof(ulong) == 4 ? *(int64_t *)value : (int64_t)value;
> >                   \
> > +#define GET_F64_REG(insn, pos, regs)
> >                                    \
> > + ({
> >                                 \
> > + register ulong rf_address asm("a0") = SHIFT_RIGHT(insn, (pos)-3) &
> > 0xf8;                          \
> > + ulong tmp;
> >                             \
> > + volatile u64 value;
> >                             \
> > + asm volatile("1: auipc %0, %%pcrel_hi(get_f64_reg); add %0, %0, %2;
> > jalr t0, %0, %%pcrel_lo(1b)"  \
> > + : "=&r"(tmp) : "r"(&value), "r"(rf_address)  :"t0");
> >                         \
> > + value;
> >                             \
> >  })
> > #define SET_F64_REG(insn, pos, regs, val)
> >                                      \
> >  ({
>
> This patch is wrong for numerous reasons:
>
> 1. The volatile is unnecessary as loads have side-effects modelled by the
>    constraints; only stores need volatile.
>
> 2. Similarly, value does not need to be volatile.
>
> 3. But value doesn?t even need to exist.
>
> 4. You?ve lost the clobber on a0 through the old value.
>
> 5. Your formatting of the constraints is wrong.
>
> 6. GET_F64_REG is now even more broken on RV32. It won?t crash, but you?re
>    reading a completely random uninitialised value from value.
>
> On RV32, get_f64_reg expects a0 to be a pointer to a u64 and will store the
> 64-bit value there. The only bug in the existing code is that it needs to grow
> separate offset and __val variables like SET_F64_REG in order to handle RV32
> correctly. You have not fixed that bug, but you have also introduced many
> additional problems.
>
> Jess
>

