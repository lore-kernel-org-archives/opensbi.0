From: Anup Patel <anup@brainfault.org>
Date: Sat, 10 Dec 2022 19:51:44 +0530
Subject: [PATCH v2] lib: utils/fdt: Add full valid detection for __fdt_parse_region
In-Reply-To: <20221207173644.1106040-1-wxjstz@126.com>
References: <20221207173644.1106040-1-wxjstz@126.com>
Message-ID: <CAAhSdy0W0zRDDjJ1vUP2F3yrEf_EV2P-VJnqm09RLokyGfuiBw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 7, 2022 at 11:07 PM Xiang W <wxjstz@126.com> wrote:
>
> The original code only detects region->order, and a certain relationship
> needs to be satisfied between region->order and region->base. This patch
> detects whether the region in fdt is valid through sbi_is_region_valid

The sbi_domain_register() already checks is_region_valid() on each
region via sanitize_domain().

Calling is_region_valid() in __fdt_parse_region() is unnecessary.

Regards,
Anup

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> REF -> v2
> * is_region_valid is local function, change it public and rename
>   sbi_is_region_valid
> ---
>  include/sbi/sbi_domain.h   | 7 +++++++
>  lib/sbi/sbi_domain.c       | 4 ++--
>  lib/utils/fdt/fdt_domain.c | 5 +++--
>  3 files changed, 12 insertions(+), 4 deletions(-)
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index 5553d21..fdd73a9 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -109,6 +109,13 @@ extern struct sbi_domain *domidx_to_domain_table[];
>  #define sbi_domain_for_each_memregion(__d, __r) \
>         for ((__r) = (__d)->regions; (__r)->order; (__r)++)
>
> +/**
> + * Check if sbi_domain_memregion is valid
> + * @param reg pointrt to the sbi_domain_memregion that needs to be check
> + * @return True if reg is vaild sbi_domain_memregion
> +*/
> +bool sbi_is_region_valid(const struct sbi_domain_memregion *reg);
> +
>  /**
>   * Check whether given HART is assigned to specified domain
>   * @param dom pointer to domain
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 3302213..08f0ea6 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -141,7 +141,7 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
>  }
>
>  /* Check if region complies with constraints */
> -static bool is_region_valid(const struct sbi_domain_memregion *reg)
> +bool sbi_is_region_valid(const struct sbi_domain_memregion *reg)
>  {
>         if (reg->order < 3 || __riscv_xlen < reg->order)
>                 return FALSE;
> @@ -226,7 +226,7 @@ static int sanitize_domain(const struct sbi_platform *plat,
>                 return SBI_EINVAL;
>         }
>         sbi_domain_for_each_memregion(dom, reg) {
> -               if (!is_region_valid(reg)) {
> +               if (!sbi_is_region_valid(reg)) {
>                         sbi_printf("%s: %s has invalid region base=0x%lx "
>                                    "order=%lu flags=0x%lx\n", __func__,
>                                    dom->name, reg->base, reg->order,
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index bd0eec3..49908f5 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -257,8 +257,6 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
>         if (!val && len >= 4)
>                 return SBI_EINVAL;
>         val32 = fdt32_to_cpu(*val);
> -       if (val32 < 3 || __riscv_xlen < val32)
> -               return SBI_EINVAL;
>         region->order = val32;
>
>         /* Read "mmio" DT property */
> @@ -266,6 +264,9 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
>         if (fdt_get_property(fdt, region_offset, "mmio", NULL))
>                 region->flags |= SBI_DOMAIN_MEMREGION_MMIO;
>
> +       if(!sbi_is_region_valid(region))
> +               return SBI_EINVAL;
> +
>         (*region_count)++;
>
>         return 0;
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

