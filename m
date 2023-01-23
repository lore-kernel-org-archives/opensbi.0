From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Jan 2023 11:39:10 +0530
Subject: [PATCH v2] platform: generic: renesas: rzfive: Configure the
 Local memory regions as part of root domain
In-Reply-To: <20230113164719.8058-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230113164719.8058-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAAhSdy1tRJnXDPDedEw==3URiOyarhvfhUOb+ROSy7Jz3aMh0A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 13, 2023 at 10:17 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
> memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
> virtual address falls within this range, the MMU doesn't trigger a page
> fault; it assumes the virtual address is a physical address which can
> cause undesired behaviours for statically linked applications/libraries.
>
> To avoid this, add the ILM/DLM memory regions to the root domain region
> of the PMPU with permissions set to 0x0 for S/U modes so that any access
> to these regions gets blocked and for M-mode we grant full access (R/W/X).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The patch subject was too long so I simplified it to:
platform: renesas/rzfive: Configure Local memory regions as part of root domain

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> v1->v2
> * Allow local memory region access in M-mode.
> ---
>  platform/generic/renesas/rzfive/rzfive.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index ca182e3..ee9c9c4 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -5,8 +5,27 @@
>   */
>
>  #include <platform_override.h>
> +#include <sbi/sbi_domain.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>
> +int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
> +{
> +       /*
> +        * Renesas RZ/Five RISC-V SoC has Instruction local memory and
> +        * Data local memory (ILM & DLM) mapped between region 0x30000
> +        * to 0x4FFFF. When a virtual address falls within this range,
> +        * the MMU doesn't trigger a page fault; it assumes the virtual
> +        * address is a physical address which can cause undesired
> +        * behaviours for statically linked applications/libraries. To
> +        * avoid this, add the ILM/DLM memory regions to the root domain
> +        * region of the PMPU with permissions set to 0x0 for S/U modes
> +        * so that any access to these regions gets blocked and for M-mode
> +        * we grant full access.
> +        */
> +       return sbi_domain_root_add_memrange(0x30000, 0x20000, 0x1000,
> +                                           SBI_DOMAIN_MEMREGION_M_RWX);
> +}
> +
>  static const struct fdt_match renesas_rzfive_match[] = {
>         { .compatible = "renesas,r9a07g043f01" },
>         { /* sentinel */ }
> @@ -14,4 +33,5 @@ static const struct fdt_match renesas_rzfive_match[] = {
>
>  const struct platform_override renesas_rzfive = {
>         .match_table = renesas_rzfive_match,
> +       .early_init = renesas_rzfive_early_init,
>  };
> --
> 2.17.1
>

