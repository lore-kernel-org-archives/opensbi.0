From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Jan 2023 16:01:49 +0530
Subject: [PATCH v7 1/4] lib: sbi: Allow platform to influence cold boot
 HART selection
In-Reply-To: <20221229025618.29555-2-weiliang.lim@starfivetech.com>
References: <20221229025618.29555-1-weiliang.lim@starfivetech.com> <20221229025618.29555-2-weiliang.lim@starfivetech.com>
Message-ID: <CAAhSdy3Gd1wxtE6eLugR580OzJCJ4Tcuax8e8R6ypfO+WWyYyA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 29, 2022 at 8:27 AM Wei Liang Lim
<weiliang.lim@starfivetech.com> wrote:
>
> From: Anup Patel <apatel@ventanamicro.com>
>
> We add an optional cold_boot_allowed() platform callback which allows
> platform support to decide which HARTs can do cold boot initialization.
>
> If this platform callback is not available then any HART can do cold
> boot initialization.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
>  include/sbi/sbi_platform.h | 20 ++++++++++++++++++++
>  lib/sbi/sbi_init.c         |  7 +++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 722f27a..bd0d5ca 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -65,6 +65,9 @@ enum sbi_platform_features {
>
>  /** Platform functions */
>  struct sbi_platform_operations {
> +       /* Check if specified HART is allowed to do cold boot */
> +       bool (*cold_boot_allowed)(u32 hartid);
> +
>         /* Platform nascent initialization */
>         int (*nascent_init)(void);
>
> @@ -356,6 +359,23 @@ static inline bool sbi_platform_hart_invalid(const struct sbi_platform *plat,
>         return FALSE;
>  }
>
> +/**
> + * Check whether given HART is allowed to do cold boot
> + *
> + * @param plat pointer to struct sbi_platform
> + * @param hartid HART ID
> + *
> + * @return true if HART is allowed to do cold boot and false otherwise
> + */
> +static inline bool sbi_platform_cold_boot_allowed(
> +                                       const struct sbi_platform *plat,
> +                                       u32 hartid)
> +{
> +       if (plat && sbi_platform_ops(plat)->cold_boot_allowed)
> +               return sbi_platform_ops(plat)->cold_boot_allowed(hartid);
> +       return true;
> +}
> +
>  /**
>   * Nascent (very early) initialization for current HART
>   *
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index a8500e5..d45cee6 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -498,8 +498,11 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
>          * HARTs which satisfy above condition.
>          */
>
> -       if (next_mode_supported && atomic_xchg(&coldboot_lottery, 1) == 0)
> -               coldboot = TRUE;
> +       if (sbi_platform_cold_boot_allowed(plat, hartid)) {
> +               if (next_mode_supported &&
> +                   atomic_xchg(&coldboot_lottery, 1) == 0)
> +                       coldboot = true;
> +       }
>
>         /*
>          * Do platform specific nascent (very early) initialization so
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

