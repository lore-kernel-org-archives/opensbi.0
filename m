From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 16:00:45 +0530
Subject: [PATCH 2/2] lib: utils/serial: remove semihosting_putc
In-Reply-To: <20231117010440.105759-2-wxjstz@126.com>
References: <20231117010440.105759-1-wxjstz@126.com> <20231117010440.105759-2-wxjstz@126.com>
Message-ID: <CAAhSdy1+g2qS1_30=g5TP7sXPY2swf5MhSHP8v6oJ6+BHHx2jQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 17, 2023 at 6:34?AM Xiang W <wxjstz@126.com> wrote:
>
> For some debuggers that do not implement SYSWRITEC and SYSREADC
> operations, we can use SYSWRITE and SYSREAD instead like the
> implementation of semihosting_putc(). This makes
> semihosting_putc/semihosting_puts similar. Since
> console_putc/console_puts are now interchangeable, removing the
> semihosting_putc.

This commit description needs to be re-written. I have taken care at
the time of merging this patch.

>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> Signed-off-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Guo Ren <guoren@kerenl.org>

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/serial/semihosting.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> index a27c69e..19ebaa0 100644
> --- a/lib/utils/serial/semihosting.c
> +++ b/lib/utils/serial/semihosting.c
> @@ -178,11 +178,6 @@ static unsigned long semihosting_puts(const char *str, unsigned long len)
>         return (ret < 0) ? 0 : ret;
>  }
>
> -static void semihosting_putc(char ch)
> -{
> -       semihosting_puts(&ch, 1);
> -}
> -
>  static int semihosting_getc(void)
>  {
>         char ch = 0;
> @@ -199,7 +194,6 @@ static int semihosting_getc(void)
>
>  static struct sbi_console_device semihosting_console = {
>         .name = "semihosting",
> -       .console_putc = semihosting_putc,
>         .console_puts = semihosting_puts,
>         .console_getc = semihosting_getc
>  };
> --
> 2.42.0
>

