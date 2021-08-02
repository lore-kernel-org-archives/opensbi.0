From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 2 Aug 2021 12:40:35 -0700
Subject: [PATCH 2/5] lib: utils: Extend fdt_get_node_addr_size() for
 multiple register sets
In-Reply-To: <20210724122503.2486624-3-anup.patel@wdc.com>
References: <20210724122503.2486624-1-anup.patel@wdc.com>
 <20210724122503.2486624-3-anup.patel@wdc.com>
Message-ID: <CAOnJCUL-g2HDPSzbvL3an6iwUK4mp944JOhUY7EWH1JqXyXKNg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 24, 2021 at 5:25 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add "set" parameter to fdt_get_node_addr_size() API so that
> calling function can specify index of desired register set. This
> will allow fdt_get_node_addr_size() to handle DT nodes with
> multiple register sets.
>

IMHO, index would be a better name for the parameter.

> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi_utils/fdt/fdt_helper.h      |  3 ++-
>  lib/utils/fdt/fdt_helper.c              | 31 ++++++++++++++++++-------
>  lib/utils/gpio/fdt_gpio_sifive.c        |  2 +-
>  lib/utils/reset/fdt_reset_sifive_test.c |  2 +-
>  4 files changed, 27 insertions(+), 11 deletions(-)
>
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 55b9382..0445e36 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -43,7 +43,8 @@ int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
>                                 const char *prop, const char *cells_prop,
>                                 int index, struct fdt_phandle_args *out_args);
>
> -int fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
> +int fdt_get_node_addr_size(void *fdt, int node, int set,
> +                          unsigned long *addr,
>                            unsigned long *size);
>
>  int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid);
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index a970c0f..a992911 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -157,7 +157,8 @@ static int fdt_translate_address(void *fdt, uint64_t reg, int parent,
>         return 0;
>  }
>
> -int fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
> +int fdt_get_node_addr_size(void *fdt, int node, int set,
> +                          unsigned long *addr,
>                            unsigned long *size)
>  {
>         int parent, len, i, rc;
> @@ -165,6 +166,9 @@ int fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
>         const fdt32_t *prop_addr, *prop_size;
>         uint64_t temp = 0;
>
> +       if (!fdt || node < 0 || set < 0)
> +               return SBI_EINVAL;
> +
>         parent = fdt_parent_offset(fdt, node);
>         if (parent < 0)
>                 return parent;
> @@ -179,6 +183,11 @@ int fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
>         prop_addr = fdt_getprop(fdt, node, "reg", &len);
>         if (!prop_addr)
>                 return SBI_ENODEV;
> +
> +       if ((len / sizeof(u32)) <= (set * (cell_addr + cell_size)))
> +               return SBI_EINVAL;
> +
> +       prop_addr = prop_addr + (set * (cell_addr + cell_size));
>         prop_size = prop_addr + cell_addr;
>
>         if (addr) {
> @@ -271,7 +280,8 @@ int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
>         if (nodeoffset < 0 || !uart || !fdt)
>                 return SBI_ENODEV;
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> +                                   &reg_addr, &reg_size);
>         if (rc < 0 || !reg_addr || !reg_size)
>                 return SBI_ENODEV;
>         uart->addr = reg_addr;
> @@ -309,7 +319,8 @@ int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
>         if (nodeoffset < 0 || !uart || !fdt)
>                 return SBI_ENODEV;
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> +                                   &reg_addr, &reg_size);
>         if (rc < 0 || !reg_addr || !reg_size)
>                 return SBI_ENODEV;
>         uart->addr = reg_addr;
> @@ -343,7 +354,8 @@ int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
>         if (nodeoffset < 0 || !uart || !fdt)
>                 return SBI_ENODEV;
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> +                                   &reg_addr, &reg_size);
>         if (rc < 0 || !reg_addr || !reg_size)
>                 return SBI_ENODEV;
>         uart->addr = reg_addr;
> @@ -381,7 +393,8 @@ int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
>         if (nodeoffset < 0 || !uart || !fdt)
>                 return SBI_ENODEV;
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> +                                   &reg_addr, &reg_size);
>         if (rc < 0 || !reg_addr || !reg_size)
>                 return SBI_ENODEV;
>         uart->addr = reg_addr;
> @@ -441,7 +454,8 @@ int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic)
>         if (nodeoffset < 0 || !plic || !fdt)
>                 return SBI_ENODEV;
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> +                                   &reg_addr, &reg_size);
>         if (rc < 0 || !reg_addr || !reg_size)
>                 return SBI_ENODEV;
>         plic->addr = reg_addr;
> @@ -482,7 +496,8 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
>             !out_first_hartid || !out_hart_count)
>                 return SBI_EINVAL;
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> +                                   &reg_addr, &reg_size);
>         if (rc < 0 || !reg_addr || !reg_size)
>                 return SBI_ENODEV;
>         *out_addr = reg_addr;
> @@ -544,7 +559,7 @@ int fdt_parse_compat_addr(void *fdt, unsigned long *addr,
>         if (nodeoffset < 0)
>                 return nodeoffset;
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, addr, NULL);
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0, addr, NULL);
>         if (rc < 0 || !addr)
>                 return SBI_ENODEV;
>
> diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
> index abc9d72..bbddd58 100644
> --- a/lib/utils/gpio/fdt_gpio_sifive.c
> +++ b/lib/utils/gpio/fdt_gpio_sifive.c
> @@ -76,7 +76,7 @@ static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
>                 return SBI_ENOSPC;
>         chip = &sifive_gpio_chip_array[sifive_gpio_chip_count];
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoff, &chip->addr, NULL);
> +       rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &chip->addr, NULL);
>         if (rc)
>                 return rc;
>
> diff --git a/lib/utils/reset/fdt_reset_sifive_test.c b/lib/utils/reset/fdt_reset_sifive_test.c
> index f98f03d..b0b7dbb 100644
> --- a/lib/utils/reset/fdt_reset_sifive_test.c
> +++ b/lib/utils/reset/fdt_reset_sifive_test.c
> @@ -18,7 +18,7 @@ static int sifive_test_reset_init(void *fdt, int nodeoff,
>         int rc;
>         unsigned long addr;
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoff, &addr, NULL);
> +       rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
>         if (rc)
>                 return rc;
>
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Other than that, looks good.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

