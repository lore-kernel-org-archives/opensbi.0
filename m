From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Dec 2023 17:49:20 +0530
Subject: [PATCH v4 06/15] platform: generic: Introduce pmu_init() platform override
In-Reply-To: <20231130124213.2590640-7-peterlin@andestech.com>
References: <20231130124213.2590640-1-peterlin@andestech.com> <20231130124213.2590640-7-peterlin@andestech.com>
Message-ID: <CAAhSdy0aKRtAN7xD9BNpJOzkBWxkNMNQL4-jfVwj8yuEDjgaVA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 30, 2023 at 6:13?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Add pmu_init() platform override, which will be used to register
> PMU device and populate event mappings.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> Changes v2 -> v3:
>   - New patch
> Changes v3 -> v4:
>   - Only return pmu_init override on error so fdt_pmu_setup() can be executed
>   - Include RB tags
> ---
>  platform/generic/include/platform_override.h | 1 +
>  platform/generic/platform.c                  | 6 ++++++
>  2 files changed, 7 insertions(+)
>
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
> index fa400b9..f17e94e 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -267,6 +267,12 @@ static int generic_pmu_init(void)
>  {
>         int rc;
>
> +       if (generic_plat && generic_plat->pmu_init) {
> +               rc = generic_plat->pmu_init(generic_plat_match);
> +               if (rc)
> +                       return rc;
> +       }
> +
>         rc = fdt_pmu_setup(fdt_get_address());
>         if (rc && rc != SBI_ENOENT)
>                 return rc;
> --
> 2.34.1
>

