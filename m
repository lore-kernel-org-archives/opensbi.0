From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 20:54:48 +0530
Subject: [PATCH v4] lib: sbi: fix missing '\r' for console
In-Reply-To: <20230213090929.144906-1-wxjstz@126.com>
References: <20230213090929.144906-1-wxjstz@126.com>
Message-ID: <CAAhSdy2425+iLY1z4QjQ1awpUzhx-MuXjPsj58ZztSx1u16qaw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 13, 2023 at 2:40 PM Xiang W <wxjstz@126.com> wrote:
>
> print is finally implemented by sbi_putc or console_dev->puts. sbi_putc
> will add a \r before the output \n. This patch adds missing \r when
> outputting characters via console_dev->puts.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
>
> Changes since v4:
> - nputs_all come back
> - implement partial writes as much as possible
>
> Changes since v3:
> - Prevent string overflow when looking for \n
>
> Changes since v2:
> - Fix the bug reported by Samuel. Prevent p from accessing memory other
>   than strings.
>
> ---
>  lib/sbi/sbi_console.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index f3ac003..4be5a8f 100644
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
> +               p = sbi_strchr(s, '\n');

Introduce "char *sbi_strnchr(const char *s, int c, size_t count)" and
use it here. This will simplify the below condition in "if ()" as well.

> +               if (p == NULL || p > e)
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
> 2.39.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

