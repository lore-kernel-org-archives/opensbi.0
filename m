From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Aug 2021 17:50:45 +0530
Subject: [PATCH] lib/utils: fdt: Change addr and size to uint64_t
In-Reply-To: <20210805074113.5626-1-bmeng.cn@gmail.com>
References: <20210805074113.5626-1-bmeng.cn@gmail.com>
Message-ID: <CAAhSdy10wEvh2EygGt7-Qsf8j7WM1sgWtmqdL8sPbN7UXh1MQQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 5, 2021 at 1:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The maximum address and size encoded in DT are 64-bit numbers, so we
> should use uint64_t for 'addr' and 'size' in fdt_get_node_addr_size().
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

We don't have MMU in M-mode so both RV32 and RV64 can only access
memory or devices within 0 to ULONG_MAX addresses. Based on this
rationale the addr and size parameters were kept "unsigned long". Using
"uint64_t" for addr and size is also fine because it makes things closer to
DT but on RV32 the addresses will still be truncated to 32-bit.

Overall, this looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>
>  include/sbi_utils/fdt/fdt_helper.h      |  6 +++---
>  lib/utils/fdt/fdt_helper.c              | 19 +++++++++----------
>  lib/utils/gpio/fdt_gpio_sifive.c        |  4 +++-
>  lib/utils/reset/fdt_reset_sifive_test.c |  2 +-
>  platform/fpga/openpiton/platform.c      |  2 +-
>  5 files changed, 17 insertions(+), 16 deletions(-)
>
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 55b9382..32aebb4 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -43,8 +43,8 @@ int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
>                                 const char *prop, const char *cells_prop,
>                                 int index, struct fdt_phandle_args *out_args);
>
> -int fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
> -                          unsigned long *size);
> +int fdt_get_node_addr_size(void *fdt, int node, uint64_t *addr,
> +                          uint64_t *size);
>
>  int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid);
>
> @@ -75,7 +75,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
>                           unsigned long *out_addr, unsigned long *out_size,
>                           u32 *out_first_hartid, u32 *out_hart_count);
>
> -int fdt_parse_compat_addr(void *fdt, unsigned long *addr,
> +int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
>                           const char *compatible);
>
>  #endif /* __FDT_HELPER_H__ */
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index a970c0f..a27f5ba 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -120,7 +120,7 @@ int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
>  }
>
>  static int fdt_translate_address(void *fdt, uint64_t reg, int parent,
> -                                unsigned long *addr)
> +                                uint64_t *addr)
>  {
>         int i, rlen;
>         int cell_addr, cell_size;
> @@ -157,8 +157,7 @@ static int fdt_translate_address(void *fdt, uint64_t reg, int parent,
>         return 0;
>  }
>
> -int fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
> -                          unsigned long *size)
> +int fdt_get_node_addr_size(void *fdt, int node, uint64_t *addr, uint64_t *size)
>  {
>         int parent, len, i, rc;
>         int cell_addr, cell_size;
> @@ -266,7 +265,7 @@ int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
>  {
>         int len, rc;
>         const fdt32_t *val;
> -       unsigned long reg_addr, reg_size;
> +       uint64_t reg_addr, reg_size;
>
>         if (nodeoffset < 0 || !uart || !fdt)
>                 return SBI_ENODEV;
> @@ -304,7 +303,7 @@ int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
>  {
>         int len, rc;
>         const fdt32_t *val;
> -       unsigned long reg_addr, reg_size;
> +       uint64_t reg_addr, reg_size;
>
>         if (nodeoffset < 0 || !uart || !fdt)
>                 return SBI_ENODEV;
> @@ -338,7 +337,7 @@ int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
>  {
>         int len, rc;
>         const fdt32_t *val;
> -       unsigned long reg_addr, reg_size;
> +       uint64_t reg_addr, reg_size;
>
>         if (nodeoffset < 0 || !uart || !fdt)
>                 return SBI_ENODEV;
> @@ -376,7 +375,7 @@ int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
>  {
>         int len, rc;
>         const fdt32_t *val;
> -       unsigned long reg_addr, reg_size;
> +       uint64_t reg_addr, reg_size;
>
>         if (nodeoffset < 0 || !uart || !fdt)
>                 return SBI_ENODEV;
> @@ -436,7 +435,7 @@ int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic)
>  {
>         int len, rc;
>         const fdt32_t *val;
> -       unsigned long reg_addr, reg_size;
> +       uint64_t reg_addr, reg_size;
>
>         if (nodeoffset < 0 || !plic || !fdt)
>                 return SBI_ENODEV;
> @@ -472,7 +471,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
>                           u32 *out_first_hartid, u32 *out_hart_count)
>  {
>         const fdt32_t *val;
> -       unsigned long reg_addr, reg_size;
> +       uint64_t reg_addr, reg_size;
>         int i, rc, count, cpu_offset, cpu_intc_offset;
>         u32 phandle, hwirq, hartid, first_hartid, last_hartid;
>         u32 match_hwirq = (for_timer) ? IRQ_M_TIMER : IRQ_M_SOFT;
> @@ -535,7 +534,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
>         return 0;
>  }
>
> -int fdt_parse_compat_addr(void *fdt, unsigned long *addr,
> +int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
>                           const char *compatible)
>  {
>         int nodeoffset, rc;
> diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
> index abc9d72..00d3e14 100644
> --- a/lib/utils/gpio/fdt_gpio_sifive.c
> +++ b/lib/utils/gpio/fdt_gpio_sifive.c
> @@ -71,15 +71,17 @@ static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
>  {
>         int rc;
>         struct sifive_gpio_chip *chip;
> +       uint64_t addr;
>
>         if (SIFIVE_GPIO_CHIP_MAX <= sifive_gpio_chip_count)
>                 return SBI_ENOSPC;
>         chip = &sifive_gpio_chip_array[sifive_gpio_chip_count];
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoff, &chip->addr, NULL);
> +       rc = fdt_get_node_addr_size(fdt, nodeoff, &addr, NULL);
>         if (rc)
>                 return rc;
>
> +       chip->addr = addr;
>         chip->chip.driver = &fdt_gpio_sifive;
>         chip->chip.id = phandle;
>         chip->chip.ngpio = SIFIVE_GPIO_PINS_DEF;
> diff --git a/lib/utils/reset/fdt_reset_sifive_test.c b/lib/utils/reset/fdt_reset_sifive_test.c
> index f98f03d..b0b59e7 100644
> --- a/lib/utils/reset/fdt_reset_sifive_test.c
> +++ b/lib/utils/reset/fdt_reset_sifive_test.c
> @@ -16,7 +16,7 @@ static int sifive_test_reset_init(void *fdt, int nodeoff,
>                                   const struct fdt_match *match)
>  {
>         int rc;
> -       unsigned long addr;
> +       uint64_t addr;
>
>         rc = fdt_get_node_addr_size(fdt, nodeoff, &addr, NULL);
>         if (rc)
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index 57ec21b..6939b57 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -64,7 +64,7 @@ static int openpiton_early_init(bool cold_boot)
>         void *fdt;
>         struct platform_uart_data uart_data;
>         struct plic_data plic_data;
> -       unsigned long clint_addr;
> +       uint64_t clint_addr;
>         int rc;
>
>         if (!cold_boot)
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

