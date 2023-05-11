From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 May 2023 12:58:00 +0530
Subject: [PATCH] lib: sbi: Simplify BITS_PER_LONG definition
In-Reply-To: <20230425113221.485662-1-wxjstz@126.com>
References: <20230425113221.485662-1-wxjstz@126.com>
Message-ID: <CAAhSdy216j5KG+UGOk7g5er+-zn+Ff=Ls_JDavin7-AxdXfvrw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 5:03?PM Xiang W <wxjstz@126.com> wrote:
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Please don't leave the commit description empty. Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_bitops.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/include/sbi/sbi_bitops.h b/include/sbi/sbi_bitops.h
> index 251e4d8..2e08947 100644
> --- a/include/sbi/sbi_bitops.h
> +++ b/include/sbi/sbi_bitops.h
> @@ -12,13 +12,7 @@
>
>  #include <sbi/sbi_types.h>
>
> -#if __SIZEOF_POINTER__ == 8
> -#define BITS_PER_LONG          64
> -#elif __SIZEOF_POINTER__ == 4
> -#define BITS_PER_LONG          32
> -#else
> -#error "Unexpected __SIZEOF_POINTER__"
> -#endif
> +#define BITS_PER_LONG          (8 * __SIZEOF_LONG__)
>
>  #define EXTRACT_FIELD(val, which) \
>         (((val) & (which)) / ((which) & ~((which)-1)))
> --
> 2.39.2
>

