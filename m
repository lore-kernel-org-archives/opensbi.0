From: Xiang W <wxjstz@126.com>
Date: Sat, 15 May 2021 20:07:27 +0800
Subject: [PATCH] Makefile: unconditionally disable SSP
In-Reply-To: <20210515081638.2361496-1-fontaine.fabrice@gmail.com>
References: <20210515081638.2361496-1-fontaine.fabrice@gmail.com>
Message-ID: <2c8a933bae5cbe989227f44b52b451acd09b5ecf.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-05-15?? 10:16 +0200?Fabrice Fontaine???
> Though -nostdlib is passed in CFLAGS, -fno-stack-protector must also
> be
> passed to avoid linking errors related to undefined references to
> '__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
> -fstack-protector.
> 
> Fixes:
>  - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
> 

Reviewed-by: Xiang W <wxjstz@126.com>

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index eeffe6b..6b64205 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -203,7 +203,7 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
>  GENFLAGS	+=	$(platform-genflags-y)
>  GENFLAGS	+=	$(firmware-genflags-y)
>  
> -CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib
> -fno-strict-aliasing -O2
> +CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib
> -fno-stack-protector -fno-strict-aliasing -O2
>  CFLAGS		+=	-fno-omit-frame-pointer -fno-
> optimize-sibling-calls
>  CFLAGS		+=	-mno-save-restore -mstrict-align
>  CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI)
> -march=$(PLATFORM_RISCV_ISA)
> -- 
> 2.30.2
> 
> 


