From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 21:55:28 +0530
Subject: [PATCH v5 2/2] lib: sbi: fix missing '\r' for console
In-Reply-To: <20230227161906.634775-3-wxjstz@126.com>
References: <20230227161906.634775-1-wxjstz@126.com> <20230227161906.634775-3-wxjstz@126.com>
Message-ID: <CAAhSdy2vCAyff+_CMBQ-z+PtcqFQPT58uifA0w5SyvR7bvtcPw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 27, 2023 at 9:50?PM Xiang W <wxjstz@126.com> wrote:
>
> print is finally implemented by sbi_putc or console_dev->puts. sbi_putc
> will add a \r before the output \n. This patch adds missing \r when
> outputting characters via console_dev->puts.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_console.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index f3ac003..adeadcb 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -46,12 +46,41 @@ void sbi_putc(char ch)
>         }
>  }
>
> +static unsigned long console_puts_all(const char *str, unsigned long len)
> +{
> +       const char *s = str;
> +       const char *e = s + len;
> +       while (s < e)
> +               s += console_dev->console_puts(s, e - s);
> +       return len;
> +}
> +
> +static unsigned long console_puts(const char *str, unsigned long len)
> +{
> +       unsigned long l;
> +       const char *s, *p, *e;
> +       s = str;
> +       e = str + len;
> +       while (s < e) {
> +               p = sbi_strnchr(s, '\n', e - s);
> +               if (p == NULL)
> +                       p = e;
> +               l = console_dev->console_puts(s, p - s);
> +               if (l < p - s)
> +                       return s - str + l;
> +               if (p < e && *p == '\n')
> +                       console_puts_all("\r\n", 2);
> +               s = p + 1;
> +       }
> +       return len;
> +}
> +
>  static unsigned long nputs(const char *str, unsigned long len)
>  {
>         unsigned long i, ret;
>
>         if (console_dev && console_dev->console_puts) {
> -               ret = console_dev->console_puts(str, len);
> +               ret = console_puts(str, len);
>         } else {
>                 for (i = 0; i < len; i++)
>                         sbi_putc(str[i]);
> --
> 2.39.2
>

