From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Nov 2023 12:21:31 +0530
Subject: [PATCH v2 3/3] lib: sbi: Add regions merging when sanitizing
 domain region
In-Reply-To: <IA1PR20MB4953272F8B5C9000CDA69F02BBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49533A7AB5888E0117F7799BBBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953272F8B5C9000CDA69F02BBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy0xVowOfN3xeNMB-XT+kcjnKpitTUckvMeNSwDCNb4-BQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 10, 2023 at 6:30?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> As the domain will reject a new memory region which has a sub-regions
> already in the domain, even the new region is bigger and has the same
> flags. This problem can be solved by relaxing region restriction and
> rechecking when adding and sanitizing domains.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  lib/sbi/sbi_domain.c | 66 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 45 insertions(+), 21 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 2b9d16f..9e9cdad 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -193,12 +193,11 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
>         return false;
>  }
>
> -/** Check if regionA conflicts regionB */
> -static bool is_region_conflict(const struct sbi_domain_memregion *regA,
> -                               const struct sbi_domain_memregion *regB)
> +/** Check if regionA can be replaced by regionB */
> +static bool is_region_compatible(const struct sbi_domain_memregion *regA,
> +                                const struct sbi_domain_memregion *regB)
>  {
> -       if ((is_region_subset(regA, regB) || is_region_subset(regB, regA)) &&
> -           regA->flags == regB->flags)
> +       if (is_region_subset(regA, regB) && regA->flags == regB->flags)
>                 return true;
>
>         return false;
> @@ -266,6 +265,11 @@ static void swap_region(struct sbi_domain_memregion* reg1,
>         sbi_memcpy(reg2, &treg, sizeof(treg));
>  }
>
> +static void clear_region(struct sbi_domain_memregion* reg)
> +{
> +       sbi_memset(reg, 0x0, sizeof(*reg));
> +}
> +
>  static int sanitize_domain(const struct sbi_platform *plat,
>                            struct sbi_domain *dom)
>  {
> @@ -315,22 +319,46 @@ static int sanitize_domain(const struct sbi_platform *plat,
>                 return SBI_EINVAL;
>         }
>
> +       /* Remove covered regions */
> +       while(i < (count - 1)) {
> +               reg = &dom->regions[i];
> +               j = i + 1;
> +               while (j < count) {
> +                       reg1 = &dom->regions[j];
> +
> +                       /* reg1 is sub-region of reg, remove reg1 */
> +                       if (is_region_compatible(reg1, reg)) {
> +                               swap_region(reg1, &dom->regions[count - 1]);
> +                               clear_region(&dom->regions[count - 1]);
> +                               count--;
> +                               continue;
> +                       }
> +
> +                       /*
> +                        * reg is sub-region of reg1, replace reg with reg1
> +                        * and recheck all other regions.
> +                        */
> +                       if (is_region_compatible(reg, reg1)) {
> +                               swap_region(reg, reg1);
> +                               swap_region(reg1, &dom->regions[count - 1]);
> +                               clear_region(&dom->regions[count - 1]);
> +                               count--;
> +                               goto regions_recheck;
> +                       }
> +
> +                       j++;
> +               }
> +
> +               i++;
> +regions_recheck:
> +       }
> +
>         /* Sort the memory regions */
>         for (i = 0; i < (count - 1); i++) {
>                 reg = &dom->regions[i];
>                 for (j = i + 1; j < count; j++) {
>                         reg1 = &dom->regions[j];
>
> -                       if (is_region_conflict(reg1, reg)) {
> -                               sbi_printf("%s: %s conflict between regions "
> -                                       "(base=0x%lx order=%lu flags=0x%lx) and "
> -                                       "(base=0x%lx order=%lu flags=0x%lx)\n",
> -                                       __func__, dom->name,
> -                                       reg->base, reg->order, reg->flags,
> -                                       reg1->base, reg1->order, reg1->flags);
> -                               return SBI_EINVAL;
> -                       }
> -
>                         if (!is_region_before(reg1, reg))
>                                 continue;
>
> @@ -581,12 +609,8 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
>
>         /* Check for conflicts */

This comment needs to change.

>         sbi_domain_for_each_memregion(&root, nreg) {
> -               if (is_region_conflict(reg, nreg)) {
> -                       sbi_printf("%s: is_region_conflict check failed"
> -                       " 0x%lx conflicts existing 0x%lx\n", __func__,
> -                                  reg->base, nreg->base);
> -                       return SBI_EALREADY;
> -               }
> +               if (is_region_compatible(reg, nreg))
> +                       return 0;
>         }
>
>         /* Append the memregion to root memregions */
> --
> 2.42.0
>

Otherwise, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

