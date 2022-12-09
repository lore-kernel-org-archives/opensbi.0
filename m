From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Dec 2022 14:11:23 +0530
Subject: [PATCH v2 2/3] lib: fix __fdt_parse_region()
In-Reply-To: <20221208011421.11624-3-heinrich.schuchardt@canonical.com>
References: <20221208011421.11624-1-heinrich.schuchardt@canonical.com> <20221208011421.11624-3-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy25aTcMbw0m+wehcd13G2-LfUPV__5NZaA8GB4+2TpaZg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 8, 2022 at 6:44 AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> If fdt_getprop() returns NULL, this indicates an error. In this case lenp
> is set to an error code. But even if lenp = 0 we should not continue.
>
> If fdt_getprop() returns a wider value than we expect this is a separate
> error condition.
>
> In both cases the device-tree is invalid.
>
> Addresses-Coverity-ID: 1529703 ("Dereference after null check")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> v2:
>         correct the len requirements
> ---
>  lib/utils/fdt/fdt_domain.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index bd0eec3..0568603 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -246,7 +246,7 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
>
>         /* Read "base" DT property */
>         val = fdt_getprop(fdt, region_offset, "base", &len);
> -       if (!val && len >= 8)
> +       if (!val || len != 8)
>                 return SBI_EINVAL;
>         val64 = fdt32_to_cpu(val[0]);
>         val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
> @@ -254,7 +254,7 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
>
>         /* Read "order" DT property */
>         val = fdt_getprop(fdt, region_offset, "order", &len);
> -       if (!val && len >= 4)
> +       if (!val || len != 4)
>                 return SBI_EINVAL;
>         val32 = fdt32_to_cpu(*val);
>         if (val32 < 3 || __riscv_xlen < val32)
> --
> 2.37.2
>

