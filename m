From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Nov 2024 18:07:10 +0530
Subject: [PATCH v2 09/11] lib: utils/reset: Use fdt_driver for initialization
In-Reply-To: <20241111220304.1228821-10-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com> <20241111220304.1228821-10-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1T0PJHtdmFyt7qwxMjU3Yq1g==8ANeQqULnQpRb3Hdvw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 12, 2024 at 3:33?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> The reset driver subsystem does not need any extra data, so it can use
> `struct fdt_driver` directly. The generic fdt_reset_init() performs a
> best-effort initialization of all matching DT nodes. Platform-specific
> logic expects exactly one DT node to match a single driver. This is
> accomplished by using fdt_driver_init_one() with a local list containing
> that one driver.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> (no changes since v1)
>
>  include/sbi_utils/reset/fdt_reset.h          | 15 +-------
>  lib/utils/reset/fdt_reset.c                  | 36 ++------------------
>  lib/utils/reset/fdt_reset_atcwdt200.c        |  2 +-
>  lib/utils/reset/fdt_reset_drivers.carray     |  2 +-
>  lib/utils/reset/fdt_reset_gpio.c             |  4 +--
>  lib/utils/reset/fdt_reset_htif.c             |  2 +-
>  lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c |  2 +-
>  lib/utils/reset/fdt_reset_sunxi_wdt.c        |  2 +-
>  lib/utils/reset/fdt_reset_syscon.c           |  4 +--
>  platform/generic/sifive/fu740.c              |  9 +++--
>  platform/generic/starfive/jh7110.c           |  9 +++--
>  11 files changed, 26 insertions(+), 61 deletions(-)
>
> diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
> index f126fd33..5fba3886 100644
> --- a/include/sbi_utils/reset/fdt_reset.h
> +++ b/include/sbi_utils/reset/fdt_reset.h
> @@ -11,19 +11,10 @@
>  #define __FDT_RESET_H__
>
>  #include <sbi/sbi_types.h>
> -
> -struct fdt_reset {
> -       const struct fdt_match *match_table;
> -       int (*init)(const void *fdt, int nodeoff, const struct fdt_match *match);
> -};
> +#include <sbi_utils/fdt/fdt_driver.h>
>
>  #ifdef CONFIG_FDT_RESET
>
> -/**
> - * fdt_reset_driver_init() - initialize reset driver based on the device-tree
> - */
> -int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv);
> -
>  /**
>   * fdt_reset_init() - initialize reset drivers based on the device-tree
>   *
> @@ -33,10 +24,6 @@ void fdt_reset_init(const void *fdt);
>
>  #else
>
> -static inline int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv)
> -{
> -       return 0;
> -}
>  static inline void fdt_reset_init(const void *fdt) { }
>
>  #endif
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index 4b20c3e3..633a25cd 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -7,44 +7,12 @@
>   *   Anup Patel <anup.patel@wdc.com>
>   */
>
> -#include <sbi/sbi_console.h>
> -#include <sbi/sbi_error.h>
> -#include <sbi/sbi_scratch.h>
> -#include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/reset/fdt_reset.h>
>
>  /* List of FDT reset drivers generated at compile time */
> -extern struct fdt_reset *const fdt_reset_drivers[];
> -
> -int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv)
> -{
> -       int noff, rc, cnt = 0;
> -       const struct fdt_match *match;
> -
> -       noff = -1;
> -       while ((noff = fdt_find_match(fdt, noff,
> -                               drv->match_table, &match)) >= 0) {
> -               if (!fdt_node_is_enabled(fdt, noff))
> -                       continue;
> -
> -               if (drv->init) {
> -                       rc = drv->init(fdt, noff, match);
> -                       if (!rc)
> -                               cnt++;
> -                       else if (rc != SBI_ENODEV) {
> -                               sbi_printf("%s: %s init failed, %d\n",
> -                                       __func__, match->compatible, rc);
> -                       }
> -               }
> -       }
> -
> -       return cnt > 0 ? 0 : SBI_ENODEV;
> -}
> +extern const struct fdt_driver *const fdt_reset_drivers[];
>
>  void fdt_reset_init(const void *fdt)
>  {
> -       int pos;
> -
> -       for (pos = 0; fdt_reset_drivers[pos]; pos++)
> -               fdt_reset_driver_init(fdt, fdt_reset_drivers[pos]);
> +       fdt_driver_init_all(fdt, fdt_reset_drivers);
>  }
> diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
> index 6ef3b134..d3e38e61 100644
> --- a/lib/utils/reset/fdt_reset_atcwdt200.c
> +++ b/lib/utils/reset/fdt_reset_atcwdt200.c
> @@ -111,7 +111,7 @@ static const struct fdt_match atcwdt200_reset_match[] = {
>         {},
>  };
>
> -struct fdt_reset fdt_reset_atcwdt200 = {
> +const struct fdt_driver fdt_reset_atcwdt200 = {
>         .match_table = atcwdt200_reset_match,
>         .init        = atcwdt200_reset_init,
>  };
> diff --git a/lib/utils/reset/fdt_reset_drivers.carray b/lib/utils/reset/fdt_reset_drivers.carray
> index 6ff799cc..2e9e86af 100644
> --- a/lib/utils/reset/fdt_reset_drivers.carray
> +++ b/lib/utils/reset/fdt_reset_drivers.carray
> @@ -1,3 +1,3 @@
>  HEADER: sbi_utils/reset/fdt_reset.h
> -TYPE: struct fdt_reset
> +TYPE: const struct fdt_driver
>  NAME: fdt_reset_drivers
> diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
> index de81e2eb..cf751254 100644
> --- a/lib/utils/reset/fdt_reset_gpio.c
> +++ b/lib/utils/reset/fdt_reset_gpio.c
> @@ -153,7 +153,7 @@ static const struct fdt_match gpio_poweroff_match[] = {
>         { },
>  };
>
> -struct fdt_reset fdt_poweroff_gpio = {
> +const struct fdt_driver fdt_poweroff_gpio = {
>         .match_table = gpio_poweroff_match,
>         .init = gpio_reset_init,
>  };
> @@ -163,7 +163,7 @@ static const struct fdt_match gpio_reset_match[] = {
>         { },
>  };
>
> -struct fdt_reset fdt_reset_gpio = {
> +const struct fdt_driver fdt_reset_gpio = {
>         .match_table = gpio_reset_match,
>         .init = gpio_reset_init,
>  };
> diff --git a/lib/utils/reset/fdt_reset_htif.c b/lib/utils/reset/fdt_reset_htif.c
> index 7c04c81c..61c907fa 100644
> --- a/lib/utils/reset/fdt_reset_htif.c
> +++ b/lib/utils/reset/fdt_reset_htif.c
> @@ -32,7 +32,7 @@ static const struct fdt_match htif_reset_match[] = {
>         { },
>  };
>
> -struct fdt_reset fdt_reset_htif = {
> +const struct fdt_driver fdt_reset_htif = {
>         .match_table = htif_reset_match,
>         .init = htif_reset_init
>  };
> diff --git a/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c b/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
> index 368cd108..66826830 100644
> --- a/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
> +++ b/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
> @@ -108,7 +108,7 @@ static const struct fdt_match sg2042_mcu_reset_match[] = {
>         { },
>  };
>
> -struct fdt_reset fdt_reset_sg2042_mcu = {
> +const struct fdt_driver fdt_reset_sg2042_mcu = {
>         .match_table = sg2042_mcu_reset_match,
>         .init = sg2042_mcu_reset_init,
>  };
> diff --git a/lib/utils/reset/fdt_reset_sunxi_wdt.c b/lib/utils/reset/fdt_reset_sunxi_wdt.c
> index f4b06d23..708bf25c 100644
> --- a/lib/utils/reset/fdt_reset_sunxi_wdt.c
> +++ b/lib/utils/reset/fdt_reset_sunxi_wdt.c
> @@ -71,7 +71,7 @@ static const struct fdt_match sunxi_wdt_reset_match[] = {
>         { },
>  };
>
> -struct fdt_reset fdt_reset_sunxi_wdt = {
> +const struct fdt_driver fdt_reset_sunxi_wdt = {
>         .match_table = sunxi_wdt_reset_match,
>         .init = sunxi_wdt_reset_init,
>  };
> diff --git a/lib/utils/reset/fdt_reset_syscon.c b/lib/utils/reset/fdt_reset_syscon.c
> index 0dd76acb..d1a3bc0e 100644
> --- a/lib/utils/reset/fdt_reset_syscon.c
> +++ b/lib/utils/reset/fdt_reset_syscon.c
> @@ -151,7 +151,7 @@ static const struct fdt_match syscon_poweroff_match[] = {
>         { },
>  };
>
> -struct fdt_reset fdt_syscon_poweroff = {
> +const struct fdt_driver fdt_syscon_poweroff = {
>         .match_table = syscon_poweroff_match,
>         .init = syscon_reset_init,
>  };
> @@ -161,7 +161,7 @@ static const struct fdt_match syscon_reboot_match[] = {
>         { },
>  };
>
> -struct fdt_reset fdt_syscon_reboot = {
> +const struct fdt_driver fdt_syscon_reboot = {
>         .match_table = syscon_reboot_match,
>         .init = syscon_reset_init,
>  };
> diff --git a/platform/generic/sifive/fu740.c b/platform/generic/sifive/fu740.c
> index 46dc02ae..52ca12ff 100644
> --- a/platform/generic/sifive/fu740.c
> +++ b/platform/generic/sifive/fu740.c
> @@ -209,11 +209,16 @@ static const struct fdt_match da9063_reset_match[] = {
>         { },
>  };
>
> -struct fdt_reset fdt_reset_da9063 = {
> +const struct fdt_driver fdt_reset_da9063 = {
>         .match_table = da9063_reset_match,
>         .init = da9063_reset_init,
>  };
>
> +static const struct fdt_driver *const sifive_fu740_reset_drivers[] = {
> +       &fdt_reset_da9063,
> +       NULL
> +};
> +
>  static u64 sifive_fu740_tlbr_flush_limit(const struct fdt_match *match)
>  {
>         /*
> @@ -232,7 +237,7 @@ static int sifive_fu740_final_init(bool cold_boot, void *fdt,
>         int rc;
>
>         if (cold_boot) {
> -               rc = fdt_reset_driver_init(fdt, &fdt_reset_da9063);
> +               rc = fdt_driver_init_one(fdt, sifive_fu740_reset_drivers);
>                 if (rc)
>                         sbi_printf("%s: failed to find da9063 for reset\n",
>                                    __func__);
> diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
> index 264fe99c..6d95758f 100644
> --- a/platform/generic/starfive/jh7110.c
> +++ b/platform/generic/starfive/jh7110.c
> @@ -227,11 +227,16 @@ static const struct fdt_match pm_reset_match[] = {
>         { },
>  };
>
> -static struct fdt_reset fdt_reset_pmic = {
> +static const struct fdt_driver fdt_reset_pmic = {
>         .match_table = pm_reset_match,
>         .init = pm_reset_init,
>  };
>
> +static const struct fdt_driver *const starfive_jh7110_reset_drivers[] = {
> +       &fdt_reset_pmic,
> +       NULL
> +};
> +
>  static int starfive_jh7110_inst_init(const void *fdt)
>  {
>         int noff, rc = 0;
> @@ -281,7 +286,7 @@ static int starfive_jh7110_final_init(bool cold_boot, void *fdt,
>                                       const struct fdt_match *match)
>  {
>         if (cold_boot) {
> -               fdt_reset_driver_init(fdt, &fdt_reset_pmic);
> +               fdt_driver_init_one(fdt, starfive_jh7110_reset_drivers);
>         }
>
>         return 0;
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

