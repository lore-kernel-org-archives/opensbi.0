From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 18 Oct 2020 16:50:38 -0700
Subject: [PATCH v2 11/16] lib: utils: Update fdt_reserved_memory_fixup()
 to use current domain
In-Reply-To: <20201015132700.2232820-12-anup.patel@wdc.com>
References: <20201015132700.2232820-1-anup.patel@wdc.com>
 <20201015132700.2232820-12-anup.patel@wdc.com>
Message-ID: <CAOnJCUK-gy+XzLgFt0N0e573rR0Kxq8wuEsFGwEQM8Xs_ygTjA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 15, 2020 at 6:28 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> Now that each HART is mapped to a domain having a set of memory
> regions, we update fdt_reserved_memory_fixup() to use domain memory
> regions for adding reserved memory nodes in device tree.
>
> We also change reserved memory node name prefix from "mmode_pmp"
> to "mmode_resv" because domain memory regions can impact other
> hardware configurations (such as IOPMP, etc) along with PMP.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/utils/fdt/fdt_fixup.c | 47 ++++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 25 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index 8f554e1..e9e1dff 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -9,6 +9,7 @@
>
>  #include <libfdt.h>
>  #include <sbi/sbi_console.h>
> +#include <sbi/sbi_domain.h>
>  #include <sbi/sbi_math.h>
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_platform.h>
> @@ -97,11 +98,11 @@ static int fdt_resv_memory_update_node(void *fdt, unsigned long addr,
>
>         if (na > 1 && addr_high)
>                 sbi_snprintf(name, sizeof(name),
> -                            "mmode_pmp%d@%x,%x", index,
> +                            "mmode_resv%d@%x,%x", index,
>                              addr_high, addr_low);
>         else
>                 sbi_snprintf(name, sizeof(name),
> -                            "mmode_pmp%d@%x", index,
> +                            "mmode_resv%d@%x", index,
>                              addr_low);
>
>         subnode = fdt_add_subnode(fdt, parent, name);
> @@ -153,10 +154,11 @@ static int fdt_resv_memory_update_node(void *fdt, unsigned long addr,
>   */
>  int fdt_reserved_memory_fixup(void *fdt)
>  {
> +       struct sbi_domain_memregion *reg;
> +       struct sbi_domain *dom = sbi_domain_thishart_ptr();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> -       unsigned long prot, addr, size;
> -       int parent, i, j;
> -       int err;
> +       unsigned long addr, size;
> +       int err, parent, i;
>         int na = fdt_address_cells(fdt, 0);
>         int ns = fdt_size_cells(fdt, 0);
>
> @@ -203,34 +205,29 @@ int fdt_reserved_memory_fixup(void *fdt)
>          * We assume the given device tree does not contain any memory region
>          * child node protected by PMP. Normally PMP programming happens at
>          * M-mode firmware. The memory space used by OpenSBI is protected.
> -        * Some additional memory spaces may be protected by platform codes.
> +        * Some additional memory spaces may be protected by domain memory
> +        * regions.
>          *
>          * With above assumption, we create child nodes directly.
>          */
>
> -       if (!sbi_hart_pmp_count(scratch)) {
> -               /*
> -                * Update the DT with firmware start & size even if PMP is not
> -                * supported. This makes sure that supervisor OS is always
> -                * aware of OpenSBI resident memory area.
> -                */
> -               addr = scratch->fw_start & ~(scratch->fw_size - 1UL);
> -               size = (1UL << log2roundup(scratch->fw_size));
> -               return fdt_resv_memory_update_node(fdt, addr, size,
> -                                                  0, parent, true);
> -       }
> -
> -       for (i = 0, j = 0; i < sbi_hart_pmp_count(scratch); i++) {
> -               err = sbi_hart_pmp_get(scratch, i, &prot, &addr, &size);
> -               if (err)
> +       i = 0;
> +       sbi_domain_for_each_memregion(dom, reg) {
> +               /* Ignore MMIO or READABLE or WRITABLE or EXECUTABLE regions */
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
> +                       continue;
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_READABLE)
>                         continue;
> -               if (!(prot & PMP_A))
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_WRITEABLE)
>                         continue;
> -               if (prot & (PMP_R | PMP_W | PMP_X))
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_EXECUTABLE)
>                         continue;
>
> -               fdt_resv_memory_update_node(fdt, addr, size, j, parent, false);
> -               j++;
> +               addr = reg->base;
> +               size = 1UL << reg->order;
> +               fdt_resv_memory_update_node(fdt, addr, size, i, parent,
> +                       (sbi_hart_pmp_count(scratch)) ? false : true);
> +               i++;
>         }
>
>         return 0;
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

