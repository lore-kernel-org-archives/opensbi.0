From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Dec 2022 19:12:17 +0530
Subject: [PATCH v3 3/3] generic/starfive: Add Starfive JH7110 platform implementation
In-Reply-To: <20221212054018.169408-4-weiliang.lim@starfivetech.com>
References: <20221212054018.169408-1-weiliang.lim@starfivetech.com> <20221212054018.169408-4-weiliang.lim@starfivetech.com>
Message-ID: <CAAhSdy1Vy2MX0GyC3Cw0zH89un0ETbH6h0a09SNtPVEkJEQTbQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 11:11 AM Wei Liang Lim
<weiliang.lim@starfivetech.com> wrote:
>
> Add Starfive JH7110 platform implementation
>
> Signed-off-by: Wei Liang Lim <weiliang.lim@starfivetech.com>
> Reviewed-by: Chee Hong Ang <cheehong.ang@starfivetech.com>
> Reviewed-by: Jun Liang Tan <junliang.tan@starfivetech.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  platform/generic/Kconfig             |  4 ++++
>  platform/generic/configs/defconfig   |  1 +
>  platform/generic/starfive/jh7110.c   | 27 +++++++++++++++++++++++++++
>  platform/generic/starfive/objects.mk |  6 ++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 platform/generic/starfive/jh7110.c
>  create mode 100644 platform/generic/starfive/objects.mk
>
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 4b5d2cd..a6e467d 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -41,4 +41,8 @@ config PLATFORM_SIFIVE_FU740
>         depends on FDT_RESET && FDT_I2C
>         default n
>
> +config PLATFORM_STARFIVE_JH7110
> +       bool "StarFive JH7110 support"
> +       default n
> +
>  endif
> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
> index 2eaeeb7..ef6aad9 100644
> --- a/platform/generic/configs/defconfig
> +++ b/platform/generic/configs/defconfig
> @@ -2,6 +2,7 @@ CONFIG_PLATFORM_ALLWINNER_D1=y
>  CONFIG_PLATFORM_ANDES_AE350=y
>  CONFIG_PLATFORM_SIFIVE_FU540=y
>  CONFIG_PLATFORM_SIFIVE_FU740=y
> +CONFIG_PLATFORM_STARFIVE_JH7110=y
>  CONFIG_FDT_GPIO=y
>  CONFIG_FDT_GPIO_SIFIVE=y
>  CONFIG_FDT_I2C=y
> diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
> new file mode 100644
> index 0000000..1c76975
> --- /dev/null
> +++ b/platform/generic/starfive/jh7110.c
> @@ -0,0 +1,27 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 StarFive
> + *
> + * Authors:
> + *   Wei Liang Lim <weiliang.lim@starfivetech.com>
> + */
> +
> +#include <platform_override.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +
> +static bool starfive_cold_boot_allowed(u32 hartid,
> +                                  const struct fdt_match *match)
> +{
> +       return (hartid == 1);
> +}
> +
> +static const struct fdt_match starfive_jh7110_match[] = {
> +       { .compatible = "starfive,jh7110" },
> +       { },
> +};
> +
> +const struct platform_override starfive_jh7110 = {
> +       .match_table = starfive_jh7110_match,
> +       .cold_boot_allowed = starfive_cold_boot_allowed,
> +};
> diff --git a/platform/generic/starfive/objects.mk b/platform/generic/starfive/objects.mk
> new file mode 100644
> index 0000000..0b900fb
> --- /dev/null
> +++ b/platform/generic/starfive/objects.mk
> @@ -0,0 +1,6 @@
> +#
> +# SPDX-License-Identifier: BSD-2-Clause
> +#
> +
> +carray-platform_override_modules-$(CONFIG_PLATFORM_STARFIVE_JH7110) += starfive_jh7110
> +platform-objs-$(CONFIG_PLATFORM_STARFIVE_JH7110) += starfive/jh7110.o
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

