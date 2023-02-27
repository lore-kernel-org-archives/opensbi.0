From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 11:39:23 +0530
Subject: [PATCH 1/2] lib: sbi: Align SBI vendor extension id with
 mvendorid CSR
In-Reply-To: <20230213051805.603113-1-apatel@ventanamicro.com>
References: <20230213051805.603113-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy0OJtz-nj_KF=b3d6wLkoefcn1NR++xO=e5BMoExg3g+g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 13, 2023 at 10:48 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> As-per the SBI specification, the lower 24bits of the SBI vendor
> extension id is same as lower 24bits of the mvendorid CSR.
>
> We update the SBI vendor extension id checking based on above.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  include/sbi/sbi_platform.h                   | 17 ++++++++---------
>  lib/sbi/sbi_ecall_vendor.c                   | 19 +++++++++++++++++--
>  platform/generic/include/platform_override.h |  1 -
>  platform/generic/platform.c                  | 19 ++++++-------------
>  4 files changed, 31 insertions(+), 25 deletions(-)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 43d1c03..3a629a6 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -126,8 +126,8 @@ struct sbi_platform_operations {
>         /** Exit platform timer for current HART */
>         void (*timer_exit)(void);
>
> -       /** platform specific SBI extension implementation probe function */
> -       int (*vendor_ext_check)(long extid);
> +       /** Check if SBI vendor extension is implemented or not */
> +       bool (*vendor_ext_check)(void);
>         /** platform specific SBI extension implementation provider */
>         int (*vendor_ext_provider)(long extid, long funcid,
>                                    const struct sbi_trap_regs *regs,
> @@ -636,20 +636,19 @@ static inline void sbi_platform_timer_exit(const struct sbi_platform *plat)
>  }
>
>  /**
> - * Check if a vendor extension is implemented or not.
> + * Check if SBI vendor extension is implemented or not.
>   *
>   * @param plat pointer to struct sbi_platform
> - * @param extid        vendor SBI extension id
>   *
> - * @return 0 if extid is not implemented and 1 if implemented
> + * @return false if not implemented and true if implemented
>   */
> -static inline int sbi_platform_vendor_ext_check(const struct sbi_platform *plat,
> -                                               long extid)
> +static inline bool sbi_platform_vendor_ext_check(
> +                                       const struct sbi_platform *plat)
>  {
>         if (plat && sbi_platform_ops(plat)->vendor_ext_check)
> -               return sbi_platform_ops(plat)->vendor_ext_check(extid);
> +               return sbi_platform_ops(plat)->vendor_ext_check();
>
> -       return 0;
> +       return false;
>  }
>
>  /**
> diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
> index 9252829..9ea5156 100644
> --- a/lib/sbi/sbi_ecall_vendor.c
> +++ b/lib/sbi/sbi_ecall_vendor.c
> @@ -13,12 +13,23 @@
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_trap.h>
> +#include <sbi/riscv_asm.h>
> +
> +static inline unsigned long sbi_ecall_vendor_id(void)
> +{
> +       return SBI_EXT_VENDOR_START +
> +               (csr_read(CSR_MVENDORID) &
> +                (SBI_EXT_VENDOR_END - SBI_EXT_VENDOR_START));
> +}
>
>  static int sbi_ecall_vendor_probe(unsigned long extid,
>                                   unsigned long *out_val)
>  {
> -       *out_val = sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr(),
> -                                                extid);
> +       if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()) ||
> +           extid != sbi_ecall_vendor_id())
> +               *out_val = 0;
> +       else
> +               *out_val = 1;
>         return 0;
>  }
>
> @@ -27,6 +38,10 @@ static int sbi_ecall_vendor_handler(unsigned long extid, unsigned long funcid,
>                                     unsigned long *out_val,
>                                     struct sbi_trap_info *out_trap)
>  {
> +       if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()) ||
> +           extid != sbi_ecall_vendor_id())
> +               return SBI_ERR_NOT_SUPPORTED;
> +
>         return sbi_platform_vendor_ext_provider(sbi_platform_thishart_ptr(),
>                                                 extid, funcid, regs,
>                                                 out_val, out_trap);
> diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
> index a59b06a..350c381 100644
> --- a/platform/generic/include/platform_override.h
> +++ b/platform/generic/include/platform_override.h
> @@ -27,7 +27,6 @@ struct platform_override {
>         int (*extensions_init)(const struct fdt_match *match,
>                                struct sbi_hart_features *hfeatures);
>         void (*fw_init)(void *fdt, const struct fdt_match *match);
> -       int (*vendor_ext_check)(long extid, const struct fdt_match *match);
>         int (*vendor_ext_provider)(long extid, long funcid,
>                                    const struct sbi_trap_regs *regs,
>                                    unsigned long *out_value,
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index a34d3b0..88c3ec7 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -180,13 +180,10 @@ static int generic_final_init(bool cold_boot)
>         return 0;
>  }
>
> -static int generic_vendor_ext_check(long extid)
> +static bool generic_vendor_ext_check(void)
>  {
> -       if (generic_plat && generic_plat->vendor_ext_check)
> -               return generic_plat->vendor_ext_check(extid,
> -                                                     generic_plat_match);
> -
> -       return 0;
> +       return (generic_plat && generic_plat->vendor_ext_provider) ?
> +               true : false;
>  }
>
>  static int generic_vendor_ext_provider(long extid, long funcid,
> @@ -194,13 +191,9 @@ static int generic_vendor_ext_provider(long extid, long funcid,
>                                        unsigned long *out_value,
>                                        struct sbi_trap_info *out_trap)
>  {
> -       if (generic_plat && generic_plat->vendor_ext_provider) {
> -               return generic_plat->vendor_ext_provider(extid, funcid, regs,
> -                                                        out_value, out_trap,
> -                                                        generic_plat_match);
> -       }
> -
> -       return SBI_ENOTSUPP;
> +       return generic_plat->vendor_ext_provider(extid, funcid, regs,
> +                                                out_value, out_trap,
> +                                                generic_plat_match);
>  }
>
>  static void generic_early_exit(void)
> --
> 2.34.1
>

