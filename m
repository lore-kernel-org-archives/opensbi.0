From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Jan 2023 14:45:51 +0530
Subject: [PATCH 5/6] lib: reset/fdt_reset_atcwdt200: use defined macros in atcsmu.h
In-Reply-To: <20230104062927.15628-6-peterlin@andestech.com>
References: <20230104062927.15628-1-peterlin@andestech.com> <20230104062927.15628-6-peterlin@andestech.com>
Message-ID: <CAAhSdy3XC9b8FWYqDd1gTTwz-_BL9ZAnHZZKeja7+a01L0RpQw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 4, 2023 at 12:02 PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Reuse the smu related macros defined in atcsmu.h.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  lib/utils/reset/fdt_reset_atcwdt200.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
> index 91acc9f..a6e6834 100644
> --- a/lib/utils/reset/fdt_reset_atcwdt200.c
> +++ b/lib/utils/reset/fdt_reset_atcwdt200.c
> @@ -17,6 +17,8 @@
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/reset/fdt_reset.h>
>
> +#include <andes/atcsmu.h>
> +

This can result in compile error because andes/atcsmu.h is
part of platform code.

I suggest that andes/atcsmu.h should be in a common location
include/sbi_utils/sys/ which is meant for common system devices.

>  #define ATCWDT200_WP_NUM 0x5aa5
>  #define WREN_REG 0x18
>  #define CTRL_REG 0x10
> @@ -41,12 +43,6 @@
>  #define CLK_PCLK (1 << 1)
>  #define WDT_EN (1 << 0)
>
> -#define FLASH_BASE 0x80000000ULL
> -#define SMU_RESET_VEC_LO_OFF 0x50
> -#define SMU_RESET_VEC_HI_OFF 0x60
> -#define SMU_HARTn_RESET_VEC_LO(n) (SMU_RESET_VEC_LO_OFF + (n * 0x4))
> -#define SMU_HARTn_RESET_VEC_HI(n) (SMU_RESET_VEC_HI_OFF + (n * 0x4))
> -
>  static volatile char *wdt_addr;
>  static volatile char *smu_addr;
>
> @@ -67,8 +63,8 @@ static void ae350_system_reset(u32 type, u32 reason)
>         const struct sbi_platform *plat = sbi_platform_thishart_ptr();
>
>         for (int i = 0; i < sbi_platform_hart_count(plat); i++) {
> -               writel(FLASH_BASE, smu_addr + SMU_HARTn_RESET_VEC_LO(i));
> -               writel(FLASH_BASE >> 32, smu_addr + SMU_HARTn_RESET_VEC_HI(i));
> +               writel(FLASH_BASE, smu_addr + HARTn_RESET_VEC_LO(i));
> +               writel(FLASH_BASE >> 32, smu_addr + HARTn_RESET_VEC_HI(i));
>         }
>
>         /* Program WDT control register  */
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

