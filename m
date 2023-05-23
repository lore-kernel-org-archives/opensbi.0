From: Guo Ren <guoren@kernel.org>
Date: Tue, 23 May 2023 17:44:58 +0800
Subject: [PATCH 1/3] platform: generic: thead: move to thead c9xx header
 to vendor specific postion
In-Reply-To: <IA1PR20MB4953CEF2405E057BE1B9D7AFBB409@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20230523063603.1836508-1-inochiama@outlook.com> <IA1PR20MB4953CEF2405E057BE1B9D7AFBB409@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAJF2gTT2Fznwc4abjwKsb3aT1VYW6ujLGHYZrijSUeBnN3wd2A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 23, 2023 at 2:36?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> The CSR encoding for t-head c9xx cores is shared across all the
> platforms with these cores. So move header thead_c9xx.h to the
> thead subdir.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  platform/generic/allwinner/sun20i-d1.c                        | 2 +-
>  .../generic/include/{thead_c9xx.h => thead/c9xx_encoding.h}   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename platform/generic/include/{thead_c9xx.h => thead/c9xx_encoding.h} (98%)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 0f0a9f3..fe38d8f 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -5,7 +5,7 @@
>   */
>
>  #include <platform_override.h>
> -#include <thead_c9xx.h>
> +#include <thead/c9xx_encoding.h>
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_io.h>
>  #include <sbi/sbi_bitops.h>
> diff --git a/platform/generic/include/thead_c9xx.h b/platform/generic/include/thead/c9xx_encoding.h
> similarity index 98%
> rename from platform/generic/include/thead_c9xx.h
> rename to platform/generic/include/thead/c9xx_encoding.h
> index bab0408..58adbef 100644
> --- a/platform/generic/include/thead_c9xx.h
> +++ b/platform/generic/include/thead/c9xx_encoding.h
> @@ -1,5 +1,5 @@
> -#ifndef __RISCV_THEAD_C9XX_H____
> -#define __RISCV_THEAD_C9XX_H____
> +#ifndef __RISCV_THEAD_C9XX_ENCODING_H____
> +#define __RISCV_THEAD_C9XX_ENCODING_H____
>
>  /* T-HEAD C9xx M mode CSR.  */
>  #define THEAD_C9XX_CSR_MXSTATUS                0x7c0
> --
> 2.40.1

Acked-by: Guo Ren <guoren@kernel.org>
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Best Regards
 Guo Ren

