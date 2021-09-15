From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Sep 2021 15:41:19 +0800
Subject: [PATCH 1/2] lib: sbi: add some macros to detect BUG at runtime
In-Reply-To: <20210915064258.13064-1-wxjstz@126.com>
References: <20210915064258.13064-1-wxjstz@126.com>
Message-ID: <CAEUhbmXTdZ3B+mDZiSb_xSFUj+HkB-SxS-1ugOWV23eKNbLtJQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 15, 2021 at 2:44 PM Xiang W <wxjstz@126.com> wrote:
>
> Two macros are mainly added. One is called BUG(), which is used to put
> in unreachable branches. One named BUG_ON, used for assertion.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  include/sbi/sbi_console.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> index e24ba5f..ce08541 100644
> --- a/include/sbi/sbi_console.h
> +++ b/include/sbi/sbi_console.h
> @@ -11,6 +11,7 @@
>  #define __SBI_CONSOLE_H__
>
>  #include <sbi/sbi_types.h>
> +#include <sbi/riscv_asm.h>
>
>  struct sbi_console_device {
>         /** Name of the console device */
> @@ -51,4 +52,17 @@ struct sbi_scratch;
>
>  int sbi_console_init(struct sbi_scratch *scratch);
>
> +#define BUG() do { \
> +       sbi_printf("BUG: failure at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
> +       while (1)       \
> +               wfi();  \
> +       __builtin_unreachable(); \
> +} while (0)
> +
> +#define BUG_ON(cond) do { \
> +       if (cond)       \
> +               break;  \
> +       BUG(); \
> +} while (1)

Shouldn't this be:

if (cond)
    BUG()

?

Regards,
Bin

