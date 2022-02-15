From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Feb 2022 20:55:39 +0530
Subject: [PATCH v2 13/13] lib: utils: Disable appropriate APLIC DT nodes
 in fdt_fixups()
In-Reply-To: <20220209150441.121729-14-apatel@ventanamicro.com>
References: <20220209150441.121729-1-apatel@ventanamicro.com>
 <20220209150441.121729-14-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3jLVvqNXYPGQsB7KM6rTK57=W-QDwNmhchCEBcwpu6Kw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 9, 2022 at 8:36 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should disable APLIC DT nodes in fdt_fixups() which are not
> accessible to the next booting stage based on currently assigned
> domain.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  include/sbi_utils/fdt/fdt_fixup.h | 18 +++++++++++++++---
>  lib/utils/fdt/fdt_fixup.c         | 11 +++++++++++
>  2 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
> index 77575bb..fb076ba 100644
> --- a/include/sbi_utils/fdt/fdt_fixup.h
> +++ b/include/sbi_utils/fdt/fdt_fixup.h
> @@ -21,6 +21,18 @@
>   */
>  void fdt_cpu_fixup(void *fdt);
>
> +/**
> + * Fix up the APLIC nodes in the device tree
> + *
> + * This routine disables APLIC nodes which are not accessible to the next
> + * booting stage based on currently assigned domain.
> + *
> + * It is recommended that platform codes call this helper in their final_init()
> + *
> + * @param fdt: device tree blob
> + */
> +void fdt_aplic_fixup(void *fdt);
> +
>  /**
>   * Fix up the IMSIC nodes in the device tree
>   *
> @@ -76,9 +88,9 @@ int fdt_reserved_memory_nomap_fixup(void *fdt);
>   * General device tree fix-up
>   *
>   * This routine do all required device tree fix-ups for a typical platform.
> - * It fixes up the PLIC node, IMSIC nodes, and the reserved memory node in
> - * the device tree by calling the corresponding helper routines to accomplish
> - * the task.
> + * It fixes up the PLIC node, IMSIC nodes, APLIC nodes, and the reserved
> + * memory node in the device tree by calling the corresponding helper
> + * routines to accomplish the task.
>   *
>   * It is recommended that platform codes call this helper in their final_init()
>   *
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index c2460b8..a80bd82 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -71,6 +71,15 @@ static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
>         }
>  }
>
> +void fdt_aplic_fixup(void *fdt)
> +{
> +       int noff = 0;
> +
> +       while ((noff = fdt_node_offset_by_compatible(fdt, noff,
> +                                                    "riscv,aplic")) >= 0)
> +               fdt_domain_based_fixup_one(fdt, noff);
> +}
> +
>  void fdt_imsic_fixup(void *fdt)
>  {
>         int noff = 0;
> @@ -289,6 +298,8 @@ int fdt_reserved_memory_nomap_fixup(void *fdt)
>
>  void fdt_fixups(void *fdt)
>  {
> +       fdt_aplic_fixup(fdt);
> +
>         fdt_imsic_fixup(fdt);
>
>         fdt_plic_fixup(fdt);
> --
> 2.25.1
>

