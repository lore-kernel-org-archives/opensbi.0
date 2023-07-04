From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Jul 2023 09:34:18 +0530
Subject: [PATCH v6 02/12] lib: sbi: print not fill '0' when left-aligned
In-Reply-To: <20230612080959.571293-3-wxjstz@126.com>
References: <20230612080959.571293-1-wxjstz@126.com> <20230612080959.571293-3-wxjstz@126.com>
Message-ID: <CAAhSdy3oU3USYcp7OxhcdNDTVL0VWWMkvE_EGPKF_yiRgrCTag@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 12, 2023 at 1:40?PM Xiang W <wxjstz@126.com> wrote:
>
> Left alignment and padding '0' should not exist at the same time,
> this patch is not padded with 0 when left aligned.

s/this patch is not padded with/this patch skips padding/

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_console.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 6e07663..b7d0896 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -288,6 +288,8 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                                 if (!flags_done)
>                                         ++format;
>                         }
> +                       if (flags & PAD_RIGHT)
> +                               flags &= ~PAD_ZERO;
>                         /* Get width */
>                         width = 0;
>                         for (; *format >= '0' && *format <= '9'; ++format) {
> --
> 2.39.2
>

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

