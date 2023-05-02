From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 2 May 2023 10:37:20 +0200
Subject: [PATCH v2] lib: sbi: Optimize probe of srst/susp
In-Reply-To: <20230501150157.6983-1-wxjstz@126.com>
References: <20230501150157.6983-1-wxjstz@126.com>
Message-ID: <20230502-823574b7ec0b4b04c1d62aa1@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 01, 2023 at 11:01:57PM +0800, Xiang W wrote:
> No need to do a fully comprehensive count, just find a supported reset
> or suspend type
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

I didn't provide any tags in my review of v1 and, if I had, it
would've been an r-b, not an s-o-b.

> ---
> V2: Add a similar optimization to susp as suggested by Andrew
> 
>  lib/sbi/sbi_ecall_srst.c |  7 ++++---
>  lib/sbi/sbi_ecall_susp.c | 10 ++++++----
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
> index 93b012c..91059d7 100644
> --- a/lib/sbi/sbi_ecall_srst.c
> +++ b/lib/sbi/sbi_ecall_srst.c
> @@ -50,7 +50,7 @@ static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
>  
>  static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
>  {
> -	u32 type, count = 0;
> +	u32 type;
>  
>  	/*
>  	 * At least one standard reset types should be supported by
> @@ -60,10 +60,11 @@ static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
>  	for (type = 0; type <= SBI_SRST_RESET_TYPE_LAST; type++) {
>  		if (sbi_system_reset_supported(type,
>  					SBI_SRST_RESET_REASON_NONE))
> -			count++;
> +			*out_val = 1;
> +			return 0;

Missing {} around these two statements. Sorry I missed that in the v1
review. Seeing them added in the SUSP change below points it out.

>  	}
>  
> -	*out_val = (count) ? 1 : 0;
> +	*out_val = 0;
>  	return 0;
>  }
>  
> diff --git a/lib/sbi/sbi_ecall_susp.c b/lib/sbi/sbi_ecall_susp.c
> index f20126c..c8b8f64 100644
> --- a/lib/sbi/sbi_ecall_susp.c
> +++ b/lib/sbi/sbi_ecall_susp.c
> @@ -25,18 +25,20 @@ static int sbi_ecall_susp_handler(unsigned long extid, unsigned long funcid,
>  
>  static int sbi_ecall_susp_probe(unsigned long extid, unsigned long *out_val)
>  {
> -	u32 type, count = 0;
> +	u32 type;
>  
>  	/*
>  	 * At least one suspend type should be supported by the
>  	 * platform for the SBI SUSP extension to be usable.
>  	 */
>  	for (type = 0; type <= SBI_SUSP_SLEEP_TYPE_LAST; type++) {
> -		if (sbi_system_suspend_supported(type))
> -			count++;
> +		if (sbi_system_suspend_supported(type)) {
> +			*out_val = 1;
> +			return 0;
> +		}
>  	}
>  
> -	*out_val = count ? 1 : 0;
> +	*out_val = 0;
>  	return 0;
>  }
>  
> -- 
> 2.39.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

