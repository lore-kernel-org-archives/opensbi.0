From: Anup Patel <anup@brainfault.org>
Date: Sun, 12 Jun 2022 10:00:51 +0530
Subject: [PATCH] platform: generic: add overrides for vendor extensions
In-Reply-To: <20220610044920.547047-1-mchitale@ventanamicro.com>
References: <20220610044920.547047-1-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy3hRji-urK15oYTduEijVGUBPYi8XR4X3AY+uzzTLkXnQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 10, 2022 at 10:20 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Allow the vendor_ext_check and vendor_ext_provider APIs of the
> generic platform to be overridden by other platforms
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  platform/generic/include/platform_override.h |  7 ++++++
>  platform/generic/platform.c                  | 25 ++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
> index 4af8754..e55da25 100644
> --- a/platform/generic/include/platform_override.h
> +++ b/platform/generic/include/platform_override.h
> @@ -11,6 +11,7 @@
>  #define __PLATFORM_OVERRIDE_H__
>
>  #include <sbi/sbi_types.h>
> +#include <sbi/sbi_trap.h>
>
>  struct platform_override {
>         const struct fdt_match *match_table;
> @@ -21,6 +22,12 @@ struct platform_override {
>         void (*early_exit)(const struct fdt_match *match);
>         void (*final_exit)(const struct fdt_match *match);
>         int (*fdt_fixup)(void *fdt, const struct fdt_match *match);
> +       int (*vendor_ext_check)(long extid, const struct fdt_match *match);
> +       int (*vendor_ext_provider)(long extid, long funcid,
> +                                  const struct sbi_trap_regs *regs,
> +                                  unsigned long *out_value,
> +                                  struct sbi_trap_info *out_trap,
> +                                  const struct fdt_match *match);
>  };
>
>  #endif
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 7651273..bf93af6 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -168,6 +168,29 @@ static int generic_final_init(bool cold_boot)
>         return 0;
>  }
>
> +static int generic_vendor_ext_check(long extid)
> +{
> +       if (generic_plat && generic_plat->vendor_ext_check)
> +               return generic_plat->vendor_ext_check(extid,
> +                                                     generic_plat_match);
> +
> +       return 0;
> +}
> +
> +static int generic_vendor_ext_provider(long extid, long funcid,
> +                                      const struct sbi_trap_regs *regs,
> +                                      unsigned long *out_value,
> +                                      struct sbi_trap_info *out_trap)
> +{
> +       if (generic_plat && generic_plat->vendor_ext_provider) {
> +               return generic_plat->vendor_ext_provider(extid, funcid, regs,
> +                                                        out_value, out_trap,
> +                                                        generic_plat_match);
> +       }
> +
> +       return SBI_ENOTSUPP;
> +}
> +
>  static void generic_early_exit(void)
>  {
>         if (generic_plat && generic_plat->early_exit)
> @@ -236,6 +259,8 @@ const struct sbi_platform_operations platform_ops = {
>         .get_tlbr_flush_limit   = generic_tlbr_flush_limit,
>         .timer_init             = fdt_timer_init,
>         .timer_exit             = fdt_timer_exit,
> +       .vendor_ext_check       = generic_vendor_ext_check,
> +       .vendor_ext_provider    = generic_vendor_ext_provider,
>  };
>
>  struct sbi_platform platform = {
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

