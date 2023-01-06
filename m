From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Jan 2023 23:19:26 +0530
Subject: [PATCH 6/9] lib: utils: Use SU-{R/W/X} flags for region
 permissions during parsing
In-Reply-To: <20221220104625.80667-7-hchauhan@ventanamicro.com>
References: <20221220104625.80667-1-hchauhan@ventanamicro.com> <20221220104625.80667-7-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3FhkBFuSM4zM1TEymkPhrEb5uXuv19HELPVsFuL60XOA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 20, 2022 at 4:17 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Use the newer SU-{R/W/X} flags for checking and assigning region
> permissions.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/utils/fdt/fdt_domain.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index 0568603..f979343 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -338,9 +338,9 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
>          * 2) mmio regions protecting M-mode only mmio devices
>          */
>         sbi_domain_for_each_memregion(&root, reg) {
> -               if ((reg->flags & SBI_DOMAIN_MEMREGION_READABLE) ||
> -                   (reg->flags & SBI_DOMAIN_MEMREGION_WRITEABLE) ||
> -                   (reg->flags & SBI_DOMAIN_MEMREGION_EXECUTABLE))
> +               if ((reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE) ||
> +                   (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE) ||
> +                   (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE))
>                         continue;
>                 if (FDT_DOMAIN_REGION_MAX_COUNT <= val32)
>                         return SBI_EINVAL;
> --
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

