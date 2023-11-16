From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 16:09:39 +0530
Subject: [PATCH v3 2/3] lib: utils/timer: mtimer: add separate T-Head C9xx
 CLINT mtimer compatible
In-Reply-To: <IA1PR20MB4953CBA138C8AE2410A21C33BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495397CC87AD8A595B45131CBBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953CBA138C8AE2410A21C33BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy34OexruH0=V0qLho+HGzUs06uEVSHJe5Q=aHaAfnBxww@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 16, 2023 at 2:36?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> T-HEAD allows soc vendor to map the mtimer and mswi of C9xx clint on
> different address, which may cause a misuse if use the same compatible
> string, add a new timer compatible string to avoid this.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://lore.kernel.org/linux-riscv/6e48cbe5e60f9ada2fd1fe58e803e127f1a678e5.1696433229.git.unicorn_wang at outlook.com/
> Reviewed-by: Guo Ren <guoren@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/utils/timer/fdt_timer_mtimer.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> index 29560fb..86ad1aa 100644
> --- a/lib/utils/timer/fdt_timer_mtimer.c
> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> @@ -145,10 +145,17 @@ static const struct timer_mtimer_quirks thead_clint_quirks = {
>         .without_mtime  = true,
>  };
>
> +static const struct timer_mtimer_quirks thead_aclint_quirks = {
> +       .has_64bit_mmio = false,
> +       .custom_aclint  = true,
> +};
> +
>  static const struct fdt_match timer_mtimer_match[] = {
>         { .compatible = "riscv,clint0", .data = &sifive_clint_quirks },
>         { .compatible = "sifive,clint0", .data = &sifive_clint_quirks },
>         { .compatible = "thead,c900-clint", .data = &thead_clint_quirks },
> +       { .compatible = "thead,c900-aclint-mtimer",
> +         .data = &thead_aclint_quirks },
>         { .compatible = "riscv,aclint-mtimer" },
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

