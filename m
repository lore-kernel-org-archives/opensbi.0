From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Feb 2023 09:55:41 +0530
Subject: [PATCH v5 1/2] lib: sbi: Add sbi_strnchr implementation
In-Reply-To: <20230227161906.634775-2-wxjstz@126.com>
References: <20230227161906.634775-1-wxjstz@126.com> <20230227161906.634775-2-wxjstz@126.com>
Message-ID: <CAAhSdy0on4VS8cjwRD8u5cCuyZ1J3JVT4OPO6OSsJCmznR9QZQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 27, 2023 at 9:49 PM Xiang W <wxjstz@126.com> wrote:
>
> This commit add an implementation of sbi_strnchr
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_string.h |  2 ++
>  lib/sbi/sbi_string.c     | 10 ++++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/sbi/sbi_string.h b/include/sbi/sbi_string.h
> index b7c2bc2..6941382 100644
> --- a/include/sbi/sbi_string.h
> +++ b/include/sbi/sbi_string.h
> @@ -31,6 +31,8 @@ char *sbi_strncpy(char *dest, const char *src, size_t count);
>
>  char *sbi_strchr(const char *s, int c);
>
> +char *sbi_strnchr(const char *s, int c, size_t count);
> +
>  char *sbi_strrchr(const char *s, int c);
>
>  void *sbi_memset(void *s, int c, size_t count);
> diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
> index 9ebea69..82b8c7e 100644
> --- a/lib/sbi/sbi_string.c
> +++ b/lib/sbi/sbi_string.c
> @@ -97,6 +97,16 @@ char *sbi_strchr(const char *s, int c)
>                 return (char *)s;
>  }
>
> +char *sbi_strnchr(const char *s, int c, size_t count)
> +{
> +       while (count-- > 0) {
> +               if (*s == (char)c)
> +                       return (char *)s;
> +               s++;
> +       }
> +       return NULL;
> +}
> +
>  char *sbi_strrchr(const char *s, int c)
>  {
>         const char *last = s + sbi_strlen(s);
> --
> 2.39.2
>

