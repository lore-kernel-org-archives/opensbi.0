From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 1 Oct 2020 16:02:47 -0700
Subject: [PATCH 01/16] include: sbi: Remove redundant includes from
 sbi_platform.h
In-Reply-To: <20200925112914.725846-2-anup.patel@wdc.com>
References: <20200925112914.725846-1-anup.patel@wdc.com>
 <20200925112914.725846-2-anup.patel@wdc.com>
Message-ID: <CAOnJCU+WjX8xChP0mG1sM=n0U1BAb05p34A2ARKZgy20cYQ9mQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 25, 2020 at 4:29 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sbi_ecall.h and sbi_trap.h are not required to be included in
> sbi_platform.h hence we remove it. This way sources requiring
> these headers will have to explicitly include it thereby reducing
> implicit includes.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
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
>         /** Platform has timer value */
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
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

