From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 12 Nov 2022 00:49:46 -0800
Subject: [RFC PATCH 2/3] lib: sbi: Add sbi_nputs() function
In-Reply-To: <20221110170016.1477865-3-apatel@ventanamicro.com>
References: <20221110170016.1477865-1-apatel@ventanamicro.com> <20221110170016.1477865-3-apatel@ventanamicro.com>
Message-ID: <CAOnJCUKu7EqzsoKxqdcO=MqkvRQXbcJKS3wJRO457Ce1QuXSfQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 10, 2022 at 9:01 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add new sbi_nputs() which help us print a fixed number of characters
> from a physical memory location.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_console.h |  2 ++
>  lib/sbi/sbi_console.c     | 10 ++++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> index e15b55d..1bdeeb9 100644
> --- a/include/sbi/sbi_console.h
> +++ b/include/sbi/sbi_console.h
> @@ -33,6 +33,8 @@ void sbi_putc(char ch);
>
>  void sbi_puts(const char *str);
>
> +void sbi_nputs(const char *str, unsigned long len);
> +
>  void sbi_gets(char *s, int maxwidth, char endchar);
>
>  int __printf(2, 3) sbi_sprintf(char *out, const char *format, ...);
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index cfef2f8..a975708 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -51,6 +51,16 @@ void sbi_puts(const char *str)
>         spin_unlock(&console_out_lock);
>  }
>
> +void sbi_nputs(const char *str, unsigned long len)
> +{
> +       unsigned long i;
> +
> +       spin_lock(&console_out_lock);
> +       for (i = 0; i < len; i++)
> +               sbi_putc(str[i]);
> +       spin_unlock(&console_out_lock);
> +}
> +
>  void sbi_gets(char *s, int maxwidth, char endchar)
>  {
>         int ch;
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

