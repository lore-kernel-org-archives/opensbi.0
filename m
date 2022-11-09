From: Xiang W <wxjstz@126.com>
Date: Wed, 09 Nov 2022 23:07:58 +0800
Subject: [PATCH v2] lib: utils/serial: Fix semihosting compile error
 using LLVM
In-Reply-To: <20221108121016.1441356-1-apatel@ventanamicro.com>
References: <20221108121016.1441356-1-apatel@ventanamicro.com>
Message-ID: <4dcdf2c57c174bd13f3214d3f5f9bc663d5c110b.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-08???? 17:40 +0530?Anup Patel???
> We fix the following semihosting compile error observed using LLVM:
> lib/utils/serial/semihosting.c:158:12: error: result of comparison of constant -1 with expression of type 'char' is always true [-Werror,-
> Wtautological-constant-out-of-range-compare]
> ??????????????? ret = ch > -1 ? ch : -1;
> ????????????????????? ~~ ^ ~~
> 
> Fixes: 7f09fba86e43 ("lib: utils/serial: add semihosting support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/utils/serial/semihosting.c | 4 ++--
> ?1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> index 5012fa1..86fa296 100644
> --- a/lib/utils/serial/semihosting.c
> +++ b/lib/utils/serial/semihosting.c
> @@ -154,8 +154,8 @@ static int semihosting_getc(void)
> ????????int ret;
> ?
> ????????if (semihosting_infd < 0)? {
> -???????????????ch = semihosting_trap(SYSREADC, NULL);
> -???????????????ret = ch > -1 ? ch : -1;
> +???????????????ret = semihosting_trap(SYSREADC, NULL);
> +???????????????ret = ret < 0 ? -1 : ret;
> ????????} else
> ????????????????ret = semihosting_read(semihosting_infd, &ch, 1) > 0 ? ch : -1;
> ?
> -- 
> 2.34.1
> 
> 



