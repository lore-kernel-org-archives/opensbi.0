From: Charles Papon <charles.papon.90@gmail.com>
Date: Sat, 12 Jun 2021 13:24:49 +0200
Subject: [PATCH v3] lib: sbi: Fix GET_F64_REG inline assembly
In-Reply-To: <CO6PR04MB781222AD631F442FCE938A758D339@CO6PR04MB7812.namprd04.prod.outlook.com>
References: <20210612043131.156280-1-anup.patel@wdc.com>
 <CO6PR04MB781222AD631F442FCE938A758D339@CO6PR04MB7812.namprd04.prod.outlook.com>
Message-ID: <CAMabmMJHG7R3zp7buZ7dftWOdmm1GFjLh10uG16gsD0ZUmCKOA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

Thanks for the fix :)
Charles

On Sat, Jun 12, 2021 at 6:34 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> Hi Charles,
>
> > -----Original Message-----
> > From: Anup Patel <Anup.Patel@wdc.com>
> > Sent: 12 June 2021 10:02
> > To: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> > <Alistair.Francis@wdc.com>
> > Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org; Charles
> > Papon <charles.papon.90@gmail.com>; Anup Patel <Anup.Patel@wdc.com>
> > Subject: [PATCH v3] lib: sbi: Fix GET_F64_REG inline assembly
> >
> > From: Charles Papon <charles.papon.90@gmail.com>
> >
> > Current, GET_F64_REG() macro does not generate correct inline assembly for
> > the RV32 systems. This patch provides separate definitions of GET_F64_REG()
> > macro for RV32 and RV64 systems.
> >
> > Signed-off-by: Charles Papon <charles.papon.90@gmail.com>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/riscv_fp.h | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h index
> > a685884..b3dc08b 100644
> > --- a/include/sbi/riscv_fp.h
> > +++ b/include/sbi/riscv_fp.h
> > @@ -42,15 +42,28 @@
> >                       : "t0");                                                                            \
> >       })
> >  #define init_fp_reg(i) SET_F32_REG((i) << 3, 3, 0, 0)
> > +
> > +#if __riscv_xlen == 64
> >  #define GET_F64_REG(insn, pos, regs)
> > \
> >       ({                                                                                              \
> > -             register ulong value asm("a0") =
> > \
> > -                     SHIFT_RIGHT(insn, (pos)-3) & 0xf8;
> > \
> > +             register ulong value asm("a0") = SHIFT_RIGHT(insn, (pos)-3) &
> > 0xf8;                     \
> >               ulong tmp;                                                                              \
> >               asm("1: auipc %0, %%pcrel_hi(get_f64_reg); add %0, %0, %1;
> > jalr t0, %0, %%pcrel_lo(1b)" \
> >                   : "=&r"(tmp), "+&r"(value)::"t0");
> > \
> > -             sizeof(ulong) == 4 ? *(int64_t *)value : (int64_t)value;
> > \
> > +             value;                                                                                  \
> >       })
> > +#else
> > +#define GET_F64_REG(insn, pos, regs)
> > \
> > +     ({                                                                                               \
> > +             u64 value;                                                                               \
> > +             ulong offset = SHIFT_RIGHT(insn, (pos)-3) & 0xf8;
> > \
> > +             register ulong ptr asm("a0") = (ulong)&value;
> > \
> > +             asm ("1: auipc t1, %%pcrel_hi(get_f64_reg); add t1, t1, %2;
> > jalr t0, t1, %%pcrel_lo(1b)" \
> > +                 : "=m"(value) : "r"(ptr), "r"(offset) : "t0", "t1");
> > \
> > +             value;                                                                                   \
> > +     })
> > +#endif
> > +
> >  #define SET_F64_REG(insn, pos, regs, val)
> > \
> >       ({                                                                                                  \
> >               uint64_t __val = (val);
> > \
> > --
> > 2.25.1
>
> This is same patch which you posted last.
>
> I have fixed patch subject, patch description, and other minor nits.
>
> I have tested in on QEMU RV64 and QEMU RV32.
>
> Applied this patch on the riscv/opensbi repo.
>
> Thanks,
> Anup
>

