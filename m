From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Jul 2023 10:24:56 +0530
Subject: [PATCH v6 06/12] lib: sbi: print add 'o' type
In-Reply-To: <20230612080959.571293-7-wxjstz@126.com>
References: <20230612080959.571293-1-wxjstz@126.com> <20230612080959.571293-7-wxjstz@126.com>
Message-ID: <CAAhSdy1kASFsQnDy2GkMJdgTYgeZmhRht6QAL0BM0ChtrBHeKQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 12, 2023 at 1:40?PM Xiang W <wxjstz@126.com> wrote:

No patch description ?

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_console.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index a9a2ed6..047c51e 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -328,7 +328,8 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                                              width, flags, *format);
>                                 continue;
>                         }
> -                       if ((*format == 'u') || (*format == 'x') || (*format == 'X')) {
> +                       if ((*format == 'u') || (*format == 'o')
> +                                        || (*format == 'x') || (*format == 'X')) {
>                                 pc += printi(out, out_len, va_arg(args, unsigned int),
>                                              width, flags, *format);
>                                 continue;
> @@ -342,7 +343,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                                 type = 'i';
>                                 if (format[1] == 'l') {
>                                         ++format;
> -                                       if ((format[1] == 'u')
> +                                       if ((format[1] == 'u') || (format[1] == 'o')
>                                                         || (format[1] == 'd') || (format[1] == 'i')
>                                                         || (format[1] == 'x') || (format[1] == 'X')) {
>                                                 ++format;
> @@ -352,7 +353,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                                                 width, flags, type);
>                                         continue;
>                                 }
> -                               if ((format[1] == 'u')
> +                               if ((format[1] == 'u') || (format[1] == 'o')
>                                                 || (format[1] == 'd') || (format[1] == 'i')
>                                                 || (format[1] == 'x') || (format[1] == 'X')) {
>                                         ++format;
> --
> 2.39.2
>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

