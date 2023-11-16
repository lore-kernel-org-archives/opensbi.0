From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 12:18:15 +0530
Subject: [PATCH v2 08/11] lib: utils: fdt_fixup: Allow preserving PMU properties
In-Reply-To: <20231019113713.3508153-9-peterlin@andestech.com>
References: <20231019113713.3508153-1-peterlin@andestech.com> <20231019113713.3508153-9-peterlin@andestech.com>
Message-ID: <CAAhSdy18NUx61ZGnawEin7Jm_YkfriDYn97iOPq3O-G4rzOy9Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 19, 2023 at 5:11?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Add a scratch option to control PMU fixup, so the next
> stage software can dump the PMU node including event
> mapping information for debugging purposes.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2:
>   - New patch
> ---
>  include/sbi/sbi_scratch.h | 2 ++
>  lib/utils/fdt/fdt_fixup.c | 6 +++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index e6a33ba..7914dfb 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -151,6 +151,8 @@ enum sbi_scratch_options {
>         SBI_SCRATCH_NO_BOOT_PRINTS = (1 << 0),
>         /** Enable runtime debug prints */
>         SBI_SCRATCH_DEBUG_PRINTS = (1 << 1),
> +       /** Preserve PMU node properties */
> +       SBI_SCRATCH_PRESERVE_PMU_PROP = (1 << 2),

s/SBI_SCRATCH_PRESERVE_PMU_PROP/SBI_SCRATCH_PRESERVE_PMU_NODE/

>  };
>
>  /** Get pointer to sbi_scratch for current HART */
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index 67e2e2e..b0c885f 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -482,6 +482,8 @@ int fdt_reserved_memory_fixup(void *fdt)
>
>  void fdt_fixups(void *fdt)
>  {
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
>         fdt_aplic_fixup(fdt);
>
>         fdt_imsic_fixup(fdt);
> @@ -489,5 +491,7 @@ void fdt_fixups(void *fdt)
>         fdt_plic_fixup(fdt);
>
>         fdt_reserved_memory_fixup(fdt);
> -       fdt_pmu_fixup(fdt);
> +
> +       if (!(scratch->options & SBI_SCRATCH_PRESERVE_PMU_PROP))
> +               fdt_pmu_fixup(fdt);
>  }
> --
> 2.34.1
>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

