From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 3 Mar 2024 10:02:56 +0530
Subject: [PATCH v3 6/6] lib: sbi: call platform load/store emulators
In-Reply-To: <CAAhSdy3rrTxGioFY75+Ki-fu5ni8J+ZLjaofCO=rpopfR9y-kA@mail.gmail.com>
References: <1709378725-56656-1-git-send-email-ganboing@gmail.com>
 <1709378725-56656-7-git-send-email-ganboing@gmail.com> <CAAhSdy3rrTxGioFY75+Ki-fu5ni8J+ZLjaofCO=rpopfR9y-kA@mail.gmail.com>
Message-ID: <CAK9=C2XPjWZ=xXEb253G=r_G1dxBtTm07dWe9jbwykcKZE0+cQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 2, 2024 at 6:48?PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Mar 2, 2024 at 4:55?PM Bo Gan <ganboing@gmail.com> wrote:
> >
> > sbi_load/store_fault_handler now tries to call platform emulators
> > if defined. Otherwise, redirects the fault.
> >
> > We let the handler fail if the trap was originated from M mode. In
> > this case, something must be very wrong and we should not attempt
> > to access sbi_platform_ptr(sbi_scratch_thishart_ptr()).
> >
> > Signed-off-by: Bo Gan <ganboing@gmail.com>
> > ---
> >  include/sbi/sbi_platform.h | 25 +++++++++++++++++++++++++
> >  lib/sbi/sbi_trap_ldst.c    | 17 +++++++++++++++--
> >  2 files changed, 40 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> > index 06247dc..c556925 100644
> > --- a/include/sbi/sbi_platform.h
> > +++ b/include/sbi/sbi_platform.h
> > @@ -48,6 +48,7 @@
> >  #include <sbi/sbi_error.h>
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi/sbi_version.h>
> > +#include <sbi/sbi_trap_ldst.h>
> >
> >  struct sbi_domain_memregion;
> >  struct sbi_ecall_return;
> > @@ -686,6 +687,30 @@ static inline int sbi_platform_vendor_ext_provider(
> >         return SBI_ENOTSUPP;
> >  }
> >
> > +static inline int
> > +sbi_platform_emulate_load(const struct sbi_platform *plat,
> > +                         struct sbi_trap_regs *regs,
> > +                         const struct sbi_trap_info *orig_trap)
> > +{
> > +       if (plat && sbi_platform_ops(plat)->emulate_load) {
> > +               return sbi_trap_emulate_load(
> > +                       regs, orig_trap, sbi_platform_ops(plat)->emulate_load);
> > +       }
> > +       return sbi_trap_redirect(regs, orig_trap);
> > +}
> > +
> > +static inline int
> > +sbi_platform_emulate_store(const struct sbi_platform *plat,
> > +                          struct sbi_trap_regs *regs,
> > +                          const struct sbi_trap_info *orig_trap)
> > +{
> > +       if (plat && sbi_platform_ops(plat)->emulate_store) {
> > +               return sbi_trap_emulate_store(
> > +                       regs, orig_trap, sbi_platform_ops(plat)->emulate_store);
> > +       }
> > +       return sbi_trap_redirect(regs, orig_trap);
> > +}
> > +
>
> These should be implemented as follows:
>
> static inline int
> sbi_platform_emulate_load(const struct sbi_platform *plat,
>                          int rlen, union sbi_reg_data *out_val)
> {
>        if (plat && sbi_platform_ops(plat)->emulate_load) {
>                return sbi_platform_ops(plat)->emulate_load(rlen, out_val);
>        }
>        return SBI_ENOTSUPP;
> }
>
> static inline int
> sbi_platform_emulate_store(const struct sbi_platform *plat,
>                           int wlen, union sbi_reg_data in_val)
> {
>        if (plat && sbi_platform_ops(plat)->emulate_store) {
>                return sbi_platform_ops(plat)->emulate_store(wlen, in_val);
>        }
>        return SBI_ENOTSUPP;
> }

We also need "addr" parameter so this should be:

static inline int
sbi_platform_emulate_load(const struct sbi_platform *plat,
                         unsigned long addr, int rlen, union
sbi_ldst_data *out_val)
{
       if (plat && sbi_platform_ops(plat)->emulate_load) {
               return sbi_platform_ops(plat)->emulate_load(addr, rlen, out_val);
       }
       return SBI_ENOTSUPP;
}

static inline int
sbi_platform_emulate_store(const struct sbi_platform *plat,
                          unsigned long addr, int wlen, union
sbi_ldst_data in_val)
{
       if (plat && sbi_platform_ops(plat)->emulate_store) {
               return sbi_platform_ops(plat)->emulate_store(addr, wlen, in_val);
       }
       return SBI_ENOTSUPP;
}

Regards,
Anup

>
> >  #endif
> >
> >  #endif
> > diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
> > index 5516954..606830e 100644
> > --- a/lib/sbi/sbi_trap_ldst.c
> > +++ b/lib/sbi/sbi_trap_ldst.c
> > @@ -15,6 +15,7 @@
> >  #include <sbi/sbi_pmu.h>
> >  #include <sbi/sbi_trap.h>
> >  #include <sbi/sbi_unpriv.h>
> > +#include <sbi/sbi_platform.h>
> >
> >  static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
> >                                         ulong addr_offset)
> > @@ -294,11 +295,23 @@ int sbi_misaligned_store_handler(struct sbi_trap_regs *regs,
> >  int sbi_load_fault_handler(struct sbi_trap_regs *regs,
> >                            const struct sbi_trap_info *orig_trap)
> >  {
> > -       return sbi_trap_redirect(regs, orig_trap);
> > +       /* If fault came from M mode, just fail */
> > +       if (((regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) == PRV_M) {
> > +               return SBI_EINVAL;
> > +       }
> > +
> > +       return sbi_platform_emulate_load(sbi_platform_thishart_ptr(), regs,
> > +                                        orig_trap);
> >  }
> >
> >  int sbi_store_fault_handler(struct sbi_trap_regs *regs,
> >                             const struct sbi_trap_info *orig_trap)
> >  {
> > -       return sbi_trap_redirect(regs, orig_trap);
> > +       /* If fault came from M mode, just fail */
> > +       if (((regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) == PRV_M) {
> > +               return SBI_EINVAL;
> > +       }
> > +
> > +       return sbi_platform_emulate_store(sbi_platform_thishart_ptr(), regs,
> > +                                         orig_trap);
> >  }
> > --
> > 2.7.4
> >
>
> Regards,
> Anup
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

