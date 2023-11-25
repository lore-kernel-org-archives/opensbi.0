From: Anup Patel <anup@brainfault.org>
Date: Sat, 25 Nov 2023 10:12:06 +0530
Subject: [PATCH v3 10/15] lib: utils: fdt_fixup: Allow preserving PMU properties
In-Reply-To: <20231122073617.379441-11-peterlin@andestech.com>
References: <20231122073617.379441-1-peterlin@andestech.com> <20231122073617.379441-11-peterlin@andestech.com>
Message-ID: <CAAhSdy2iMgXBJcN_OOju3cHTLa6n2hF58YnDK-X5iLAs6NWQKg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 22, 2023 at 1:10?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Add a scratch option to control PMU fixup, so the next
> stage software can dump the PMU node including event
> mapping information for debugging purposes.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - Rename to SBI_SCRATCH_PRESERVE_PMU_NODE (suggested by Anup)
>   - Include Anup's RB tag
> ---
>  include/sbi/sbi_scratch.h | 2 ++
>  lib/utils/fdt/fdt_fixup.c | 6 +++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index e6a33ba..0f67cde 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -151,6 +151,8 @@ enum sbi_scratch_options {
>         SBI_SCRATCH_NO_BOOT_PRINTS = (1 << 0),
>         /** Enable runtime debug prints */
>         SBI_SCRATCH_DEBUG_PRINTS = (1 << 1),
> +       /** Preserve PMU node properties */
> +       SBI_SCRATCH_PRESERVE_PMU_NODE = (1 << 2),

I have second thoughts about using the scratch option for this.

Let's not waste a bit in the scratch option just for debugging the PMU node.

I suggest adding the kconfig option FDT_FIXUPS_PRESERVE_PMU_NODE
in <opensbi>lib/utils/fdt/Kconfig and use it in fdt_fixups() function.

Regards,
Anup

>  };
>
>  /** Get pointer to sbi_scratch for current HART */
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index e213ded..cf20edf 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -387,6 +387,8 @@ int fdt_reserved_memory_fixup(void *fdt)
>
>  void fdt_fixups(void *fdt)
>  {
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
>         fdt_aplic_fixup(fdt);
>
>         fdt_imsic_fixup(fdt);
> @@ -394,5 +396,7 @@ void fdt_fixups(void *fdt)
>         fdt_plic_fixup(fdt);
>
>         fdt_reserved_memory_fixup(fdt);
> -       fdt_pmu_fixup(fdt);
> +
> +       if (!(scratch->options & SBI_SCRATCH_PRESERVE_PMU_NODE))
> +               fdt_pmu_fixup(fdt);
>  }
> --
> 2.34.1
>

