From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 8 Feb 2022 01:07:54 -0800
Subject: [PATCH 06/13] include: sbi: Introduce nascent_init() platform
 callback
In-Reply-To: <20220104101323.127564-4-apatel@ventanamicro.com>
References: <20220104101323.127564-1-apatel@ventanamicro.com>
 <20220104101323.127564-4-apatel@ventanamicro.com>
Message-ID: <CAOnJCULwk25OExM2WuzJS-hYmUHK4WDLnWSVNazCkWQSMxzDfg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 4, 2022 at 2:13 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We introduce nascent_init() platform callback which will allow
> platforms to do very early initialization of platform specific
> per-HART CSRs and per-HART devices.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_platform.h | 17 +++++++++++++++++
>  lib/sbi/sbi_init.c         |  8 ++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 4d192f2..e097785 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -64,6 +64,9 @@ enum sbi_platform_features {
>
>  /** Platform functions */
>  struct sbi_platform_operations {
> +       /* Platform nascent initialization */
> +       int (*nascent_init)(void);
> +
>         /** Platform early initialization */
>         int (*early_init)(bool cold_boot);
>         /** Platform final initialization */
> @@ -299,6 +302,20 @@ static inline bool sbi_platform_hart_invalid(const struct sbi_platform *plat,
>         return FALSE;
>  }
>
> +/**
> + * Nascent (very early) initialization for current HART
> + *

We probably need a better comment to differentiate between Nascent & early init.
Without that, platform vendors may just use this instead of early init.

> + * @param plat pointer to struct sbi_platform
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +static inline int sbi_platform_nascent_init(const struct sbi_platform *plat)
> +{
> +       if (plat && sbi_platform_ops(plat)->nascent_init)
> +               return sbi_platform_ops(plat)->nascent_init();
> +       return 0;
> +}
> +
>  /**
>   * Early initialization for current HART
>   *
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 83043c5..27d03a7 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -494,6 +494,14 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
>         if (next_mode_supported && atomic_xchg(&coldboot_lottery, 1) == 0)
>                 coldboot = TRUE;
>
> +       /*
> +        * Do platform specific nascent (very early) initialization so
> +        * that platform can initialize platform specific per-HART CSRs
> +        * or per-HART devices.
> +        */
> +       if (sbi_platform_nascent_init(plat))
> +               sbi_hart_hang();
> +
>         if (coldboot)
>                 init_coldboot(scratch, hartid);
>         else
> --
> 2.25.1
>

Other than that, LGTM.

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

