From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Jul 2022 17:12:47 +0530
Subject: [PATCH] lib: sbi: Fix sbi_snprintf
In-Reply-To: <20220726112522.5070-1-ajones@ventanamicro.com>
References: <20220726112522.5070-1-ajones@ventanamicro.com>
Message-ID: <CAAhSdy2STYM0nP94wWxP_1U-VNQvFJmPyF=zP00V9tCfFJ8Gbg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 26, 2022 at 4:55 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> printc would happily write to 'out' even when 'out_len' was zero,
> potentially overflowing buffers. Rework printc to not do that and
> also ensure the null byte is written at the last position when
> necessary, as stated in the snprintf man page. Finally, ensure all
> writes to 'out' go through printc and rename a goto label which
> clashed with it.
>
> Fixes: 9e8ff05cb61f ("Initial commit.")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  lib/sbi/sbi_console.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 34c843d3f9e3..47f361705fc7 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -76,20 +76,24 @@ typedef __builtin_va_list va_list;
>
>  static void printc(char **out, u32 *out_len, char ch)
>  {
> -       if (out) {
> -               if (*out) {
> -                       if (out_len && (0 < *out_len)) {
> -                               **out = ch;
> -                               ++(*out);
> -                               (*out_len)--;
> -                       } else {
> -                               **out = ch;
> -                               ++(*out);
> -                       }
> -               }
> -       } else {
> +       if (!out) {
>                 sbi_putc(ch);
> +               return;
>         }
> +
> +       if (!*out)
> +               return;

What if the output buffer is filled with zeros ?

> +
> +       if (!out_len || *out_len > 1)
> +               **out = ch;
> +       else if (*out_len == 1)
> +               **out = '\0';
> +
> +       if (out_len && *out_len > 0)
> +               --(*out_len);
> +
> +       if (!out_len || *out_len > 0)
> +               ++(*out);
>  }
>
>  static int prints(char **out, u32 *out_len, const char *string, int width,
> @@ -193,7 +197,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                         if (*format == '\0')
>                                 break;
>                         if (*format == '%')
> -                               goto out;
> +                               goto literal;
>                         /* Get flags */
>                         if (*format == '-') {
>                                 ++format;
> @@ -332,13 +336,14 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                                 continue;
>                         }
>                 } else {
> -               out:
> +literal:
>                         printc(out, out_len, *format);
>                         ++pc;
>                 }
>         }
> +
>         if (out)
> -               **out = '\0';
> +               printc(out, out_len, '\0');
>
>         return pc;
>  }
> --
> 2.36.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

