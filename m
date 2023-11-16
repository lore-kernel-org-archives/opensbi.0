From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 21:13:29 +0530
Subject: [PATCH v4 1/2] lib: sbi: separate the swap operation of domain region
In-Reply-To: <IA1PR20MB495392B05FE034A393C7C539BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535E12C4609D9816C7C824BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495392B05FE034A393C7C539BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy1wR1gNDfY2BXNzpZRdU9OLfRZUCJjzbp5jUP_kDUnbTA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 16, 2023 at 4:18?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Swapping domain region is a common operation when sorting domain region,
> so separate it as a function to make code clean.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 4d248d0..71cb381 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -256,10 +256,20 @@ static const struct sbi_domain_memregion *find_next_subset_region(
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
>  static int sanitize_domain(struct sbi_domain *dom)
>  {
>         u32 i, j, count;
> -       struct sbi_domain_memregion treg, *reg, *reg1;
> +       struct sbi_domain_memregion *reg, *reg1;
>
>         /* Check possible HARTs */
>         if (!dom->possible_harts) {
> @@ -323,9 +333,7 @@ static int sanitize_domain(struct sbi_domain *dom)
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
> 2.42.1
>

