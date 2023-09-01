From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 1 Sep 2023 11:01:15 -0500
Subject: [PATCH] lib: utils/timer: mtimer: Change to use correct condition
In-Reply-To: <20230901151442.1830095-1-xu.zhang@hexintek.com>
References: <20230901151442.1830095-1-xu.zhang@hexintek.com>
Message-ID: <6c105e2e-f26a-45ce-8add-bcff47226e22@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-09-01 10:14 AM, Xu Zhang wrote:
> It should use mt->mtime_addr to check align.
> 
> Signed-off-by: Xu Zhang <xu.zhang@hexintek.com>
> ---
>  lib/utils/timer/aclint_mtimer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> index 271e625..ddfa2bd 100644
> --- a/lib/utils/timer/aclint_mtimer.c
> +++ b/lib/utils/timer/aclint_mtimer.c
> @@ -187,7 +187,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
>  	/* Sanity checks */
>  	if (!mt ||
>  	    (mt->hart_count && !mt->mtimecmp_size) ||
> -	    (mt->mtime_size && (mt->mtime_addr & (ACLINT_MTIMER_ALIGN - 1))) ||
> +	    (mt->mtime_addr && (mt->mtime_addr & (ACLINT_MTIMER_ALIGN - 1))) ||

The original code is correct. The purpose is to skip the alignment check if
mtime_size == 0, or in other words, if the mtime register is not implemented. In
that case, we don't care what mtime_addr is, because it is not used.

Regards,
Samuel

>  	    (mt->mtime_size && (mt->mtime_size & (ACLINT_MTIMER_ALIGN - 1))) ||
>  	    (mt->mtimecmp_addr & (ACLINT_MTIMER_ALIGN - 1)) ||
>  	    (mt->mtimecmp_size & (ACLINT_MTIMER_ALIGN - 1)) ||


