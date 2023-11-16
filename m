From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 09:09:13 +0530
Subject: [PATCH v3 2/2] lib: sbi: Add regions merging when sanitizing
 domain region
In-Reply-To: <IA1PR20MB49531646A00D16AC4CA87764BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <CAAhSdy3dcSXBcC2BXk+vBhyHMqos0Uf8C-n26RPXP3aTsY+yzg@mail.gmail.com>
 <IA1PR20MB49531646A00D16AC4CA87764BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy2Dw6r77DS7ZDZk6fhjRKNTCJN-nOC-_9uHJPg05-qr8w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 16, 2023 at 6:06?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> >On Wed, Nov 15, 2023 at 1:35?PM Inochi Amaoto <inochiama@outlook.com> wrote:
> >>
> >> As the domain will reject a new memory region which has a sub-regions
> >> already in the domain, even the new region is bigger and has the same
> >> flags. This problem can be solved by relaxing region restriction and
> >> rechecking when adding and sanitizing domains.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> Reviewed-by: Anup Patel <anup@brainfault.org>
> >> ---
> >>  lib/sbi/sbi_domain.c | 68 ++++++++++++++++++++++++++++++--------------
> >>  1 file changed, 46 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> >> index 71cb381..ba8ce44 100644
> >> --- a/lib/sbi/sbi_domain.c
> >> +++ b/lib/sbi/sbi_domain.c
> >> @@ -193,12 +193,11 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
> >>         return false;
> >>  }
> >>
> >> -/** Check if regionA conflicts regionB */
> >> -static bool is_region_conflict(const struct sbi_domain_memregion *regA,
> >> -                               const struct sbi_domain_memregion *regB)
> >> +/** Check if regionA can be replaced by regionB */
> >> +static bool is_region_compatible(const struct sbi_domain_memregion *regA,
> >> +                                const struct sbi_domain_memregion *regB)
> >>  {
> >> -       if ((is_region_subset(regA, regB) || is_region_subset(regB, regA)) &&
> >> -           regA->flags == regB->flags)
> >> +       if (is_region_subset(regA, regB) && regA->flags == regB->flags)
> >>                 return true;
> >>
> >>         return false;
> >> @@ -266,6 +265,11 @@ static void swap_region(struct sbi_domain_memregion* reg1,
> >>         sbi_memcpy(reg2, &treg, sizeof(treg));
> >>  }
> >>
> >> +static void clear_region(struct sbi_domain_memregion* reg)
> >> +{
> >> +       sbi_memset(reg, 0x0, sizeof(*reg));
> >> +}
> >> +
> >>  static int sanitize_domain(struct sbi_domain *dom)
> >>  {
> >>         u32 i, j, count;
> >> @@ -314,22 +318,46 @@ static int sanitize_domain(struct sbi_domain *dom)
> >>                 return SBI_EINVAL;
> >>         }
> >>
> >> +       /* Remove covered regions */
> >> +       while(i < (count - 1)) {
> >> +               reg = &dom->regions[i];
> >> +               j = i + 1;
> >> +               while (j < count) {
> >> +                       reg1 = &dom->regions[j];
> >> +
> >> +                       /* reg1 is sub-region of reg, remove reg1 */
> >> +                       if (is_region_compatible(reg1, reg)) {
> >> +                               swap_region(reg1, &dom->regions[count - 1]);
> >> +                               clear_region(&dom->regions[count - 1]);
> >> +                               count--;
> >> +                               continue;
> >> +                       }
> >> +
> >> +                       /*
> >> +                        * reg is sub-region of reg1, replace reg with reg1
> >> +                        * and recheck all other regions.
> >> +                        */
> >> +                       if (is_region_compatible(reg, reg1)) {
> >> +                               swap_region(reg, reg1);
> >> +                               swap_region(reg1, &dom->regions[count - 1]);
> >> +                               clear_region(&dom->regions[count - 1]);
> >
> >This does not seem right.
> >
> >We should disturb the sorted order of regions so all regions
> >from i + 1 to count - 1 should be shifted up.
> >
>
> It already shift up the region from i + 1 to count - 1.
> In fact, the process can be described as follows:
>
> R[i] -> ... -> R[j] -> ... -> R[c-2] -> R[c-1]        (1)
>   i              j                      count
>
> R[j] -> ... -> R[i] -> ... -> R[c-2] -> R[c-1]        (2)
>   i              j                      count
>
> R[j] -> ... -> R[c-1] -> ... -> R[c-2] -> R[i]        (3)
>   i              j                        count
>
> R[j] -> ... -> R[c-1] -> ... -> R[c-2]                (4)
>   i              j              count
>
> It just replaces pos i with j, the replace pos j with last. This make no
> change for the whole check. It just needs a recheck at pos i with new
> count - 1 boundary after swapping.
>
> The only thing needed to be changed is just replacing pos i with the last,
> without replacing pos i and j. Because we must recheck all the left regions.
> So swapping pos i and j gives no help.

This is exactly the problem. You are not maintaining the sorted
order of the regions.

..., R[i-1], R[i], R[i+1], ..., R[j-1], R[j], R[j+1], ....,
R[count-2], R[count-1]

to preserve the sorted order of regions after removal of R[i], this will be

..., R[i-1], R[i+1], ..., R[j-1], R[j], R[j+1], ...., R[count-2], R[count-1]

whereas you patch changes this to

..., R[i-1], R[j], R[i+1], ..., R[j-1], R[count-1], R[j+1], ..., R[count-2]

Further, the checking "reg1 is sub-region of reg, remove reg1" is
totally redundant if the "Remove covered regions" is moved after
"Sort the memory regions".

This patch needs to be re-written.

Regards,
Anup

>
> Please correct me if there is something I miss. Thanks.
>
> >> +                               count--;
> >> +                               goto regions_recheck;
> >> +                       }
> >> +
> >> +                       j++;
> >> +               }
> >> +
> >> +               i++;
> >> +regions_recheck:
> >> +       }
> >> +
> >>         /* Sort the memory regions */
> >>         for (i = 0; i < (count - 1); i++) {
> >>                 reg = &dom->regions[i];
> >>                 for (j = i + 1; j < count; j++) {
> >>                         reg1 = &dom->regions[j];
> >>
> >> -                       if (is_region_conflict(reg1, reg)) {
> >> -                               sbi_printf("%s: %s conflict between regions "
> >> -                                       "(base=0x%lx order=%lu flags=0x%lx) and "
> >> -                                       "(base=0x%lx order=%lu flags=0x%lx)\n",
> >> -                                       __func__, dom->name,
> >> -                                       reg->base, reg->order, reg->flags,
> >> -                                       reg1->base, reg1->order, reg1->flags);
> >> -                               return SBI_EINVAL;
> >> -                       }
> >> -
> >>                         if (!is_region_before(reg1, reg))
> >>                                 continue;
> >>
> >> @@ -576,14 +604,10 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
> >>             (ROOT_REGION_MAX <= root_memregs_count))
> >>                 return SBI_EINVAL;
> >>
> >> -       /* Check for conflicts */
> >> +       /* Check whether compatible region exists for the new one */
> >>         sbi_domain_for_each_memregion(&root, nreg) {
> >> -               if (is_region_conflict(reg, nreg)) {
> >> -                       sbi_printf("%s: is_region_conflict check failed"
> >> -                       " 0x%lx conflicts existing 0x%lx\n", __func__,
> >> -                                  reg->base, nreg->base);
> >> -                       return SBI_EALREADY;
> >> -               }
> >> +               if (is_region_compatible(reg, nreg))
> >> +                       return 0;
> >>         }
> >>
> >>         /* Append the memregion to root memregions */
> >> --
> >> 2.42.1
> >>
> >
> >Regards,
> >Anup
> >
> >

