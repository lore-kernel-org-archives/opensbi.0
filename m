From: Anup Patel <anup@brainfault.org>
Date: Wed, 18 Jan 2023 13:30:00 +0530
Subject: [PATCH v3 6/6] lib: reset/fdt_reset_atcwdt200: Use defined macros
 and function in atcsmu.h
In-Reply-To: <20230118075321.19447-7-peterlin@andestech.com>
References: <20230118075321.19447-1-peterlin@andestech.com> <20230118075321.19447-7-peterlin@andestech.com>
Message-ID: <CAAhSdy38oNJk=yNxTKVqJCH3MAGiTPPiDSyGvuFfg8HoHLhu3A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 18, 2023 at 1:24 PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Reuse the smu related macros and function in atcsmu.h.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/utils/reset/Kconfig               |  1 +
>  lib/utils/reset/fdt_reset_atcwdt200.c | 21 ++++++++-------------
>  2 files changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
> index 0e0c2c1d..4748cc85 100644
> --- a/lib/utils/reset/Kconfig
> +++ b/lib/utils/reset/Kconfig
> @@ -11,6 +11,7 @@ if FDT_RESET
>
>  config FDT_RESET_ATCWDT200
>         bool "Andes WDT FDT reset driver"
> +       depends on SYS_ATCSMU
>         default n
>
>  config FDT_RESET_GPIO
> diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
> index 91acc9f7..9a611116 100644
> --- a/lib/utils/reset/fdt_reset_atcwdt200.c
> +++ b/lib/utils/reset/fdt_reset_atcwdt200.c
> @@ -16,6 +16,7 @@
>  #include <sbi/sbi_system.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/reset/fdt_reset.h>
> +#include <sbi_utils/sys/atcsmu.h>
>
>  #define ATCWDT200_WP_NUM 0x5aa5
>  #define WREN_REG 0x18
> @@ -41,14 +42,8 @@
>  #define CLK_PCLK (1 << 1)
>  #define WDT_EN (1 << 0)
>
> -#define FLASH_BASE 0x80000000ULL
> -#define SMU_RESET_VEC_LO_OFF 0x50
> -#define SMU_RESET_VEC_HI_OFF 0x60
> -#define SMU_HARTn_RESET_VEC_LO(n) (SMU_RESET_VEC_LO_OFF + (n * 0x4))
> -#define SMU_HARTn_RESET_VEC_HI(n) (SMU_RESET_VEC_HI_OFF + (n * 0x4))
> -
> -static volatile char *wdt_addr;
> -static volatile char *smu_addr;
> +static volatile char *wdt_addr = NULL;
> +static struct smu_data smu = { 0 };
>
>  static int ae350_system_reset_check(u32 type, u32 reason)
>  {
> @@ -66,16 +61,16 @@ static void ae350_system_reset(u32 type, u32 reason)
>  {
>         const struct sbi_platform *plat = sbi_platform_thishart_ptr();
>
> -       for (int i = 0; i < sbi_platform_hart_count(plat); i++) {
> -               writel(FLASH_BASE, smu_addr + SMU_HARTn_RESET_VEC_LO(i));
> -               writel(FLASH_BASE >> 32, smu_addr + SMU_HARTn_RESET_VEC_HI(i));
> -       }
> +       for (int i = 0; i < sbi_platform_hart_count(plat); i++)
> +               if (smu_set_reset_vector(&smu, FLASH_BASE, i))
> +                       goto fail;
>
>         /* Program WDT control register  */
>         writew(ATCWDT200_WP_NUM, wdt_addr + WREN_REG);
>         writel(INT_CLK_32768 | INT_EN | RST_CLK_128 | RST_EN | WDT_EN,
>                wdt_addr + CTRL_REG);
>
> +fail:
>         sbi_hart_hang();
>  }
>
> @@ -104,7 +99,7 @@ static int atcwdt200_reset_init(void *fdt, int nodeoff,
>         if (fdt_parse_compat_addr(fdt, &reg_addr, "andestech,atcsmu"))
>                 return SBI_ENODEV;
>
> -       smu_addr = (volatile char *)(unsigned long)reg_addr;
> +       smu.addr = (unsigned long)reg_addr;
>
>         sbi_system_reset_add_device(&atcwdt200_reset);
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

