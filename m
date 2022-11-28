From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 28 Nov 2022 08:20:23 +0000
Subject: [PATCH] platform: andes/ae350: Avoid repeated inclusion of
 header files
In-Reply-To: <20221116072716.1763-1-zhangleizheng@eswincomputing.com>
References: <20221116072716.1763-1-zhangleizheng@eswincomputing.com>
Message-ID: <Y4RvR2ui4Lh2zDqe@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 16, 2022 at 03:27:16PM +0800, zhangleizheng at eswincomputing.com wrote:
> From: zhangleizheng <zhangleizheng@eswincomputing.com>
> 
> Avoid cache.h reuse when compiling.
> 
> Signed-off-by: zhangleizheng <zhangleizheng@eswincomputing.com>

Looks good to me,
Thanks.

Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

> ---
>  platform/andes/ae350/cache.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/platform/andes/ae350/cache.h b/platform/andes/ae350/cache.h
> index e1c1826..8e00a1d 100644
> --- a/platform/andes/ae350/cache.h
> +++ b/platform/andes/ae350/cache.h
> @@ -7,6 +7,9 @@
>   *   Nylon Chen <nylon7@andestech.com>
>   */
>  
> +#ifndef _AE350_CACHE_H_
> +#define _AE350_CACHE_H_
> +
>  uintptr_t mcall_set_mcache_ctl(unsigned long input);
>  uintptr_t mcall_set_mmisc_ctl(unsigned long input);
>  uintptr_t mcall_icache_op(unsigned int enable);
> @@ -15,3 +18,5 @@ uintptr_t mcall_l1_cache_i_prefetch_op(unsigned long enable);
>  uintptr_t mcall_l1_cache_d_prefetch_op(unsigned long enable);
>  uintptr_t mcall_non_blocking_load_store(unsigned long enable);
>  uintptr_t mcall_write_around(unsigned long enable);
> +
> +#endif /* _AE350_CACHE_H_ */
> -- 
> 2.17.1
> 

