From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 22 Feb 2023 13:24:05 +0100
Subject: [PATCH v2] lib: sbi: sbi_ecall: Check the range of SBI error
In-Reply-To: <20230222024854.24876-1-peterlin@andestech.com>
References: <20230222024854.24876-1-peterlin@andestech.com>
Message-ID: <20230222122405.uoi2kavjdngy5q5a@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 22, 2023 at 10:48:54AM +0800, Yu Chien Peter Lin wrote:
> We should also check if the return error code is greater than 0
> (SBI_SUCCESS), as this is an invalid error.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> Changes v1 -> v2:
> - Include Xiang's Reviewed-by
> - Drop the 'ret -> out_err' rename

The SBI_ENOTSUPP -> SBI_ERR_NOT_SUPPORTED rename was also dropped, but as
Anup suggests, we should probably do a full rework of that in another
series later.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

> ---
>  lib/sbi/sbi_ecall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> index 27ce5d49..d0f01665 100644
> --- a/lib/sbi/sbi_ecall.c
> +++ b/lib/sbi/sbi_ecall.c
> @@ -120,7 +120,7 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
>  		trap.epc = regs->mepc;
>  		sbi_trap_redirect(regs, &trap);
>  	} else {
> -		if (ret < SBI_LAST_ERR) {
> +		if (ret < SBI_LAST_ERR || SBI_SUCCESS < ret) {
>  			sbi_printf("%s: Invalid error %d for ext=0x%lx "
>  				   "func=0x%lx\n", __func__, ret,
>  				   extension_id, func_id);
> -- 
> 2.34.1
> 

