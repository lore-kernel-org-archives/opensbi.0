From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 9 Jun 2023 05:15:38 +0100
Subject: [PATCH v5 14/14] lib: sbi: Fix invalid directive print
In-Reply-To: <20230609033643.85014-1-wxjstz@126.com>
References: <20230609033430.84471-1-wxjstz@126.com>
 <20230609033643.85014-1-wxjstz@126.com>
Message-ID: <3E9E84E3-2ED5-4AAC-8560-3D1F37EB9D63@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Jun 2023, at 04:36, Xiang W <wxjstz@126.com> wrote:
> 
> before fix:
>> printf("%1234"); /* print noting */
> after fix:
>> printf("%1234"); /* print %1234 */
> 
> Signed-off-by: Xiang W <wxjstz@126.com>

Who cares what it does? It?s UB. Going out of your way to make it do a
specific thing with extra code is a waste of time and obfuscation.

Turn on -Wformat -Werror=format and get rid of broken code.

Jess

> ---
> lib/sbi/sbi_console.c | 10 +++++++---
> 1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index f7fd761..a4ee1e5 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -266,6 +266,7 @@ static void print(struct print_info *info, const char *format, va_list args)
> {
> bool flags_done;
> char scr[2];
> + const char *format_bak;
> bool use_tbuf = (!info->out) ? true : false;
> info->pos = 0;
> info->pc = 0;
> @@ -285,6 +286,8 @@ static void print(struct print_info *info, const char *format, va_list args)
> if (use_tbuf)
> info->flags |= USED_TBUF;
> if (*format == '%') {
> + /* need restore when the directive is invalid */
> + format_bak = format;
> ++format;
> if (*format == '\0')
> break;
> @@ -377,10 +380,11 @@ static void print(struct print_info *info, const char *format, va_list args)
> prints(info, scr);
> continue;
> }
> - } else {
> -literal:
> - printc(info, *format);
> + /* invalid directive */
> + format = format_bak;
> }
> +literal:
> + printc(info, *format);
> }
> 
> if (use_tbuf && info->pos > 0)
> -- 
> 2.39.2
> 


