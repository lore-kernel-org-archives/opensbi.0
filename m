From: Anup Patel <anup@brainfault.org>
Date: Wed, 22 Jun 2022 10:47:22 +0530
Subject: [PATCH] lib: utils/timer: Remove Allwinner D1 CLINT compatibles
In-Reply-To: <20220622045742.18200-1-samuel@sholland.org>
References: <20220622045742.18200-1-samuel@sholland.org>
Message-ID: <CAAhSdy2qL6pUF+2KG-pZbByW3RKWk64gCm8Ugx15ShusTuHCDg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 22, 2022 at 10:27 AM Samuel Holland <samuel@sholland.org> wrote:
>
> The allwinner,sun20i-d1-clint compatible string is not documented in any
> official binding, so it should not be used by drivers.
>
> The MSWI in the D1 CLINT is compatible with the ACLINT specification, so
> it can take advantage of generic driver support. However, that is only
> possible if the MSWI and MTIMER are split into separate DT nodes. This
> means the final binding for this device is likely to be incompatible
> with what is implemented here.

I don't think splitting D1 CLINT into two separate DT nodes is
wrong because traditionally CLINT has been a composite device
(consisting of a timer and IPI device).

If you want resemblance of DT with HW then you can do something
like below:

clint {
    mswi at abc {
        ...
    };

    mtimer at xyz {
        ...
    };
};

>
> Remove this compatible string from the driver to prevent it from
> appearing in a stable version and causing future issues.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>
>  lib/utils/ipi/fdt_ipi_mswi.c       | 1 -
>  lib/utils/timer/fdt_timer_mtimer.c | 6 ------
>  2 files changed, 7 deletions(-)
>
> diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
> index af69e16..0176941 100644
> --- a/lib/utils/ipi/fdt_ipi_mswi.c
> +++ b/lib/utils/ipi/fdt_ipi_mswi.c
> @@ -54,7 +54,6 @@ static int ipi_mswi_cold_init(void *fdt, int nodeoff,
>  static const unsigned long clint_offset = CLINT_MSWI_OFFSET;
>
>  static const struct fdt_match ipi_mswi_match[] = {
> -       { .compatible = "allwinner,sun20i-d1-clint", .data = &clint_offset },
>         { .compatible = "riscv,clint0", .data = &clint_offset },
>         { .compatible = "sifive,clint0", .data = &clint_offset },
>         { .compatible = "riscv,aclint-mswi" },
> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> index e140567..7b8546b 100644
> --- a/lib/utils/timer/fdt_timer_mtimer.c
> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> @@ -109,18 +109,12 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>         return 0;
>  }
>
> -static const struct timer_mtimer_quirks d1_clint_quirks = {
> -       .mtime_offset   = CLINT_MTIMER_OFFSET,
> -       .has_64bit_mmio = false,
> -};
> -
>  static const struct timer_mtimer_quirks sifive_clint_quirks = {
>         .mtime_offset   = CLINT_MTIMER_OFFSET,
>         .has_64bit_mmio = true,
>  };
>
>  static const struct fdt_match timer_mtimer_match[] = {
> -       { .compatible = "allwinner,sun20i-d1-clint", .data = &d1_clint_quirks },
>         { .compatible = "riscv,clint0", .data = &sifive_clint_quirks },
>         { .compatible = "sifive,clint0", .data = &sifive_clint_quirks },
>         { .compatible = "riscv,aclint-mtimer" },
> --
> 2.35.1
>

