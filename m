From: Anup Patel <anup@brainfault.org>
Date: Mon, 10 Jul 2023 09:27:07 +0530
Subject: [PATCH v9 11/11] lib: sbi: Fix missing '\0' when buffer szie
 equal 1
In-Reply-To: <20230709160326.202193-1-wxjstz@126.com>
References: <20230709160231.202121-1-wxjstz@126.com> <20230709160326.202193-1-wxjstz@126.com>
Message-ID: <CAAhSdy3okO+KfxqdxwKTJ=ByTwQ80qQB=K=cFqrJp4TOSO4KaQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 9, 2023 at 9:34?PM Xiang W <wxjstz@126.com> wrote:
>
> Fix special case: sbi_snprintf(out, out_len, ...) when out_len equal
> 1, The previous code will not fill the buffer with any char.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_console.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 00feec8..ad04c8b 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -271,6 +271,12 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                 out_len = &console_tbuf_len;
>         }
>
> +       /* handle special case: *out_len == 1*/
> +       if (out) {
> +               if(!out_len || *out_len)
> +                       **out = '\0';
> +       }
> +
>         for (; *format != 0; ++format) {
>                 width = flags = 0;
>                 if (use_tbuf)
> --
> 2.40.1
>

