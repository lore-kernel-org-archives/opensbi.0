From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Nov 2022 16:47:36 +0800
Subject: [PATCH] platform: andes/ae350: Avoid repeated inclusion of header files
In-Reply-To: <20221116072716.1763-1-zhangleizheng@eswincomputing.com>
References: <20221116072716.1763-1-zhangleizheng@eswincomputing.com>
Message-ID: <CAEUhbmVz1JTN_yWArB4qzj2g_rSEnoxfBLSYhA1KWjUNiWK2=Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 16, 2022 at 3:29 PM <zhangleizheng@eswincomputing.com> wrote:
>
> From: zhangleizheng <zhangleizheng@eswincomputing.com>
>
> Avoid cache.h reuse when compiling.
>
> Signed-off-by: zhangleizheng <zhangleizheng@eswincomputing.com>

nits: use "First Name" "Last Name" as the git.user.name

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

Otherwise,
Reviewed-by: Bin Meng <bmeng@tinylab.org>

