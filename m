From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Dec 2022 21:32:53 +0800
Subject: [PATCH v4 2/3] platform: generic: Allow platform_override to
 select cold boot HART
In-Reply-To: <20221220034102.150151-3-weiliang.lim@starfivetech.com>
References: <20221220034102.150151-1-weiliang.lim@starfivetech.com> <20221220034102.150151-3-weiliang.lim@starfivetech.com>
Message-ID: <CAEUhbmW30_pRyiePwxVKkQqyrV9zXLgy2sdMD_iYhsRWoTRygw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 20, 2022 at 11:48 AM Wei Liang Lim
<weiliang.lim@starfivetech.com> wrote:
>
> From: Anup Patel <apatel@ventanamicro.com>
>
> We add a generic platform override callback to allow platform specific
> selection of cold boot HART.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  platform/generic/include/platform_override.h | 1 +
>  platform/generic/platform.c                  | 9 +++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
> index 7f1558d..21354e9 100644
> --- a/platform/generic/include/platform_override.h
> +++ b/platform/generic/include/platform_override.h
> @@ -18,6 +18,7 @@ struct platform_override {
>         const struct fdt_match *match_table;
>         u64 (*features)(const struct fdt_match *match);
>         u64 (*tlbr_flush_limit)(const struct fdt_match *match);
> +       bool (*cold_boot_allowed)(u32 hartid, const struct fdt_match *match);
>         int (*early_init)(bool cold_boot, const struct fdt_match *match);
>         int (*final_init)(bool cold_boot, const struct fdt_match *match);
>         void (*early_exit)(const struct fdt_match *match);
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index bfe15f0..16aa4f3 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -122,6 +122,14 @@ fail:
>                 wfi();
>  }
>
> +static bool generic_cold_boot_allowed(u32 hartid)
> +{
> +       if (generic_plat && generic_plat->cold_boot_allowed)
> +               return generic_plat->cold_boot_allowed(
> +                                               hartid, generic_plat_match);
> +       return TRUE;

s/TRUE/true

> +}
> +
>  static int generic_nascent_init(void)
>  {
>         if (platform_has_mlevel_imsic)
> @@ -261,6 +269,7 @@ static int generic_console_init(void)
>  }
>
>  const struct sbi_platform_operations platform_ops = {
> +       .cold_boot_allowed      = generic_cold_boot_allowed,
>         .nascent_init           = generic_nascent_init,
>         .early_init             = generic_early_init,
>         .final_init             = generic_final_init,
> --
> 2.25.1
>

Otherwise,
Reviewed-by: Bin Meng <bmeng@tinylab.org>

