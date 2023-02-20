From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Feb 2023 21:08:18 +0530
Subject: [PATCH v2] lib: utils: fdt_fixup: Fix compile error
In-Reply-To: <20230219103116.710854-1-wxjstz@126.com>
References: <20230219103116.710854-1-wxjstz@126.com>
Message-ID: <CAAhSdy0UonkLe-+wezkh16xeyw=kxD4hkNb_uVKDsBGhojbvug@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 19, 2023 at 4:02 PM Xiang W <wxjstz@126.com> wrote:
>
> When building with GCC-10 or older versions, it throws the following
> error:
>
>  CC-DEP    platform/generic/lib/utils/fdt/fdt_fixup.dep
>  CC        platform/generic/lib/utils/fdt/fdt_fixup.o
> lib/utils/fdt/fdt_fixup.c: In function 'fdt_reserved_memory_fixup':
> lib/utils/fdt/fdt_fixup.c:376:2: error: label at end of compound statement
>   376 |  next_entry:
>       |  ^~~~~~~~~~
>
> Remove the goto statement. Fixed issue#288 [1]
>
> [1]: https://github.com/riscv-software-src/opensbi/issues/288
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> Changes in v2:
> - Fix a comment issue raised by Andreas Schwab
>
>  lib/utils/fdt/fdt_fixup.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index 619e4f5..e23517d 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -361,19 +361,22 @@ int fdt_reserved_memory_fixup(void *fdt)
>                         return SBI_ENOSPC;
>                 }
>
> +               int overlap = 0;
>                 addr = reg->base;
>                 for (j = 0; j < i; j++) {
>                         if (addr == filtered_base[j]
>                             && filtered_order[j] < reg->order) {
> +                               overlap = 1;
>                                 filtered_order[j] = reg->order;
> -                               goto next_entry;
> +                               break;
>                         }
>                 }
>
> -               filtered_base[i] = reg->base;
> -               filtered_order[i] = reg->order;
> -               i++;
> -       next_entry:
> +               if (!overlap) {
> +                       filtered_base[i] = reg->base;
> +                       filtered_order[i] = reg->order;
> +                       i++;
> +               }
>         }
>
>         for (j = 0; j < i; j++) {
> --
> 2.39.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

