From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 2 Nov 2021 13:23:11 +0100
Subject: [PATCH] include: sbi_utils: Introduce an helper to get fdt base
 address
In-Reply-To: <CAAhSdy09Y0b6h=GwEipUDjD=WBKm4nn1mnkFAP44Pw=sTKA=BA@mail.gmail.com>
References: <20211027074336.1798579-1-alexandre.ghiti@canonical.com>
 <CAAhSdy09Y0b6h=GwEipUDjD=WBKm4nn1mnkFAP44Pw=sTKA=BA@mail.gmail.com>
Message-ID: <CA+zEjCvcU15PLq1WaOFG9jbtnnY8+w_MoGR8Xaiuuyueumy-Kw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 2, 2021 at 11:11 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Oct 27, 2021 at 1:13 PM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > This simply adds an helper to get fdt address which is more explicit than
> > sbi_scratch_thishart_arg1_ptr.
> >
> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>
> Some of the sources were missing "#include <sbi_utils/fdt/fdt_helper.h>",
> I have taken care of this while merging this patch.

Arf, thanks Anup!

>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
>
> Applied this patch to the riscv/opensbi repo.
>
> Thanks,
> Anup
>
> > ---
> >  include/sbi_utils/fdt/fdt_helper.h | 6 ++++++
> >  lib/utils/ipi/fdt_ipi.c            | 2 +-
> >  lib/utils/irqchip/fdt_irqchip.c    | 2 +-
> >  lib/utils/reset/fdt_reset.c        | 2 +-
> >  lib/utils/serial/fdt_serial.c      | 2 +-
> >  lib/utils/timer/fdt_timer.c        | 2 +-
> >  platform/andes/ae350/platform.c    | 2 +-
> >  platform/fpga/ariane/platform.c    | 2 +-
> >  platform/fpga/openpiton/platform.c | 4 ++--
> >  platform/generic/platform.c        | 6 +++---
> >  platform/kendryte/k210/platform.c  | 2 +-
> >  platform/nuclei/ux600/platform.c   | 2 +-
> >  12 files changed, 20 insertions(+), 14 deletions(-)
> >
> > diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> > index 5cb7340..24fee7a 100644
> > --- a/include/sbi_utils/fdt/fdt_helper.h
> > +++ b/include/sbi_utils/fdt/fdt_helper.h
> > @@ -11,6 +11,7 @@
> >  #define __FDT_HELPER_H__
> >
> >  #include <sbi/sbi_types.h>
> > +#include <sbi/sbi_scratch.h>
> >
> >  struct fdt_match {
> >         const char *compatible;
> > @@ -81,4 +82,9 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
> >  int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
> >                           const char *compatible);
> >
> > +static inline void *fdt_get_address(void)
> > +{
> > +       return sbi_scratch_thishart_arg1_ptr();
> > +}
> > +
> >  #endif /* __FDT_HELPER_H__ */
> > diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
> > index ed56e49..91f116f 100644
> > --- a/lib/utils/ipi/fdt_ipi.c
> > +++ b/lib/utils/ipi/fdt_ipi.c
> > @@ -45,7 +45,7 @@ static int fdt_ipi_cold_init(void)
> >         int pos, noff, rc;
> >         struct fdt_ipi *drv;
> >         const struct fdt_match *match;
> > -       void *fdt = sbi_scratch_thishart_arg1_ptr();
> > +       void *fdt = fdt_get_address();
> >
> >         for (pos = 0; pos < array_size(ipi_drivers); pos++) {
> >                 drv = ipi_drivers[pos];
> > diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
> > index 1306d50..8dda661 100644
> > --- a/lib/utils/irqchip/fdt_irqchip.c
> > +++ b/lib/utils/irqchip/fdt_irqchip.c
> > @@ -38,7 +38,7 @@ static int fdt_irqchip_cold_init(void)
> >         int pos, noff, rc;
> >         struct fdt_irqchip *drv;
> >         const struct fdt_match *match;
> > -       void *fdt = sbi_scratch_thishart_arg1_ptr();
> > +       void *fdt = fdt_get_address();
> >
> >         for (pos = 0; pos < array_size(irqchip_drivers); pos++) {
> >                 drv = irqchip_drivers[pos];
> > diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> > index 92f37b0..488ac76 100644
> > --- a/lib/utils/reset/fdt_reset.c
> > +++ b/lib/utils/reset/fdt_reset.c
> > @@ -35,7 +35,7 @@ int fdt_reset_init(void)
> >         int pos, noff, rc;
> >         struct fdt_reset *drv;
> >         const struct fdt_match *match;
> > -       void *fdt = sbi_scratch_thishart_arg1_ptr();
> > +       void *fdt = fdt_get_address();
> >
> >         for (pos = 0; pos < array_size(reset_drivers); pos++) {
> >                 drv = reset_drivers[pos];
> > diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
> > index 1d1eba8..cedda04 100644
> > --- a/lib/utils/serial/fdt_serial.c
> > +++ b/lib/utils/serial/fdt_serial.c
> > @@ -40,7 +40,7 @@ int fdt_serial_init(void)
> >         struct fdt_serial *drv;
> >         const struct fdt_match *match;
> >         int pos, noff = -1, len, coff, rc;
> > -       void *fdt = sbi_scratch_thishart_arg1_ptr();
> > +       void *fdt = fdt_get_address();
> >
> >         /* Find offset of node pointed to by stdout-path */
> >         coff = fdt_path_offset(fdt, "/chosen");
> > diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
> > index 148c05e..781bb63 100644
> > --- a/lib/utils/timer/fdt_timer.c
> > +++ b/lib/utils/timer/fdt_timer.c
> > @@ -45,7 +45,7 @@ static int fdt_timer_cold_init(void)
> >         int pos, noff, rc;
> >         struct fdt_timer *drv;
> >         const struct fdt_match *match;
> > -       void *fdt = sbi_scratch_thishart_arg1_ptr();
> > +       void *fdt = fdt_get_address();
> >
> >         for (pos = 0; pos < array_size(timer_drivers); pos++) {
> >                 drv = timer_drivers[pos];
> > diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
> > index ae4ef71..b351694 100644
> > --- a/platform/andes/ae350/platform.c
> > +++ b/platform/andes/ae350/platform.c
> > @@ -55,7 +55,7 @@ static int ae350_final_init(bool cold_boot)
> >         if (!cold_boot)
> >                 return 0;
> >
> > -       fdt = sbi_scratch_thishart_arg1_ptr();
> > +       fdt = fdt_get_address();
> >         fdt_fixups(fdt);
> >
> >         return 0;
> > diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> > index 5acc446..84e2bf8 100644
> > --- a/platform/fpga/ariane/platform.c
> > +++ b/platform/fpga/ariane/platform.c
> > @@ -76,7 +76,7 @@ static int ariane_final_init(bool cold_boot)
> >         if (!cold_boot)
> >                 return 0;
> >
> > -       fdt = sbi_scratch_thishart_arg1_ptr();
> > +       fdt = fdt_get_address();
> >         fdt_fixups(fdt);
> >
> >         return 0;
> > diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> > index 924053e..59c6702 100644
> > --- a/platform/fpga/openpiton/platform.c
> > +++ b/platform/fpga/openpiton/platform.c
> > @@ -76,7 +76,7 @@ static int openpiton_early_init(bool cold_boot)
> >
> >         if (!cold_boot)
> >                 return 0;
> > -       fdt = sbi_scratch_thishart_arg1_ptr();
> > +       fdt = fdt_get_address();
> >
> >         rc = fdt_parse_uart8250(fdt, &uart_data, "ns16550");
> >         if (!rc)
> > @@ -112,7 +112,7 @@ static int openpiton_final_init(bool cold_boot)
> >         if (!cold_boot)
> >                 return 0;
> >
> > -       fdt = sbi_scratch_thishart_arg1_ptr();
> > +       fdt = fdt_get_address();
> >         fdt_fixups(fdt);
> >
> >         return 0;
> > diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> > index 0757d87..276f64e 100644
> > --- a/platform/generic/platform.c
> > +++ b/platform/generic/platform.c
> > @@ -148,7 +148,7 @@ static int generic_final_init(bool cold_boot)
> >         if (!cold_boot)
> >                 return 0;
> >
> > -       fdt = sbi_scratch_thishart_arg1_ptr();
> > +       fdt = fdt_get_address();
> >
> >         fdt_cpu_fixup(fdt);
> >         fdt_fixups(fdt);
> > @@ -177,7 +177,7 @@ static void generic_final_exit(void)
> >
> >  static int generic_domains_init(void)
> >  {
> > -       return fdt_domains_populate(sbi_scratch_thishart_arg1_ptr());
> > +       return fdt_domains_populate(fdt_get_address());
> >  }
> >
> >  static u64 generic_tlbr_flush_limit(void)
> > @@ -189,7 +189,7 @@ static u64 generic_tlbr_flush_limit(void)
> >
> >  static int generic_pmu_init(void)
> >  {
> > -       return fdt_pmu_setup(sbi_scratch_thishart_arg1_ptr());
> > +       return fdt_pmu_setup(fdt_get_address());
> >  }
> >
> >  static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
> > diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> > index e7caec3..5d35ed4 100644
> > --- a/platform/kendryte/k210/platform.c
> > +++ b/platform/kendryte/k210/platform.c
> > @@ -120,7 +120,7 @@ static int k210_final_init(bool cold_boot)
> >         if (!cold_boot)
> >                 return 0;
> >
> > -       fdt = sbi_scratch_thishart_arg1_ptr();
> > +       fdt = fdt_get_address();
> >
> >         fdt_cpu_fixup(fdt);
> >         fdt_fixups(fdt);
> > diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> > index 6f87cf8..3300061 100644
> > --- a/platform/nuclei/ux600/platform.c
> > +++ b/platform/nuclei/ux600/platform.c
> > @@ -175,7 +175,7 @@ static int ux600_final_init(bool cold_boot)
> >         if (!cold_boot)
> >                 return 0;
> >
> > -       fdt = sbi_scratch_thishart_arg1_ptr();
> > +       fdt = fdt_get_address();
> >         ux600_modify_dt(fdt);
> >
> >         return 0;
> > --
> > 2.30.2
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

