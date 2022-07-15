From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 15 Jul 2022 10:32:14 +0200
Subject: [PATCH v2] lib: utils: serial: Add Cadence UART driver
In-Reply-To: <20220715024054.7326-1-junliang.tan@linux.starfivetech.com>
References: <20220715024054.7326-1-junliang.tan@linux.starfivetech.com>
Message-ID: <20220715083214.vs5fvxhgt4m45waa@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 15, 2022 at 10:40:54AM +0800, Jun Liang Tan wrote:
> Add Cadence UART driver
> 
> Signed-off-by: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
> Signed-off-by: Wei Liang Lim <weiliang.lim@linux.starfivetech.com>
> ---
>  include/sbi_utils/fdt/fdt_helper.h      |   4 +-
>  include/sbi_utils/serial/cadence-uart.h |  16 +++
>  lib/utils/fdt/fdt_helper.c              |   6 +-
>  lib/utils/serial/cadence-uart.c         | 125 ++++++++++++++++++++++++
>  lib/utils/serial/fdt_serial_cadence.c   |  35 +++++++
>  lib/utils/serial/fdt_serial_uart8250.c  |   2 +-
>  lib/utils/serial/objects.mk             |   4 +
>  7 files changed, 186 insertions(+), 6 deletions(-)
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
> index 2bdb1ef..1e136fe 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -427,8 +427,8 @@ int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
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
> @@ -492,7 +492,7 @@ int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
>  	if (nodeoffset < 0)
>  		return nodeoffset;
>  
> -	return fdt_parse_uart8250_node(fdt, nodeoffset, uart);
> +	return fdt_parse_uart_node(fdt, nodeoffset, uart);
>  }
>  
>  int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
> diff --git a/lib/utils/serial/cadence-uart.c b/lib/utils/serial/cadence-uart.c
> new file mode 100644
> index 0000000..ffa79f8
> --- /dev/null
> +++ b/lib/utils/serial/cadence-uart.c
> @@ -0,0 +1,125 @@
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
> +#define UART_REG_OFFSET_CTRL		0x00	/* Control register */
> +#define UART_REG_OFFSET_MODE		0x04	/* Mode register */
> +#define UART_REG_OFFSET_CH_STS		0x2C	/* Channel status register */
> +#define UART_REG_OFFSET_RX_TX_FIFO	0x30	/* RX and TX FIFO register */
> +#define UART_REG_OFFSET_INT_DIS		0x0C	/* Interrupt disable register */
> +#define UART_REG_OFFSET_BRG	0x18	/* Baud rate generator register */
> +#define UART_REG_OFFSET_BRD	0x34	/* Baud rate divider register */

Can we please order these in ascending order by offset? Also, do these
define names match the manual you used for the register names? I'm looking
at B.33 of https://docs.xilinx.com/v/u/en-US/ug585-Zynq-7000-TRM (which I
found from a reference from QEMU code). In that manual they use CR for
control, MR for mode, etc. Names that match the documentation is generally
preferred (but I may be looking at the wrong documentation :-)

> +
> +/* Control register, 0x00 */

If we name the flags in a way that associate them with their register
then we don't need comments like the one above.

> +#define UART_CR_TX_DIS	0x00000020	/* TX disabled, bit 5 */
> +#define UART_CR_TX_EN	0x00000010	/* TX enabled, bit 4 */
> +#define UART_CR_RX_DIS	0x00000008	/* RX disabled, bit 3 */
> +#define UART_CR_RX_EN	0x00000004	/* RX enabled, bit 2*/
> +#define UART_CR_TXRST	0x00000002	/* TX logic reset, bit 1 */
> +#define UART_CR_RXRST	0x00000001	/* RX logic reset, bit 0 */

These names match the manual I'm looking at and make it clear we should
call the control register offset something like UART_REG_OFFSET_CR or
just UART_REG_CR in order for the flags to match up. Also, I would drop
the 'bit N' parts of the comments.

> +
> +/* Channel status register, 0x2C */
> +#define	UART_CHSR_TXFULL	0x00000010	/* TX FIFO full, bit 4 */
> +#define	UART_CHSR_RXEMPTY	0x00000002	/* RX FIFO empty, bit 1 */

Same comments as for the control register flags.

> +
> +/* Mode register, 0x04 */
> +#define UART_MR_PARITY_NONE	0x00000020	/* No parity set */
> +
> +/* Baud rate generator register, 0x18 */
> +#define UART_BRG_CLK_DIVISOR	0x00000001	/* baud_sample = sel_clk */

Please align all define columns above (both registers and flags), i.e.

#define DEFNAME			DEFVAL		/* COMMENT */

should line up all the way down.

> +
> +/* clang-format on */
> +
> +static volatile void *uart_base;
> +static u32 uart_in_freq;
> +static u32 uart_baudrate;
> +
> +/**
> + * Find minimum divisor divides in_freq to max_target_hz;
> + * Based on SiFive UART driver (sifive-uart.c)
> + */
> +static inline unsigned int uart_min_clk_divisor(uint64_t in_freq,
> +						uint64_t max_target_hz)
> +{
> +	uint64_t quotient = (in_freq + max_target_hz - 1) / (max_target_hz);

Neither sifive-uart nor this code is checking max_target_hz is non-zero.
And, since it can be read from the DT, there's a chance it could be.
(Hopefully people building DTs check their nodes have sane values, but
we shouldn't count on it.)

I think we should add

	if (max_target_hz == 0)
		return 0;

to this function and the sifive function.

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
> +	while (get_reg(UART_REG_OFFSET_CH_STS) & UART_CHSR_TXFULL)
> +		;
> +
> +	set_reg(UART_REG_OFFSET_RX_TX_FIFO, ch);
> +}
> +
> +static int cadence_uart_getc(void)
> +{
> +	u32 ret = get_reg(UART_REG_OFFSET_CH_STS);
> +
> +	if (!(ret & UART_CHSR_RXEMPTY))
> +		return get_reg(UART_REG_OFFSET_RX_TX_FIFO);
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
> +	set_reg(UART_REG_OFFSET_INT_DIS, 0xFFFFFFFF);

Please add a blank line here

> +	/* Disable TX RX */
> +	set_reg(UART_REG_OFFSET_CTRL, UART_CR_TX_DIS | UART_CR_RX_DIS);

and here

> +	/* Configure baudrate */
> +	if (in_freq) {
> +		set_reg(UART_REG_OFFSET_BRG, UART_BRG_CLK_DIVISOR);
> +		set_reg(UART_REG_OFFSET_BRD,
> +			uart_min_clk_divisor(in_freq, baudrate));
> +	}

and here

> +	/* Software reset TX RX data path and enable TX RX */
> +	set_reg(UART_REG_OFFSET_CTRL, UART_CR_TXRST | UART_CR_RXRST
> +		| UART_CR_TX_EN | UART_CR_RX_EN);

and here

> +	/* Set:
> +	 * 1 stop bit, bits[07:06] = 0x00,
> +	 * no parity set, bits[05:03] = 0x100,
> +	 * 8 bits character length, bits[02:01] = 0x00,
> +	 * sel_clk = uart_clk, bit[0] = 0x0
> +	 */
> +	set_reg(UART_REG_OFFSET_MODE, UART_MR_PARITY_NONE);
> +
> +	sbi_console_set_device(&cadence_console);
> +
> +	return 0;
> +}
> diff --git a/lib/utils/serial/fdt_serial_cadence.c b/lib/utils/serial/fdt_serial_cadence.c
> new file mode 100644
> index 0000000..2357520
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
> +	struct platform_uart_data uart;
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
> index 544b741..0287f51 100644
> --- a/lib/utils/serial/fdt_serial_uart8250.c
> +++ b/lib/utils/serial/fdt_serial_uart8250.c
> @@ -17,7 +17,7 @@ static int serial_uart8250_init(void *fdt, int nodeoff,
>  	int rc;
>  	struct platform_uart_data uart;
>  
> -	rc = fdt_parse_uart8250_node(fdt, nodeoff, &uart);
> +	rc = fdt_parse_uart_node(fdt, nodeoff, &uart);
>  	if (rc)
>  		return rc;
>  
> diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
> index d26a74e..76d6f94 100644
> --- a/lib/utils/serial/objects.mk
> +++ b/lib/utils/serial/objects.mk
> @@ -10,6 +10,9 @@
>  libsbiutils-objs-y += serial/fdt_serial.o
>  libsbiutils-objs-y += serial/fdt_serial_drivers.o
>  
> +carray-fdt_serial_drivers-y += fdt_serial_cadence
> +libsbiutils-objs-y += serial/fdt_serial_cadence.o
> +
>  carray-fdt_serial_drivers-y += fdt_serial_gaisler
>  libsbiutils-objs-y += serial/fdt_serial_gaisler.o
>  
> @@ -31,6 +34,7 @@ libsbiutils-objs-y += serial/fdt_serial_uart8250.o
>  carray-fdt_serial_drivers-y += fdt_serial_xlnx_uartlite
>  libsbiutils-objs-y += serial/fdt_serial_xlnx_uartlite.o
>  
> +libsbiutils-objs-y += serial/cadence-uart.o
>  libsbiutils-objs-y += serial/gaisler-uart.o
>  libsbiutils-objs-y += serial/shakti-uart.o
>  libsbiutils-objs-y += serial/sifive-uart.o
> -- 
> 2.37.0
>

Thanks,
drew 

