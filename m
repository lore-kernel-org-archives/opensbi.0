From: Samuel Holland <samuel@sholland.org>
Date: Thu, 17 Nov 2022 09:04:32 -0600
Subject: [PATCH] platform: generic/allwinner: Optimize header file
 location
In-Reply-To: <20221117071705.350-1-zhangleizheng@eswincomputing.com>
References: <20221117071705.350-1-zhangleizheng@eswincomputing.com>
Message-ID: <3cbf7efd-0132-d3d2-60b3-a0e2cb6dabdd@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/17/22 01:17, zhangleizheng at eswincomputing.com wrote:
> From: Leizheng Zhang <zhangleizheng@eswincomputing.com>
> 
> Optimize sbi/sbi_console.h file location
> 
> Signed-off-by: Leizheng Zhang <zhangleizheng@eswincomputing.com>
> ---
>  platform/generic/allwinner/sun20i-d1.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 6a502e5..d2a0f53 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -7,6 +7,7 @@
>  #include <platform_override.h>
>  #include <thead_c9xx.h>
>  #include <sbi/riscv_io.h>
> +#include <sbi/sbi_console.h>

This header is not actually used anywhere in the file, so you can just
remove it.

Regards,
Samuel

>  #include <sbi/sbi_bitops.h>
>  #include <sbi/sbi_ecall_interface.h>
>  #include <sbi/sbi_error.h>
> @@ -201,8 +202,6 @@ static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
>  	return 0;
>  }
>  
> -#include <sbi/sbi_console.h>
> -
>  static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
>  {
>  	unsigned long mip_val;


