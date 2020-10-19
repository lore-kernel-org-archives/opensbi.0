From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Mon, 19 Oct 2020 17:51:48 +0000
Subject: [PATCH v3 01/16] include: sbi: Remove redundant includes from
 sbi_platform.h
In-Reply-To: <20201019125453.2460105-2-anup.patel@wdc.com>
References: <20201019125453.2460105-1-anup.patel@wdc.com>
 <20201019125453.2460105-2-anup.patel@wdc.com>
Message-ID: <b68d3ce4ad76aad2899cb31efb85549e6b608c34.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 18:24 +0530, Anup Patel wrote:
> The sbi_ecall.h and sbi_trap.h are not required to be included in
> sbi_platform.h hence we remove it. This way sources requiring
> these headers will have to explicitly include it thereby reducing
> implicit includes.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/sbi/sbi_platform.h | 4 ++--
>  lib/sbi/sbi_hart.c         | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 8087148..f51e36a 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -40,12 +40,12 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#include <sbi/sbi_ecall.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_scratch.h>
> -#include <sbi/sbi_trap.h>
>  #include <sbi/sbi_version.h>
>  
> +struct sbi_trap_info;
> +
>  /** Possible feature flags of a platform */
>  enum sbi_platform_features {
>  	/** Platform has timer value */
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 6413194..55a04da 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -19,6 +19,7 @@
>  #include <sbi/sbi_math.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_string.h>
> +#include <sbi/sbi_trap.h>
>  
>  extern void __sbi_expected_trap(void);
>  extern void __sbi_expected_trap_hext(void);
