From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Mar 2022 18:15:33 +0530
Subject: [PATCH 1/3] lib: pmp_set/pmp_get moved errors from runtime to
 compile time
In-Reply-To: <20220315162240.40990-1-wxjstz@126.com>
References: <20220315162240.40990-1-wxjstz@126.com>
Message-ID: <CAAhSdy1pmeBDsv=AD4AYC-Oq1RfMdgtycQcb+hEaKsA3_YZfkw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 15, 2022 at 9:52 PM Xiang W <wxjstz@126.com> wrote:
>
> pmp_set/pmp_get calculates the location of the CSR register separately
> through conditional compilation. In the case of non-32-bit and 64-bit,
> we can report an error directly through #error without putting it at
> runtime
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/riscv_asm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> index 847bdba..5eab1ed 100644
> --- a/lib/sbi/riscv_asm.c
> +++ b/lib/sbi/riscv_asm.c
> @@ -261,7 +261,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
>         pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
>         pmpcfg_shift = (n & 7) << 3;
>  #else
> -       return SBI_ENOTSUPP;
> +# error "Unexpected __riscv_xlen"
>  #endif
>         pmpaddr_csr = CSR_PMPADDR0 + n;
>
> @@ -312,7 +312,7 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
>         pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
>         pmpcfg_shift = (n & 7) << 3;
>  #else
> -       return SBI_ENOTSUPP;
> +# error "Unexpected __riscv_xlen"
>  #endif
>         pmpaddr_csr = CSR_PMPADDR0 + n;
>
> --
> 2.30.2
>

