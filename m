From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 24 Jul 2024 11:10:07 +0530
Subject: [PATCH 1/6] platform: Setup serial console device in early_init()
In-Reply-To: <20240705071504.50988-2-apatel@ventanamicro.com>
References: <20240705071504.50988-1-apatel@ventanamicro.com> <20240705071504.50988-2-apatel@ventanamicro.com>
Message-ID: <CAPd4WewBnxstB_su9-TeXLy3QDa9V7OJMWYiqTYrqqjvk+jaZA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 5, 2024 at 12:45?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The sbi_console_init() does not do any special initialization so
> setup serial console device in early_init() so that console prints
> work as early as possible.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  platform/fpga/ariane/platform.c    | 26 +++++++++-----------------
>  platform/fpga/openpiton/platform.c | 20 ++++----------------
>  platform/generic/platform.c        | 21 +++++++++++----------
>  platform/kendryte/k210/platform.c  | 18 ++++++------------
>  platform/nuclei/ux600/platform.c   | 18 +++++++-----------
>  platform/template/platform.c       | 18 ++++++------------
>  6 files changed, 43 insertions(+), 78 deletions(-)
>
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index 8be5e6c..8d46d88 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -7,7 +7,6 @@
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_encoding.h>
>  #include <sbi/riscv_io.h>
> -#include <sbi/sbi_console.h>
>  #include <sbi/sbi_const.h>
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_platform.h>
> @@ -67,8 +66,15 @@ static struct aclint_mtimer_data mtimer = {
>   */
>  static int ariane_early_init(bool cold_boot)
>  {
> -       /* For now nothing to do. */
> -       return 0;
> +       if (!cold_boot)
> +               return 0;
> +
> +       return uart8250_init(ARIANE_UART_ADDR,
> +                            ARIANE_UART_FREQ,
> +                            ARIANE_UART_BAUDRATE,
> +                            ARIANE_UART_REG_SHIFT,
> +                            ARIANE_UART_REG_WIDTH,
> +                            ARIANE_UART_REG_OFFSET);
>  }
>
>  /*
> @@ -87,19 +93,6 @@ static int ariane_final_init(bool cold_boot)
>         return 0;
>  }
>
> -/*
> - * Initialize the ariane console.
> - */
> -static int ariane_console_init(void)
> -{
> -       return uart8250_init(ARIANE_UART_ADDR,
> -                            ARIANE_UART_FREQ,
> -                            ARIANE_UART_BAUDRATE,
> -                            ARIANE_UART_REG_SHIFT,
> -                            ARIANE_UART_REG_WIDTH,
> -                            ARIANE_UART_REG_OFFSET);
> -}
> -
>  static int plic_ariane_warm_irqchip_init(int m_cntx_id, int s_cntx_id)
>  {
>         int ret;
> @@ -175,7 +168,6 @@ static int ariane_timer_init(bool cold_boot)
>  const struct sbi_platform_operations platform_ops = {
>         .early_init = ariane_early_init,
>         .final_init = ariane_final_init,
> -       .console_init = ariane_console_init,
>         .irqchip_init = ariane_irqchip_init,
>         .ipi_init = ariane_ipi_init,
>         .timer_init = ariane_timer_init,
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index 2317a89..dd74a0c 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -6,7 +6,6 @@
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_encoding.h>
>  #include <sbi/riscv_io.h>
> -#include <sbi/sbi_console.h>
>  #include <sbi/sbi_const.h>
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_platform.h>
> @@ -103,7 +102,10 @@ static int openpiton_early_init(bool cold_boot)
>                                     ACLINT_DEFAULT_MTIMECMP_OFFSET;
>         }
>
> -       return 0;
> +       return uart8250_init(uart.addr, uart.freq, uart.baud,
> +                            OPENPITON_DEFAULT_UART_REG_SHIFT,
> +                            OPENPITON_DEFAULT_UART_REG_WIDTH,
> +                            OPENPITON_DEFAULT_UART_REG_OFFSET);
>  }
>
>  /*
> @@ -122,19 +124,6 @@ static int openpiton_final_init(bool cold_boot)
>         return 0;
>  }
>
> -/*
> - * Initialize the openpiton console.
> - */
> -static int openpiton_console_init(void)
> -{
> -       return uart8250_init(uart.addr,
> -                            uart.freq,
> -                            uart.baud,
> -                            OPENPITON_DEFAULT_UART_REG_SHIFT,
> -                            OPENPITON_DEFAULT_UART_REG_WIDTH,
> -                            OPENPITON_DEFAULT_UART_REG_OFFSET);
> -}
> -
>  static int plic_openpiton_warm_irqchip_init(int m_cntx_id, int s_cntx_id)
>  {
>         int ret;
> @@ -210,7 +199,6 @@ static int openpiton_timer_init(bool cold_boot)
>  const struct sbi_platform_operations platform_ops = {
>         .early_init = openpiton_early_init,
>         .final_init = openpiton_final_init,
> -       .console_init = openpiton_console_init,
>         .irqchip_init = openpiton_irqchip_init,
>         .ipi_init = openpiton_ipi_init,
>         .timer_init = openpiton_timer_init,
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 1f46b76..3470474 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -221,9 +221,19 @@ static int generic_nascent_init(void)
>
>  static int generic_early_init(bool cold_boot)
>  {
> -       if (cold_boot)
> +       int rc;
> +
> +       if (cold_boot) {
>                 fdt_reset_init();
>
> +               if (semihosting_enabled())
> +                       rc = semihosting_init();
> +               else
> +                       rc = fdt_serial_init();
> +               if (rc)
> +                       return rc;
> +       }
> +
>         if (!generic_plat || !generic_plat->early_init)
>                 return 0;
>
> @@ -378,14 +388,6 @@ static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
>         return evt_val;
>  }
>
> -static int generic_console_init(void)
> -{
> -       if (semihosting_enabled())
> -               return semihosting_init();
> -       else
> -               return fdt_serial_init();
> -}
> -
>  const struct sbi_platform_operations platform_ops = {
>         .cold_boot_allowed      = generic_cold_boot_allowed,
>         .nascent_init           = generic_nascent_init,
> @@ -395,7 +397,6 @@ const struct sbi_platform_operations platform_ops = {
>         .final_exit             = generic_final_exit,
>         .extensions_init        = generic_extensions_init,
>         .domains_init           = generic_domains_init,
> -       .console_init           = generic_console_init,
>         .irqchip_init           = fdt_irqchip_init,
>         .irqchip_exit           = fdt_irqchip_exit,
>         .ipi_init               = fdt_ipi_init,
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index 27b23f7..531adcd 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -9,7 +9,6 @@
>
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_encoding.h>
> -#include <sbi/sbi_console.h>
>  #include <sbi/sbi_const.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_system.h>
> @@ -109,10 +108,13 @@ static struct sbi_system_reset_device k210_reset = {
>
>  static int k210_early_init(bool cold_boot)
>  {
> -       if (cold_boot)
> -               sbi_system_reset_add_device(&k210_reset);
> +       if (!cold_boot)
> +               return 0;
>
> -       return 0;
> +       sbi_system_reset_add_device(&k210_reset);
> +
> +       return sifive_uart_init(K210_UART_BASE_ADDR, k210_get_clk_freq(),
> +                               K210_UART_BAUDRATE);
>  }
>
>  static int k210_final_init(bool cold_boot)
> @@ -130,12 +132,6 @@ static int k210_final_init(bool cold_boot)
>         return 0;
>  }
>
> -static int k210_console_init(void)
> -{
> -       return sifive_uart_init(K210_UART_BASE_ADDR, k210_get_clk_freq(),
> -                               K210_UART_BAUDRATE);
> -}
> -
>  static int k210_irqchip_init(bool cold_boot)
>  {
>         int rc;
> @@ -181,8 +177,6 @@ const struct sbi_platform_operations platform_ops = {
>
>         .final_init     = k210_final_init,
>
> -       .console_init   = k210_console_init,
> -
>         .irqchip_init = k210_irqchip_init,
>
>         .ipi_init  = k210_ipi_init,
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index f688b50..2289366 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -11,7 +11,6 @@
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_io.h>
>  #include <sbi/riscv_encoding.h>
> -#include <sbi/sbi_console.h>
>  #include <sbi/sbi_const.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_system.h>
> @@ -150,8 +149,10 @@ static int ux600_early_init(bool cold_boot)
>  {
>         u32 regval;
>
> -       if (cold_boot)
> -               sbi_system_reset_add_device(&ux600_reset);
> +       if (!cold_boot)
> +               return 0;
> +
> +       sbi_system_reset_add_device(&ux600_reset);
>
>         /* Measure CPU Frequency using Timer */
>         ux600_clk_freq = ux600_get_clk_freq();
> @@ -163,7 +164,9 @@ static int ux600_early_init(bool cold_boot)
>         regval = readl((void *)(UX600_GPIO_ADDR + UX600_GPIO_IOF_EN_OFS)) |
>                 UX600_GPIO_IOF_UART0_MASK;
>         writel(regval, (void *)(UX600_GPIO_ADDR + UX600_GPIO_IOF_EN_OFS));
> -       return 0;
> +
> +       return sifive_uart_init(UX600_DEBUG_UART, ux600_clk_freq,
> +                               UX600_UART_BAUDRATE);
>  }
>
>  static void ux600_modify_dt(void *fdt)
> @@ -184,12 +187,6 @@ static int ux600_final_init(bool cold_boot)
>         return 0;
>  }
>
> -static int ux600_console_init(void)
> -{
> -       return sifive_uart_init(UX600_DEBUG_UART, ux600_clk_freq,
> -                               UX600_UART_BAUDRATE);
> -}
> -
>  static int ux600_irqchip_init(bool cold_boot)
>  {
>         int rc;
> @@ -234,7 +231,6 @@ static int ux600_timer_init(bool cold_boot)
>  const struct sbi_platform_operations platform_ops = {
>         .early_init             = ux600_early_init,
>         .final_init             = ux600_final_init,
> -       .console_init           = ux600_console_init,
>         .irqchip_init           = ux600_irqchip_init,
>         .ipi_init               = ux600_ipi_init,
>         .timer_init             = ux600_timer_init,
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index 4b3f2ac..b4d30a5 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -64,7 +64,12 @@ static struct aclint_mtimer_data mtimer = {
>   */
>  static int platform_early_init(bool cold_boot)
>  {
> -       return 0;
> +       if (!cold_boot)
> +               return 0;
> +
> +       /* Example if the generic UART8250 driver is used */
> +       return uart8250_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
> +                            PLATFORM_UART_BAUDRATE, 0, 1, 0);
>  }
>
>  /*
> @@ -75,16 +80,6 @@ static int platform_final_init(bool cold_boot)
>         return 0;
>  }
>
> -/*
> - * Initialize the platform console.
> - */
> -static int platform_console_init(void)
> -{
> -       /* Example if the generic UART8250 driver is used */
> -       return uart8250_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
> -                            PLATFORM_UART_BAUDRATE, 0, 1, 0);
> -}
> -
>  /*
>   * Initialize the platform interrupt controller for current HART.
>   */
> @@ -143,7 +138,6 @@ static int platform_timer_init(bool cold_boot)
>  const struct sbi_platform_operations platform_ops = {
>         .early_init             = platform_early_init,
>         .final_init             = platform_final_init,
> -       .console_init           = platform_console_init,
>         .irqchip_init           = platform_irqchip_init,
>         .ipi_init               = platform_ipi_init,
>         .timer_init             = platform_timer_init
> --
> 2.34.1

LGTM

Reviewed-By: Himanshu Chauhan <hchauhan@ventanamicro.com>

>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

