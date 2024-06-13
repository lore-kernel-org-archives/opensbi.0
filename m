From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jun 2024 18:58:06 +0530
Subject: [PATCH 6/7] lib: utils/reset: Skip initialize reset when dt is
 not enabled
In-Reply-To: <20240611111937.1459876-7-wxjstz@126.com>
References: <20240611111937.1459876-1-wxjstz@126.com> <20240611111937.1459876-7-wxjstz@126.com>
Message-ID: <CAAhSdy0b+Wgtw2gKXy49XTAAZ9N4mt1a9ro1YuczwX+TB=vf+w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 11, 2024 at 4:49?PM Xiang W <wxjstz@126.com> wrote:
>
> When the dt node has a status property and the value is not ok or
> okay, skip initializing reset.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/reset/fdt_reset.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index 4334586..327fb99 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -26,6 +26,9 @@ int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
>         if (noff < 0)
>                 return SBI_ENODEV;
>
> +       if (!fdt_node_is_enabled(fdt, noff))
> +               return SBI_ENODEV;
> +
>         if (drv->init) {
>                 rc = drv->init(fdt, noff, match);
>                 if (rc && rc != SBI_ENODEV) {
> --
> 2.43.0
>

