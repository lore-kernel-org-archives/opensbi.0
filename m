From: Anup Patel <anup@brainfault.org>
Date: Wed, 26 Jun 2024 18:18:23 +0530
Subject: [PATCH 1/2] lib: sbi: fwft: check feature value to be exactly 1
 or 0
In-Reply-To: <20240624102918.1410501-1-cleger@rivosinc.com>
References: <20240624102918.1410501-1-cleger@rivosinc.com>
Message-ID: <CAAhSdy3zO1TK9F3hbza+aAOOPYPWWQ1Z5BDLGiAAjBjKwM_Bhw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 24, 2024 at 4:08?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> As stated by the spec and pointed out by Andrew Jones, the value passed
> for MISALIGNED_EXC_DELEG and PTE_AD_HW_UPDATING should be either 0 or 1.
> Add check for these values and return SBI_EINVAL if not.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_fwft.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
> index aff087f..595819b 100644
> --- a/lib/sbi/sbi_fwft.c
> +++ b/lib/sbi/sbi_fwft.c
> @@ -84,10 +84,12 @@ static int fwft_misaligned_delegation_supported(struct fwft_config *conf)
>  static int fwft_set_misaligned_delegation(struct fwft_config *conf,
>                                          unsigned long value)
>  {
> -       if (value)
> +       if (value == 1)
>                 csr_set(CSR_MEDELEG, MIS_DELEG);
> -       else
> +       else if (value == 0)
>                 csr_clear(CSR_MEDELEG, MIS_DELEG);
> +       else
> +               return SBI_EINVAL;
>
>         return SBI_OK;
>  }
> @@ -111,18 +113,20 @@ static int fwft_adue_supported(struct fwft_config *conf)
>
>  static int fwft_set_adue(struct fwft_config *conf, unsigned long value)
>  {
> -       if (value)
> +       if (value == 1)
>  #if __riscv_xlen == 32
>                 csr_set(CSR_MENVCFGH, ENVCFG_ADUE >> 32);
>  #else
>                 csr_set(CSR_MENVCFG, ENVCFG_ADUE);
>  #endif
> -       else
> +       else if (value == 0)
>  #if __riscv_xlen == 32
>                 csr_clear(CSR_MENVCFGH, ENVCFG_ADUE >> 32);
>  #else
>                 csr_clear(CSR_MENVCFG, ENVCFG_ADUE);
>  #endif
> +       else
> +               return SBI_EINVAL;
>
>         return SBI_OK;
>  }
> --
> 2.45.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

