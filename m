From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Nov 2024 11:30:02 +0530
Subject: [PATCH 3/3] lib: utils/regmap: Use FDT node offset as regmap ID
In-Reply-To: <20240904021006.3653559-4-samuel.holland@sifive.com>
References: <20240904021006.3653559-1-samuel.holland@sifive.com> <20240904021006.3653559-4-samuel.holland@sifive.com>
Message-ID: <CAAhSdy3bALdrJG+WC+w9PU+pkHuGPuj-wgBXc5V5WQ7SeSHiMg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 4, 2024 at 7:40?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Since the FDT is not modified during driver initialization, node offsets
> are just as suitable as phandles for use as identifiers: they are stable
> and unique. With this change, it is no longer necessary to pass the
> phandle to the driver init functions, so these init functions now use
> the same prototype as other kinds of drivers.
>
> This matches what is already done for I2C adapters.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  include/sbi_utils/regmap/fdt_regmap.h |  2 +-
>  lib/utils/regmap/fdt_regmap.c         | 14 +++++++-------
>  lib/utils/regmap/fdt_regmap_syscon.c  |  4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/include/sbi_utils/regmap/fdt_regmap.h b/include/sbi_utils/regmap/fdt_regmap.h
> index 86e72442..de946f27 100644
> --- a/include/sbi_utils/regmap/fdt_regmap.h
> +++ b/include/sbi_utils/regmap/fdt_regmap.h
> @@ -17,7 +17,7 @@ struct fdt_phandle_args;
>  /** FDT based regmap driver */
>  struct fdt_regmap {
>         const struct fdt_match *match_table;
> -       int (*init)(const void *fdt, int nodeoff, u32 phandle,
> +       int (*init)(const void *fdt, int nodeoff,
>                     const struct fdt_match *match);
>  };
>
> diff --git a/lib/utils/regmap/fdt_regmap.c b/lib/utils/regmap/fdt_regmap.c
> index f02d2f07..933938fb 100644
> --- a/lib/utils/regmap/fdt_regmap.c
> +++ b/lib/utils/regmap/fdt_regmap.c
> @@ -16,7 +16,7 @@
>  extern struct fdt_regmap *fdt_regmap_drivers[];
>  extern unsigned long fdt_regmap_drivers_size;
>
> -static int fdt_regmap_init(const void *fdt, int nodeoff, u32 phandle)
> +static int fdt_regmap_init(const void *fdt, int nodeoff)
>  {
>         int pos, rc;
>         struct fdt_regmap *drv;
> @@ -27,7 +27,7 @@ static int fdt_regmap_init(const void *fdt, int nodeoff, u32 phandle)
>                 drv = fdt_regmap_drivers[pos];
>                 match = fdt_match_node(fdt, nodeoff, drv->match_table);
>                 if (match && drv->init) {
> -                       rc = drv->init(fdt, nodeoff, phandle, match);
> +                       rc = drv->init(fdt, nodeoff, match);
>                         if (rc == SBI_ENODEV)
>                                 continue;
>                         if (rc)
> @@ -39,20 +39,20 @@ static int fdt_regmap_init(const void *fdt, int nodeoff, u32 phandle)
>         return SBI_ENOSYS;
>  }
>
> -static int fdt_regmap_find(const void *fdt, int nodeoff, u32 phandle,
> +static int fdt_regmap_find(const void *fdt, int nodeoff,
>                            struct regmap **out_rmap)
>  {
>         int rc;
> -       struct regmap *rmap = regmap_find(phandle);
> +       struct regmap *rmap = regmap_find(nodeoff);
>
>         if (!rmap) {
>                 /* Regmap not found so initialize matching driver */
> -               rc = fdt_regmap_init(fdt, nodeoff, phandle);
> +               rc = fdt_regmap_init(fdt, nodeoff);
>                 if (rc)
>                         return rc;
>
>                 /* Try to find regmap again */
> -               rmap = regmap_find(phandle);
> +               rmap = regmap_find(nodeoff);
>                 if (!rmap)
>                         return SBI_ENOSYS;
>         }
> @@ -75,7 +75,7 @@ int fdt_regmap_get_by_phandle(const void *fdt, u32 phandle,
>         if (pnodeoff < 0)
>                 return pnodeoff;
>
> -       return fdt_regmap_find(fdt, pnodeoff, phandle, out_rmap);
> +       return fdt_regmap_find(fdt, pnodeoff, out_rmap);
>  }
>
>  int fdt_regmap_get(const void *fdt, int nodeoff, struct regmap **out_rmap)
> diff --git a/lib/utils/regmap/fdt_regmap_syscon.c b/lib/utils/regmap/fdt_regmap_syscon.c
> index a95f2515..ba559086 100644
> --- a/lib/utils/regmap/fdt_regmap_syscon.c
> +++ b/lib/utils/regmap/fdt_regmap_syscon.c
> @@ -159,7 +159,7 @@ static int regmap_syscon_write_be32(struct regmap *rmap, unsigned int reg,
>         return 0;
>  }
>
> -static int regmap_syscon_init(const void *fdt, int nodeoff, u32 phandle,
> +static int regmap_syscon_init(const void *fdt, int nodeoff,
>                               const struct fdt_match *match)
>  {
>         struct syscon_regmap *srm;
> @@ -188,7 +188,7 @@ static int regmap_syscon_init(const void *fdt, int nodeoff, u32 phandle,
>                 goto fail_free_syscon;
>         srm->addr = addr;
>
> -       srm->rmap.id = phandle;
> +       srm->rmap.id = nodeoff;
>         srm->rmap.reg_shift = 0;
>         srm->rmap.reg_stride = srm->reg_io_width * 8;
>         srm->rmap.reg_base = 0;
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

