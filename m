From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Jul 2023 11:25:52 +0530
Subject: [PATCH v6 09/12] lib: sbi: sbi_console.c code re-layout
In-Reply-To: <20230612080959.571293-10-wxjstz@126.com>
References: <20230612080959.571293-1-wxjstz@126.com> <20230612080959.571293-10-wxjstz@126.com>
Message-ID: <CAAhSdy0oELehTS4gPMpffjGmC2FsgRofB7HUwoPD298CJOQZyQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 12, 2023 at 1:40?PM Xiang W <wxjstz@126.com> wrote:

The patch subject is totally misleading.

>
> Move the type definitions and macros in sbi_console.c to the begin
> of the file.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_console.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 824ff6e..af93f51 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -14,8 +14,19 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
>
> +#define PAD_RIGHT 1
> +#define PAD_ZERO 2
> +#define PAD_ALTERNATE 4
> +#define PAD_SIGN 8
> +#define PRINT_BUF_LEN 64
>  #define CONSOLE_TBUF_MAX 256
>
> +#define va_start(v, l) __builtin_va_start((v), l)
> +#define va_end __builtin_va_end
> +#define va_arg __builtin_va_arg
> +
> +typedef __builtin_va_list va_list;
> +
>  static const struct sbi_console_device *console_dev = NULL;
>  static char console_tbuf[CONSOLE_TBUF_MAX];
>  static u32 console_tbuf_len;
> @@ -117,17 +128,6 @@ unsigned long sbi_ngets(char *str, unsigned long len)
>         return i;
>  }
>
> -#define PAD_RIGHT 1
> -#define PAD_ZERO 2
> -#define PAD_ALTERNATE 4
> -#define PAD_SIGN 8
> -#define PRINT_BUF_LEN 64
> -
> -#define va_start(v, l) __builtin_va_start((v), l)
> -#define va_end __builtin_va_end
> -#define va_arg __builtin_va_arg
> -typedef __builtin_va_list va_list;
> -
>  static void printc(char **out, u32 *out_len, char ch)
>  {
>         if (!out) {
> --
> 2.39.2
>

Regards,
Anup

