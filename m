From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 14:49:11 +0000
Subject: [PATCH v3 06/15] platform: generic: Introduce pmu_init() platform override
In-Reply-To: <20231122073617.379441-7-peterlin@andestech.com>
References: <20231122073617.379441-1-peterlin@andestech.com> <20231122073617.379441-7-peterlin@andestech.com>
Message-ID: <CA+V-a8uFMbPYYQ5jrjQ3VuSMZ0d3i9cacPOYMZXdOew0bBymaQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 22, 2023 at 7:41?AM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Add pmu_init() platform override which will be used to register
> PMU device and populate event mappings.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v2 -> v3:
>   - New patch
> ---
>  platform/generic/include/platform_override.h | 1 +
>  platform/generic/platform.c                  | 3 +++
>  2 files changed, 4 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
> index bf4b112..f2a4327 100644
> --- a/platform/generic/include/platform_override.h
> +++ b/platform/generic/include/platform_override.h
> @@ -27,6 +27,7 @@ struct platform_override {
>         int (*fdt_fixup)(void *fdt, const struct fdt_match *match);
>         int (*extensions_init)(const struct fdt_match *match,
>                                struct sbi_hart_features *hfeatures);
> +       int (*pmu_init)(const struct fdt_match *match);
>         void (*fw_init)(void *fdt, const struct fdt_match *match);
>         int (*vendor_ext_provider)(long funcid,
>                                    const struct sbi_trap_regs *regs,
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index fa400b9..54a913b 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -267,6 +267,9 @@ static int generic_pmu_init(void)
>  {
>         int rc;
>
> +       if (generic_plat && generic_plat->pmu_init)
> +               return generic_plat->pmu_init(generic_plat_match);
> +
>         rc = fdt_pmu_setup(fdt_get_address());
>         if (rc && rc != SBI_ENOENT)
>                 return rc;
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

