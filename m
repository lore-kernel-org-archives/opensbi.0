From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 24 Jul 2024 11:10:29 +0530
Subject: [PATCH 2/6] lib: sbi: Remove sbi_console_init() and
 console_init() platform callback
In-Reply-To: <20240705071504.50988-3-apatel@ventanamicro.com>
References: <20240705071504.50988-1-apatel@ventanamicro.com> <20240705071504.50988-3-apatel@ventanamicro.com>
Message-ID: <CAPd4Wey=k75cNQZpG+XV4VhZNrpA8zrhyAVhUgpyMpAes8vQ9Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 5, 2024 at 12:45?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Now that all platforms have been updated to initialize serial console
> device in early_init(), the sbi_console_init() and console_init()
> platform callback are redundant hence remove them.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_console.h  |  2 --
>  include/sbi/sbi_platform.h | 17 -----------------
>  lib/sbi/sbi_console.c      | 11 -----------
>  lib/sbi/sbi_init.c         |  4 ----
>  4 files changed, 34 deletions(-)
>
> diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> index 0979765..3097db1 100644
> --- a/include/sbi/sbi_console.h
> +++ b/include/sbi/sbi_console.h
> @@ -58,8 +58,6 @@ void sbi_console_set_device(const struct sbi_console_device *dev);
>
>  struct sbi_scratch;
>
> -int sbi_console_init(struct sbi_scratch *scratch);
> -
>  #define SBI_ASSERT(cond, args) do { \
>         if (unlikely(!(cond))) \
>                 sbi_panic args; \
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 581935a..7b3ac4b 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -111,9 +111,6 @@ struct sbi_platform_operations {
>         /** Get platform specific mhpmevent value */
>         uint64_t (*pmu_xlate_to_mhpmevent)(uint32_t event_idx, uint64_t data);
>
> -       /** Initialize the platform console */
> -       int (*console_init)(void);
> -
>         /** Initialize the platform interrupt controller for current HART */
>         int (*irqchip_init)(bool cold_boot);
>         /** Exit the platform interrupt controller for current HART */
> @@ -549,20 +546,6 @@ static inline uint64_t sbi_platform_pmu_xlate_to_mhpmevent(const struct sbi_plat
>         return 0;
>  }
>
> -/**
> - * Initialize the platform console
> - *
> - * @param plat pointer to struct sbi_platform
> - *
> - * @return 0 on success and negative error code on failure
> - */
> -static inline int sbi_platform_console_init(const struct sbi_platform *plat)
> -{
> -       if (plat && sbi_platform_ops(plat)->console_init)
> -               return sbi_platform_ops(plat)->console_init();
> -       return 0;
> -}
> -
>  /**
>   * Initialize the platform interrupt controller for current HART
>   *
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index d3ec461..194529d 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -477,14 +477,3 @@ void sbi_console_set_device(const struct sbi_console_device *dev)
>
>         console_dev = dev;
>  }
> -
> -int sbi_console_init(struct sbi_scratch *scratch)
> -{
> -       int rc = sbi_platform_console_init(sbi_platform_ptr(scratch));
> -
> -       /* console is not a necessary device */
> -       if (rc == SBI_ENODEV)
> -               return 0;
> -
> -       return rc;
> -}
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 0f9e14c..d80efe9 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -261,10 +261,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>         if (rc)
>                 sbi_hart_hang();
>
> -       rc = sbi_console_init(scratch);
> -       if (rc)
> -               sbi_hart_hang();
> -
>         rc = sbi_sse_init(scratch, true);
>         if (rc) {
>                 sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
> --
> 2.34.1
>

LGTM

Reviewed-By: Himanshu Chauhan <hchauhan@ventanamicro.com>

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

