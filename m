From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Dec 2022 21:43:24 +0800
Subject: [PATCH Zisslpcfi 2/2] lib: sbi: zsslpcfi detection and elp cfi
 state reflect back in status
In-Reply-To: <20221212030804.927309-3-debug@rivosinc.com>
References: <20221212030804.927309-1-debug@rivosinc.com> <20221212030804.927309-3-debug@rivosinc.com>
Message-ID: <CAEUhbmVbzA5UhFnV+Z_eDVBd1BizjyYjrzoJ7ymT4c=Vx6FjiQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 11:10 AM Deepak Gupta <debug@rivosinc.com> wrote:
>
> This patch adds support for zsslpcfi detection in sbi_hart.c
> If zsslpcfi is detected, this turns on menvcfg.CFI
>
> zsslpcfi records status of cfi state in xstatus csr. Missing landing pad
> sets MPELP in mstatus. When SBI is redirecting back to S/VS/HS, SPELP is
> set in sstatus/vsstatus.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  include/sbi/riscv_encoding.h |  2 ++
>  lib/sbi/sbi_hart.c           | 21 +++++++++++++++++++++
>  lib/sbi/sbi_trap.c           | 18 ++++++++++++++++++
>  3 files changed, 41 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 1fb520f..d7886e7 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -32,6 +32,8 @@
>  #define MSTATUS_TVM                    _UL(0x00100000)
>  #define MSTATUS_TW                     _UL(0x00200000)
>  #define MSTATUS_TSR                    _UL(0x00400000)
> +#define MSTATUS_SPELP                  _UL(0x10000000)
> +#define MSTATUS_MPELP                  _UL(0x20000000)
>  #define MSTATUS32_SD                   _UL(0x80000000)
>  #if __riscv_xlen == 64
>  #define MSTATUS_UXL                    _ULL(0x0000000300000000)
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 5447c52..6beae2d 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -157,6 +157,16 @@ static void mstatus_init(struct sbi_scratch *scratch)
>  #endif
>                 }
>
> +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSLPCFI)) {
> +#if __riscv_xlen == 32
> +                       unsigned long menvcfgh_val;
> +                       menvcfgh_val = csr_read(CSR_MENVCFGH);
> +                       menvcfgh_val |= ENVCFGH_CFI;
> +                       csr_write(CSR_MENVCFGH, menvcfgh_val);
> +#else
> +                       menvcfg_val |= ENVCFG_CFI;
> +#endif
> +               }
>                 csr_write(CSR_MENVCFG, menvcfg_val);
>         }
>
> @@ -555,6 +565,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>                 sbi_scratch_offset_ptr(scratch, hart_features_offset);
>         unsigned long val, oldval;
>         int rc;
> +       int ssp_exist, lplr_exist;

Use bool

>
>         /* If hart features already detected then do nothing */
>         if (hfeatures->detected)
> @@ -693,6 +704,16 @@ __mhpm_skip:
>                                         SBI_HART_EXT_SMSTATEEN, true);
>         }
>
> +       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> +               val = csr_read_allowed(CSR_SSP, (unsigned long)&trap);
> +               ssp_exist = trap.cause?0:1;

need space around ? and :

use true/false instead of 1/0

> +               val = csr_read_allowed(CSR_LPLR, (unsigned long)&trap);
> +               lplr_exist = trap.cause?0:1;
> +               if (lplr_exist & ssp_exist)
> +                       __sbi_hart_update_extension(hfeatures,
> +                                       SBI_HART_EXT_SSLPCFI, true);
> +       }
> +
>         /* Let platform populate extensions */
>         rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
>                                           hfeatures);
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index c875c90..a700041 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -87,6 +87,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>                       struct sbi_trap_info *trap)
>  {
>         ulong hstatus, vsstatus, prev_mode;
> +       bool elp = FALSE;

s/FALSE/false

>  #if __riscv_xlen == 32
>         bool prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? TRUE : FALSE;
>  #else
> @@ -100,6 +101,13 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>         if (prev_mode != PRV_S && prev_mode != PRV_U)
>                 return SBI_ENOTSUPP;
>
> +       /* If extension has support for CFI, clear MPELP because redirecting to VS or (H)S */
> +       if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSLPCFI)) {
> +               elp = (regs->mstatus & MSTATUS_MPELP)? TRUE: FALSE;
> +               /* Since redirecting, clear mpelp unconditionally */
> +               regs->mstatus &= ~MSTATUS_MPELP;
> +       }
> +
>         /* If exceptions came from VS/VU-mode, redirect to VS-mode if
>          * delegated in hedeleg
>          */
> @@ -153,6 +161,11 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>                 /* Get VS-mode SSTATUS CSR */
>                 vsstatus = csr_read(CSR_VSSTATUS);
>
> +               /*if elp was set, set it back in vsstatus */

need space after /*

> +               if (elp) {
> +                       vsstatus |= MSTATUS_SPELP;
> +               }
> +
>                 /* Set SPP for VS-mode */
>                 vsstatus &= ~SSTATUS_SPP;
>                 if (prev_mode == PRV_S)
> @@ -193,6 +206,11 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>
>                 /* Clear SIE for S-mode */
>                 regs->mstatus &= ~MSTATUS_SIE;
> +
> +               /* if elp was set, set it back in mstatus */
> +               if (elp) {
> +                       regs->mstatus |= MSTATUS_SPELP;
> +               }
>         }
>

Regards,
Bin

