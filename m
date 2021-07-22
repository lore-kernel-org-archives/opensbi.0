From: Atish Patra <Atish.Patra@wdc.com>
Date: Thu, 22 Jul 2021 19:19:02 +0000
Subject: [PATCH 2/2] lib: utils: support both of gpio-poweroff, gpio-reset
In-Reply-To: <20210722105359.18622-3-xypron.glpk@gmx.de>
References: <20210722105359.18622-1-xypron.glpk@gmx.de>
 <20210722105359.18622-3-xypron.glpk@gmx.de>
Message-ID: <b6d51cd4fb5f0a6cc3f2cec465be07c027d83853.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-07-22 at 12:53 +0200, Heinrich Schuchardt wrote:
> The generic GPIO reset driver has two entries in the match table:
> "gpio-poweroff", "gpio-reset". Only the first entry is considered by
> fdt_reset_init().
> 
> Define "gpio-poweroff" and "gpio-reset" as compatibility strings of
> two
> separate reset drivers. They still can share code.
> 
> Fixes: e3d6919d10d7 ("lib: utils/reset: Add generic GPIO reset
> driver")
> Signed-off-by: Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com>
> ---
> ?lib/utils/reset/fdt_reset.c????? |? 3 ++-
> ?lib/utils/reset/fdt_reset_gpio.c | 11 ++++++++++-
> ?2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/utils/reset/fdt_reset.c
> b/lib/utils/reset/fdt_reset.c
> index 87f925c..0d84dc2 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -12,12 +12,14 @@
> ?#include <sbi_utils/fdt/fdt_helper.h>
> ?#include <sbi_utils/reset/fdt_reset.h>
> 
> +extern struct fdt_reset fdt_poweroff_gpio;
> ?extern struct fdt_reset fdt_reset_gpio;
> ?extern struct fdt_reset fdt_reset_sifive_test;
> ?extern struct fdt_reset fdt_reset_htif;
> ?extern struct fdt_reset fdt_reset_thead;
> 
> ?static struct fdt_reset *reset_drivers[] = {
> +???????&fdt_poweroff_gpio,
> ????????&fdt_reset_gpio,
> ????????&fdt_reset_sifive_test,
> ????????&fdt_reset_htif,
> @@ -45,7 +47,6 @@ int fdt_reset_init(void)
> ????????????????????????if (rc)
> ????????????????????????????????return rc;
> ????????????????}
> -???????????????break;
> ????????}
> 
> ????????return 0;
> diff --git a/lib/utils/reset/fdt_reset_gpio.c
> b/lib/utils/reset/fdt_reset_gpio.c
> index 7e0eb74..77e308a 100644
> --- a/lib/utils/reset/fdt_reset_gpio.c
> +++ b/lib/utils/reset/fdt_reset_gpio.c
> @@ -129,8 +129,17 @@ static int gpio_reset_init(void *fdt, int
> nodeoff,
> ????????return 0;
> ?}
> 
> -static const struct fdt_match gpio_reset_match[] = {
> +static const struct fdt_match gpio_poweroff_match[] = {
> ????????{ .compatible = "gpio-poweroff", .data = (void *)FALSE },
> +???????{ },
> +};
> +
> +struct fdt_reset fdt_poweroff_gpio = {
> +???????.match_table = gpio_poweroff_match,
> +???????.init = gpio_reset_init,
> +};
> +
> +static const struct fdt_match gpio_reset_match[] = {
> ????????{ .compatible = "gpio-restart", .data = (void *)TRUE },
> ????????{ },
> ?};
> --
> 2.30.2
> 
Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish
