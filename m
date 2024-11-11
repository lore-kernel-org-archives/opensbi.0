From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Nov 2024 18:28:38 +0530
Subject: [PATCH v2 3/3] platform: Drop IPI warm init and exit hooks
In-Reply-To: <20241025185950.1371610-4-samuel.holland@sifive.com>
References: <20241025185950.1371610-1-samuel.holland@sifive.com> <20241025185950.1371610-4-samuel.holland@sifive.com>
Message-ID: <CAAhSdy0bfk-EP9aossu6RULYJ76TSjxGZQPTwLompUX6trTfcQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 26, 2024 at 12:45?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Now that the SBI IPI core clears IPIs at warm boot in a generic way,
> none of the drivers or platforms use these hooks, and we can remove
> them. Platforms need only to initialize the driver once during cold
> init. If other hooks are needed in the future, they can be added to
> struct sbi_ipi_device.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
> (no changes since v1)
>
>  include/sbi/sbi_platform.h         | 25 +++++-------------------
>  include/sbi_utils/ipi/fdt_ipi.h    |  9 ++-------
>  lib/sbi/sbi_ipi.c                  | 13 +++++--------
>  lib/utils/ipi/fdt_ipi.c            | 31 +-----------------------------
>  lib/utils/ipi/fdt_ipi_mswi.c       |  2 --
>  lib/utils/ipi/fdt_ipi_plicsw.c     |  2 --
>  platform/fpga/ariane/platform.c    | 14 +++-----------
>  platform/fpga/openpiton/platform.c | 14 +++-----------
>  platform/generic/platform.c        |  1 -
>  platform/kendryte/k210/platform.c  | 12 ++----------
>  platform/nuclei/ux600/platform.c   | 12 ++----------
>  platform/template/platform.c       | 14 +++-----------
>  12 files changed, 26 insertions(+), 123 deletions(-)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 7b3ac4bf..d16a5e20 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -116,10 +116,8 @@ struct sbi_platform_operations {
>         /** Exit the platform interrupt controller for current HART */
>         void (*irqchip_exit)(void);
>
> -       /** Initialize IPI for current HART */
> -       int (*ipi_init)(bool cold_boot);
> -       /** Exit IPI for current HART */
> -       void (*ipi_exit)(void);
> +       /** Initialize IPI during cold boot */
> +       int (*ipi_init)(void);
>
>         /** Get tlb flush limit value **/
>         u64 (*get_tlbr_flush_limit)(void);
> @@ -574,32 +572,19 @@ static inline void sbi_platform_irqchip_exit(const struct sbi_platform *plat)
>  }
>
>  /**
> - * Initialize the platform IPI support for current HART
> + * Initialize the platform IPI support during cold boot
>   *
>   * @param plat pointer to struct sbi_platform
> - * @param cold_boot whether cold boot (true) or warm_boot (false)
>   *
>   * @return 0 on success and negative error code on failure
>   */
> -static inline int sbi_platform_ipi_init(const struct sbi_platform *plat,
> -                                       bool cold_boot)
> +static inline int sbi_platform_ipi_init(const struct sbi_platform *plat)
>  {
>         if (plat && sbi_platform_ops(plat)->ipi_init)
> -               return sbi_platform_ops(plat)->ipi_init(cold_boot);
> +               return sbi_platform_ops(plat)->ipi_init();
>         return 0;
>  }
>
> -/**
> - * Exit the platform IPI support for current HART
> - *
> - * @param plat pointer to struct sbi_platform
> - */
> -static inline void sbi_platform_ipi_exit(const struct sbi_platform *plat)
> -{
> -       if (plat && sbi_platform_ops(plat)->ipi_exit)
> -               sbi_platform_ops(plat)->ipi_exit();
> -}
> -
>  /**
>   * Initialize the platform timer for current HART
>   *
> diff --git a/include/sbi_utils/ipi/fdt_ipi.h b/include/sbi_utils/ipi/fdt_ipi.h
> index c6245201..161f7a2e 100644
> --- a/include/sbi_utils/ipi/fdt_ipi.h
> +++ b/include/sbi_utils/ipi/fdt_ipi.h
> @@ -17,18 +17,13 @@
>  struct fdt_ipi {
>         const struct fdt_match *match_table;
>         int (*cold_init)(const void *fdt, int nodeoff, const struct fdt_match *match);
> -       int (*warm_init)(void);
> -       void (*exit)(void);
>  };
>
> -void fdt_ipi_exit(void);
> -
> -int fdt_ipi_init(bool cold_boot);
> +int fdt_ipi_init(void);
>
>  #else
>
> -static inline void fdt_ipi_exit(void) { }
> -static inline int fdt_ipi_init(bool cold_boot) { return 0; }
> +static inline int fdt_ipi_init(void) { return 0; }
>
>  #endif
>
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index b39f03e0..52898d30 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -321,6 +321,11 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
>                 if (ret < 0)
>                         return ret;
>                 ipi_halt_event = ret;
> +
> +               /* Initialize platform IPI support */
> +               ret = sbi_platform_ipi_init(sbi_platform_ptr(scratch));
> +               if (ret)
> +                       return ret;
>         } else {
>                 if (!ipi_data_off)
>                         return SBI_ENOMEM;
> @@ -332,11 +337,6 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
>         ipi_data = sbi_scratch_offset_ptr(scratch, ipi_data_off);
>         ipi_data->ipi_type = 0x00;
>
> -       /* Initialize platform IPI support */
> -       ret = sbi_platform_ipi_init(sbi_platform_ptr(scratch), cold_boot);
> -       if (ret)
> -               return ret;
> -
>         /* Clear any pending IPIs for the current hart */
>         sbi_ipi_raw_clear();
>
> @@ -353,7 +353,4 @@ void sbi_ipi_exit(struct sbi_scratch *scratch)
>
>         /* Process pending IPIs */
>         sbi_ipi_process();
> -
> -       /* Platform exit */
> -       sbi_platform_ipi_exit(sbi_platform_ptr(scratch));
>  }
> diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
> index 959cf57d..c2ff9cfa 100644
> --- a/lib/utils/ipi/fdt_ipi.c
> +++ b/lib/utils/ipi/fdt_ipi.c
> @@ -16,22 +16,7 @@
>  extern struct fdt_ipi *fdt_ipi_drivers[];
>  extern unsigned long fdt_ipi_drivers_size;
>
> -static struct fdt_ipi *current_driver = NULL;
> -
> -void fdt_ipi_exit(void)
> -{
> -       if (current_driver && current_driver->exit)
> -               current_driver->exit();
> -}
> -
> -static int fdt_ipi_warm_init(void)
> -{
> -       if (current_driver && current_driver->warm_init)
> -               return current_driver->warm_init();
> -       return 0;
> -}
> -
> -static int fdt_ipi_cold_init(void)
> +int fdt_ipi_init(void)
>  {
>         int pos, noff, rc;
>         struct fdt_ipi *drv;
> @@ -56,7 +41,6 @@ static int fdt_ipi_cold_init(void)
>                                 continue;
>                         if (rc)
>                                 return rc;
> -                       current_driver = drv;
>
>                         /*
>                          * We will have multiple IPI devices on multi-die or
> @@ -71,16 +55,3 @@ static int fdt_ipi_cold_init(void)
>          */
>         return 0;
>  }
> -
> -int fdt_ipi_init(bool cold_boot)
> -{
> -       int rc;
> -
> -       if (cold_boot) {
> -               rc = fdt_ipi_cold_init();
> -               if (rc)
> -                       return rc;
> -       }
> -
> -       return fdt_ipi_warm_init();
> -}
> diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
> index 01331970..c58d7722 100644
> --- a/lib/utils/ipi/fdt_ipi_mswi.c
> +++ b/lib/utils/ipi/fdt_ipi_mswi.c
> @@ -64,6 +64,4 @@ static const struct fdt_match ipi_mswi_match[] = {
>  struct fdt_ipi fdt_ipi_mswi = {
>         .match_table = ipi_mswi_match,
>         .cold_init = ipi_mswi_cold_init,
> -       .warm_init = NULL,
> -       .exit = NULL,
>  };
> diff --git a/lib/utils/ipi/fdt_ipi_plicsw.c b/lib/utils/ipi/fdt_ipi_plicsw.c
> index 1fd6ba1d..a178db1b 100644
> --- a/lib/utils/ipi/fdt_ipi_plicsw.c
> +++ b/lib/utils/ipi/fdt_ipi_plicsw.c
> @@ -42,6 +42,4 @@ static const struct fdt_match ipi_plicsw_match[] = {
>  struct fdt_ipi fdt_ipi_plicsw = {
>         .match_table = ipi_plicsw_match,
>         .cold_init   = fdt_plicsw_cold_ipi_init,
> -       .warm_init   = NULL,
> -       .exit        = NULL,
>  };
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index 6d901271..5bacebdb 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -131,19 +131,11 @@ static int ariane_irqchip_init(bool cold_boot)
>  }
>
>  /*
> - * Initialize IPI for current HART.
> + * Initialize IPI during cold boot.
>   */
> -static int ariane_ipi_init(bool cold_boot)
> +static int ariane_ipi_init(void)
>  {
> -       int ret;
> -
> -       if (cold_boot) {
> -               ret = aclint_mswi_cold_init(&mswi);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> +       return aclint_mswi_cold_init(&mswi);
>  }
>
>  /*
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index eb6087f9..89ea80bb 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -162,19 +162,11 @@ static int openpiton_irqchip_init(bool cold_boot)
>  }
>
>  /*
> - * Initialize IPI for current HART.
> + * Initialize IPI during cold boot.
>   */
> -static int openpiton_ipi_init(bool cold_boot)
> +static int openpiton_ipi_init(void)
>  {
> -       int ret;
> -
> -       if (cold_boot) {
> -               ret = aclint_mswi_cold_init(&mswi);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> +       return aclint_mswi_cold_init(&mswi);
>  }
>
>  /*
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 49d877d0..487f2c2b 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -399,7 +399,6 @@ const struct sbi_platform_operations platform_ops = {
>         .irqchip_init           = fdt_irqchip_init,
>         .irqchip_exit           = fdt_irqchip_exit,
>         .ipi_init               = fdt_ipi_init,
> -       .ipi_exit               = fdt_ipi_exit,
>         .pmu_init               = generic_pmu_init,
>         .pmu_xlate_to_mhpmevent = generic_pmu_xlate_to_mhpmevent,
>         .get_tlbr_flush_limit   = generic_tlbr_flush_limit,
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index c67d3f83..795f61b5 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -146,17 +146,9 @@ static int k210_irqchip_init(bool cold_boot)
>         return plic_warm_irqchip_init(&plic, hartid * 2, hartid * 2 + 1);
>  }
>
> -static int k210_ipi_init(bool cold_boot)
> +static int k210_ipi_init(void)
>  {
> -       int rc;
> -
> -       if (cold_boot) {
> -               rc = aclint_mswi_cold_init(&mswi);
> -               if (rc)
> -                       return rc;
> -       }
> -
> -       return 0;
> +       return aclint_mswi_cold_init(&mswi);
>  }
>
>  static int k210_timer_init(bool cold_boot)
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index 07a1a1a4..ae1e0a18 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -202,17 +202,9 @@ static int ux600_irqchip_init(bool cold_boot)
>                                       (hartid) ? (2 * hartid) : -1);
>  }
>
> -static int ux600_ipi_init(bool cold_boot)
> +static int ux600_ipi_init(void)
>  {
> -       int rc;
> -
> -       if (cold_boot) {
> -               rc = aclint_mswi_cold_init(&mswi);
> -               if (rc)
> -                       return rc;
> -       }
> -
> -       return 0;
> +       return aclint_mswi_cold_init(&mswi);
>  }
>
>  static int ux600_timer_init(bool cold_boot)
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index 39a2ac87..bc1ba52f 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -99,20 +99,12 @@ static int platform_irqchip_init(bool cold_boot)
>  }
>
>  /*
> - * Initialize IPI for current HART.
> + * Initialize IPI during cold boot.
>   */
> -static int platform_ipi_init(bool cold_boot)
> +static int platform_ipi_init(void)
>  {
> -       int ret;
> -
>         /* Example if the generic ACLINT driver is used */
> -       if (cold_boot) {
> -               ret = aclint_mswi_cold_init(&mswi);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> +       return aclint_mswi_cold_init(&mswi);
>  }
>
>  /*
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

