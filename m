From: Anup Patel <anup@brainfault.org>
Date: Tue, 11 Jun 2024 14:32:17 +0530
Subject: [PATCH] lib: utils/fdt: fdt_find_match skip disabled node
In-Reply-To: <20240527015627.629207-1-wxjstz@126.com>
References: <20240527015627.629207-1-wxjstz@126.com>
Message-ID: <CAAhSdy2RBfzk2i5s3bcOfrf8OVP0tZe_K=9FyEvdC-rqrBONOw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 27, 2024 at 7:26?AM Xiang W <wxjstz@126.com> wrote:
>
> Some node in devicetree are disabled and need to be skipped during
> initialization.

The fdt_find_match() only finds matching DT nodes irrespective
of the status of the DT node.

Instead of changing the behavior of fdt_find_match(), the
fdt_node_is_enabled() should be called separately by individual
driver frameworks.

Regards,
Anup

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/utils/fdt/fdt_helper.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index a0e93b9..ef627b7 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -65,9 +65,11 @@ int fdt_find_match(void *fdt, int startoff,
>                 nodeoff = fdt_node_offset_by_compatible(fdt, startoff,
>                                                 match_table->compatible);
>                 if (nodeoff >= 0) {
> -                       if (out_match)
> -                               *out_match = match_table;
> -                       return nodeoff;
> +                       if (fdt_node_is_enabled(fdt, nodeoff)) {
> +                               if (out_match)
> +                                       *out_match = match_table;
> +                               return nodeoff;
> +                       }
>                 }
>                 match_table++;
>         }
> --
> 2.43.0
>

