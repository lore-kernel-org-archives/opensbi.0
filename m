From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 11 Jun 2021 13:52:51 +0000
Subject: [PATCH 1/1] lib: utils: missing initialization in thead_reset_init
In-Reply-To: <20210608200546.101536-1-xypron.glpk@gmx.de>
References: <20210608200546.101536-1-xypron.glpk@gmx.de>
Message-ID: <CO6PR04MB781272A222DFA9F46FBA8ABA8D349@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: 09 June 2021 01:36
> To: opensbi at lists.infradead.org
> Cc: Guo Ren <guoren@linux.alibaba.com>; Anup Patel
> <Anup.Patel@wdc.com>; Atish Patra <Atish.Patra@wdc.com>; Heinrich
> Schuchardt <xypron.glpk@gmx.de>
> Subject: [PATCH 1/1] lib: utils: missing initialization in thead_reset_init
> 
> If property csr-copy does not exist, fdt_getprop() will return NULL and cnt will
> have a random value from the stack.
> 
> Call clone_csrs() only if cnt is initialized to a non-zero value.
> 
> Fixes: 49e422c5ad7a ("lib: utils: reset: Add T-HEAD sample platform reset
> driver")
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/reset/fdt_reset_thead.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/utils/reset/fdt_reset_thead.c
> b/lib/utils/reset/fdt_reset_thead.c
> index 95f8c36..9f2fe03 100644
> --- a/lib/utils/reset/fdt_reset_thead.c
> +++ b/lib/utils/reset/fdt_reset_thead.c
> @@ -62,24 +62,26 @@ static int thead_reset_init(void *fdt, int nodeoff,
>  	void *p;
>  	const fdt64_t *val;
>  	const fdt32_t *val_w;
> -	int len, i, cnt;
> +	int len, i;
>  	u32 t, tmp = 0;
> 
>  	/* Prepare clone csrs */
>  	val_w = fdt_getprop(fdt, nodeoff, "csr-copy", &len);
>  	if (len > 0 && val_w) {
> -		cnt = len / sizeof(fdt32_t);
> +		int cnt;
> 
> +		cnt = len / sizeof(fdt32_t);
>  		if (cnt > MAX_CUSTOM_CSR)
>  			sbi_hart_hang();
> 
>  		for (i = 0; i < cnt; i++) {
>  			custom_csr[i].index = fdt32_to_cpu(val_w[i]);
>  		}
> +
> +		if (cnt)
> +			clone_csrs(cnt);
>  	}
> 
> -	if (cnt)
> -		clone_csrs(cnt);
> 
>  	/* Delegate plic enable regs for S-mode */
>  	val = fdt_getprop(fdt, nodeoff, "plic-delegate", &len);
> --
> 2.30.2


