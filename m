From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Jul 2023 11:08:18 +0530
Subject: [PATCH v8 11/11] lib: sbi: Fix missing '\0' when buffer szie
 equal 1
In-Reply-To: <20230705143754.635428-1-wxjstz@126.com>
References: <20230705143703.635254-1-wxjstz@126.com> <20230705143754.635428-1-wxjstz@126.com>
Message-ID: <CAAhSdy2QOcjukWmQiCxWTJsJK6g_WS_MYz8GvUqT2q9Q639MLw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 5, 2023 at 8:08?PM Xiang W <wxjstz@126.com> wrote:
>
> Fix special case: sbi_snprintf(out, out_len, ...) when out_len equal
> 1, The previous code will not fill the buffer with any char.

I would rather do something like below in printc(...)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 168dffd..e0ecb41 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -138,10 +138,10 @@ static void printc(char **out, u32 *out_len, char ch)
      * The *printf entry point functions have enforced that (*out) can
      * only be null when out_len is non-null and its value is zero.
      */
-    if (!out_len || *out_len > 1) {
+    if (!out_len || *out_len)
         *(*out)++ = ch;
+    if (!out_len || *out_len > 1)
         **out = '\0';
-    }

     if (out_len && *out_len > 0)
         --(*out_len);

Regards,
Anup

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_console.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 00feec8..0703d4a 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -271,6 +271,10 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>                 out_len = &console_tbuf_len;
>         }
>
> +       /* handle special case: *out_len == 1*/
> +       if (out)
> +               **out = '\0';
> +
>         for (; *format != 0; ++format) {
>                 width = flags = 0;
>                 if (use_tbuf)
> --
> 2.40.1
>

