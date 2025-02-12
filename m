From: Anup Patel <anup@brainfault.org>
Date: Wed, 12 Feb 2025 18:10:59 +0530
Subject: [PATCH] platform: generic: thead: add Sophgo SG2044
In-Reply-To: <20250113073314.1080900-1-inochiama@gmail.com>
References: <20250113073314.1080900-1-inochiama@gmail.com>
Message-ID: <CAAhSdy1vTAyjBj7ZxgmyTNTRjKWAfmUF28toSYwTjqAma3eYMQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 13, 2025 at 1:04?PM Inochi Amaoto <inochiama@gmail.com> wrote:
>
> The Sophgo SG2044 is a new version of C920, although it supports
> sscofpmf, it still needs this pmu quirks its cores.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/thead/thead-generic.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
> index be64831..fedb614 100644
> --- a/platform/generic/thead/thead-generic.c
> +++ b/platform/generic/thead/thead-generic.c
> @@ -45,21 +45,18 @@ static struct thead_generic_quirks thead_th1520_quirks = {
>         .errata = THEAD_QUIRK_ERRATA_TLB_FLUSH | THEAD_QUIRK_ERRATA_THEAD_PMU,
>  };
>
> -static struct thead_generic_quirks canaan_k230_quirks = {
> -       .errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
> -};
> -
> -static struct thead_generic_quirks sophgo_cv1800_quirks = {
> +static struct thead_generic_quirks thead_pmu_quirks = {
>         .errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
>  };
>
>  static const struct fdt_match thead_generic_match[] = {
> -       { .compatible = "sophgo,cv1800b", .data = &sophgo_cv1800_quirks },
> -       { .compatible = "sophgo,cv1812h", .data = &sophgo_cv1800_quirks },
> -       { .compatible = "sophgo,sg2000", .data = &sophgo_cv1800_quirks },
> -       { .compatible = "sophgo,sg2002", .data = &sophgo_cv1800_quirks },
> +       { .compatible = "canaan,kendryte-k230", .data = &thead_pmu_quirks },
> +       { .compatible = "sophgo,cv1800b", .data = &thead_pmu_quirks },
> +       { .compatible = "sophgo,cv1812h", .data = &thead_pmu_quirks },
> +       { .compatible = "sophgo,sg2000", .data = &thead_pmu_quirks },
> +       { .compatible = "sophgo,sg2002", .data = &thead_pmu_quirks },
> +       { .compatible = "sophgo,sg2044", .data = &thead_pmu_quirks },
>         { .compatible = "thead,th1520", .data = &thead_th1520_quirks },
> -       { .compatible = "canaan,kendryte-k230", .data = &canaan_k230_quirks },
>         { },
>  };
>
> --
> 2.48.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

