From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jun 2024 18:59:42 +0530
Subject: [PATCH 7/7] lib: utils/reset: Fix fdt_reset to search for more dt nodes
In-Reply-To: <20240611111937.1459876-8-wxjstz@126.com>
References: <20240611111937.1459876-1-wxjstz@126.com> <20240611111937.1459876-8-wxjstz@126.com>
Message-ID: <CAAhSdy1yf02EnwDaS4TQXqPyMMCPGfK1divsF-C4r=+reUnB=g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 11, 2024 at 4:49?PM Xiang W <wxjstz@126.com> wrote:
>
> If there are multiple dt nodes, the previous code only tries to match
> the first one, which may lose initialization.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/utils/reset/fdt_reset.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index 327fb99..df67da1 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -22,18 +22,18 @@ int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
>         int noff, rc = SBI_ENODEV;
>         const struct fdt_match *match;
>
> -       noff = fdt_find_match(fdt, -1, drv->match_table, &match);
> -       if (noff < 0)
> -               return SBI_ENODEV;
> -
> -       if (!fdt_node_is_enabled(fdt, noff))
> -               return SBI_ENODEV;
> -
> -       if (drv->init) {
> -               rc = drv->init(fdt, noff, match);
> -               if (rc && rc != SBI_ENODEV) {
> -                       sbi_printf("%s: %s init failed, %d\n",
> -                                  __func__, match->compatible, rc);
> +       noff = -1;
> +       while ((noff = fdt_find_match(fdt, noff,
> +                               drv->match_table, &match)) >= 0) {
> +               if (!fdt_node_is_enabled(fdt, noff))
> +                       continue;
> +
> +               if (drv->init) {
> +                       rc = drv->init(fdt, noff, match);
> +                       if (rc && rc != SBI_ENODEV) {
> +                               sbi_printf("%s: %s init failed, %d\n",
> +                                       __func__, match->compatible, rc);
> +                       }

Need to do "return rc" here and we should have
"return SBI_ENODEV" at the end of this function.

>                 }
>         }
>
> --
> 2.43.0
>

Otherwise this looks good to me. I have taken care
of the above at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

