From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Nov 2022 12:01:13 +0530
Subject: [PATCH v2] platform: generic/allwinner: Remove unused header files
In-Reply-To: <20221118052029.1275-1-zhangleizheng@eswincomputing.com>
References: <20221118052029.1275-1-zhangleizheng@eswincomputing.com>
Message-ID: <CAAhSdy0dVEt2pjsQPE0cuE5_WCBXVn9aq3Udm6MX-=nvdjGfZw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 18, 2022 at 10:51 AM <zhangleizheng@eswincomputing.com> wrote:
>
> From: Leizheng Zhang <zhangleizheng@eswincomputing.com>
>
> Remove "#include <sbi/sbi_console.h>"
>
> Signed-off-by: Leizheng Zhang <zhangleizheng@eswincomputing.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/allwinner/sun20i-d1.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 6a502e5..707313b 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -201,8 +201,6 @@ static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
>         return 0;
>  }
>
> -#include <sbi/sbi_console.h>
> -
>  static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
>  {
>         unsigned long mip_val;
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

