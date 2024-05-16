From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 May 2024 11:16:00 +0530
Subject: [PATCH] platform: generic: thead: add Sophgo CV18XX/SG200X series
In-Reply-To: <IA1PR20MB4953463968312055179421F0BBE32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953463968312055179421F0BBE32@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy2_0VhO6pGc2wkWvV4pyZbmZ5wWgzcJ5nyDPUDA27Kj=w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 14, 2024 at 10:23?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> The Sophgo CV18XX/SG200X series SoCs have a standard C906
> core. Add support for it.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/thead/thead-generic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
> index 3b59a0d..c82e0c1 100644
> --- a/platform/generic/thead/thead-generic.c
> +++ b/platform/generic/thead/thead-generic.c
> @@ -49,7 +49,15 @@ static struct thead_generic_quirks canaan_k230_quirks = {
>         .errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
>  };
>
> +static struct thead_generic_quirks sophgo_cv1800_quirks = {
> +       .errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
> +};
> +
>  static const struct fdt_match thead_generic_match[] = {
> +       { .compatible = "sophgo,cv1800b", .data = &sophgo_cv1800_quirks },
> +       { .compatible = "sophgo,cv1812h", .data = &sophgo_cv1800_quirks },
> +       { .compatible = "sophgo,sg2000", .data = &sophgo_cv1800_quirks },
> +       { .compatible = "sophgo,sg2002", .data = &sophgo_cv1800_quirks },
>         { .compatible = "thead,th1520", .data = &thead_th1520_quirks },
>         { .compatible = "canaan,kendryte-k230", .data = &canaan_k230_quirks },
>         { },
> --
> 2.45.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

