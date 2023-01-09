From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 Jan 2023 01:36:32 -0800
Subject: [PATCH v4 6/7] lib: sbi: Add console_puts() callback in the
 console device
In-Reply-To: <20230104145006.947830-7-apatel@ventanamicro.com>
References: <20230104145006.947830-1-apatel@ventanamicro.com> <20230104145006.947830-7-apatel@ventanamicro.com>
Message-ID: <CAOnJCUJC2OB-8J++96DfyN031VMXdSKhjOKTfO06YZ4tbaxn_Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 4, 2023 at 6:50 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add console_puts() callback in the console device which allows
> console drivers (such as semihosting) to implement a specialized
> way to output character string.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>  include/sbi/sbi_console.h |  3 +++
>  lib/sbi/sbi_console.c     | 19 ++++++++++++++-----
>  2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> index 660c239..8e95b9d 100644
> --- a/include/sbi/sbi_console.h
> +++ b/include/sbi/sbi_console.h
> @@ -19,6 +19,9 @@ struct sbi_console_device {
>         /** Write a character to the console output */
>         void (*console_putc)(char ch);
>
> +       /** Write a character string to the console output */
> +       void (*console_puts)(const char *str, unsigned long len);
> +
>         /** Read a character from the console input */
>         int (*console_getc)(void);
>  };
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 3942320..bf7c071 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -12,6 +12,7 @@
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_string.h>
>
>  static const struct sbi_console_device *console_dev = NULL;
>  static spinlock_t console_out_lock            = SPIN_LOCK_INITIALIZER;
> @@ -44,9 +45,13 @@ void sbi_putc(char ch)
>  void sbi_puts(const char *str)
>  {
>         spin_lock(&console_out_lock);
> -       while (*str) {
> -               sbi_putc(*str);
> -               str++;
> +       if (console_dev && console_dev->console_puts) {
> +               console_dev->console_puts(str, sbi_strlen(str));
> +       } else {
> +               while (*str) {
> +                       sbi_putc(*str);
> +                       str++;
> +               }
>         }
>         spin_unlock(&console_out_lock);
>  }
> @@ -56,8 +61,12 @@ void sbi_nputs(const char *str, unsigned long len)
>         unsigned long i;
>
>         spin_lock(&console_out_lock);
> -       for (i = 0; i < len; i++)
> -               sbi_putc(str[i]);
> +       if (console_dev && console_dev->console_puts) {
> +               console_dev->console_puts(str, len);
> +       } else {
> +               for (i = 0; i < len; i++)
> +                       sbi_putc(str[i]);
> +       }
>         spin_unlock(&console_out_lock);
>  }
>
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

