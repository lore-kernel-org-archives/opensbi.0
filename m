From: Anup Patel <anup@brainfault.org>
Date: Wed, 22 Sep 2021 13:44:54 +0530
Subject: [PATCH V4 1/2] lib: sbi: add some macros to detect BUG at runtime
In-Reply-To: <20210916043250.8656-1-wxjstz@126.com>
References: <20210916043250.8656-1-wxjstz@126.com>
Message-ID: <CAAhSdy2nHdmF4oqU0xu5uAmQbT8iSsVuKu4gu0ZY=hQ0BzRjzw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 16, 2021 at 10:03 AM Xiang W <wxjstz@126.com> wrote:
>
> Three macros are added. One is called BUG, which is used to put in an
> unreachable branch. One is called BUG_ON, which is used to check bugs
> and assert conditions are opposite. One is called SBI_ASSERT, used for
> assertion checking.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  include/sbi/sbi_console.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> index e24ba5f..05d2f57 100644
> --- a/include/sbi/sbi_console.h
> +++ b/include/sbi/sbi_console.h
> @@ -11,6 +11,8 @@
>  #define __SBI_CONSOLE_H__
>
>  #include <sbi/sbi_types.h>
> +#include <sbi/riscv_asm.h>

Including "sbi/riscv_asm.h" is redundant with the use of sbi_hart_hang().

> +#include <sbi/sbi_hart.h>
>
>  struct sbi_console_device {
>         /** Name of the console device */
> @@ -51,4 +53,21 @@ struct sbi_scratch;
>
>  int sbi_console_init(struct sbi_scratch *scratch);
>
> +#define BUG() do { \
> +       sbi_printf("BUG: failure at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \

This line should be within 80 characters.

> +       sbi_hart_hang(); \
> +} while (0)
> +
> +#define BUG_ON(cond) do { \
> +       if (cond)       \
> +               BUG();  \
> +} while (0)
> +
> +#define SBI_ASSERT(cond) do { \
> +       if (!(cond)) { \
> +               sbi_printf("ASSERT: %s:%d/%s(): Assertion `%s` failed.\n", __FILE__,__LINE__,__func__, #cond);\

same as above.

> +               sbi_hart_hang(); \
> +       } \
> +} while (0)
> +
>  #endif
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Otherwise, this patch looks good.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

I have taken care of the above minor comments while merging this
patch. Applied this patch to the riscv/opensbi repo.

Regards,
Anup

