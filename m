From: Heiko Stübner <heiko@sntech.de>
Date: Tue, 27 Sep 2022 13:41:26 +0200
Subject: [PATCH v4 5/5] platform: generic: allwinner: add support for c9xx pmu
In-Reply-To: <CAJF2gTS26pzgEnasxrz04vY1XFatcCT4=cyhiLTVpyoofZS6mg@mail.gmail.com>
References: <20220926101607.731275-1-heiko@sntech.de> <20220926101607.731275-6-heiko@sntech.de> <CAJF2gTS26pzgEnasxrz04vY1XFatcCT4=cyhiLTVpyoofZS6mg@mail.gmail.com>
Message-ID: <3190206.aeNJFYEL58@diego>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Am Dienstag, 27. September 2022, 01:30:15 CEST schrieb Guo Ren:
> On Mon, Sep 26, 2022 at 6:16 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > With the T-HEAD C9XX cores being designed before or during ratification
> > of the SSCOFPMF extension, they implement a PMU extension that behaves
> > very similar but not equal to it by providing overflow interrupts though
> > in a slightly different registers format.
> >
> > The sun20i-d1 is using this core. So implement the necessary overrides
> > to allow its pmu to be used via the standard sbi-pmu extension.
> >
> > For now it's also the only soc using this core, so keep the additional
> > code in the d1-space for now.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  platform/generic/allwinner/sun20i-d1.c |  72 ++++++++++++++
> >  platform/generic/include/thead_c9xx.h  | 127 +++++++++++++++++++++++++
> >  2 files changed, 199 insertions(+)
> >  create mode 100644 platform/generic/include/thead_c9xx.h
> >
> > diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> > index 5b2656c..a624b8b 100644
> > --- a/platform/generic/allwinner/sun20i-d1.c
> > +++ b/platform/generic/allwinner/sun20i-d1.c
> > @@ -5,11 +5,13 @@
> >   */
> >
> >  #include <platform_override.h>
> > +#include <thead_c9xx.h>
> >  #include <sbi/riscv_io.h>
> >  #include <sbi/sbi_bitops.h>
> >  #include <sbi/sbi_ecall_interface.h>
> >  #include <sbi/sbi_error.h>
> >  #include <sbi/sbi_hsm.h>
> > +#include <sbi/sbi_pmu.h>
> >  #include <sbi_utils/fdt/fdt_helper.h>
> >  #include <sbi_utils/irqchip/fdt_irqchip_plic.h>
> >
> > @@ -199,6 +201,75 @@ static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
> >         return 0;
> >  }
> >
> > +static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
> > +{
> > +       unsigned long val;
> > +       unsigned long mip_val;
> > +
> > +       if (ctr_idx >= SBI_PMU_HW_CTR_MAX)
> > +               return;
> > +
> > +       mip_val = csr_read(CSR_MIP);
> > +       /**
> > +        * Clear out the OF bit so that next interrupt can be enabled.
> > +        * This should be done only when the corresponding overflow interrupt
> > +        * bit is cleared. That indicates that software has already handled the
> > +        * previous interrupts or the hardware yet to set an overflow interrupt.
> > +        * Otherwise, there will be race conditions where we may clear the bit
> > +        * the software is yet to handle the interrupt.
> > +        */
> > +       if (!(mip_val & THEAD_C9XX_MIP_MOIP)) {
> > +               val = csr_read(THEAD_C9XX_CSR_MCOUNTEROF);
> > +               val &= ~(1 << ctr_idx);
> > +               csr_write(THEAD_C9XX_CSR_MCOUNTEROF, val);
> > +       }
> > +
> > +       /**
> > +        * SSCOFPMF uses the OF bit for enabling/disabling the interrupt,
> > +        * while the C9XX has designated enable bits.
> > +        * So enable per-counter interrupt on C9xx here.
> > +        */
> > +       val = csr_read(THEAD_C9XX_CSR_MCOUNTERINTEN);
> > +       val |= (1 << ctr_idx);
> > +       csr_write(THEAD_C9XX_CSR_MCOUNTERINTEN, val);
> Use csr_set

great idea. I've added this to my v5-branch but will wait a bit for more
review comments to hopefully drop in :-)

> > +}
> > +
> > +static void thead_c9xx_pmu_ctr_disable_irq(uint32_t ctr_idx)
> > +{
> > +       unsigned long val;
> > +
> > +       val = csr_read(THEAD_C9XX_CSR_MCOUNTERINTEN);
> > +       val &= ~(1 << ctr_idx);
> > +       csr_write(THEAD_C9XX_CSR_MCOUNTERINTEN, val);
> csr_clear
> 
> > +}
> > +
> > +static int thead_c9xx_pmu_irq_bit(void)
> > +{
> > +       return THEAD_C9XX_MIP_MOIP;
> > +}
> > +
> > +static void thead_c9xx_pmu_counter_data(unsigned int *count,
> > +                                       unsigned int *bits)
> > +{
> > +       /* auto-detection doesn't work on t-head c9xx cores */
> > +       *count = 29;
> > +       *bits = 64;
> > +}
> > +
> > +const struct sbi_pmu_device thead_c9xx_pmu_device = {
> > +       .hw_counter_enable_irq = thead_c9xx_pmu_ctr_enable_irq,
> > +       .hw_counter_disable_irq = thead_c9xx_pmu_ctr_disable_irq,
> > +       .hw_counter_irq_bit = thead_c9xx_pmu_irq_bit,
> > +       .hw_counter_data = thead_c9xx_pmu_counter_data,
> > +};
> > +
> > +static int sun20i_d1_extensions_init(const struct fdt_match *match)
> > +{
> > +       sbi_pmu_set_device(&thead_c9xx_pmu_device);
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct fdt_match sun20i_d1_match[] = {
> >         { .compatible = "allwinner,sun20i-d1" },
> >         { },
> > @@ -207,4 +278,5 @@ static const struct fdt_match sun20i_d1_match[] = {
> >  const struct platform_override sun20i_d1 = {
> >         .match_table    = sun20i_d1_match,
> >         .final_init     = sun20i_d1_final_init,
> > +       .extensions_init = sun20i_d1_extensions_init,
> >  };
> > diff --git a/platform/generic/include/thead_c9xx.h b/platform/generic/include/thead_c9xx.h
> > new file mode 100644
> > index 0000000..bab0408
> > --- /dev/null
> > +++ b/platform/generic/include/thead_c9xx.h
> > @@ -0,0 +1,127 @@
> > +#ifndef __RISCV_THEAD_C9XX_H____
> > +#define __RISCV_THEAD_C9XX_H____
> > +
> > +/* T-HEAD C9xx M mode CSR.  */
> > +#define THEAD_C9XX_CSR_MXSTATUS                0x7c0
> > +#define THEAD_C9XX_CSR_MHCR            0x7c1
> > +#define THEAD_C9XX_CSR_MCOR            0x7c2
> > +#define THEAD_C9XX_CSR_MCCR2           0x7c3
> > +#define THEAD_C9XX_CSR_MCER2           0x7c4
> > +#define THEAD_C9XX_CSR_MHINT           0x7c5
> > +#define THEAD_C9XX_CSR_MRMR            0x7c6
> > +#define THEAD_C9XX_CSR_MRVBR           0x7c7
> > +#define THEAD_C9XX_CSR_MCER            0x7c8
> > +#define THEAD_C9XX_CSR_MCOUNTERWEN     0x7c9
> > +#define THEAD_C9XX_CSR_MCOUNTERINTEN   0x7ca
> > +#define THEAD_C9XX_CSR_MCOUNTEROF      0x7cb
> > +#define THEAD_C9XX_CSR_MHINT2          0x7cc
> > +#define THEAD_C9XX_CSR_MHINT3          0x7cd
> > +#define THEAD_C9XX_CSR_MRADDR          0x7e0
> > +#define THEAD_C9XX_CSR_MEXSTATUS       0x7e1
> > +#define THEAD_C9XX_CSR_MNMICAUSE       0x7e2
> > +#define THEAD_C9XX_CSR_MNMIPC          0x7e3
> > +#define THEAD_C9XX_CSR_MHPMCR          0x7f0
> > +#define THEAD_C9XX_CSR_MHPMSR          0x7f1
> > +#define THEAD_C9XX_CSR_MHPMER          0x7f2
> > +#define THEAD_C9XX_CSR_MSMPR           0x7f3
> > +#define THEAD_C9XX_CSR_MTEECFG         0x7f4
> > +#define THEAD_C9XX_CSR_MZONEID         0x7f5
> > +#define THEAD_C9XX_CSR_ML2CPID         0x7f6
> > +#define THEAD_C9XX_CSR_ML2WP           0x7f7
> > +#define THEAD_C9XX_CSR_MDTCMCR         0x7f8
> > +#define THEAD_C9XX_CSR_USP             0x7d1
> > +#define THEAD_C9XX_CSR_MCINS           0x7d2
> > +#define THEAD_C9XX_CSR_MCINDEX         0x7d3
> > +#define THEAD_C9XX_CSR_MCDATA0         0x7d4
> > +#define THEAD_C9XX_CSR_MCDATA1         0x7d5
> > +#define THEAD_C9XX_CSR_MEICR           0x7d6
> > +#define THEAD_C9XX_CSR_MEICR2          0x7d7
> > +#define THEAD_C9XX_CSR_MBEADDR         0x7d8
> > +#define THEAD_C9XX_CSR_MCPUID          0xfc0
> > +#define THEAD_C9XX_CSR_MAPBADDR                0xfc1
> > +#define THEAD_C9XX_CSR_MWMSR           0xfc2
> > +#define THEAD_C9XX_CSR_MHALTCAUSE      0xfe0
> > +#define THEAD_C9XX_CSR_MDBGINFO                0xfe1
> > +#define THEAD_C9XX_CSR_MPCFIFO         0xfe2
> > +
> > +/* T-HEAD C9xx S mode CSR.  */
> > +#define THEAD_C9XX_CSR_SXSTATUS                0x5c0
> > +#define THEAD_C9XX_CSR_SHCR            0x5c1
> > +#define THEAD_C9XX_CSR_SCER2           0x5c2
> > +#define THEAD_C9XX_CSR_SCER            0x5c3
> > +#define THEAD_C9XX_CSR_SCOUNTERINTEN   0x5c4
> > +#define THEAD_C9XX_CSR_SCOUNTEROF      0x5c5
> > +#define THEAD_C9XX_CSR_SHINT           0x5c6
> > +#define THEAD_C9XX_CSR_SHINT2          0x5c7
> > +#define THEAD_C9XX_CSR_SHPMINHIBIT     0x5c8
> > +#define THEAD_C9XX_CSR_SHPMCR          0x5c9
> > +#define THEAD_C9XX_CSR_SHPMSR          0x5ca
> > +#define THEAD_C9XX_CSR_SHPMER          0x5cb
> > +#define THEAD_C9XX_CSR_SL2CPID         0x5cc
> > +#define THEAD_C9XX_CSR_SL2WP           0x5cd
> > +#define THEAD_C9XX_CSR_SBEADDR         0x5d0
> > +#define THEAD_C9XX_CSR_SCYCLE          0x5e0
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER1    0x5e1
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER2    0x5e2
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER3    0x5e3
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER4    0x5e4
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER5    0x5e5
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER6    0x5e6
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER7    0x5e7
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER8    0x5e8
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER9    0x5e9
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER10   0x5ea
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER11   0x5eb
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER12   0x5ec
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER13   0x5ed
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER14   0x5ee
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER15   0x5ef
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER16   0x5f0
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER17   0x5f1
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER18   0x5f2
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER19   0x5f3
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER20   0x5f4
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER21   0x5f5
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER22   0x5f6
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER23   0x5f7
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER24   0x5f8
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER25   0x5f9
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER26   0x5fa
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER27   0x5fb
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER28   0x5fc
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER29   0x5fd
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER30   0x5fe
> > +#define THEAD_C9XX_CSR_SHPMCOUNTER31   0x5ff
> Have we used the above CSR_SH* CSR in the patchset series?
>
> > +
> > +/* T-HEAD C9xx U mode CSR.  */
> > +#define THEAD_C9XX_CSR_FXCR            0x800
> It's about the float point register, maybe it should not contain in
> the PMU patch.

My intention was to directly introduce one semi-complete header
with the t-head extensions, so that people in the future don't need
to look this up in some vendor tree when adding support for
other stuff.

I guess I'll leave that to SBI people to decide if that is ok or
if they want a minimal header instead.


Heiko




