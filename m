From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jun 2024 16:44:42 +0530
Subject: [PATCH v4 1/2] lib: sbi: Add support for Svade and Svadu extensions
In-Reply-To: <20240605121110.14784-2-yongxuan.wang@sifive.com>
References: <20240605121110.14784-1-yongxuan.wang@sifive.com> <20240605121110.14784-2-yongxuan.wang@sifive.com>
Message-ID: <CAAhSdy12myby_5bVQw-W_L2vbUM0-kJtEUGpMmh9=9Q-ZNaikA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 5, 2024 at 5:41?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
>
> Add support for Svade and Svadu extensions. When both are present in the
> device tree, the M-mode firmware should select the Svade extension
> to comply with the RVA23 profile, which mandates Svade and lists Svadu as
> an optional extension.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/riscv_encoding.h |  1 +
>  include/sbi/sbi_hart.h       |  4 ++++
>  lib/sbi/sbi_hart.c           | 12 ++++++++++++
>  3 files changed, 17 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index d914828e13af..477fa3a1ad86 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -211,6 +211,7 @@
>
>  #define ENVCFG_STCE                    (_ULL(1) << 63)
>  #define ENVCFG_PBMTE                   (_ULL(1) << 62)
> +#define ENVCFG_ADUE                    (_ULL(1) << 61)
>  #define ENVCFG_CDE                     (_ULL(1) << 60)
>  #define ENVCFG_CBZE                    (_UL(1) << 7)
>  #define ENVCFG_CBCFE                   (_UL(1) << 6)
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index cc78eec6f65a..81ec061d36a9 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -63,6 +63,10 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_SSCSRIND,
>         /** Hart has Ssccfg extension */
>         SBI_HART_EXT_SSCCFG,
> +       /** Hart has Svade extension */
> +       SBI_HART_EXT_SVADE,
> +       /** Hart has Svadu extension */
> +       SBI_HART_EXT_SVADU,
>
>         /** Maximum index of Hart extension */
>         SBI_HART_EXT_MAX,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index cd974cc1a8da..c3667019b9a1 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -135,9 +135,19 @@ static void mstatus_init(struct sbi_scratch *scratch)
>  #endif
>                 __set_menvcfg_ext(SBI_HART_EXT_SSTC, ENVCFG_STCE)
>                 __set_menvcfg_ext(SBI_HART_EXT_SMCDELEG, ENVCFG_CDE);
> +               __set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);
>
>  #undef __set_menvcfg_ext
>
> +               /*
> +                * When both Svade and Svadu are present in DT, the default scheme for managing
> +                * the PTE A/D bits should use Svade. Check Svadu before Svade extension to ensure
> +                * that the ADUE bit is cleared when the Svade support are specified.
> +                */
> +
> +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
> +                       menvcfg_val &= ~ENVCFG_ADUE;
> +
>                 csr_write(CSR_MENVCFG, menvcfg_val);
>  #if __riscv_xlen == 32
>                 csr_write(CSR_MENVCFGH, menvcfg_val >> 32);
> @@ -668,6 +678,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>         __SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
>         __SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
>         __SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
> +       __SBI_HART_EXT_DATA(svade, SBI_HART_EXT_SVADE),
> +       __SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
>  };
>
>  _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

