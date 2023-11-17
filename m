From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 15:59:54 +0530
Subject: [PATCH 1/2] lib: sbi: Make console_puts/console_putc interchangeable
In-Reply-To: <20231117010440.105759-1-wxjstz@126.com>
References: <20231117010440.105759-1-wxjstz@126.com>
Message-ID: <CAAhSdy0=Yq-HaZT9oSgp_f1R0cNFjbbRBLD3RJHEO6+r6EVxOQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 17, 2023 at 6:34?AM Xiang W <wxjstz@126.com> wrote:
>
> console_puts/console_putc should replace each other, but the previous
> sbi_putc can only use console_putc. This patch improves this problem.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Guo Ren <guoren@kerenl.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_console.c | 35 +++++++++++++++++------------------
>  1 file changed, 17 insertions(+), 18 deletions(-)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 2b3b0a3..ab09a5c 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -37,28 +37,22 @@ int sbi_getc(void)
>         return -1;
>  }
>
> -void sbi_putc(char ch)
> -{
> -       if (console_dev && console_dev->console_putc) {
> -               if (ch == '\n')
> -                       console_dev->console_putc('\r');
> -               console_dev->console_putc(ch);
> -       }
> -}
> -
>  static unsigned long nputs(const char *str, unsigned long len)
>  {
> -       unsigned long i, ret;
> +       unsigned long i;
>
> -       if (console_dev && console_dev->console_puts) {
> -               ret = console_dev->console_puts(str, len);
> -       } else {
> -               for (i = 0; i < len; i++)
> -                       sbi_putc(str[i]);
> -               ret = len;
> +       if (console_dev) {
> +               if (console_dev->console_puts)
> +                       return console_dev->console_puts(str, len);
> +               else if (console_dev->console_putc) {
> +                       for (i = 0; i < len; i++) {
> +                               if (str[i] == '\n')
> +                                       console_dev->console_putc('\r');
> +                               console_dev->console_putc(str[i]);
> +                       }
> +               }
>         }
> -
> -       return ret;
> +       return len;
>  }
>
>  static void nputs_all(const char *str, unsigned long len)
> @@ -69,6 +63,11 @@ static void nputs_all(const char *str, unsigned long len)
>                 p += nputs(&str[p], len - p);
>  }
>
> +void sbi_putc(char ch)
> +{
> +       nputs_all(&ch, 1);
> +}
> +
>  void sbi_puts(const char *str)
>  {
>         unsigned long len = sbi_strlen(str);
> --
> 2.42.0
>

