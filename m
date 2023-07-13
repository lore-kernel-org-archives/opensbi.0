From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jul 2023 15:05:18 +0530
Subject: [PATCH] lib: sbi: Configure seed bits when MSECCFG is readable
In-Reply-To: <20230712083254.1585244-1-sameo@rivosinc.com>
References: <20230712083254.1585244-1-sameo@rivosinc.com>
Message-ID: <CAAhSdy0RWOG35ZM0teiJG6WE9vN1Z7YBuWsPHANr3BeX+ioLMQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 2:03?PM Samuel Ortiz <sameo@rivosinc.com> wrote:
>
> When MSECCFFG is not trapped, giving exclusive access to the SEED CSR to
> S-Mode (SSEED=1, USEED=0) seems like a reasonable default. It gives the
> Linux kernel the ability to add entropy to its randomness pool while
> preventing user mode from accessing it.
>
> Eventually, this check will be enhanced with a check for the Zkr
> extensions through the riscv,isa-extensions dt-bindings.
>
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>

Latest OpenSBI has ISA string parsing which can be used to
detect more extensions. You can even enhance this to support
the new DT bindings as well.

> ---
>  include/sbi/riscv_encoding.h |  5 +++++
>  lib/sbi/sbi_hart.c           | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 4ebed97..6a66d32 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -223,6 +223,9 @@
>  #define ENVCFG_CBIE_INV                        _UL(0x3)
>  #define ENVCFG_FIOM                    _UL(0x1)
>
> +#define SECCFG_SSEED                   (_ULL(1) << 9)
> +#define SECCFG_USEED                   (_ULL(1) << 8)
> +
>  /* ===== User-level CSRs ===== */
>
>  /* User Trap Setup (N-extension) */
> @@ -444,6 +447,8 @@
>  /* Machine Configuration */
>  #define CSR_MENVCFG                    0x30a
>  #define CSR_MENVCFGH                   0x31a
> +#define CSR_MSECCFG                    0x747
> +#define CSR_MSECCFGH                   0x757
>
>  /* Machine Trap Handling */
>  #define CSR_MSCRATCH                   0x340
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 0c27fd7..39af37c 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -703,6 +703,19 @@ __mhpm_skip:
>                                         SBI_HART_EXT_SMSTATEEN, true);
>         }
>
> +       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11) {

This should be >= SBI_HART_PRIV_VER_1_12 since mseccfg CSR
was introduced with Priv v1.12

> +               val = csr_read_allowed(CSR_MSECCFG, (unsigned long)&trap);
> +               if (!trap.cause) {
> +                       /* Disable unprivileged access to the SEED CSR */
> +                       val &= ~SECCFG_USEED;
> +
> +                       /* Enable S-Mode access to the SEED CSR */
> +                       val |= SECCFG_SSEED;
> +
> +                       csr_write(CSR_MSECCFG, val);

Over here, we should only detect seed CSR (i.e. Zksed extension)
while the mseccfg CSR should be programmed in mstatus_init().

> +               }
> +       }
> +
>         /* Let platform populate extensions */
>         rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
>                                           hfeatures);
>
> base-commit: ea6533ada828cf71b9359f566be0f9c640022543
> --
> 2.41.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

