From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Jul 2023 11:14:10 +0530
Subject: [PATCH v6 07/12] lib: sbi: Fix printi
In-Reply-To: <20230612080959.571293-8-wxjstz@126.com>
References: <20230612080959.571293-1-wxjstz@126.com> <20230612080959.571293-8-wxjstz@126.com>
Message-ID: <CAAhSdy0p45BikJmTQ-ABaQkYtAiRY3vHsv4C74tZ-2oXJV_YBQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 12, 2023 at 1:40?PM Xiang W <wxjstz@126.com> wrote:
>
> Fix two bug:
> > printf("%#08x", 0x123); /* print 0000x123 */
> > printf("%#x", 0); /* print 0x0 */
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_console.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 047c51e..6f714f0 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -227,23 +227,33 @@ static int printi(char **out, u32 *out_len, long long i,
>                 }
>         }
>
> -       if (flags & PAD_ALTERNATE) {
> -               if ((b == 16) && (letbase == 'A')) {
> -                       *--s = 'X';
> -               } else if ((b == 16) && (letbase == 'a')) {
> -                       *--s = 'x';
> -               }
> -               *--s = '0';
> -       }
> -
> -       if (sign) {
> -               if (width && (flags & PAD_ZERO)) {
> +       if (flags & PAD_ZERO) {
> +               if (sign) {
>                         printc(out, out_len, sign);
>                         ++pc;
>                         --width;
> -               } else {
> -                       *--s = sign;
>                 }
> +               if (i && (flags & PAD_ALTERNATE)) {
> +                       if (b == 16 || b == 8) {
> +                               printc(out, out_len, '0');
> +                               ++pc;
> +                               --width;
> +                       }
> +                       if (b == 16) {
> +                               printc(out, out_len, 'x' - 'a' + letbase);
> +                               ++pc;
> +                               --width;
> +                       }
> +               }
> +       } else {
> +               if (i && (flags & PAD_ALTERNATE)) {
> +                       if (b == 16)
> +                               *--s = 'x' - 'a' + letbase;
> +                       if (b == 16 || b == 8)
> +                               *--s = '0';
> +               }
> +               if (sign)
> +                       *--s = sign;
>         }
>
>         return pc + prints(out, out_len, s, width, flags);
> --
> 2.39.2
>

