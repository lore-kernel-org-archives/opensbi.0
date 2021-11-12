From: Gabriel L. Somlo <gsomlo@gmail.com>
Date: Fri, 12 Nov 2021 09:39:50 -0500
Subject: [PATCH v2] lib: utils: Add LiteX UART support
In-Reply-To: <BFA63DEC-ADA2-4FEE-BB71-D8C91549AFB7@jrtc27.com>
References: <20211112011710.1994602-1-gsomlo@gmail.com>
 <BFA63DEC-ADA2-4FEE-BB71-D8C91549AFB7@jrtc27.com>
Message-ID: <YY58tlw27BeHb9Fu@errol.ini.cmu.edu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jess,

Thanks for the review. Some answers inline, below.

On Fri, Nov 12, 2021 at 01:26:43AM +0000, Jessica Clarke wrote:
> On 12 Nov 2021, at 01:17, Gabriel Somlo <gsomlo@gmail.com> wrote:
> > 
> > The LiteX SoC framework (https://github.com/enjoy-digital/litex)
> > provides a wide range of building blocks that allow creation of
> > full FPGA based systems. CPU options supported by LiteX span
> > several RISC-V models, including Rocket (64-bit) and VexRiscv
> > (32-bit).
> 
> Most of this is utterly irrelevant. LiteX is a SoC framework that
> provides a UART, that?s all one needs to know to understand this patch.

Fair enough, I'll trim it down a bit in v3.

> > This patch adds support for detecting and provisioning LiteX's
> > UART based on its FDT info (detailed in the Linux sources at
> > Documentation/devicetree/bindings/serial/litex,liteuart.yaml).
> > 
> > Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>
> > ---
> > 
> > New in v2:
> > 	- remove properties (and parameters) not actually used by the
> > 	  LiteX UART
> > 	- remove redundant parentheses from pointer arithmetic
> > 	  (thanks jrtc27!)
> > 
> >> See https://github.com/litex-hub/linux-on-litex-rocket for instructions
> >> on how to build a LiteX+Rocket bitstream for e.g. the nexys4ddr (Xilinx
> >> Artix7 FPGA dev board), and https://pastebin.com/nu1dSE16 for a demo of
> >> the board booting a linux payload via opensbi, using this patch.
> > 
> > include/sbi_utils/fdt/fdt_helper.h    |  3 ++
> > include/sbi_utils/serial/litex-uart.h | 17 +++++++
> > lib/utils/fdt/fdt_helper.c            | 19 ++++++++
> > lib/utils/serial/fdt_serial.c         |  2 +
> > lib/utils/serial/fdt_serial_litex.c   | 35 +++++++++++++++
> > lib/utils/serial/litex-uart.c         | 64 +++++++++++++++++++++++++++
> > lib/utils/serial/objects.mk           |  2 +
> > 7 files changed, 142 insertions(+)
> > create mode 100644 include/sbi_utils/serial/litex-uart.h
> > create mode 100644 lib/utils/serial/fdt_serial_litex.c
> > create mode 100644 lib/utils/serial/litex-uart.c
> > 
> > diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> > index 24fee7a..5f75f07 100644
> > --- a/include/sbi_utils/fdt/fdt_helper.h
> > +++ b/include/sbi_utils/fdt/fdt_helper.h
> > @@ -62,6 +62,9 @@ int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
> > int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
> > 			       struct platform_uart_data *uart);
> > 
> > +int fdt_parse_litex_uart_node(void *fdt, int nodeoffset,
> > +			      struct platform_uart_data *uart);
> > +
> > int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
> > 			    struct platform_uart_data *uart);
> > 
> > diff --git a/include/sbi_utils/serial/litex-uart.h b/include/sbi_utils/serial/litex-uart.h
> > new file mode 100644
> > index 0000000..91ab644
> > --- /dev/null
> > +++ b/include/sbi_utils/serial/litex-uart.h
> > @@ -0,0 +1,17 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 Gabriel Somlo
> > + *
> > + * Authors:
> > + *   Gabriel Somlo <gsomlo@gmail.com>
> > + */
> > +
> > +#ifndef __SERIAL_LITEX_UART_H__
> > +#define __SERIAL_LITEX_UART_H__
> > +
> > +#include <sbi/sbi_types.h>
> > +
> > +int litex_uart_init(unsigned long base);
> > +
> > +#endif
> > diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> > index 5bf4021..a42f53b 100644
> > --- a/lib/utils/fdt/fdt_helper.c
> > +++ b/lib/utils/fdt/fdt_helper.c
> > @@ -403,6 +403,25 @@ int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
> > 	return 0;
> > }
> > 
> > +int fdt_parse_litex_uart_node(void *fdt, int nodeoffset,
> > +			      struct platform_uart_data *uart)
> > +{
> > +	int rc;
> > +	uint64_t reg_addr, reg_size;
> > +
> > +	if (nodeoffset < 0 || !uart || !fdt)
> > +		return SBI_ENODEV;
> > +
> > +	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0, &reg_addr, &reg_size);
> > +	if (rc < 0 || !reg_addr || !reg_size)
> > +		return SBI_ENODEV;
> > +	uart->addr = reg_addr;
> > +
> > +	/* LiteX UART has no further configurable properties */
> > +
> > +	return 0;
> > +}
> > +
> > int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
> > 			    struct platform_uart_data *uart)
> > {
> > diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
> > index cedda04..f73d26a 100644
> > --- a/lib/utils/serial/fdt_serial.c
> > +++ b/lib/utils/serial/fdt_serial.c
> > @@ -15,6 +15,7 @@
> > 
> > extern struct fdt_serial fdt_serial_uart8250;
> > extern struct fdt_serial fdt_serial_sifive;
> > +extern struct fdt_serial fdt_serial_litex;
> > extern struct fdt_serial fdt_serial_htif;
> > extern struct fdt_serial fdt_serial_shakti;
> > extern struct fdt_serial fdt_serial_gaisler;
> > @@ -22,6 +23,7 @@ extern struct fdt_serial fdt_serial_gaisler;
> > static struct fdt_serial *serial_drivers[] = {
> > 	&fdt_serial_uart8250,
> > 	&fdt_serial_sifive,
> > +	&fdt_serial_litex,
> > 	&fdt_serial_htif,
> > 	&fdt_serial_shakti,
> > 	&fdt_serial_gaisler
> > diff --git a/lib/utils/serial/fdt_serial_litex.c b/lib/utils/serial/fdt_serial_litex.c
> > new file mode 100644
> > index 0000000..f9495dc
> > --- /dev/null
> > +++ b/lib/utils/serial/fdt_serial_litex.c
> > @@ -0,0 +1,35 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 Gabriel Somlo
> > + *
> > + * Authors:
> > + *   Gabriel Somlo <gsomlo@gmail.com>
> > + */
> > +
> > +#include <sbi_utils/fdt/fdt_helper.h>
> > +#include <sbi_utils/serial/fdt_serial.h>
> > +#include <sbi_utils/serial/litex-uart.h>
> > +
> > +static int serial_litex_init(void *fdt, int nodeoff,
> > +				const struct fdt_match *match)
> 
> This does not line up.

Got it, thanks.

> > +{
> > +	int rc;
> > +	struct platform_uart_data uart;
> > +
> > +	rc = fdt_parse_litex_uart_node(fdt, nodeoff, &uart);
> > +	if (rc)
> > +		return rc;
> > +
> > +	return litex_uart_init(uart.addr);
> > +}
> > +
> > +static const struct fdt_match serial_litex_match[] = {
> > +	{ .compatible = "litex,liteuart" },
> > +	{ },
> > +};
> > +
> > +struct fdt_serial fdt_serial_litex = {
> > +	.match_table = serial_litex_match,
> > +	.init = serial_litex_init
> > +};
> > diff --git a/lib/utils/serial/litex-uart.c b/lib/utils/serial/litex-uart.c
> > new file mode 100644
> > index 0000000..a9b821a
> > --- /dev/null
> > +++ b/lib/utils/serial/litex-uart.c
> > @@ -0,0 +1,64 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 Gabriel Somlo
> > + *
> > + * Authors:
> > + *   Gabriel Somlo <gsomlo@gmail.com>
> > + */
> > +
> > +#include <sbi/riscv_io.h>
> > +#include <sbi/sbi_console.h>
> > +#include <sbi_utils/serial/litex-uart.h>
> > +
> > +/* clang-format off */
> > +
> > +#define UART_REG_RXTX		0
> > +#define UART_REG_TXFULL		1
> > +#define UART_REG_RXEMPTY	2
> > +#define UART_REG_EV_STATUS	3
> > +#define UART_REG_EV_PENDING	4
> > +#define UART_REG_EV_ENABLE	5
> > +
> > +/* clang-format on */
> > +
> > +static volatile void *uart_base;
> > +
> > +static u32 get_reg(u32 num)
> 
> Are these actually 32-bit registers, or are they 8-bit registers with a
> stride of 32? If the latter, you should be using u8 for their values.

LiteX uses 32-bit "subregisters" in CPU-native endianness -- LE, in
our case, since we're dealing with RISC-V. Registers larger than 32
bits "stretch across" multiple subregisters. In this case, though, we
only use 8 bits per register, so it works out effectively the same as
"8-bit registers with a stride of 32".

> > +{
> > +	return readl(uart_base + num * 0x4);
> 
> These still use non-standard void pointer arithmetic.

So I could re-type `uart_base` to be `static volatile u32 *` (which
fits the 32-bit subregister model of LiteX), and do, e.g.:

	static volatile u32 *uart_base;

	static u8 get_reg(u8 reg)
	{
	        return readb(uart_base + reg);
	}

	static void set_reg(u8 reg, u8 val)
	{
	        writeb(val, uart_base + reg);
	}

Does that sound reasonable?

(for the record, I "cloned" the code from `sifive-uart.c`, which ATM
gets away with things like this:

https://github.com/riscv-software-src/opensbi/blob/master/lib/utils/serial/sifive-uart.c#L32

and this:

https://github.com/riscv-software-src/opensbi/blob/master/lib/utils/serial/sifive-uart.c#L59

so, in my defense, I was just "blending in" with existing practice... :)
 
> > +}
> > +
> > +static void set_reg(u32 num, u32 val)
> > +{
> > +	writel(val, uart_base + num * 0x4);
> > +}
> > +
> > +static void litex_uart_putc(char ch)
> > +{
> > +	while ((get_reg(UART_REG_TXFULL) & 0x01));
> 
> Are the other bits defined to be zero? Based on the name it seems like
> the & 0x01 is unnecessary.
> 
> > +	set_reg(UART_REG_RXTX, ch);
> > +}
> > +
> > +static int litex_uart_getc(void)
> > +{
> > +	int ret = -1;
> > +	if (!(get_reg(UART_REG_RXEMPTY) & 0x01)) {
> 
> Ditto.

Yeah, these are actually single-bit registers, so I'll just use them as
Booleans, make things look cleaner that way.

> 
> > +		ret = get_reg(UART_REG_RXTX);
> > +		set_reg(UART_REG_EV_PENDING, 0x02); /* ack UART_EV_RX */
> 
> Define a constant for this rather than using a magic number and a
> comment?

As it turns out, acknowledging the "event" (either RX or TX) only comes
into play when the UART is used in IRQ mode. For polling, we don't need
to deal with those registers at all. I'll send a simplified version with
v3, shortly.

Thanks,
--Gabriel
 
> > +	}
> > +	return ret;
> > +}
> > +
> > +static struct sbi_console_device litex_console = {
> > +	.name = "litex_uart",
> > +	.console_putc = litex_uart_putc,
> > +	.console_getc = litex_uart_getc
> > +};
> > +
> > +int litex_uart_init(unsigned long base)
> > +{
> > +	uart_base = (volatile void *)base;
> > +	sbi_console_set_device(&litex_console);
> > +	return 0;
> > +}
> > diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
> > index 9fb0902..4f751ba 100644
> > --- a/lib/utils/serial/objects.mk
> > +++ b/lib/utils/serial/objects.mk
> > @@ -12,8 +12,10 @@ libsbiutils-objs-y += serial/fdt_serial_gaisler.o
> > libsbiutils-objs-y += serial/fdt_serial_htif.o
> > libsbiutils-objs-y += serial/fdt_serial_shakti.o
> > libsbiutils-objs-y += serial/fdt_serial_sifive.o
> > +libsbiutils-objs-y += serial/fdt_serial_litex.o
> > libsbiutils-objs-y += serial/fdt_serial_uart8250.o
> > libsbiutils-objs-y += serial/gaisler-uart.o
> > libsbiutils-objs-y += serial/shakti-uart.o
> > libsbiutils-objs-y += serial/sifive-uart.o
> > +libsbiutils-objs-y += serial/litex-uart.o
> > libsbiutils-objs-y += serial/uart8250.o
> > -- 
> > 2.31.1
> > 
> 

