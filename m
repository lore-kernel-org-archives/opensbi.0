From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 16:14:51 +0530
Subject: [PATCH v3 3/3] lib: utils/ipi: mswi: add separate T-Head C9xx
 CLINT mswi compatible
In-Reply-To: <IA1PR20MB49535C88C1F556B2AD341566BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495397CC87AD8A595B45131CBBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49535C88C1F556B2AD341566BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy2v-4zxjPftKUyyuEwDtnHcBu7h227D6cKmzUkxUriUog@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 16, 2023 at 2:36?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Like the mtimer of T-HEAD C9xx clint, the mswi also needs new compatible
> string to avoid misuse.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://lore.kernel.org/linux-riscv/1f6b82a1864477a51db33d3f295889ff985b497b.1696433229.git.unicorn_wang at outlook.com/
> Reviewed-by: Guo Ren <guoren@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/utils/ipi/fdt_ipi_mswi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
> index e3a6378..5432db6 100644
> --- a/lib/utils/ipi/fdt_ipi_mswi.c
> +++ b/lib/utils/ipi/fdt_ipi_mswi.c
> @@ -56,6 +56,7 @@ static const struct fdt_match ipi_mswi_match[] = {
>         { .compatible = "riscv,clint0", .data = &clint_offset },
>         { .compatible = "sifive,clint0", .data = &clint_offset },
>         { .compatible = "thead,c900-clint", .data = &clint_offset },
> +       { .compatible = "thead,c900-aclint-mswi" },
>         { .compatible = "riscv,aclint-mswi" },
>         { },
>  };
> --
> 2.42.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

