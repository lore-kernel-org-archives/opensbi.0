From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Nov 2024 11:27:52 +0530
Subject: [PATCH 2/2] platform: Drop timer warm init and exit hooks
In-Reply-To: <20240903040814.622145-3-samuel.holland@sifive.com>
References: <20240903040814.622145-1-samuel.holland@sifive.com> <20240903040814.622145-3-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1ogjPYzNqv60YhDiUBGvK3FbXquR88UxyNqQQrYU-4iQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 3, 2024 at 9:38?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Now that driver lifecycle is managed from within the SBI timer core,
> platforms need only to initialize the driver once during cold init.
> Remove the remaining platform hooks that are no longer used.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  include/sbi/sbi_platform.h          | 25 +++++------------------
>  include/sbi_utils/timer/fdt_timer.h |  9 ++-------
>  lib/sbi/sbi_timer.c                 | 10 ++++------
>  lib/utils/timer/fdt_timer.c         | 31 +----------------------------
>  lib/utils/timer/fdt_timer_mtimer.c  |  2 --
>  lib/utils/timer/fdt_timer_plmt.c    |  2 --
>  platform/fpga/ariane/platform.c     | 14 +++----------
>  platform/fpga/openpiton/platform.c  | 14 +++----------
>  platform/generic/platform.c         |  1 -
>  platform/kendryte/k210/platform.c   | 12 ++---------
>  platform/nuclei/ux600/platform.c    | 12 ++---------
>  platform/template/platform.c        | 14 +++----------
>  12 files changed, 25 insertions(+), 121 deletions(-)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 7b3ac4bf..d7af3093 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -127,10 +127,8 @@ struct sbi_platform_operations {
>         /** Get tlb fifo num entries*/
>         u32 (*get_tlb_num_entries)(void);
>
> -       /** Initialize platform timer for current HART */
> -       int (*timer_init)(bool cold_boot);
> -       /** Exit platform timer for current HART */
> -       void (*timer_exit)(void);
> +       /** Initialize platform timer during cold boot */
> +       int (*timer_init)(void);
>
>         /** Check if SBI vendor extension is implemented or not */
>         bool (*vendor_ext_check)(void);
> @@ -601,32 +599,19 @@ static inline void sbi_platform_ipi_exit(const struct sbi_platform *plat)
>  }
>
>  /**
> - * Initialize the platform timer for current HART
> + * Initialize the platform timer during cold boot
>   *
>   * @param plat pointer to struct sbi_platform
> - * @param cold_boot whether cold boot (true) or warm_boot (false)
>   *
>   * @return 0 on success and negative error code on failure
>   */
> -static inline int sbi_platform_timer_init(const struct sbi_platform *plat,
> -                                         bool cold_boot)
> +static inline int sbi_platform_timer_init(const struct sbi_platform *plat)
>  {
>         if (plat && sbi_platform_ops(plat)->timer_init)
> -               return sbi_platform_ops(plat)->timer_init(cold_boot);
> +               return sbi_platform_ops(plat)->timer_init();
>         return 0;
>  }
>
> -/**
> - * Exit the platform timer for current HART
> - *
> - * @param plat pointer to struct sbi_platform
> - */
> -static inline void sbi_platform_timer_exit(const struct sbi_platform *plat)
> -{
> -       if (plat && sbi_platform_ops(plat)->timer_exit)
> -               sbi_platform_ops(plat)->timer_exit();
> -}
> -
>  /**
>   * Check if SBI vendor extension is implemented or not.
>   *
> diff --git a/include/sbi_utils/timer/fdt_timer.h b/include/sbi_utils/timer/fdt_timer.h
> index 555ebcba..8f0469da 100644
> --- a/include/sbi_utils/timer/fdt_timer.h
> +++ b/include/sbi_utils/timer/fdt_timer.h
> @@ -17,18 +17,13 @@
>  struct fdt_timer {
>         const struct fdt_match *match_table;
>         int (*cold_init)(const void *fdt, int nodeoff, const struct fdt_match *match);
> -       int (*warm_init)(void);
> -       void (*exit)(void);
>  };
>
> -void fdt_timer_exit(void);
> -
> -int fdt_timer_init(bool cold_boot);
> +int fdt_timer_init(void);
>
>  #else
>
> -static inline void fdt_timer_exit(void) { }
> -static inline int fdt_timer_init(bool cold_boot) { return 0; }
> +static inline int fdt_timer_init(void) { return 0; }
>
>  #endif
>
> diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> index 466e81e5..fca56a04 100644
> --- a/lib/sbi/sbi_timer.c
> +++ b/lib/sbi/sbi_timer.c
> @@ -191,6 +191,10 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
>
>                 if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR))
>                         get_time_val = get_ticks;
> +
> +               ret = sbi_platform_timer_init(plat);
> +               if (ret)
> +                       return ret;
>         } else {
>                 if (!time_delta_off)
>                         return SBI_ENOMEM;
> @@ -199,10 +203,6 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
>         time_delta = sbi_scratch_offset_ptr(scratch, time_delta_off);
>         *time_delta = 0;
>
> -       ret = sbi_platform_timer_init(plat, cold_boot);
> -       if (ret)
> -               return ret;
> -
>         if (timer_dev && timer_dev->warm_init) {
>                 ret = timer_dev->warm_init();
>                 if (ret)
> @@ -219,6 +219,4 @@ void sbi_timer_exit(struct sbi_scratch *scratch)
>
>         csr_clear(CSR_MIP, MIP_STIP);
>         csr_clear(CSR_MIE, MIP_MTIP);
> -
> -       sbi_platform_timer_exit(sbi_platform_ptr(scratch));
>  }
> diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
> index aa0494e4..37965f5e 100644
> --- a/lib/utils/timer/fdt_timer.c
> +++ b/lib/utils/timer/fdt_timer.c
> @@ -16,22 +16,7 @@
>  extern struct fdt_timer *fdt_timer_drivers[];
>  extern unsigned long fdt_timer_drivers_size;
>
> -static struct fdt_timer *current_driver = NULL;
> -
> -void fdt_timer_exit(void)
> -{
> -       if (current_driver && current_driver->exit)
> -               current_driver->exit();
> -}
> -
> -static int fdt_timer_warm_init(void)
> -{
> -       if (current_driver && current_driver->warm_init)
> -               return current_driver->warm_init();
> -       return 0;
> -}
> -
> -static int fdt_timer_cold_init(void)
> +int fdt_timer_init(void)
>  {
>         int pos, noff, rc;
>         struct fdt_timer *drv;
> @@ -56,7 +41,6 @@ static int fdt_timer_cold_init(void)
>                                 continue;
>                         if (rc)
>                                 return rc;
> -                       current_driver = drv;
>
>                         /*
>                          * We will have multiple timer devices on multi-die or
> @@ -71,16 +55,3 @@ static int fdt_timer_cold_init(void)
>          */
>         return 0;
>  }
> -
> -int fdt_timer_init(bool cold_boot)
> -{
> -       int rc;
> -
> -       if (cold_boot) {
> -               rc = fdt_timer_cold_init();
> -               if (rc)
> -                       return rc;
> -       }
> -
> -       return fdt_timer_warm_init();
> -}
> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> index eff50417..e752ddc5 100644
> --- a/lib/utils/timer/fdt_timer_mtimer.c
> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> @@ -165,6 +165,4 @@ static const struct fdt_match timer_mtimer_match[] = {
>  struct fdt_timer fdt_timer_mtimer = {
>         .match_table = timer_mtimer_match,
>         .cold_init = timer_mtimer_cold_init,
> -       .warm_init = NULL,
> -       .exit = NULL,
>  };
> diff --git a/lib/utils/timer/fdt_timer_plmt.c b/lib/utils/timer/fdt_timer_plmt.c
> index 87e634bd..459a1190 100644
> --- a/lib/utils/timer/fdt_timer_plmt.c
> +++ b/lib/utils/timer/fdt_timer_plmt.c
> @@ -46,6 +46,4 @@ static const struct fdt_match timer_plmt_match[] = {
>  struct fdt_timer fdt_timer_plmt = {
>         .match_table = timer_plmt_match,
>         .cold_init   = fdt_plmt_cold_timer_init,
> -       .warm_init   = NULL,
> -       .exit        = NULL,
>  };
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index c895cb47..dfe170f9 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -147,19 +147,11 @@ static int ariane_ipi_init(bool cold_boot)
>  }
>
>  /*
> - * Initialize ariane timer for current HART.
> + * Initialize ariane timer during cold boot.
>   */
> -static int ariane_timer_init(bool cold_boot)
> +static int ariane_timer_init(void)
>  {
> -       int ret;
> -
> -       if (cold_boot) {
> -               ret = aclint_mtimer_cold_init(&mtimer, NULL);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> +       return aclint_mtimer_cold_init(&mtimer, NULL);
>  }
>
>  /*
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index ea0a4799..2bfc15ce 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -178,19 +178,11 @@ static int openpiton_ipi_init(bool cold_boot)
>  }
>
>  /*
> - * Initialize openpiton timer for current HART.
> + * Initialize openpiton timer during cold boot.
>   */
> -static int openpiton_timer_init(bool cold_boot)
> +static int openpiton_timer_init(void)
>  {
> -       int ret;
> -
> -       if (cold_boot) {
> -               ret = aclint_mtimer_cold_init(&mtimer, NULL);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> +       return aclint_mtimer_cold_init(&mtimer, NULL);
>  }
>
>  /*
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 49d877d0..921c494c 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -405,7 +405,6 @@ const struct sbi_platform_operations platform_ops = {
>         .get_tlbr_flush_limit   = generic_tlbr_flush_limit,
>         .get_tlb_num_entries    = generic_tlb_num_entries,
>         .timer_init             = fdt_timer_init,
> -       .timer_exit             = fdt_timer_exit,
>         .vendor_ext_check       = generic_vendor_ext_check,
>         .vendor_ext_provider    = generic_vendor_ext_provider,
>  };
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index 82dd0809..06b7eb74 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -159,17 +159,9 @@ static int k210_ipi_init(bool cold_boot)
>         return aclint_mswi_warm_init();
>  }
>
> -static int k210_timer_init(bool cold_boot)
> +static int k210_timer_init(void)
>  {
> -       int rc;
> -
> -       if (cold_boot) {
> -               rc = aclint_mtimer_cold_init(&mtimer, NULL);
> -               if (rc)
> -                       return rc;
> -       }
> -
> -       return 0;
> +       return aclint_mtimer_cold_init(&mtimer, NULL);
>  }
>
>  const struct sbi_platform_operations platform_ops = {
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index b17c1df2..d4f309aa 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -215,17 +215,9 @@ static int ux600_ipi_init(bool cold_boot)
>         return aclint_mswi_warm_init();
>  }
>
> -static int ux600_timer_init(bool cold_boot)
> +static int ux600_timer_init(void)
>  {
> -       int rc;
> -
> -       if (cold_boot) {
> -               rc = aclint_mtimer_cold_init(&mtimer, NULL);
> -               if (rc)
> -                       return rc;
> -       }
> -
> -       return 0;
> +       return aclint_mtimer_cold_init(&mtimer, NULL);
>  }
>
>  const struct sbi_platform_operations platform_ops = {
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index 1238a8d6..1fc7b7bb 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -116,20 +116,12 @@ static int platform_ipi_init(bool cold_boot)
>  }
>
>  /*
> - * Initialize platform timer for current HART.
> + * Initialize platform timer during cold boot.
>   */
> -static int platform_timer_init(bool cold_boot)
> +static int platform_timer_init(void)
>  {
> -       int ret;
> -
>         /* Example if the generic ACLINT driver is used */
> -       if (cold_boot) {
> -               ret = aclint_mtimer_cold_init(&mtimer, NULL);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> +       return aclint_mtimer_cold_init(&mtimer, NULL);
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

