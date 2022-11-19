From: Xiang W <wxjstz@126.com>
Date: Sat, 19 Nov 2022 16:27:58 +0800
Subject: [PATCH v2] platform: generic/allwinner: Remove unused header
 files
In-Reply-To: <20221118052029.1275-1-zhangleizheng@eswincomputing.com>
References: <20221118052029.1275-1-zhangleizheng@eswincomputing.com>
Message-ID: <03bbab92b95b4341c47bf0fbb7e9d68458fa15c0.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-18???? 13:20 +0800?zhangleizheng at eswincomputing.com???
> From: Leizheng Zhang <zhangleizheng@eswincomputing.com>
> 
> Remove "#include <sbi/sbi_console.h>"
> 
> Signed-off-by: Leizheng Zhang <zhangleizheng@eswincomputing.com>
Look good to me

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?platform/generic/allwinner/sun20i-d1.c | 2 --
> ?1 file changed, 2 deletions(-)
> 
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 6a502e5..707313b 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -201,8 +201,6 @@ static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
> ????????return 0;
> ?}
> ?
> -#include <sbi/sbi_console.h>
> -
> ?static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
> ?{
> ????????unsigned long mip_val;
> -- 
> 2.17.1
> 
> 



