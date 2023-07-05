From: Anup Patel <anup@brainfault.org>
Date: Wed, 5 Jul 2023 11:12:50 +0530
Subject: [PATCH v7 10/11] lib: sbi: Fix timing of clearing tbuf
In-Reply-To: <20230704131208.465914-11-wxjstz@126.com>
References: <20230704131208.465914-1-wxjstz@126.com> <20230704131208.465914-11-wxjstz@126.com>
Message-ID: <CAAhSdy3f1weckfGvY2pRwGRiAbEUFkzuhJFp6U_8JBs34a33aA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 4, 2023 at 6:42?PM Xiang W <wxjstz@126.com> wrote:
>
> A single scan of the format char may add multiple characters to the
> tbuf, causing a buffer overflow. You should check if tbuf is full in
> printc so that it does not cause a buffer overflow.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_console.c | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index af5e94b..50af405 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -121,6 +121,7 @@ unsigned long sbi_ngets(char *str, unsigned long len)
>  #define PAD_ZERO 2
>  #define PAD_ALTERNATE 4
>  #define PAD_SIGN 8
> +#define USED_TBUF (1 << (8 * sizeof(int) - 1))

Why have this magical value of USED_TBUF ?

I suggest rename USED_TBUF to USE_TBUF and set its value to 16.

>  #define PRINT_BUF_LEN 64
>
>  #define va_start(v, l) __builtin_va_start((v), l)
> @@ -128,7 +129,7 @@ unsigned long sbi_ngets(char *str, unsigned long len)
>  #define va_arg __builtin_va_arg
>  typedef __builtin_va_list va_list;
>
> -static void printc(char **out, u32 *out_len, char ch)
> +static void printc(char **out, u32 *out_len, char ch, int flags)
>  {
>         if (!out) {
>                 sbi_putc(ch);
> @@ -142,8 +143,14 @@ static void printc(char **out, u32 *out_len, char ch)
>         if (!out_len || *out_len > 1) {
>                 *(*out)++ = ch;
>                 **out = '\0';
> -               if (out_len)
> +               if (out_len) {
>                         --(*out_len);
> +                       if ((flags & USED_TBUF) && *out_len == 1) {
> +                               nputs_all(console_tbuf, CONSOLE_TBUF_MAX - *out_len);
> +                               *out = console_tbuf;
> +                               *out_len = CONSOLE_TBUF_MAX;
> +                       }
> +               }
>         }
>  }
>
> @@ -154,16 +161,16 @@ static int prints(char **out, u32 *out_len, const char *string, int width,
>         width -= sbi_strlen(string);
>         if (!(flags & PAD_RIGHT)) {
>                 for (; width > 0; --width) {
> -                       printc(out, out_len, flags & PAD_ZERO ? '0' : ' ');
> +                       printc(out, out_len, flags & PAD_ZERO ? '0' : ' ', flags);
>                         ++pc;
>                 }
>         }
>         for (; *string; ++string) {
> -               printc(out, out_len, *string);
> +               printc(out, out_len, *string, flags);
>                 ++pc;
>         }
>         for (; width > 0; --width) {
> -               printc(out, out_len, ' ');
> +               printc(out, out_len, ' ', flags);
>                 ++pc;
>         }
>
> @@ -215,18 +222,18 @@ static int printi(char **out, u32 *out_len, long long i,
>
>         if (flags & PAD_ZERO) {
>                 if (sign) {
> -                       printc(out, out_len, sign);
> +                       printc(out, out_len, sign, flags);
>                         ++pc;
>                         --width;
>                 }
>                 if (i && (flags & PAD_ALTERNATE)) {
>                         if (b == 16 || b == 8) {
> -                               printc(out, out_len, '0');
> +                               printc(out, out_len, '0', flags);
>                                 ++pc;
>                                 --width;
>                         }
>                         if (b == 16) {
> -                               printc(out, out_len, 'x' - 'a' + letbase);
> +                               printc(out, out_len, 'x' - 'a' + letbase, flags);
>                                 ++pc;
>                                 --width;
>                         }
> @@ -265,15 +272,11 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>         }
>
>         for (; *format != 0; ++format) {
> -               if (use_tbuf && !console_tbuf_len) {
> -                       nputs_all(console_tbuf, CONSOLE_TBUF_MAX);
> -                       console_tbuf_len = CONSOLE_TBUF_MAX;
> -                       tout = console_tbuf;
> -               }
> -
> +               width = flags = 0;
> +               if (use_tbuf)
> +                       flags |= USED_TBUF;
>                 if (*format == '%') {
>                         ++format;
> -                       width = flags = 0;
>                         if (*format == '\0')
>                                 break;
>                         if (*format == '%')
> @@ -371,7 +374,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                         }
>                 } else {
>  literal:
> -                       printc(out, out_len, *format);
> +                       printc(out, out_len, *format, flags);
>                         ++pc;
>                 }
>         }
> --
> 2.40.1
>

Regards,
Anup

