From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Feb 2023 09:25:54 +0530
Subject: [PATCH v2] lib: sbi: fix missing '\r' for console
In-Reply-To: <20230213020821.109087-1-wxjstz@126.com>
References: <20230213020821.109087-1-wxjstz@126.com>
Message-ID: <CAAhSdy3SvbA=XSaoGrSAriN3Qk0LeEkkBafzeAbBHHJnAR3vEA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 13, 2023 at 8:09 AM Xiang W <wxjstz@126.com> wrote:
>
> print is finally implemented by sbi_putc or console_dev->puts. sbi_putc
> will add a \r before the output \n. This patch adds missing \r when
> outputting characters via console_dev->puts.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
>
> Changes since v2:
> - Fix the bug reported by Samuel. Prevent p from accessing memory other
>   than strings.
> ---
>  lib/sbi/sbi_console.c | 46 +++++++++++++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index f3ac003..f8560c9 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -46,27 +46,43 @@ void sbi_putc(char ch)
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
> +       const char *s, *p, *e;
> +       s = str;
> +       e = str + len;
> +       while (s < e) {
> +               p = sbi_strchr(s, '\n');
> +               p = p ? p : e;
> +               console_puts_all(s, p - s);
> +               if (p < e && *p == '\n')
> +                       console_puts_all("\r\n", 2);
> +               s = p + 1;
> +       }
> +       return len;
> +}
> +
>  static unsigned long nputs(const char *str, unsigned long len)
>  {
> -       unsigned long i, ret;
> +       unsigned long i;
>
>         if (console_dev && console_dev->console_puts) {
> -               ret = console_dev->console_puts(str, len);
> +               console_puts(str, len);
>         } else {
>                 for (i = 0; i < len; i++)
>                         sbi_putc(str[i]);
> -               ret = len;
>         }
>
> -       return ret;
> -}
> -
> -static void nputs_all(const char *str, unsigned long len)
> -{
> -       unsigned long p = 0;
> -
> -       while (p < len)
> -               p += nputs(&str[p], len - p);
> +       return len;

This patch is already broken because it changes the semantics
of nputs() and nputs_all(). The nputs() is supposed is allowed
to do partial writes whereas nputs_all() only returns after printing
all characters.

Regards,
Anup

>  }
>
>  void sbi_puts(const char *str)
> @@ -74,7 +90,7 @@ void sbi_puts(const char *str)
>         unsigned long len = sbi_strlen(str);
>
>         spin_lock(&console_out_lock);
> -       nputs_all(str, len);
> +       nputs(str, len);
>         spin_unlock(&console_out_lock);
>  }
>
> @@ -255,7 +271,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>
>         for (; *format != 0; ++format) {
>                 if (use_tbuf && !console_tbuf_len) {
> -                       nputs_all(console_tbuf, CONSOLE_TBUF_MAX);
> +                       nputs(console_tbuf, CONSOLE_TBUF_MAX);
>                         console_tbuf_len = CONSOLE_TBUF_MAX;
>                         tout = console_tbuf;
>                 }
> @@ -386,7 +402,7 @@ literal:
>         }
>
>         if (use_tbuf && console_tbuf_len < CONSOLE_TBUF_MAX)
> -               nputs_all(console_tbuf, CONSOLE_TBUF_MAX - console_tbuf_len);
> +               nputs(console_tbuf, CONSOLE_TBUF_MAX - console_tbuf_len);
>
>         return pc;
>  }
> --
> 2.39.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

