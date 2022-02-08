From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 8 Feb 2022 01:12:58 -0800
Subject: [PATCH 10/13] lib: utils: Disable appropriate IMSIC DT nodes in
 fdt_fixups()
In-Reply-To: <20220104101323.127564-8-apatel@ventanamicro.com>
References: <20220104101323.127564-1-apatel@ventanamicro.com>
 <20220104101323.127564-8-apatel@ventanamicro.com>
Message-ID: <CAOnJCUJQ1eo4rD9Xs0aNALZ1okwU=NuxoC+RmtTfYgHDEtL1YQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 4, 2022 at 2:13 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should disable IMSIC DT nodes in fdt_fixups() which are not
> accessible to the next booting stage based on currently assigned
> domain.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi_utils/fdt/fdt_fixup.h | 17 ++++++++++++++--
>  lib/utils/fdt/fdt_fixup.c         | 32 +++++++++++++++++++++++++++++--
>  2 files changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
> index c38e5d9..77575bb 100644
> --- a/include/sbi_utils/fdt/fdt_fixup.h
> +++ b/include/sbi_utils/fdt/fdt_fixup.h
> @@ -21,6 +21,18 @@
>   */
>  void fdt_cpu_fixup(void *fdt);
>
> +/**
> + * Fix up the IMSIC nodes in the device tree
> + *
> + * This routine disables IMSIC nodes which are not accessible to the next
> + * booting stage based on currently assigned domain.
> + *
> + * It is recommended that platform codes call this helper in their final_init()
> + *
> + * @param fdt: device tree blob
> + */
> +void fdt_imsic_fixup(void *fdt);
> +
>  /**
>   * Fix up the PLIC node in the device tree
>   *
> @@ -64,8 +76,9 @@ int fdt_reserved_memory_nomap_fixup(void *fdt);
>   * General device tree fix-up
>   *
>   * This routine do all required device tree fix-ups for a typical platform.
> - * It fixes up the PLIC node and the reserved memory node in the device tree
> - * by calling the corresponding helper routines to accomplish the task.
> + * It fixes up the PLIC node, IMSIC nodes, and the reserved memory node in
> + * the device tree by calling the corresponding helper routines to accomplish
> + * the task.
>   *
>   * It is recommended that platform codes call this helper in their final_init()
>   *
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index ac01ba3..c2460b8 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -52,6 +52,34 @@ void fdt_cpu_fixup(void *fdt)
>         }
>  }
>
> +static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
> +{
> +       int rc;
> +       uint64_t reg_addr, reg_size;
> +       struct sbi_domain *dom = sbi_domain_thishart_ptr();
> +
> +       rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
> +       if (rc < 0 || !reg_addr || !reg_size)
> +               return;
> +
> +       if (!sbi_domain_check_addr(dom, reg_addr, dom->next_mode,
> +                                   SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
> +               rc = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
> +               if (rc < 0)
> +                       return;
> +               fdt_setprop_string(fdt, nodeoff, "status", "disabled");
> +       }
> +}
> +

This should be in a separate patch as it is a generic function and
doesn't match the commit text.

> +void fdt_imsic_fixup(void *fdt)
> +{
> +       int noff = 0;
> +
> +       while ((noff = fdt_node_offset_by_compatible(fdt, noff,
> +                                                    "riscv,imsics")) >= 0)
> +               fdt_domain_based_fixup_one(fdt, noff);
> +}
> +
>  void fdt_plic_fixup(void *fdt)
>  {
>         u32 *cells;
> @@ -261,10 +289,10 @@ int fdt_reserved_memory_nomap_fixup(void *fdt)
>
>  void fdt_fixups(void *fdt)
>  {
> +       fdt_imsic_fixup(fdt);
> +
>         fdt_plic_fixup(fdt);
>
>         fdt_reserved_memory_fixup(fdt);
>         fdt_pmu_fixup(fdt);
>  }
> -
> -
> --
> 2.25.1
>

Otherwise, LGTM.

Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

