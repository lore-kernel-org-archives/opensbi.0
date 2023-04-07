From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Apr 2023 11:28:06 +0530
Subject: [PATCH v2 1/1] lib: utils: fdt_fixup: avoid buffer overrun
In-Reply-To: <20230331131515.59258-1-heinrich.schuchardt@canonical.com>
References: <20230331131515.59258-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy2dButOT5c1EUOG=3=1v0gw3gnhJT+LSxGW4CMXwHNdiQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 31, 2023 at 6:45?PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> fdt_reserved_memory_fixup() uses filtered_order[PMP_COUNT]. The index
> must not reach PMP_COUNT.
>
> Fixes: 199189bd1c17 ("lib: utils: Mark only the largest region as reserved in FDT")
> Addresses-Coverity-ID: 1536994 ("Out-of-bounds write")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> v2:
>         fix typo in commit message
> ---
>  lib/utils/fdt/fdt_fixup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index c10179b..ae6be00 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -355,7 +355,7 @@ int fdt_reserved_memory_fixup(void *fdt)
>                 if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
>                         continue;
>
> -               if (i > PMP_COUNT) {
> +               if (i >= PMP_COUNT) {
>                         sbi_printf("%s: Too many memory regions to fixup.\n",
>                                    __func__);
>                         return SBI_ENOSPC;
> --
> 2.39.2
>

