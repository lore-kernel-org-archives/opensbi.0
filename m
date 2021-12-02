From: Xiang W <wxjstz@126.com>
Date: Thu, 02 Dec 2021 22:30:12 +0800
Subject: [PATCH v3 2/2] lib: sbi: Fix compile errors using -Os option
In-Reply-To: <20211202122929.685756-3-anup.patel@wdc.com>
References: <20211202122929.685756-1-anup.patel@wdc.com>
 <20211202122929.685756-3-anup.patel@wdc.com>
Message-ID: <2cc1d458933bb08ee32e6ce5eaa53dcc716995e2.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-12-02???? 17:59 +0530?Anup Patel???
> When building with -Os option along with -ffreestanding, both GCC
> and clang will add implicit calls to memcpy() and memcpy() for stack
> variables initialized in declaration.
> 
> The C standard as per Clause 4, the compiler cannot necessarily
> assume that anything beyond:
> 
> ?* float.h
> ?* iso646.h
> ?* limits.h
> ?* stdalign.h
> ?* stdarg.h
> ?* stdbool.h
> ?* stddef.h
> ?* stdint.h
> ?* stdnoreturn.h
> ?* fenv.h
> ?* math.h
> ?* and the numeric conversion functions of stdlib.h.
> 
> This patch maps memcpy() and memset() as weak-alias of sbi_memcpy()
> and sbi_memset() respectively so that implicit calls to memcpy()
> and memset() will compile properly.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/sbi/sbi_string.c | 6 ++++++
> ?1 file changed, 6 insertions(+)
> 
> diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
> index c87bce9..c67c02e 100644
> --- a/lib/sbi/sbi_string.c
> +++ b/lib/sbi/sbi_string.c
> @@ -122,6 +122,9 @@ void *sbi_memset(void *s, int c, size_t count)
> ????????return s;
> ?}
> ?
> +void *memset(void *s, int c, size_t count) \
> +__attribute__((weak, alias("sbi_memset")));
> +
> ?void *sbi_memcpy(void *dest, const void *src, size_t count)
> ?{
> ????????char *temp1?????? = dest;
> @@ -135,6 +138,9 @@ void *sbi_memcpy(void *dest, const void *src,
> size_t count)
> ????????return dest;
> ?}
> ?
> +void *memcpy(void *dest, const void *src, size_t count) \
> +__attribute__((weak, alias("sbi_memcpy")));
> +
> ?void *sbi_memmove(void *dest, const void *src, size_t count)
> ?{
> ????????char *temp1?????? = (char *)dest;
> -- 
> 2.25.1
> 
> 



