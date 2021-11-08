From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Nov 2021 10:57:33 +0530
Subject: [PATCH v5 2/3] platform: generic: move fdt_reset_init to
 final_init
In-Reply-To: <20211106095451.13200-3-heinrich.schuchardt@canonical.com>
References: <20211106095451.13200-1-heinrich.schuchardt@canonical.com>
 <20211106095451.13200-3-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy2kJJ93VHkSw_zCvPBfVyOuGR2onXLPWXZEz7JV9DSXMQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 6, 2021 at 3:24 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Move the fdt_reset_init() invocation from generic_early_init() to
> generic_final_init(). This allows to print error messages.
>
> Ignore the return value of fdt_reset_init() as we should not stop booting
> due to failure to initialize reset drivers.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
> v5:
>         no change
> v4:
>         no change
> v3:
>         no change
> v2:
>         new patch
> ---
>  platform/generic/platform.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 0757d87..8d4e41a 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -120,18 +120,10 @@ fail:
>
>  static int generic_early_init(bool cold_boot)
>  {
> -       int rc;
> -
> -       if (generic_plat && generic_plat->early_init) {
> -               rc = generic_plat->early_init(cold_boot, generic_plat_match);
> -               if (rc)
> -                       return rc;
> -       }
> -
> -       if (!cold_boot)
> +       if (!generic_plat || !generic_plat->early_init)
>                 return 0;
>
> -       return fdt_reset_init();
> +       return generic_plat->early_init(cold_boot, generic_plat_match);
>  }
>
>  static int generic_final_init(bool cold_boot)
> @@ -139,6 +131,9 @@ static int generic_final_init(bool cold_boot)
>         void *fdt;
>         int rc;
>
> +       if (cold_boot)
> +               fdt_reset_init();
> +
>         if (generic_plat && generic_plat->final_init) {
>                 rc = generic_plat->final_init(cold_boot, generic_plat_match);
>                 if (rc)
> --
> 2.32.0
>

