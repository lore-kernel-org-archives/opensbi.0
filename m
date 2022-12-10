From: Anup Patel <anup@brainfault.org>
Date: Sat, 10 Dec 2022 22:15:17 +0530
Subject: [PATCH 1/3] lib: utils/ipi: mswi: add T-Head C9xx CLINT compatible
In-Reply-To: <20221209070120.944152-2-uwu@icenowy.me>
References: <20221209070120.944152-1-uwu@icenowy.me> <20221209070120.944152-2-uwu@icenowy.me>
Message-ID: <CAAhSdy2u_P9aCWUHnVWHLN+Tn_rTbV-X76YZvxwCGR43T7822Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 9, 2022 at 12:31 PM Icenowy Zheng <uwu@icenowy.me> wrote:
>
> Althoug the MTIMER part of a C9xx CLINT differs from a SiFive one, the
> MSWI part is compliant.
>
> Add T-Head C9xx CLINT compatible string to fdt_ipi_mswi code, sharing
> the same codepath with SiFive CLINT.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/utils/ipi/fdt_ipi_mswi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
> index 0176941..4dc91f2 100644
> --- a/lib/utils/ipi/fdt_ipi_mswi.c
> +++ b/lib/utils/ipi/fdt_ipi_mswi.c
> @@ -56,6 +56,7 @@ static const unsigned long clint_offset = CLINT_MSWI_OFFSET;
>  static const struct fdt_match ipi_mswi_match[] = {
>         { .compatible = "riscv,clint0", .data = &clint_offset },
>         { .compatible = "sifive,clint0", .data = &clint_offset },
> +       { .compatible = "thead,c900-clint", .data = &clint_offset },
>         { .compatible = "riscv,aclint-mswi" },
>         { },
>  };
> --
> 2.38.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

