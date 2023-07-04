From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Jul 2023 09:54:16 +0530
Subject: [PATCH v6 04/12] lib: sbi: Add ' ' '\'' flags for print
In-Reply-To: <20230612080959.571293-5-wxjstz@126.com>
References: <20230612080959.571293-1-wxjstz@126.com> <20230612080959.571293-5-wxjstz@126.com>
Message-ID: <CAAhSdy1NxxRyHKyiRhxECZwEy94NuB0U+tqxgKRKpG+Q=sGnPQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 12, 2023 at 1:41?PM Xiang W <wxjstz@126.com> wrote:

No patch description ?

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_console.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 75fd5ac..6780ff2 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -288,6 +288,10 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                                 case '0':
>                                         flags |= PAD_ZERO;
>                                         break;
> +                               case ' ':
> +                               case '\'':
> +                                       /* Ignored flags, do nothing */
> +                                       break;
>                                 default:
>                                         flags_done = true;
>                                         break;
> --
> 2.39.2
>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

