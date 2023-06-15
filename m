From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 Jun 2023 18:32:45 +0530
Subject: [PATCH -fixes] platform/lib: Set no-map attribute on all PMP regions
In-Reply-To: <20230614082039.484666-1-alexghiti@rivosinc.com>
References: <20230614082039.484666-1-alexghiti@rivosinc.com>
Message-ID: <CAAhSdy0kBETf_KEc8Ye13EFfwB3rzPHzSvbK+YqJbx1US+dfEw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 14, 2023 at 1:50?PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> This reverts commit 6966ad0abe70 ("platform/lib: Allow the OS to map the
> regions that are protected by PMP").
>
> It was thought at the time of this commit that allowing the kernel to map
> PMP protected regions was safe but it is actually not: for example, the
> hibernation process will try to access any linear mapping page and then
> will fault on such mapped PMP regions [1]. Another issue is that the
> device tree specification [2] states that a !no-map region must be
> declared as EfiBootServicesData/Code in the EFI memory map which would make
> the PMP protected regions reclaimable by the kernel. And to circumvent
> this, RISC-V edk2 diverges from the DT specification to declare those
> regions as EfiReserved.
>
> The no-map attribute was removed to allow the kernel to use hugepages
> larger than 2MB to map the linear mapping to improve the performance but
> actually a recent talk from Mike Rapoport [3] stated that the
> performance benefit was marginal.
>
> For all those reasons, let's mark all the PMP protected regions as "no-map".
>
> [1] https://lore.kernel.org/linux-riscv/CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q at mail.gmail.com/
> [2] "3.5.4 /reserved-memory and UEFI" https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4-rc1/devicetree-specification-v0.4-rc1.pdf
> [3] https://lwn.net/Articles/931406/
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi_utils/fdt/fdt_fixup.h | 14 ---------
>  lib/utils/fdt/fdt_fixup.c         | 49 +++++++------------------------
>  platform/generic/sifive/fu540.c   | 13 --------
>  3 files changed, 10 insertions(+), 66 deletions(-)
>
> diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
> index cab3f0f..ecd55a7 100644
> --- a/include/sbi_utils/fdt/fdt_fixup.h
> +++ b/include/sbi_utils/fdt/fdt_fixup.h
> @@ -93,20 +93,6 @@ void fdt_plic_fixup(void *fdt);
>   */
>  int fdt_reserved_memory_fixup(void *fdt);
>
> -/**
> - * Fix up the reserved memory subnodes in the device tree
> - *
> - * This routine adds the no-map property to the reserved memory subnodes so
> - * that the OS does not map those PMP protected memory regions.
> - *
> - * Platform codes must call this helper in their final_init() after fdt_fixups()
> - * if the OS should not map the PMP protected reserved regions.
> - *
> - * @param fdt: device tree blob
> - * @return zero on success and -ve on failure
> - */
> -int fdt_reserved_memory_nomap_fixup(void *fdt);
> -
>  /**
>   * General device tree fix-up
>   *
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index ae6be00..e213ded 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -210,7 +210,7 @@ void fdt_plic_fixup(void *fdt)
>
>  static int fdt_resv_memory_update_node(void *fdt, unsigned long addr,
>                                        unsigned long size, int index,
> -                                      int parent, bool no_map)
> +                                      int parent)
>  {
>         int na = fdt_address_cells(fdt, 0);
>         int ns = fdt_size_cells(fdt, 0);
> @@ -239,16 +239,14 @@ static int fdt_resv_memory_update_node(void *fdt, unsigned long addr,
>         if (subnode < 0)
>                 return subnode;
>
> -       if (no_map) {
> -               /*
> -                * Tell operating system not to create a virtual
> -                * mapping of the region as part of its standard
> -                * mapping of system memory.
> -                */
> -               err = fdt_setprop_empty(fdt, subnode, "no-map");
> -               if (err < 0)
> -                       return err;
> -       }
> +       /*
> +        * Tell operating system not to create a virtual
> +        * mapping of the region as part of its standard
> +        * mapping of system memory.
> +        */
> +       err = fdt_setprop_empty(fdt, subnode, "no-map");
> +       if (err < 0)
> +               return err;
>
>         /* encode the <reg> property value */
>         val = reg;
> @@ -286,7 +284,6 @@ int fdt_reserved_memory_fixup(void *fdt)
>  {
>         struct sbi_domain_memregion *reg;
>         struct sbi_domain *dom = sbi_domain_thishart_ptr();
> -       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>         unsigned long filtered_base[PMP_COUNT] = { 0 };
>         unsigned char filtered_order[PMP_COUNT] = { 0 };
>         unsigned long addr, size;
> @@ -382,33 +379,7 @@ int fdt_reserved_memory_fixup(void *fdt)
>         for (j = 0; j < i; j++) {
>                 addr = filtered_base[j];
>                 size = 1UL << filtered_order[j];
> -               fdt_resv_memory_update_node(fdt, addr, size, j, parent,
> -                                           (sbi_hart_pmp_count(scratch))
> -                                           ? false : true);
> -       }
> -
> -       return 0;
> -}
> -
> -int fdt_reserved_memory_nomap_fixup(void *fdt)
> -{
> -       int parent, subnode;
> -       int err;
> -
> -       /* Locate the reserved memory node */
> -       parent = fdt_path_offset(fdt, "/reserved-memory");
> -       if (parent < 0)
> -               return parent;
> -
> -       fdt_for_each_subnode(subnode, fdt, parent) {
> -               /*
> -                * Tell operating system not to create a virtual
> -                * mapping of the region as part of its standard
> -                * mapping of system memory.
> -                */
> -               err = fdt_setprop_empty(fdt, subnode, "no-map");
> -               if (err < 0)
> -                       return err;
> +               fdt_resv_memory_update_node(fdt, addr, size, j, parent);
>         }
>
>         return 0;
> diff --git a/platform/generic/sifive/fu540.c b/platform/generic/sifive/fu540.c
> index 08f7bfc..b980f44 100644
> --- a/platform/generic/sifive/fu540.c
> +++ b/platform/generic/sifive/fu540.c
> @@ -20,18 +20,6 @@ static u64 sifive_fu540_tlbr_flush_limit(const struct fdt_match *match)
>         return 0;
>  }
>
> -static int sifive_fu540_fdt_fixup(void *fdt, const struct fdt_match *match)
> -{
> -       /*
> -        * SiFive Freedom U540 has an erratum that prevents S-mode software
> -        * to access a PMP protected region using 1GB page table mapping, so
> -        * always add the no-map attribute on this platform.
> -        */
> -       fdt_reserved_memory_nomap_fixup(fdt);
> -
> -       return 0;
> -}
> -
>  static const struct fdt_match sifive_fu540_match[] = {
>         { .compatible = "sifive,fu540" },
>         { .compatible = "sifive,fu540g" },
> @@ -43,5 +31,4 @@ static const struct fdt_match sifive_fu540_match[] = {
>  const struct platform_override sifive_fu540 = {
>         .match_table = sifive_fu540_match,
>         .tlbr_flush_limit = sifive_fu540_tlbr_flush_limit,
> -       .fdt_fixup = sifive_fu540_fdt_fixup,
>  };
> --
> 2.39.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

