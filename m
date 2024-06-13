From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jun 2024 18:56:04 +0530
Subject: [PATCH 4/7] lib: utils/serial: Skip initialize serial when dt is
 not enabled
In-Reply-To: <20240611111937.1459876-5-wxjstz@126.com>
References: <20240611111937.1459876-1-wxjstz@126.com> <20240611111937.1459876-5-wxjstz@126.com>
Message-ID: <CAAhSdy20cL6-1gZxC7yn925rBhm=J7S3HV5Qm2L+QnW+7dnvMQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 11, 2024 at 4:49?PM Xiang W <wxjstz@126.com> wrote:
>
> When the dt node has a status property and the value is not ok or
> okay, skip initializing serial.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/serial/fdt_serial.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
> index 0baa722..8b6e6b9 100644
> --- a/lib/utils/serial/fdt_serial.c
> +++ b/lib/utils/serial/fdt_serial.c
> @@ -40,6 +40,10 @@ int fdt_serial_init(void)
>                         else
>                                 noff = fdt_path_offset(fdt, prop);
>                 }
> +               if (-1 < noff) {
> +                       if (!fdt_node_is_enabled(fdt, noff))
> +                               noff = -1;
> +               }
>         }
>
>         /* First check DT node pointed by stdout-path */
> @@ -68,6 +72,9 @@ int fdt_serial_init(void)
>                 if (noff < 0)
>                         continue;
>
> +               if (!fdt_node_is_enabled(fdt, noff))
> +                       continue;
> +
>                 /* drv->init must not be NULL */
>                 if (drv->init == NULL)
>                         return SBI_EFAIL;
> --
> 2.43.0
>

