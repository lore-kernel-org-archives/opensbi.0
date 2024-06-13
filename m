From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jun 2024 18:55:13 +0530
Subject: [PATCH 2/7] lib: utils/timer: Skip initialize timer when dt is
 not enabled
In-Reply-To: <20240611111937.1459876-3-wxjstz@126.com>
References: <20240611111937.1459876-1-wxjstz@126.com> <20240611111937.1459876-3-wxjstz@126.com>
Message-ID: <CAAhSdy2H4FY+EY-cv98BuLYERpux8_J5X4FAWQKZ6MehQo_JBg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 11, 2024 at 4:49?PM Xiang W <wxjstz@126.com> wrote:
>
> When the dt node has a status property and the value is not ok or
> okay, skip initializing timer.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/timer/fdt_timer.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
> index 62426a7..f468730 100644
> --- a/lib/utils/timer/fdt_timer.c
> +++ b/lib/utils/timer/fdt_timer.c
> @@ -44,6 +44,9 @@ static int fdt_timer_cold_init(void)
>                 noff = -1;
>                 while ((noff = fdt_find_match(fdt, noff,
>                                         drv->match_table, &match)) >= 0) {
> +                       if (!fdt_node_is_enabled(fdt, noff))
> +                               continue;
> +
>                         /* drv->cold_init must not be NULL */
>                         if (drv->cold_init == NULL)
>                                 return SBI_EFAIL;
> --
> 2.43.0
>

