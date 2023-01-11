From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Wed, 11 Jan 2023 11:18:29 -0800 (PST)
Subject: [PATCH] platform: generic: renesas: rzfive: Configure the Local memory regions as part of root domain
In-Reply-To: <20230111101511.1386-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <mhng-4379345f-9cb9-49fa-8285-c07af3f443bb@palmer-ri-x1c9a>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 11 Jan 2023 02:15:11 PST (-0800), prabhakar.mahadev-lad.rj at bp.renesas.com wrote:
> Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
> memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
> virtual address falls within this range, the MMU doesn't trigger a page
> fault; it assumes the virtual address is a physical address which can
> cause undesired behaviours for statically linked applications/libraries.
>
> To avoid this, add the ILM/DLM memory regions to the root domain region
> of the PMPU with permissions set to 0x0 so that any access to these
> regions gets blocked.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  platform/generic/renesas/rzfive/rzfive.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index ca182e3..76f2d3a 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -5,8 +5,25 @@
>   */
>
>  #include <platform_override.h>
> +#include <sbi/sbi_domain.h>

I can't find sbi_domain, do you have pointer to whatever this depends 
on?

>  #include <sbi_utils/fdt/fdt_helper.h>
>
> +int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
> +{
> +	/*
> +	 * Renesas RZ/Five RISC-V SoC has Instruction local memory and
> +	 * Data local memory (ILM & DLM) mapped between region 0x30000
> +	 * to 0x4FFFF. When a virtual address falls within this range,
> +	 * the MMU doesn't trigger a page fault; it assumes the virtual
> +	 * address is a physical address which can cause undesired
> +	 * behaviours for statically linked applications/libraries. To
> +	 * avoid this, add the ILM/DLM memory regions to the root domain
> +	 * region of the PMPU with permissions set to 0x0 so that any
> +	 * access to these regions gets blocked.

"blocked" means it traps with an invalid access exception?  If so we 
just need to make sure that somehow gets plumbed back in to userspace.

> +	 */
> +	return sbi_domain_root_add_memrange(0x30000, 0x20000, 0x1000, 0x0);

Since I couldn't find the code, does this also hook into something 
(maybe memblock?) to prevent allocating this region?  Nothing we can do 
if userspace asks for the VAs specifically via mmap(), but we should at 
least avoid allocating them when we can do so.

> +}
> +
>  static const struct fdt_match renesas_rzfive_match[] = {
>  	{ .compatible = "renesas,r9a07g043f01" },
>  	{ /* sentinel */ }
> @@ -14,4 +31,5 @@ static const struct fdt_match renesas_rzfive_match[] = {
>
>  const struct platform_override renesas_rzfive = {
>  	.match_table = renesas_rzfive_match,
> +	.early_init = renesas_rzfive_early_init,
>  };

