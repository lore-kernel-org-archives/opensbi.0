From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 1 May 2023 14:11:35 +0200
Subject: [PATCH] lib: sbi: Optimize probe of srst
In-Reply-To: <20230428020024.868283-1-wxjstz@126.com>
References: <20230428020024.868283-1-wxjstz@126.com>
Message-ID: <20230501-d1fcda15002dbd3c39155e12@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 28, 2023 at 10:00:24AM +0800, Xiang W wrote:
> No need to do a fully comprehensive count, just find a supported reset
> type
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_ecall_srst.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
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
>  	}
>  
> -	*out_val = (count) ? 1 : 0;
> +	*out_val = 0;
>  	return 0;
>  }
>  
> -- 
> 2.39.2
> 

Looks good, but can you send a v2 also applying the same optimization to
the SUSP extension?

Thanks,
drew

