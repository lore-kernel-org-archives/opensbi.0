From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Nov 2023 21:54:51 +0530
Subject: [PATCH v3 1/4] platform: generic: thead: move to thead c9xx
 header to vendor specific postion
In-Reply-To: <IA1PR20MB4953402F2CEAEA2038B7A8F7BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49534E329372B295663B2153BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953402F2CEAEA2038B7A8F7BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy0be2eMdMfb5s6NPZES1C3UCDCcaS6h96V+CUY3yh7aHg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 7, 2023 at 8:36?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> The CSR encoding for t-head c9xx cores is shared across all the
> platforms with these cores. So move header thead_c9xx.h to the
> thead subdir.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Acked-by: Guo Ren <guoren@kernel.org>

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/allwinner/sun20i-d1.c                        | 2 +-
>  .../generic/include/{thead_c9xx.h => thead/c9xx_encoding.h}   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename platform/generic/include/{thead_c9xx.h => thead/c9xx_encoding.h} (98%)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index a9a7e47..b960284 100644
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
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

