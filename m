From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Feb 2023 11:17:05 +0530
Subject: [PATCH] lib: utils: Mark only the largest region as reserved in FDT
In-Reply-To: <20230127041923.112164-1-hchauhan@ventanamicro.com>
References: <20230127041923.112164-1-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3ddbpDc7Wix2EqdO-geTiiLTHRnLvvGb2BNr8dcWw1Aw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 9:49 AM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> In commit 230278dcf, RX and RW regions were marked separately.
> When the RW region grows (e.g. with more harts) and it isn't a
> power-of-two, sbi_domain_memregion_init will upgrade the region
> to the next power-of-two. This will make RX and RW both start
> at the same base address, like so (with 64 harts):
> Domain0 Region01 : 0x0000000080000000-0x000000008001ffff M: (R,X) S/U: ()
> Domain0 Region02 : 0x0000000080000000-0x00000000800fffff M: (R,W) S/U: ()
>
> This doesn't break the permission enforcement because of static
> priorities in PMP but makes the kernel complain about the regions
> overlapping each other. Like so:
> [    0.000000] OF: reserved mem: OVERLAP DETECTED!
> [    0.000000] mmode_resv0 at 80000000 (0x0000000080000000--0x0000000080020000) \
>         overlaps with mmode_resv1 at 80000000 (0x0000000080000000--0x0000000080100000)
>
> To fix this warning, among the multiple regions having same base
> address but different sizes, add only the largest region as reserved
> region during fdt fixup.
>
> Fixes: 230278dcf (lib: sbi: Add separate entries for firmware RX and RW regions)
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/fdt/fdt_fixup.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index 42692cc..4085762 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -1,3 +1,4 @@
> +
>  // SPDX-License-Identifier: BSD-2-Clause
>  /*
>   * fdt_fixup.c - Flat Device Tree parsing helper routines
> @@ -14,6 +15,7 @@
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
> +#include <sbi/sbi_error.h>
>  #include <sbi_utils/fdt/fdt_fixup.h>
>  #include <sbi_utils/fdt/fdt_pmu.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
> @@ -200,8 +202,10 @@ int fdt_reserved_memory_fixup(void *fdt)
>         struct sbi_domain_memregion *reg;
>         struct sbi_domain *dom = sbi_domain_thishart_ptr();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       unsigned long filtered_base[PMP_COUNT] = { 0 };
> +       unsigned char filtered_order[PMP_COUNT] = { 0 };
>         unsigned long addr, size;
> -       int err, parent, i;
> +       int err, parent, i, j;
>         int na = fdt_address_cells(fdt, 0);
>         int ns = fdt_size_cells(fdt, 0);
>
> @@ -266,11 +270,33 @@ int fdt_reserved_memory_fixup(void *fdt)
>                 if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
>                         continue;
>
> +               if (i > PMP_COUNT) {
> +                       sbi_printf("%s: Too many memory regions to fixup.\n",
> +                                  __func__);
> +                       return SBI_ENOSPC;
> +               }
> +
>                 addr = reg->base;
> -               size = 1UL << reg->order;
> -               fdt_resv_memory_update_node(fdt, addr, size, i, parent,
> -                       (sbi_hart_pmp_count(scratch)) ? false : true);
> +               for (j = 0; j < i; j++) {
> +                       if (addr == filtered_base[j]
> +                           && filtered_order[j] < reg->order) {
> +                               filtered_order[j] = reg->order;
> +                               goto next_entry;
> +                       }
> +               }
> +
> +               filtered_base[i] = reg->base;
> +               filtered_order[i] = reg->order;
>                 i++;
> +       next_entry:
> +       }
> +
> +       for (j = 0; j < i; j++) {
> +               addr = filtered_base[j];
> +               size = 1UL << filtered_order[j];
> +               fdt_resv_memory_update_node(fdt, addr, size, j, parent,
> +                                           (sbi_hart_pmp_count(scratch))
> +                                           ? false : true);
>         }
>
>         return 0;
> --
> 2.39.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

