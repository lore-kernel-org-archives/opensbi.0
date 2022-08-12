From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 12 Aug 2022 12:26:49 +0200
Subject: [PATCH v3] lib: utils: serial: Add Cadence UART driver
In-Reply-To: <20220812061331.36322-1-junliang.tan@linux.starfivetech.com>
References: <20220812061331.36322-1-junliang.tan@linux.starfivetech.com>
Message-ID: <20220812102649.4yoqnncjrikiq4c4@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 12, 2022 at 02:13:31PM +0800, Jun Liang Tan wrote:
> Add Cadence UART driver
> 
> Signed-off-by: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
> Signed-off-by: Wei Liang Lim <weiliang.lim@linux.starfivetech.com>
> ---

Please add a changelog here under the '---' when posting new versions.

>  include/sbi_utils/fdt/fdt_helper.h      |   4 +-
>  include/sbi_utils/serial/cadence-uart.h |  16 +++
>  lib/utils/fdt/fdt_helper.c              |   6 +-
>  lib/utils/serial/Kconfig                |   9 ++
>  lib/utils/serial/cadence-uart.c         | 132 ++++++++++++++++++++++++
>  lib/utils/serial/fdt_serial_cadence.c   |  35 +++++++
>  lib/utils/serial/fdt_serial_uart8250.c  |   2 +-
>  lib/utils/serial/objects.mk             |   4 +
>  lib/utils/serial/sifive-uart.c          |   7 +-
>  platform/generic/configs/defconfig      |   1 +
>  10 files changed, 209 insertions(+), 7 deletions(-)
>  create mode 100644 include/sbi_utils/serial/cadence-uart.h
>  create mode 100644 lib/utils/serial/cadence-uart.c
>  create mode 100644 lib/utils/serial/fdt_serial_cadence.c
> 
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index c60af35..bcd4996 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -65,8 +65,8 @@ int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
>  int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
>  			       struct platform_uart_data *uart);
>  
> -int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
> -			    struct platform_uart_data *uart);
> +int fdt_parse_uart_node(void *fdt, int nodeoffset,
> +			struct platform_uart_data *uart);
>  
>  int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
>  		       const char *compatible);
> diff --git a/include/sbi_utils/serial/cadence-uart.h b/include/sbi_utils/serial/cadence-uart.h
> new file mode 100644
> index 0000000..e75fb95
> --- /dev/null
> +++ b/include/sbi_utils/serial/cadence-uart.h
> @@ -0,0 +1,16 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 StarFive Technology Co., Ltd.
> + *
> + * Author: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
> + */
> +
> +#ifndef __SERIAL_CADENCE_UART_H__
> +#define __SERIAL_CADENCE_UART_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate);
> +
> +#endif
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index c6abf80..6a75d6f 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -401,8 +401,8 @@ int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
>  	return 0;
>  }
>  
> -int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
> -			    struct platform_uart_data *uart)
> +int fdt_parse_uart_node(void *fdt, int nodeoffset,
> +			struct platform_uart_data *uart)
>  {
>  	int len, rc;
>  	const fdt32_t *val;
> @@ -447,7 +447,7 @@ int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
>  	if (nodeoffset < 0)
>  		return nodeoffset;
>  
> -	return fdt_parse_uart8250_node(fdt, nodeoffset, uart);
> +	return fdt_parse_uart_node(fdt, nodeoffset, uart);
>  }
>  
>  int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
> diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
> index 152060d..6e425f2 100644
> --- a/lib/utils/serial/Kconfig
> +++ b/lib/utils/serial/Kconfig
> @@ -9,6 +9,11 @@ config FDT_SERIAL
>  
>  if FDT_SERIAL
>  
> +config FDT_SERIAL_CADENCE
> +	bool "Cadence UART FDT driver"
> +	select SERIAL_CADENCE
> +	default n
> +
>  config FDT_SERIAL_GAISLER
>  	bool "Gaisler UART FDT driver"
>  	select SERIAL_GAISLER
> @@ -46,6 +51,10 @@ config FDT_SERIAL_XILINX_UARTLITE
>  
>  endif
>  
> +config SERIAL_CADENCE
> +	bool "Cadence UART support"
> +	default n
> +
>  config SERIAL_GAISLER
>  	bool "Gaisler UART support"
>  	default n
> diff --git a/lib/utils/serial/cadence-uart.c b/lib/utils/serial/cadence-uart.c
> new file mode 100644
> index 0000000..4aecc08
> --- /dev/null
> +++ b/lib/utils/serial/cadence-uart.c
> @@ -0,0 +1,132 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 StarFive Technology Co., Ltd.
> + *
> + * Author: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
> + */
> +
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi_utils/serial/cadence-uart.h>
> +
> +/* clang-format off */
> +
> +#define UART_REG_CTRL		0x00
> +#define UART_REG_MODE		0x04
> +#define UART_REG_IDR		0x0C
> +#define UART_REG_BRGR		0x18
> +#define UART_REG_CSR		0x2C
> +#define UART_REG_RFIFO_TFIFO	0x30
> +#define UART_REG_BDIVR		0x34
> +
> +#define UART_CTRL_RXRES		0x00000001
> +#define UART_CTRL_TXRES		0x00000002
> +#define UART_CTRL_RXEN		0x00000004
> +#define UART_CTRL_RXDIS		0x00000008
> +#define UART_CTRL_TXEN		0x00000010
> +#define UART_CTRL_TXDIS		0x00000020
> +
> +#define UART_MODE_PAR_NONE	0x00000020	/* No parity set */
> +
> +#define UART_BRGR_CD_CLKDIVISOR	0x00000001	/* baud_sample = sel_clk */
> +
> +#define	UART_CSR_REMPTY		0x00000002
> +#define	UART_CSR_TFUL		0x00000010

Assuming these reg/field names match the spec, then this looks good.

> +
> +/* clang-format on */
> +
> +static volatile void *uart_base;
> +static u32 uart_in_freq;
> +static u32 uart_baudrate;
> +
> +/*
> + * Find minimum divisor divides in_freq to max_target_hz;
> + * Based on SiFive UART driver (sifive-uart.c)
> + */
> +static inline unsigned int uart_min_clk_divisor(uint64_t in_freq,
> +						uint64_t max_target_hz)
> +{
> +	uint64_t quotient;
> +
> +	if (max_target_hz == 0)
> +		return 0;

In the end I approached the possible divide-by-zero differently.
Please see commit f27203525aa2 ("lib: utils/serial: Ensure baudrate
is non-zero before using")

> +
> +	quotient = (in_freq + max_target_hz - 1) / (max_target_hz);
> +
> +	/* Avoid underflow */
> +	if (quotient == 0)
> +		return 0;
> +	else
> +		return quotient - 1;
> +}
> +
> +static u32 get_reg(u32 offset)
> +{
> +	return readl(uart_base + offset);
> +}
> +
> +static void set_reg(u32 offset, u32 val)
> +{
> +	writel(val, uart_base + offset);
> +}
> +
> +static void cadence_uart_putc(char ch)
> +{
> +	while (get_reg(UART_REG_CSR) & UART_CSR_TFUL)
> +		;
> +
> +	set_reg(UART_REG_RFIFO_TFIFO, ch);
> +}
> +
> +static int cadence_uart_getc(void)
> +{
> +	u32 ret = get_reg(UART_REG_CSR);
> +
> +	if (!(ret & UART_CSR_REMPTY))
> +		return get_reg(UART_REG_RFIFO_TFIFO);
> +
> +	return -1;
> +}
> +
> +static struct sbi_console_device cadence_console = {
> +	.name = "cadence_uart",
> +	.console_putc = cadence_uart_putc,
> +	.console_getc = cadence_uart_getc
> +};
> +
> +int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
> +{
> +	uart_base     = (volatile void *)base;
> +	uart_in_freq  = in_freq;
> +	uart_baudrate = baudrate;
> +
> +	/* Disable interrupts */
> +	set_reg(UART_REG_IDR, 0xFFFFFFFF);
> +
> +	/* Disable TX RX */
> +	set_reg(UART_REG_CTRL, UART_CTRL_TXDIS | UART_CTRL_RXDIS);
> +
> +	/* Configure baudrate */
> +	if (in_freq) {

Doing the same as the divide-by-zero fix referenced above, this should be

  if (in_freq && buadrate)

> +		set_reg(UART_REG_BRGR, UART_BRGR_CD_CLKDIVISOR);
> +		set_reg(UART_REG_BDIVR,
> +			uart_min_clk_divisor(in_freq, baudrate));
> +	}
> +
> +	/* Software reset TX RX data path and enable TX RX */
> +	set_reg(UART_REG_CTRL, UART_CTRL_TXRES | UART_CTRL_RXRES
> +		| UART_CTRL_TXEN | UART_CTRL_RXEN);
> +
> +	/* Set:

nit: comments should have the opening wing

> +	 * 1 stop bit, bits[07:06] = 0x00,
> +	 * no parity set, bits[05:03] = 0x100,
> +	 * 8 bits character length, bits[02:01] = 0x00,
> +	 * sel_clk = uart_clk, bit[0] = 0x0
> +	 */
> +	set_reg(UART_REG_MODE, UART_MODE_PAR_NONE);
> +
> +	sbi_console_set_device(&cadence_console);
> +
> +	return 0;
> +}
> diff --git a/lib/utils/serial/fdt_serial_cadence.c b/lib/utils/serial/fdt_serial_cadence.c
> new file mode 100644
> index 0000000..946e533
> --- /dev/null
> +++ b/lib/utils/serial/fdt_serial_cadence.c
> @@ -0,0 +1,35 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 StarFive Technology Co., Ltd.
> + *
> + * Author: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
> + */
> +
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/serial/fdt_serial.h>
> +#include <sbi_utils/serial/cadence-uart.h>
> +
> +static int serial_cadence_init(void *fdt, int nodeoff,
> +			       const struct fdt_match *match)
> +{
> +	int rc;
> +	struct platform_uart_data uart = { 0 };
> +
> +	rc = fdt_parse_uart_node(fdt, nodeoff, &uart);
> +	if (rc)
> +		return rc;
> +
> +	return cadence_uart_init(uart.addr, uart.freq, uart.baud);
> +}
> +
> +static const struct fdt_match serial_cadence_match[] = {
> +	{ .compatible = "cdns,uart-r1p12" },
> +	{ .compatible = "starfive,jh8100-uart" },
> +	{ },
> +};
> +
> +struct fdt_serial fdt_serial_cadence = {
> +	.match_table = serial_cadence_match,
> +	.init = serial_cadence_init
> +};
> diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
> index 0b95f2d..7b5d6a4 100644
> --- a/lib/utils/serial/fdt_serial_uart8250.c
> +++ b/lib/utils/serial/fdt_serial_uart8250.c
> @@ -17,7 +17,7 @@ static int serial_uart8250_init(void *fdt, int nodeoff,
>  	int rc;
>  	struct platform_uart_data uart = { 0 };
>  
> -	rc = fdt_parse_uart8250_node(fdt, nodeoff, &uart);
> +	rc = fdt_parse_uart_node(fdt, nodeoff, &uart);
>  	if (rc)
>  		return rc;
>  
> diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
> index fa9f5a3..efb1d9e 100644
> --- a/lib/utils/serial/objects.mk
> +++ b/lib/utils/serial/objects.mk
> @@ -10,6 +10,9 @@
>  libsbiutils-objs-$(CONFIG_FDT_SERIAL) += serial/fdt_serial.o
>  libsbiutils-objs-$(CONFIG_FDT_SERIAL) += serial/fdt_serial_drivers.o
>  
> +carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_CADENCE) += fdt_serial_cadence
> +libsbiutils-objs-$(CONFIG_FDT_SERIAL_CADENCE) += serial/fdt_serial_cadence.o
> +
>  carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_GAISLER) += fdt_serial_gaisler
>  libsbiutils-objs-$(CONFIG_FDT_SERIAL_GAISLER) += serial/fdt_serial_gaisler.o
>  
> @@ -31,6 +34,7 @@ libsbiutils-objs-$(CONFIG_FDT_SERIAL_UART8250) += serial/fdt_serial_uart8250.o
>  carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_XILINX_UARTLITE) += fdt_serial_xlnx_uartlite
>  libsbiutils-objs-$(CONFIG_FDT_SERIAL_XILINX_UARTLITE) += serial/fdt_serial_xlnx_uartlite.o
>  
> +libsbiutils-objs-$(CONFIG_SERIAL_CADENCE) += serial/cadence-uart.o
>  libsbiutils-objs-$(CONFIG_SERIAL_GAISLER) += serial/gaisler-uart.o
>  libsbiutils-objs-$(CONFIG_SERIAL_SHAKTI) += serial/shakti-uart.o
>  libsbiutils-objs-$(CONFIG_SERIAL_SIFIVE) += serial/sifive-uart.o
> diff --git a/lib/utils/serial/sifive-uart.c b/lib/utils/serial/sifive-uart.c
> index 3581d47..c085294 100644
> --- a/lib/utils/serial/sifive-uart.c
> +++ b/lib/utils/serial/sifive-uart.c
> @@ -47,7 +47,12 @@ static u32 uart_baudrate;
>  static inline unsigned int uart_min_clk_divisor(uint64_t in_freq,
>  						uint64_t max_target_hz)
>  {
> -	uint64_t quotient = (in_freq + max_target_hz - 1) / (max_target_hz);
> +	uint64_t quotient;
> +
> +	if (max_target_hz == 0)
> +		return 0;
> +
> +	quotient = (in_freq + max_target_hz - 1) / (max_target_hz);

This is no longer necessary (because of the fix referenced above). And, if
it was necessary, it should be a separate patch.

>  
>  	/* Avoid underflow */
>  	if (quotient == 0)
> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
> index 2a75394..e324173 100644
> --- a/platform/generic/configs/defconfig
> +++ b/platform/generic/configs/defconfig
> @@ -18,6 +18,7 @@ CONFIG_FDT_RESET_SIFIVE_TEST=y
>  CONFIG_FDT_RESET_SUNXI_WDT=y
>  CONFIG_FDT_RESET_THEAD=y
>  CONFIG_FDT_SERIAL=y
> +CONFIG_FDT_SERIAL_CADENCE=y
>  CONFIG_FDT_SERIAL_GAISLER=y
>  CONFIG_FDT_SERIAL_HTIF=y
>  CONFIG_FDT_SERIAL_SHAKTI=y
> -- 
> 2.37.1
>

Thanks,
drew

