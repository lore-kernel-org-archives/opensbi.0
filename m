From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Nov 2023 22:26:07 +0530
Subject: [PATCH v2 1/3] lib: sbi: separate the swap operation of domain region
In-Reply-To: <IA1PR20MB49533CD1EAD7784957CF4361BBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49533A7AB5888E0117F7799BBBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49533CD1EAD7784957CF4361BBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy3f2gnRPbKy0i1QSRo8xht5EwMaj60yQ9h+GLhNQX4B-w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 10, 2023 at 6:30?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Swapping domain region is a common operation when sorting domain region,
> so separate it as a function to make code clean.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index fd4a296..283b598 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -256,11 +256,21 @@ static const struct sbi_domain_memregion *find_next_subset_region(
>         return ret;
>  }
>
> +static void swap_region(struct sbi_domain_memregion* reg1,
> +                       struct sbi_domain_memregion* reg2)
> +{
> +       struct sbi_domain_memregion treg;
> +
> +       sbi_memcpy(&treg, reg1, sizeof(treg));
> +       sbi_memcpy(reg1, reg2, sizeof(treg));
> +       sbi_memcpy(reg2, &treg, sizeof(treg));
> +}
> +
>  static int sanitize_domain(const struct sbi_platform *plat,
>                            struct sbi_domain *dom)
>  {
>         u32 i, j, count;
> -       struct sbi_domain_memregion treg, *reg, *reg1;
> +       struct sbi_domain_memregion *reg, *reg1;
>
>         /* Check possible HARTs */
>         if (!dom->possible_harts) {
> @@ -324,9 +334,7 @@ static int sanitize_domain(const struct sbi_platform *plat,
>                         if (!is_region_before(reg1, reg))
>                                 continue;
>
> -                       sbi_memcpy(&treg, reg1, sizeof(treg));
> -                       sbi_memcpy(reg1, reg, sizeof(treg));
> -                       sbi_memcpy(reg, &treg, sizeof(treg));
> +                       swap_region(reg, reg1);
>                 }
>         }
>
> --
> 2.42.0
>

