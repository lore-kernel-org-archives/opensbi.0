From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 May 2022 09:47:01 +0530
Subject: [PATCH v2] lib: sbi: Fix mhpmeventh access for rv32 in absence of
 sscofpmf
In-Reply-To: <CAAhSdy0bbV1yDDmZ5OEK15eQKveyk75UmbN=fEkFBv4V448ZRw@mail.gmail.com>
References: <20220428184829.1188183-1-atishp@rivosinc.com>
 <CAAhSdy0bbV1yDDmZ5OEK15eQKveyk75UmbN=fEkFBv4V448ZRw@mail.gmail.com>
Message-ID: <CAAhSdy0_008mOC_7P1wqXXtfNqeguBpV7AQBCRptCw0NjfdwZQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 29, 2022 at 3:19 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Apr 29, 2022 at 12:18 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > MHPMEVENT3H-31H are defined in sscofpmf extension. Thus, they should be
> > accessed only if sscofpmf is present.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> > Changes from v1->V2:
> > 1. Fixed the compilation error in rv64
> > ---
> >  lib/sbi/riscv_asm.c | 4 ++++
> >  lib/sbi/sbi_pmu.c   | 8 ++++++--
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> > index 5eab1ed5724f..ddc4c139b95e 100644
> > --- a/lib/sbi/riscv_asm.c
> > +++ b/lib/sbi/riscv_asm.c
> > @@ -139,6 +139,10 @@ unsigned long csr_read_num(int csr_num)
> >         switchcase_csr_read_4(CSR_MHPMCOUNTER4H, ret)
> >         switchcase_csr_read_8(CSR_MHPMCOUNTER8H, ret)
> >         switchcase_csr_read_16(CSR_MHPMCOUNTER16H, ret)
> > +       /**
> > +        * The CSR range MHPMEVENT[3-16]H are available only if sscofpmf
> > +        * extension is present. The caller must ensure that.
> > +        */
> >         switchcase_csr_read(CSR_MHPMEVENT3H, ret)
> >         switchcase_csr_read_4(CSR_MHPMEVENT4H, ret)
> >         switchcase_csr_read_8(CSR_MHPMEVENT8H, ret)
> > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > index 7ea0ca5e2fa7..f458c6d4a221 100644
> > --- a/lib/sbi/sbi_pmu.c
> > +++ b/lib/sbi/sbi_pmu.c
> > @@ -404,7 +404,9 @@ static int pmu_reset_hw_mhpmevent(int ctr_idx)
> >                 return SBI_EFAIL;
> >  #if __riscv_xlen == 32
> >         csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, 0);
> > -       csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3, 0);
> > +       if (sbi_hart_has_feature(sbi_scratch_thishart_ptr(),
> > +                                 SBI_HART_HAS_SSCOFPMF))
> > +               csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3, 0);
> >  #else
> >         csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, 0);
> >  #endif
> > @@ -483,7 +485,9 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
> >
> >  #if __riscv_xlen == 32
> >         csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val & 0xFFFFFFFF);
> > -       csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3, mhpmevent_val >> BITS_PER_LONG);
> > +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > +               csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3,
> > +                             mhpmevent_val >> BITS_PER_LONG);
> >  #else
> >         csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val);
> >  #endif
> > --
> > 2.25.1
> >

