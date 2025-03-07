From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 7 Mar 2025 10:00:40 -0800
Subject: [PATCH v3] lib: sbi: Enable Control Transfer Records (CTR) Ext
 using xstateen.
In-Reply-To: <20250307124451.122828-1-rkanwal@rivosinc.com>
References: <20250307124451.122828-1-rkanwal@rivosinc.com>
Message-ID: <CAHBxVyFuiDRQhMkV7SV7toDCt6atNJT4cpkPG=aevVMfH_vx1w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 7, 2025 at 4:44?AM Rajnesh Kanwal <rkanwal@rivosinc.com> wrote:
>
> The Control Transfer Records (CTR) extension provides a method to
> record a limited branch history in register-accessible internal chip
> storage.
>
> This extension is similar to Arch LBR in x86 and BRBE in ARM.
> The Extension has been stable and the latest release can be found here
> https://github.com/riscv/riscv-control-transfer-records/release
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
>
> ---
> Changes in V3:
>         Removed FWFT bit. It was discussed in tech-prs group to
>         use trap and enable approach rather than FWFT bit. Trap
>         and enable approach leads to letter number of traps than
>         enabling and disabling FWFT bit on each CTR usage.
>         https://lists.riscv.org/g/tech-prs/message/1339
>
> Changes in V2:
>         Added FWFT bit for CTR.
> ---
>  include/sbi/riscv_encoding.h | 13 +++++++++++++
>  include/sbi/sbi_hart.h       |  4 ++++
>  lib/sbi/sbi_hart.c           |  7 +++++++
>  3 files changed, 24 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 03c68a57..f3e2afd5 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -375,6 +375,17 @@
>  #define CSR_SSTATEEN2                  0x10E
>  #define CSR_SSTATEEN3                  0x10F
>
> +/* Machine-Level Control transfer records CSRs */
> +#define CSR_MCTRCTL                     0x34e
> +
> +/* Supervisor-Level Control transfer records CSRs */
> +#define CSR_SCTRCTL                     0x14e
> +#define CSR_SCTRSTATUS                  0x14f
> +#define CSR_SCTRDEPTH                   0x15f
> +
> +/* VS-Level Control transfer records CSRs */
> +#define CSR_VSCTRCTL                    0x24e
> +
>  /* ===== Hypervisor-level CSRs ===== */
>
>  /* Hypervisor Trap Setup (H-extension) */
> @@ -799,6 +810,8 @@
>  #define SMSTATEEN0_CS                  (_ULL(1) << SMSTATEEN0_CS_SHIFT)
>  #define SMSTATEEN0_FCSR_SHIFT          1
>  #define SMSTATEEN0_FCSR                        (_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
> +#define SMSTATEEN0_CTR_SHIFT           54
> +#define SMSTATEEN0_CTR                 (_ULL(1) << SMSTATEEN0_CTR_SHIFT)
>  #define SMSTATEEN0_CONTEXT_SHIFT       57
>  #define SMSTATEEN0_CONTEXT             (_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
>  #define SMSTATEEN0_IMSIC_SHIFT         58
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 4c36c778..c3a7feb7 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -75,6 +75,10 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_ZICFISS,
>         /** Hart has Ssdbltrp extension */
>         SBI_HART_EXT_SSDBLTRP,
> +       /** HART has CTR M-mode CSRs */
> +       SBI_HART_EXT_SMCTR,
> +       /** HART has CTR S-mode CSRs */
> +       SBI_HART_EXT_SSCTR,
>
>         /** Maximum index of Hart extension */
>         SBI_HART_EXT_MAX,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 8e2979b5..c343805c 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -105,6 +105,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
>                 else
>                         mstateen_val &= ~(SMSTATEEN0_SVSLCT);
>
> +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCTR))
> +                       mstateen_val |= SMSTATEEN0_CTR;
> +               else
> +                       mstateen_val &= ~SMSTATEEN0_CTR;
> +
>                 csr_write(CSR_MSTATEEN0, mstateen_val);
>  #if __riscv_xlen == 32
>                 csr_write(CSR_MSTATEEN0H, mstateen_val >> 32);
> @@ -688,6 +693,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>         __SBI_HART_EXT_DATA(zicfilp, SBI_HART_EXT_ZICFILP),
>         __SBI_HART_EXT_DATA(zicfiss, SBI_HART_EXT_ZICFISS),
>         __SBI_HART_EXT_DATA(ssdbltrp, SBI_HART_EXT_SSDBLTRP),
> +       __SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
> +       __SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
>  };
>

LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>

>  _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
> --
> 2.43.0
>

