From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 Jan 2023 01:31:54 -0800
Subject: [PATCH v4 3/7] lib: sbi: Add sbi_ngets() function
In-Reply-To: <20230104145006.947830-4-apatel@ventanamicro.com>
References: <20230104145006.947830-1-apatel@ventanamicro.com> <20230104145006.947830-4-apatel@ventanamicro.com>
Message-ID: <CAOnJCUL6F9Pu_GrCukY3+T5A-+uB90Pj0v3qYqWgEtVPdp2uNw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 4, 2023 at 6:50 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add new sbi_ngets() which help us read characters into a
> physical memory location.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_console.h |  2 ++
>  lib/sbi/sbi_console.c     | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> index 1bdeeb9..660c239 100644
> --- a/include/sbi/sbi_console.h
> +++ b/include/sbi/sbi_console.h
> @@ -37,6 +37,8 @@ void sbi_nputs(const char *str, unsigned long len);
>
>  void sbi_gets(char *s, int maxwidth, char endchar);
>
> +unsigned long sbi_ngets(char *str, unsigned long len);
> +
>  int __printf(2, 3) sbi_sprintf(char *out, const char *format, ...);
>
>  int __printf(3, 4) sbi_snprintf(char *out, u32 out_sz, const char *format, ...);
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index a975708..3942320 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -74,6 +74,21 @@ void sbi_gets(char *s, int maxwidth, char endchar)
>         *retval = '\0';
>  }
>
> +unsigned long sbi_ngets(char *str, unsigned long len)
> +{
> +       int ch;
> +       unsigned long i;
> +
> +       for (i = 0; i < len; i++) {
> +               ch = sbi_getc();
> +               if (ch < 0)
> +                       break;
> +               str[i] = ch;
> +       }
> +
> +       return i;
> +}
> +
>  #define PAD_RIGHT 1
>  #define PAD_ZERO 2
>  #define PAD_ALTERNATE 4
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

