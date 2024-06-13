From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jun 2024 18:54:47 +0530
Subject: [PATCH 1/7] lib: utils/ipi: Skip initialize ipi when dt is not enabled
In-Reply-To: <20240611111937.1459876-2-wxjstz@126.com>
References: <20240611111937.1459876-1-wxjstz@126.com> <20240611111937.1459876-2-wxjstz@126.com>
Message-ID: <CAAhSdy3X3KfX7ccFJxd7T+H74uLnDpSkx5K3ubMWrQUJChMweQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 11, 2024 at 4:49?PM Xiang W <wxjstz@126.com> wrote:
>
> When the dt node has a status property and the value is not ok or
> okay, skip initializing ipi.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/ipi/fdt_ipi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
> index 7762aba..0b75093 100644
> --- a/lib/utils/ipi/fdt_ipi.c
> +++ b/lib/utils/ipi/fdt_ipi.c
> @@ -44,6 +44,9 @@ static int fdt_ipi_cold_init(void)
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

