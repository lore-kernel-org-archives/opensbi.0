From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 21 Feb 2023 18:21:24 +0100
Subject: [PATCH] lib: sbi: sbi_ecall: Improve return SBI error
In-Reply-To: <20230221104756.28573-1-peterlin@andestech.com>
References: <20230221104756.28573-1-peterlin@andestech.com>
Message-ID: <20230221172124.34ccwi3cg2c2ilff@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 21, 2023 at 06:47:56PM +0800, Yu Chien Peter Lin wrote:
> We should also check if the return error code is greater than 0
> (SBI_SUCCESS), as this is an invalid error.
> 
> Also rename the variable returned via a0 to 'out_err' and use
> SBI_ERR_NOT_SUPPORTED when the extension does not have a handler
> for consistency with the standard SBI errors defined in Table 1
> of the SBI specification.

It's best to do renames separate from functional changes, and, in
this case, the ret -> out_err rename feels like unnecessary churn.

Thanks,
drew

> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  lib/sbi/sbi_ecall.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> index 27ce5d49..8accf675 100644
> --- a/lib/sbi/sbi_ecall.c
> +++ b/lib/sbi/sbi_ecall.c
> @@ -97,34 +97,34 @@ void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext)
>  
>  int sbi_ecall_handler(struct sbi_trap_regs *regs)
>  {
> -	int ret = 0;
> +	int out_err = 0;
> +	unsigned long out_val = 0;
>  	struct sbi_ecall_extension *ext;
>  	unsigned long extension_id = regs->a7;
>  	unsigned long func_id = regs->a6;
>  	struct sbi_trap_info trap = {0};
> -	unsigned long out_val = 0;
>  	bool is_0_1_spec = 0;
>  
>  	ext = sbi_ecall_find_extension(extension_id);
>  	if (ext && ext->handle) {
> -		ret = ext->handle(extension_id, func_id,
> +		out_err = ext->handle(extension_id, func_id,
>  				  regs, &out_val, &trap);
>  		if (extension_id >= SBI_EXT_0_1_SET_TIMER &&
>  		    extension_id <= SBI_EXT_0_1_SHUTDOWN)
>  			is_0_1_spec = 1;
>  	} else {
> -		ret = SBI_ENOTSUPP;
> +		out_err = SBI_ERR_NOT_SUPPORTED;
>  	}
>  
> -	if (ret == SBI_ETRAP) {
> +	if (out_err == SBI_ETRAP) {
>  		trap.epc = regs->mepc;
>  		sbi_trap_redirect(regs, &trap);
>  	} else {
> -		if (ret < SBI_LAST_ERR) {
> +		if (out_err < SBI_LAST_ERR || SBI_SUCCESS < out_err) {
>  			sbi_printf("%s: Invalid error %d for ext=0x%lx "
> -				   "func=0x%lx\n", __func__, ret,
> +				   "func=0x%lx\n", __func__, out_err,
>  				   extension_id, func_id);
> -			ret = SBI_ERR_FAILED;
> +			out_err = SBI_ERR_FAILED;
>  		}
>  
>  		/*
> @@ -136,7 +136,7 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
>  		 * case should be handled differently.
>  		 */
>  		regs->mepc += 4;
> -		regs->a0 = ret;
> +		regs->a0 = out_err;
>  		if (!is_0_1_spec)
>  			regs->a1 = out_val;
>  	}
> -- 
> 2.34.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

