From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Mon, 19 Oct 2020 17:55:01 +0000
Subject: [PATCH v3 05/16] include: sbi: Make hartmask pointer const in
 sbi_hartmask_test_hart()
In-Reply-To: <20201019125453.2460105-6-anup.patel@wdc.com>
References: <20201019125453.2460105-1-anup.patel@wdc.com>
 <20201019125453.2460105-6-anup.patel@wdc.com>
Message-ID: <3514a266763f5ee5b91c830135c41e93505bfd65.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 18:24 +0530, Anup Patel wrote:
> The sbi_hartmask_test_hart() does not modify hartmask so the
> hartmask pointer parameter should be declared const.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/sbi/sbi_hartmask.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
> index 77e42cb..f1cef0c 100644
> --- a/include/sbi/sbi_hartmask.h
> +++ b/include/sbi/sbi_hartmask.h
> @@ -67,7 +67,7 @@ static inline void sbi_hartmask_clear_hart(u32 h,
> struct sbi_hartmask *m)
>   * @param h HART id to test
>   * @param m the hartmask pointer
>   */
> -static inline int sbi_hartmask_test_hart(u32 h, struct sbi_hartmask
> *m)
> +static inline int sbi_hartmask_test_hart(u32 h, const struct
> sbi_hartmask *m)
>  {
>  	if (h < SBI_HARTMASK_MAX_BITS)
>  		return __test_bit(h, m->bits);
