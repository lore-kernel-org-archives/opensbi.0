From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 Mar 2025 17:00:41 +0530
Subject: [PATCH 1/2] lib: utils/fdt: Respect compatible string fallback priority
In-Reply-To: <20250219204258.261765-1-samuel.holland@sifive.com>
References: <20250219204258.261765-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy3wq1T22MLgT07H5pK38fgb2wGbzJSM1qn0pELW0cv8_g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 20, 2025 at 2:13?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> When matching drivers to DT nodes, always match all drivers against the
> first compatible string before considering fallback compatible strings.
> This ensures the most specific match is always selected, regardless of
> the order of the drivers or match structures, as long as no compatible
> string appears in multiple match structures.
>
> Fixes: 1ccc52c427f3 ("lib: utils/fdt: Add helpers for generic driver initialization")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>
>  lib/utils/fdt/fdt_driver.c | 46 +++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 21 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_driver.c b/lib/utils/fdt/fdt_driver.c
> index f6707c0e..39385ce9 100644
> --- a/lib/utils/fdt/fdt_driver.c
> +++ b/lib/utils/fdt/fdt_driver.c
> @@ -15,39 +15,43 @@ int fdt_driver_init_by_offset(const void *fdt, int nodeoff,
>  {
>         const struct fdt_driver *driver;
>         const struct fdt_match *match;
> -       const void *prop;
> -       int len, rc;
> +       int compat_len, prop_len, rc;
> +       const char *compat_str;
>
>         if (!fdt_node_is_enabled(fdt, nodeoff))
>                 return SBI_ENODEV;
>
> -       prop = fdt_getprop(fdt, nodeoff, "compatible", &len);
> -       if (!prop)
> +       compat_str = fdt_getprop(fdt, nodeoff, "compatible", &prop_len);
> +       if (!compat_str)
>                 return SBI_ENODEV;
>
> -       while ((driver = *drivers++)) {
> -               for (match = driver->match_table; match->compatible; match++) {
> -                       if (!fdt_stringlist_contains(prop, len, match->compatible))
> -                               continue;
> +       while ((compat_len = strnlen(compat_str, prop_len) + 1) <= prop_len) {
> +               for (int i = 0; (driver = drivers[i]); i++)
> +                       for (match = driver->match_table; match->compatible; match++)
> +                               if (!memcmp(match->compatible, compat_str, compat_len))
> +                                       goto found;
>
> -                       if (driver->experimental)
> -                               sbi_printf("WARNING: %s driver is experimental and may change\n",
> -                                          match->compatible);
> +               compat_str += compat_len;
> +               prop_len -= compat_len;
> +       }
>
> -                       rc = driver->init(fdt, nodeoff, match);
> -                       if (rc < 0) {
> -                               const char *name;
> +       return SBI_ENODEV;
>
> -                               name = fdt_get_name(fdt, nodeoff, NULL);
> -                               sbi_printf("%s: %s (%s) init failed: %d\n",
> -                                          __func__, name, match->compatible, rc);
> -                       }
> +found:
> +       if (driver->experimental)
> +               sbi_printf("WARNING: %s driver is experimental and may change\n",
> +                          match->compatible);
>
> -                       return rc;
> -               }
> +       rc = driver->init(fdt, nodeoff, match);
> +       if (rc < 0) {
> +               const char *name;
> +
> +               name = fdt_get_name(fdt, nodeoff, NULL);
> +               sbi_printf("%s: %s (%s) init failed: %d\n",
> +                          __func__, name, match->compatible, rc);
>         }
>
> -       return SBI_ENODEV;
> +       return rc;
>  }
>
>  static int fdt_driver_init_scan(const void *fdt,
> --
> 2.47.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

