From: Dong Du <dd_nirvana@sjtu.edu.cn>
Date: Fri, 17 Dec 2021 21:46:57 +0800 (CST)
Subject: [PATCH 1/1] lib: sbi: simplify pmp_set()
In-Reply-To: <20211217131156.17573-1-heinrich.schuchardt@canonical.com>
References: <20211217131156.17573-1-heinrich.schuchardt@canonical.com>
Message-ID: <1467723024.14214051.1639748817602.JavaMail.zimbra@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Dec 17, 2021, at 9:11 PM, Heinrich Schuchardt heinrich.schuchardt at canonical.com wrote:

> pmpcfg_csr and pmpcfg_shift are only negative for an unexpected value of
> __riscv_xlen. We can immediately return in this case.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Hi Heinrich,
  The patch looks good to me.
  I suggest to apply the same optimization also to pmp_get, which has the same issue.

Regards,
Dong

> ---
> lib/sbi/riscv_asm.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> index 2e2e148..5e5b3d3 100644
> --- a/lib/sbi/riscv_asm.c
> +++ b/lib/sbi/riscv_asm.c
> @@ -261,12 +261,9 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned
> long addr,
> 	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
> 	pmpcfg_shift = (n & 7) << 3;
> #else
> -	pmpcfg_csr   = -1;
> -	pmpcfg_shift = -1;
> +	return SBI_ENOTSUPP;
> #endif
> 	pmpaddr_csr = CSR_PMPADDR0 + n;
> -	if (pmpcfg_csr < 0 || pmpcfg_shift < 0)
> -		return SBI_ENOTSUPP;
> 
> 	/* encode PMP config */
> 	prot &= ~PMP_A;
> --
> 2.33.1
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

