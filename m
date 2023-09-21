From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 21 Sep 2023 13:40:57 +0800
Subject: [PATCH 3/6] platform: andes: Add Andes custom PMU support
In-Reply-To: <CA+V-a8tT4aiD0HSHZAMok2o1PeFvo+RiMWsMW0ioMSUHYpEBKw@mail.gmail.com>
References: <20230906094051.3957564-1-peterlin@andestech.com>
 <20230906094051.3957564-4-peterlin@andestech.com>
 <CA+V-a8tT4aiD0HSHZAMok2o1PeFvo+RiMWsMW0ioMSUHYpEBKw@mail.gmail.com>
Message-ID: <ZQvXaQ842WGRNH1W@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Prabhakar,

On Mon, Sep 18, 2023 at 03:03:00PM +0100, Lad, Prabhakar wrote:
> Hi Lin-san,
> 
> Thank you for the patch.
> 
> On Wed, Sep 6, 2023 at 10:43?AM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Before the ratification of Sscofpmf, the Andes PMU extension was
> > designed to support the sampling and filtering of hardware performance
> > counters, compatible with the current SBI PMU extension and Linux perf
> > driver.
> >
> > This patch implements the PMU extension platform callback and PMU device
> > callbacks to update the corresponding custom CSRs.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > ---
> >  platform/generic/andes/Kconfig             |  4 +
> >  platform/generic/andes/andes_pmu.c         | 85 ++++++++++++++++++++++
> >  platform/generic/andes/objects.mk          |  1 +
> >  platform/generic/include/andes/andes_pmu.h | 12 +++
> >  4 files changed, 102 insertions(+)
> >  create mode 100644 platform/generic/andes/andes_pmu.c
> >  create mode 100644 platform/generic/include/andes/andes_pmu.h
> >
> > diff --git a/platform/generic/andes/Kconfig b/platform/generic/andes/Kconfig
> > index a91fb9c..056327b 100644
> > --- a/platform/generic/andes/Kconfig
> > +++ b/platform/generic/andes/Kconfig
> > @@ -7,3 +7,7 @@ config ANDES45_PMA
> >  config ANDES_SBI
> >         bool "Andes SBI support"
> >         default n
> > +
> > +config ANDES_PMU
> > +       bool "Andes PMU support"
> > +       default n
> > diff --git a/platform/generic/andes/andes_pmu.c b/platform/generic/andes/andes_pmu.c
> > new file mode 100644
> > index 0000000..d2574c7
> > --- /dev/null
> > +++ b/platform/generic/andes/andes_pmu.c
> > @@ -0,0 +1,85 @@
> > +// SPDX-License-Identifier: BSD-2-Clause
> > +/*
> > + * Copyright (C) 2022 Andes Technology Corporation
> 2023?

OK, will update.

> > + *
> > + */
> > +#include <andes/andes45.h>
> > +#include <andes/andes_pmu.h>
> > +#include <sbi/riscv_asm.h>
> > +#include <sbi/sbi_error.h>
> > +#include <sbi/sbi_pmu.h>
> > +#include <sbi/sbi_scratch.h>
> > +
> > +static void andes_hw_counter_enable_irq(uint32_t ctr_idx)
> > +{
> > +       unsigned long mip_val;
> > +
> > +       if (ctr_idx >= SBI_PMU_HW_CTR_MAX)
> > +               return;
> > +
> > +       mip_val = csr_read(CSR_MIP);
> > +       if (!(mip_val & MIP_PMOVI))
> > +               csr_clear(CSR_MCOUNTEROVF, BIT(ctr_idx));
> > +
> > +       csr_set(CSR_MCOUNTERINTEN, BIT(ctr_idx));
> > +}
> > +
> > +static void andes_hw_counter_disable_irq(uint32_t ctr_idx)
> > +{
> Any reason why we dont check for ctr_idx >= SBI_PMU_HW_CTR_MAX?

Its function caller [1] has done the check.

> > +       csr_clear(CSR_MCOUNTERINTEN, BIT(ctr_idx));
> > +}
> > +
> > +static void andes_hw_counter_filter_mode(unsigned long flags, int ctr_idx)
> > +{
> > +       if (!flags) {
> > +               csr_write(CSR_MCOUNTERMASK_S, 0);
> > +               csr_write(CSR_MCOUNTERMASK_U, 0);
> > +       }
> > +       if (flags & SBI_PMU_CFG_FLAG_SET_UINH) {
> > +               csr_clear(CSR_MCOUNTERMASK_S, BIT(ctr_idx));
> > +               csr_set(CSR_MCOUNTERMASK_U, BIT(ctr_idx));
> > +       }
> > +       if (flags & SBI_PMU_CFG_FLAG_SET_SINH) {
> > +               csr_set(CSR_MCOUNTERMASK_S, BIT(ctr_idx));
> > +               csr_clear(CSR_MCOUNTERMASK_U, BIT(ctr_idx));
> > +       }
> > +}
> > +
> > +static struct sbi_pmu_device andes_pmu = {
> > +       .name = "andes_pmu",
> > +       .hw_counter_enable_irq  = andes_hw_counter_enable_irq,
> > +       .hw_counter_disable_irq = andes_hw_counter_disable_irq,
> > +       /*
> > +        * In andes_pmu_extensions_init(), we set mslideleg[18] for each
> > +        * hart instead of mideleg, so leave hw_counter_irq_bit() hook
> > +        * unimplemented.
> > +        */
> > +       .hw_counter_irq_bit     = NULL,
> > +       .hw_counter_filter_mode = andes_hw_counter_filter_mode
> > +};
> > +
> > +int andes_pmu_extensions_init(const struct fdt_match *match,
> > +                             struct sbi_hart_features *hfeatures)
> > +{
> > +       if (andes_pmu()) {
> You can reverse the check here and return early?

Sure, will do.

> > +               /*
> > +                * It is not rational for a hardware to support
> > +                * both Andes PMU and standard Sscofpmf, as they
> > +                * serve the same purpose.
> > +                */
> > +               if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
> > +                                          SBI_HART_EXT_SSCOFPMF))
> > +                       ebreak();
> > +
> > +               /* Machine counter write enable */
> > +               csr_write(CSR_MCOUNTERWEN, 0xfffffffd);
> > +               /* disable HPM counter in M-mode */
> > +               csr_write(CSR_MCOUNTERMASK_M, 0xfffffffd);
> > +               /* delegate S-mode local interrupt to S-mode */
> > +               csr_write(CSR_MSLIDELEG, MIP_PMOVI);
> > +
> > +               sbi_pmu_set_device(&andes_pmu);
> In my opinion we might want to append the PMU node to DT here

Sure, I will add fdt fixup so RZ/Five users won't need to manually
append the PMU node.

> and pass that DT fragment to the higher stack instead of adding it in Linux.

The PMU node is not visible to S-mode SW (U-Boot proper or Linux) since
it is only used to initialize the event counter mappings and erased in
the generic_final_init() [2].

Thanks,
Peter Lin

[1] https://github.com/riscv-software-src/opensbi/blob/v1.3.1/lib/sbi/sbi_pmu.c#L583
[2] https://github.com/riscv-software-src/opensbi/blob/master/platform/generic/platform.c#L172

> Cheers,
> Prabhakar

