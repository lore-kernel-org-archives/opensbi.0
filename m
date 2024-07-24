From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 Jul 2024 11:05:24 +0530
Subject: [PATCH] lib: sbi_hsm: Save/restore menvcfg only when it exists
In-Reply-To: <20240710142629.2327391-1-samuel.holland@sifive.com>
References: <20240710142629.2327391-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy2pKdh8K4bnRxRogcHf=+FD0thU1PkZBHE++sP+Sm2RVg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 10, 2024 at 7:56?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Attempting to access the menvcfg CSR raises an illegal instruction
> exception on hardware which implements Sm1p11 or older.
>
> Fixes: e9ee9678ba50 ("lib: sbi: fwft: add support for SBI_FWFT_PTE_AD_HW_UPDATING")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

This is a critical fix. I think we should have an incremental
1.5.1 release with this fix.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  lib/sbi/sbi_hsm.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 7e32af37..3706acfb 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -423,10 +423,12 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
>         hdata->saved_mie = csr_read(CSR_MIE);
>         hdata->saved_mip = csr_read(CSR_MIP) & (MIP_SSIP | MIP_STIP);
>         hdata->saved_medeleg = csr_read(CSR_MEDELEG);
> +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
>  #if __riscv_xlen == 32
> -       hdata->saved_menvcfgh = csr_read(CSR_MENVCFGH);
> +               hdata->saved_menvcfgh = csr_read(CSR_MENVCFGH);
>  #endif
> -       hdata->saved_menvcfg = csr_read(CSR_MENVCFG);
> +               hdata->saved_menvcfg = csr_read(CSR_MENVCFG);
> +       }
>  }
>
>  static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
> @@ -434,10 +436,12 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
>         struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
>                                                             hart_data_offset);
>
> -       csr_write(CSR_MENVCFG, hdata->saved_menvcfg);
> +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
> +               csr_write(CSR_MENVCFG, hdata->saved_menvcfg);
>  #if __riscv_xlen == 32
> -       csr_write(CSR_MENVCFGH, hdata->saved_menvcfgh);
> +               csr_write(CSR_MENVCFGH, hdata->saved_menvcfgh);
>  #endif
> +       }
>         csr_write(CSR_MEDELEG, hdata->saved_medeleg);
>         csr_write(CSR_MIE, hdata->saved_mie);
>         csr_set(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

