From: Guo Ren <guoren@kernel.org>
Date: Wed, 25 Oct 2023 14:51:47 +0800
Subject: [PATCH 2/2] lib: utils/serial: remove semihosting_putc
In-Reply-To: <20231025043104.748104-2-wxjstz@126.com>
References: <20231025043104.748104-1-wxjstz@126.com> <20231025043104.748104-2-wxjstz@126.com>
Message-ID: <CAJF2gTRLBhjkSOOg=uz=XapN6uv6DKPpwLHeM928Go3xpwc91g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 25, 2023 at 12:31?PM Xiang W <wxjstz@126.com> wrote:
>
> For some debuggers that do not implement SYSWRITEC and SYSREADC
> operations, we can use SYSWRITE and SYSREAD instead like the
> implementation of semihosting_putc(). This makes
> semihosting_putc/semihosting_puts similar. Since
> console_putc/console_puts are now interchangeable, removing the
> semihosting_putc.
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/utils/serial/semihosting.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> index ce65887..19ebaa0 100644
> --- a/lib/utils/serial/semihosting.c
> +++ b/lib/utils/serial/semihosting.c
> @@ -160,11 +160,6 @@ static long semihosting_write(long fd, const void *memp, size_t len)
>
>  /* clang-format on */
>
> -static void semihosting_putc(char ch)
> -{
> -       semihosting_trap(SYSWRITEC, &ch);
> -}
> -
>  static unsigned long semihosting_puts(const char *str, unsigned long len)
>  {
>         char ch;
> @@ -199,7 +194,6 @@ static int semihosting_getc(void)
>
>  static struct sbi_console_device semihosting_console = {
>         .name = "semihosting",
> -       .console_putc = semihosting_putc,
Reviewed-by: Guo Ren <guoren@kerenl.org>

>         .console_puts = semihosting_puts,
>         .console_getc = semihosting_getc
>  };
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Best Regards
 Guo Ren

