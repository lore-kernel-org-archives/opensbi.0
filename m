From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Nov 2023 20:59:42 +0530
Subject: [PATCH 1/1] lib: sbi: simplify sanitize_domain()
In-Reply-To: <20231006205926.26599-1-heinrich.schuchardt@canonical.com>
References: <20231006205926.26599-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy03qDHYRkVdweV819D=P3bE_199Td_d=A3ka42=dnz4qA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 7, 2023 at 2:30?AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Since commit 112daa2e647c ("lib: sbi: Maximize the use of HART index in
> sbi_domain") the platform parameter is unused.
>
> Fixes: 112daa2e647c ("lib: sbi: Maximize the use of HART index in sbi_domain")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index fd4a296..4d248d0 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -256,8 +256,7 @@ static const struct sbi_domain_memregion *find_next_subset_region(
>         return ret;
>  }
>
> -static int sanitize_domain(const struct sbi_platform *plat,
> -                          struct sbi_domain *dom)
> +static int sanitize_domain(struct sbi_domain *dom)
>  {
>         u32 i, j, count;
>         struct sbi_domain_memregion treg, *reg, *reg1;
> @@ -494,7 +493,6 @@ int sbi_domain_register(struct sbi_domain *dom,
>         int rc;
>         struct sbi_domain *tdom;
>         u32 cold_hartid = current_hartid();
> -       const struct sbi_platform *plat = sbi_platform_thishart_ptr();
>
>         /* Sanity checks */
>         if (!dom || !assign_mask || domain_finalized)
> @@ -517,7 +515,7 @@ int sbi_domain_register(struct sbi_domain *dom,
>         }
>
>         /* Sanitize discovered domain */
> -       rc = sanitize_domain(plat, dom);
> +       rc = sanitize_domain(dom);
>         if (rc) {
>                 sbi_printf("%s: sanity checks failed for"
>                            " %s (error %d)\n", __func__,
> @@ -564,7 +562,6 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
>         int rc;
>         bool reg_merged;
>         struct sbi_domain_memregion *nreg, *nreg1, *nreg2;
> -       const struct sbi_platform *plat = sbi_platform_thishart_ptr();
>
>         /* Sanity checks */
>         if (!reg || domain_finalized || !root.regions ||
> @@ -590,7 +587,7 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
>         /* Sort and optimize root regions */
>         do {
>                 /* Sanitize the root domain so that memregions are sorted */
> -               rc = sanitize_domain(plat, &root);
> +               rc = sanitize_domain(&root);
>                 if (rc) {
>                         sbi_printf("%s: sanity checks failed for"
>                                    " %s (error %d)\n", __func__,
> --
> 2.40.1
>

