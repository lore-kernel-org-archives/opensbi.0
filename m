From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Nov 2024 18:05:33 +0530
Subject: [PATCH v2 08/11] lib: utils/regmap: Use fdt_driver for initialization
In-Reply-To: <20241111220304.1228821-9-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com> <20241111220304.1228821-9-samuel.holland@sifive.com>
Message-ID: <CAAhSdy10Z-T+4fg8RMN43Q2W2qYZtxcK9U99DRFDHwy1TkV5vQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 12, 2024 at 3:33?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> The regmap driver subsystem does not need any extra data, so it can use
> `struct fdt_driver` directly. It always initializes the driver for a
> specific DT node.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> Changes in v2:
>  - New patch for v2
>
>  include/sbi_utils/regmap/fdt_regmap.h      |  8 +------
>  lib/utils/regmap/fdt_regmap.c              | 28 +++-------------------
>  lib/utils/regmap/fdt_regmap_drivers.carray |  2 +-
>  lib/utils/regmap/fdt_regmap_syscon.c       |  2 +-
>  4 files changed, 6 insertions(+), 34 deletions(-)
>
> diff --git a/include/sbi_utils/regmap/fdt_regmap.h b/include/sbi_utils/regmap/fdt_regmap.h
> index de946f27..a24f7a98 100644
> --- a/include/sbi_utils/regmap/fdt_regmap.h
> +++ b/include/sbi_utils/regmap/fdt_regmap.h
> @@ -10,17 +10,11 @@
>  #ifndef __FDT_REGMAP_H__
>  #define __FDT_REGMAP_H__
>
> +#include <sbi_utils/fdt/fdt_driver.h>
>  #include <sbi_utils/regmap/regmap.h>
>
>  struct fdt_phandle_args;
>
> -/** FDT based regmap driver */
> -struct fdt_regmap {
> -       const struct fdt_match *match_table;
> -       int (*init)(const void *fdt, int nodeoff,
> -                   const struct fdt_match *match);
> -};
> -
>  /** Get regmap instance based on phandle */
>  int fdt_regmap_get_by_phandle(const void *fdt, u32 phandle,
>                               struct regmap **out_rmap);
> diff --git a/lib/utils/regmap/fdt_regmap.c b/lib/utils/regmap/fdt_regmap.c
> index ab991c45..2e8c2143 100644
> --- a/lib/utils/regmap/fdt_regmap.c
> +++ b/lib/utils/regmap/fdt_regmap.c
> @@ -13,30 +13,7 @@
>  #include <sbi_utils/regmap/fdt_regmap.h>
>
>  /* List of FDT regmap drivers generated at compile time */
> -extern struct fdt_regmap *const fdt_regmap_drivers[];
> -
> -static int fdt_regmap_init(const void *fdt, int nodeoff)
> -{
> -       int pos, rc;
> -       struct fdt_regmap *drv;
> -       const struct fdt_match *match;
> -
> -       /* Try all I2C drivers one-by-one */
> -       for (pos = 0; fdt_regmap_drivers[pos]; pos++) {
> -               drv = fdt_regmap_drivers[pos];
> -               match = fdt_match_node(fdt, nodeoff, drv->match_table);
> -               if (match && drv->init) {
> -                       rc = drv->init(fdt, nodeoff, match);
> -                       if (rc == SBI_ENODEV)
> -                               continue;
> -                       if (rc)
> -                               return rc;
> -                       return 0;
> -               }
> -       }
> -
> -       return SBI_ENOSYS;
> -}
> +extern const struct fdt_driver *const fdt_regmap_drivers[];
>
>  static int fdt_regmap_find(const void *fdt, int nodeoff,
>                            struct regmap **out_rmap)
> @@ -46,7 +23,8 @@ static int fdt_regmap_find(const void *fdt, int nodeoff,
>
>         if (!rmap) {
>                 /* Regmap not found so initialize matching driver */
> -               rc = fdt_regmap_init(fdt, nodeoff);
> +               rc = fdt_driver_init_by_offset(fdt, nodeoff,
> +                                              fdt_regmap_drivers);
>                 if (rc)
>                         return rc;
>
> diff --git a/lib/utils/regmap/fdt_regmap_drivers.carray b/lib/utils/regmap/fdt_regmap_drivers.carray
> index c2f1c9d0..d19a932b 100644
> --- a/lib/utils/regmap/fdt_regmap_drivers.carray
> +++ b/lib/utils/regmap/fdt_regmap_drivers.carray
> @@ -1,3 +1,3 @@
>  HEADER: sbi_utils/regmap/fdt_regmap.h
> -TYPE: struct fdt_regmap
> +TYPE: const struct fdt_driver
>  NAME: fdt_regmap_drivers
> diff --git a/lib/utils/regmap/fdt_regmap_syscon.c b/lib/utils/regmap/fdt_regmap_syscon.c
> index ba559086..1309a55c 100644
> --- a/lib/utils/regmap/fdt_regmap_syscon.c
> +++ b/lib/utils/regmap/fdt_regmap_syscon.c
> @@ -263,7 +263,7 @@ static const struct fdt_match regmap_syscon_match[] = {
>         { },
>  };
>
> -struct fdt_regmap fdt_regmap_syscon = {
> +const struct fdt_driver fdt_regmap_syscon = {
>         .match_table = regmap_syscon_match,
>         .init = regmap_syscon_init,
>  };
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

