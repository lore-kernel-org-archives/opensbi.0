From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Oct 2021 10:30:47 +0530
Subject: [PATCH 1/2] lib: sbi: convert reset to list
In-Reply-To: <CAAhSdy0hFNNQcgttLr2ar1BEYGptkO4602wgPoR8-kez9jZsxQ@mail.gmail.com>
References: <20211001083117.2008-1-nikita.shubin@maquefel.me>
 <20211001083117.2008-2-nikita.shubin@maquefel.me>
 <CAAhSdy0hFNNQcgttLr2ar1BEYGptkO4602wgPoR8-kez9jZsxQ@mail.gmail.com>
Message-ID: <CAAhSdy1hCf2=hRXQCJDk_sCnRHBROB+qvRQ4v5RVBW=t4fozuw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 7, 2021 at 5:38 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Oct 1, 2021 at 2:01 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> >
> > From: Nikita Shubin <n.shubin@yadro.com>
> >
> > To support different handlers for different types of resets, we are
> > adding a sbi_list of restart handlers.
> >
> > Instead of sbi_system_reset_set_device we use
> > sbi_system_reset_add_device to reflect the actual meaning.
> >
> > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > ---
> > rfc -> v0:
> > - restored dom->system_reset_allowed check
> > - removed reset devices iterations from sbi_system_reset, we rely on
> >   sbi_system_reset_get_device
> > - to_system_reset_device +static
> > ---
> >  include/sbi/sbi_system.h              | 13 +++++++--
> >  lib/sbi/sbi_init.c                    |  7 +++--
> >  lib/sbi/sbi_system.c                  | 38 +++++++++++++++++----------
> >  lib/utils/reset/fdt_reset_gpio.c      |  2 +-
> >  lib/utils/reset/fdt_reset_sunxi_wdt.c |  2 +-
> >  lib/utils/reset/fdt_reset_thead.c     |  2 +-
> >  lib/utils/sys/htif.c                  |  2 +-
> >  lib/utils/sys/sifive_test.c           |  2 +-
> >  platform/kendryte/k210/platform.c     |  2 +-
> >  platform/nuclei/ux600/platform.c      |  2 +-
> >  10 files changed, 47 insertions(+), 25 deletions(-)
> >
> > diff --git a/include/sbi/sbi_system.h b/include/sbi/sbi_system.h
> > index a9fa546..2cc2dbc 100644
> > --- a/include/sbi/sbi_system.h
> > +++ b/include/sbi/sbi_system.h
> > @@ -11,6 +11,7 @@
> >  #define __SBI_SYSTEM_H__
> >
> >  #include <sbi/sbi_types.h>
> > +#include <sbi/sbi_list.h>
> >
> >  /** System reset hardware device */
> >  struct sbi_system_reset_device {
> > @@ -22,11 +23,19 @@ struct sbi_system_reset_device {
> >
> >         /** Reset the system */
> >         void (*system_reset)(u32 reset_type, u32 reset_reason);
> > +
> > +       /** List */
> > +       struct sbi_dlist node;
> >  };
> >
> > -const struct sbi_system_reset_device *sbi_system_reset_get_device(void);
> > +static inline struct sbi_system_reset_device *to_system_reset_device(struct sbi_dlist *node)
> > +{
> > +       return container_of(node, struct sbi_system_reset_device, node);
> > +}
> > +
> > +const struct sbi_system_reset_device *sbi_system_reset_get_device(u32 reset_type, u32 reset_reason);
> >
> > -void sbi_system_reset_set_device(const struct sbi_system_reset_device *dev);
> > +void sbi_system_reset_add_device(struct sbi_system_reset_device *dev);
> >
> >  bool sbi_system_reset_supported(u32 reset_type, u32 reset_reason);
> >
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> > index f0eb365..843659e 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -84,8 +84,11 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
> >         hdev = sbi_hsm_get_device();
> >         sbi_printf("Platform HSM Device       : %s\n",
> >                    (hdev) ? hdev->name : "---");
> > -       srdev = sbi_system_reset_get_device();
> > -       sbi_printf("Platform SysReset Device  : %s\n",
> > +       srdev = sbi_system_reset_get_device(SBI_SRST_RESET_TYPE_COLD_REBOOT, 0);
> > +       sbi_printf("Platform Reboot Device    : %s\n",
> > +                  (srdev) ? srdev->name : "---");
> > +       srdev = sbi_system_reset_get_device(SBI_SRST_RESET_TYPE_SHUTDOWN, 0);
> > +       sbi_printf("Platform Shutdown Device  : %s\n",
> >                    (srdev) ? srdev->name : "---");
> >
> >         /* Firmware details */
> > diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
> > index 479060b..6e6bb80 100644
> > --- a/lib/sbi/sbi_system.c
> > +++ b/lib/sbi/sbi_system.c
> > @@ -18,28 +18,35 @@
> >  #include <sbi/sbi_ipi.h>
> >  #include <sbi/sbi_init.h>
> >
> > -static const struct sbi_system_reset_device *reset_dev = NULL;
> > +static SBI_LIST_HEAD(reset_devices_list);
> >
> > -const struct sbi_system_reset_device *sbi_system_reset_get_device(void)
> > +const struct sbi_system_reset_device *sbi_system_reset_get_device(u32 reset_type, u32 reset_reason)
> >  {
> > -       return reset_dev;
> > +       struct sbi_system_reset_device *dev = 0;
> > +       struct sbi_dlist *pos;
> > +
> > +       /* Check each reset device registered for supported reset type */
> > +       sbi_list_for_each(pos, &(reset_devices_list)) {
> > +               dev = to_system_reset_device(pos);
> > +               if (dev->system_reset_check &&
> > +                       dev->system_reset_check(reset_type, reset_reason))
> > +                       break;
> > +       }
> > +
> > +       return dev;
> >  }
> >
> > -void sbi_system_reset_set_device(const struct sbi_system_reset_device *dev)
> > +void sbi_system_reset_add_device(struct sbi_system_reset_device *dev)
> >  {
> > -       if (!dev || reset_dev)
> > +       if (!dev || !dev->system_reset_check)
> >                 return;
> >
> > -       reset_dev = dev;
> > +       sbi_list_add(&(dev->node), &(reset_devices_list));
> >  }
> >
> >  bool sbi_system_reset_supported(u32 reset_type, u32 reset_reason)
> >  {
> > -       if (reset_dev && reset_dev->system_reset_check &&
> > -           reset_dev->system_reset_check(reset_type, reset_reason))
> > -               return TRUE;
> > -
> > -       return FALSE;
> > +       return !!sbi_system_reset_get_device(reset_type, reset_reason);
> >  }
> >
> >  void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
> > @@ -62,9 +69,12 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
> >         sbi_hsm_hart_stop(scratch, FALSE);
> >
> >         /* Platform specific reset if domain allowed system reset */
> > -       if (dom->system_reset_allowed &&
> > -           reset_dev && reset_dev->system_reset)
> > -               reset_dev->system_reset(reset_type, reset_reason);
> > +       if (dom->system_reset_allowed) {
> > +               const struct sbi_system_reset_device *dev =
> > +                       sbi_system_reset_get_device(reset_type, reset_reason);
> > +               if (dev)
> > +                       dev->system_reset(reset_type, reset_reason);
> > +       }
> >
> >         /* If platform specific reset did not work then do sbi_exit() */
> >         sbi_exit(scratch);
> > diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
> > index 77e4d0e..4da1450 100644
> > --- a/lib/utils/reset/fdt_reset_gpio.c
> > +++ b/lib/utils/reset/fdt_reset_gpio.c
> > @@ -115,7 +115,7 @@ static int gpio_reset_init(void *fdt, int nodeoff,
> >         if (len > 0)
> >                 reset->inactive_delay = fdt32_to_cpu(*val);
> >
> > -       sbi_system_reset_set_device(&gpio_reset);
> > +       sbi_system_reset_add_device(&gpio_reset);
> >
> >         return 0;
> >  }
> > diff --git a/lib/utils/reset/fdt_reset_sunxi_wdt.c b/lib/utils/reset/fdt_reset_sunxi_wdt.c
> > index e4f16e3..6d1b5b7 100644
> > --- a/lib/utils/reset/fdt_reset_sunxi_wdt.c
> > +++ b/lib/utils/reset/fdt_reset_sunxi_wdt.c
> > @@ -61,7 +61,7 @@ static int sunxi_wdt_reset_init(void *fdt, int nodeoff,
> >
> >         sunxi_wdt_base = (volatile void *)(unsigned long)reg_addr;
> >
> > -       sbi_system_reset_set_device(&sunxi_wdt_reset);
> > +       sbi_system_reset_add_device(&sunxi_wdt_reset);
> >
> >         return 0;
> >  }
> > diff --git a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
> > index 9f2fe03..750b7aa 100644
> > --- a/lib/utils/reset/fdt_reset_thead.c
> > +++ b/lib/utils/reset/fdt_reset_thead.c
> > @@ -126,7 +126,7 @@ static int thead_reset_init(void *fdt, int nodeoff,
> >                 }
> >         }
> >
> > -       sbi_system_reset_set_device(&thead_reset);
> > +       sbi_system_reset_add_device(&thead_reset);
> >
> >         return 0;
> >  }
> > diff --git a/lib/utils/sys/htif.c b/lib/utils/sys/htif.c
> > index 330a9a6..7c69c7f 100644
> > --- a/lib/utils/sys/htif.c
> > +++ b/lib/utils/sys/htif.c
> > @@ -176,7 +176,7 @@ static struct sbi_system_reset_device htif_reset = {
> >
> >  int htif_system_reset_init(void)
> >  {
> > -       sbi_system_reset_set_device(&htif_reset);
> > +       sbi_system_reset_add_device(&htif_reset);
> >
> >         return 0;
> >  }
> > diff --git a/lib/utils/sys/sifive_test.c b/lib/utils/sys/sifive_test.c
> > index 4533954..a9ebb5c 100644
> > --- a/lib/utils/sys/sifive_test.c
> > +++ b/lib/utils/sys/sifive_test.c
> > @@ -59,7 +59,7 @@ static struct sbi_system_reset_device sifive_test_reset = {
> >  int sifive_test_init(unsigned long base)
> >  {
> >         sifive_test_base = (void *)base;
> > -       sbi_system_reset_set_device(&sifive_test_reset);
> > +       sbi_system_reset_add_device(&sifive_test_reset);
> >
> >         return 0;
> >  }
> > diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> > index 35cec5f..e7caec3 100644
> > --- a/platform/kendryte/k210/platform.c
> > +++ b/platform/kendryte/k210/platform.c
> > @@ -108,7 +108,7 @@ static struct sbi_system_reset_device k210_reset = {
> >  static int k210_early_init(bool cold_boot)
> >  {
> >         if (cold_boot)
> > -               sbi_system_reset_set_device(&k210_reset);
> > +               sbi_system_reset_add_device(&k210_reset);
> >
> >         return 0;
> >  }
> > diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> > index 6bef4c4..6f87cf8 100644
> > --- a/platform/nuclei/ux600/platform.c
> > +++ b/platform/nuclei/ux600/platform.c
> > @@ -148,7 +148,7 @@ static int ux600_early_init(bool cold_boot)
> >         u32 regval;
> >
> >         if (cold_boot)
> > -               sbi_system_reset_set_device(&ux600_reset);
> > +               sbi_system_reset_add_device(&ux600_reset);
> >
> >         /* Measure CPU Frequency using Timer */
> >         ux600_clk_freq = ux600_get_clk_freq();
> > --
> > 2.31.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Some of the source lines were crossing over 80 characters, I have fixed
this while merging.

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

>
> Regards,
> Anup

