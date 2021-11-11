From: Xiang W <wxjstz@126.com>
Date: Thu, 11 Nov 2021 23:21:43 +0800
Subject: [PATCH v1] lib: utils: Add LiteX UART support
In-Reply-To: <20211110230459.1853691-1-gsomlo@gmail.com>
References: <20211110230459.1853691-1-gsomlo@gmail.com>
Message-ID: <d3a1923e73187a23efb07b31b544f22ce99b0e49.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-11-10???? 18:04 -0500?Gabriel Somlo???
> The LiteX SoC framework (https://github.com/enjoy-digital/litex)
> provides a wide range of building blocks that allow creation of
> full FPGA based systems. CPU options supported by LiteX span
> several RISC-V models, including Rocket (64-bit) and VexRiscv
> (32-bit).
> 
> This patch adds support for detecting and provisioning LiteX's
> UART based on its FDT info (detailed in the Linux sources at
> Documentation/devicetree/bindings/serial/litex,liteuart.yaml).
> 
> Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>
Look good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> 
> See https://github.com/litex-hub/linux-on-litex-rocket?for
> instructions
> on how to build a LiteX+Rocket bitstream for e.g. the nexys4ddr
> (Xilinx
> Artix7 FPGA dev board), and https://pastebin.com/nu1dSE16?for a demo
> of
> the board booting a linux payload via opensbi, using this patch.
> 
> Thanks for your consideration,
> ? --Gabriel
> 
> ?include/sbi_utils/fdt/fdt_helper.h??? |? 3 ++
> ?include/sbi_utils/serial/litex-uart.h | 17 +++++++
> ?lib/utils/fdt/fdt_helper.c??????????? | 28 ++++++++++++
> ?lib/utils/serial/fdt_serial.c???????? |? 2 +
> ?lib/utils/serial/fdt_serial_litex.c?? | 35 +++++++++++++++
> ?lib/utils/serial/litex-uart.c???????? | 64
> +++++++++++++++++++++++++++
> ?lib/utils/serial/objects.mk?????????? |? 2 +
> ?7 files changed, 151 insertions(+)
> ?create mode 100644 include/sbi_utils/serial/litex-uart.h
> ?create mode 100644 lib/utils/serial/fdt_serial_litex.c
> ?create mode 100644 lib/utils/serial/litex-uart.c
> 
> diff --git a/include/sbi_utils/fdt/fdt_helper.h
> b/include/sbi_utils/fdt/fdt_helper.h
> index 24fee7a..5f75f07 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -62,6 +62,9 @@ int fdt_parse_shakti_uart_node(void *fdt, int
> nodeoffset,
> ?int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
> ?????????????????????????????? struct platform_uart_data *uart);
> ?
> +int fdt_parse_litex_uart_node(void *fdt, int nodeoffset,
> +???????????????????????????? struct platform_uart_data *uart);
> +
> ?int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
> ??????????????????????????? struct platform_uart_data *uart);
> ?
> diff --git a/include/sbi_utils/serial/litex-uart.h
> b/include/sbi_utils/serial/litex-uart.h
> new file mode 100644
> index 0000000..002b525
> --- /dev/null
> +++ b/include/sbi_utils/serial/litex-uart.h
> @@ -0,0 +1,17 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 Gabriel Somlo
> + *
> + * Authors:
> + *?? Gabriel Somlo <gsomlo@gmail.com>
> + */
> +
> +#ifndef __SERIAL_LITEX_UART_H__
> +#define __SERIAL_LITEX_UART_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +int litex_uart_init(unsigned long base, u32 in_freq, u32 baudrate);
> +
> +#endif
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 5bf4021..3ba78e5 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -25,6 +25,11 @@
> ?#define DEFAULT_SIFIVE_UART_REG_SHIFT??????????0
> ?#define DEFAULT_SIFIVE_UART_REG_IO_WIDTH???????4
> ?
> +#define DEFAULT_LITEX_UART_FREQ????????????????????????0
> +#define DEFAULT_LITEX_UART_BAUD????????????????????????115200
> +#define DEFAULT_LITEX_UART_REG_SHIFT???????????0
> +#define DEFAULT_LITEX_UART_REG_IO_WIDTH????????????????4
> +
> ?#define DEFAULT_GAISLER_UART_REG_IO_WIDTH??????4
> ?
> ?#define DEFAULT_SHAKTI_UART_FREQ???????????????50000000
> @@ -403,6 +408,29 @@ int fdt_parse_sifive_uart_node(void *fdt, int
> nodeoffset,
> ????????return 0;
> ?}
> ?
> +int fdt_parse_litex_uart_node(void *fdt, int nodeoffset,
> +???????????????????????????? struct platform_uart_data *uart)
> +{
> +???????int rc;
> +???????uint64_t reg_addr, reg_size;
> +
> +???????if (nodeoffset < 0 || !uart || !fdt)
> +???????????????return SBI_ENODEV;
> +
> +???????rc = fdt_get_node_addr_size(fdt, nodeoffset, 0, &reg_addr,
> &reg_size);
> +???????if (rc < 0 || !reg_addr || !reg_size)
> +???????????????return SBI_ENODEV;
> +???????uart->addr = reg_addr;
> +
> +???????/* For LiteX UART, the following properties are ignored */
> +???????uart->freq = DEFAULT_LITEX_UART_FREQ;
> +???????uart->baud = DEFAULT_LITEX_UART_BAUD;
> +???????uart->reg_shift = DEFAULT_LITEX_UART_REG_SHIFT;
> +???????uart->reg_io_width = DEFAULT_LITEX_UART_REG_IO_WIDTH;
> +
> +???????return 0;
> +}
> +
> ?int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
> ??????????????????????????? struct platform_uart_data *uart)
> ?{
> diff --git a/lib/utils/serial/fdt_serial.c
> b/lib/utils/serial/fdt_serial.c
> index cedda04..f73d26a 100644
> --- a/lib/utils/serial/fdt_serial.c
> +++ b/lib/utils/serial/fdt_serial.c
> @@ -15,6 +15,7 @@
> ?
> ?extern struct fdt_serial fdt_serial_uart8250;
> ?extern struct fdt_serial fdt_serial_sifive;
> +extern struct fdt_serial fdt_serial_litex;
> ?extern struct fdt_serial fdt_serial_htif;
> ?extern struct fdt_serial fdt_serial_shakti;
> ?extern struct fdt_serial fdt_serial_gaisler;
> @@ -22,6 +23,7 @@ extern struct fdt_serial fdt_serial_gaisler;
> ?static struct fdt_serial *serial_drivers[] = {
> ????????&fdt_serial_uart8250,
> ????????&fdt_serial_sifive,
> +???????&fdt_serial_litex,
> ????????&fdt_serial_htif,
> ????????&fdt_serial_shakti,
> ????????&fdt_serial_gaisler
> diff --git a/lib/utils/serial/fdt_serial_litex.c
> b/lib/utils/serial/fdt_serial_litex.c
> new file mode 100644
> index 0000000..fda5746
> --- /dev/null
> +++ b/lib/utils/serial/fdt_serial_litex.c
> @@ -0,0 +1,35 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 Gabriel Somlo
> + *
> + * Authors:
> + *?? Gabriel Somlo <gsomlo@gmail.com>
> + */
> +
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/serial/fdt_serial.h>
> +#include <sbi_utils/serial/litex-uart.h>
> +
> +static int serial_litex_init(void *fdt, int nodeoff,
> +???????????????????????????????const struct fdt_match *match)
> +{
> +???????int rc;
> +???????struct platform_uart_data uart;
> +
> +???????rc = fdt_parse_litex_uart_node(fdt, nodeoff, &uart);
> +???????if (rc)
> +???????????????return rc;
> +
> +???????return litex_uart_init(uart.addr, uart.freq, uart.baud);
> +}
> +
> +static const struct fdt_match serial_litex_match[] = {
> +???????{ .compatible = "litex,liteuart" },
> +???????{ },
> +};
> +
> +struct fdt_serial fdt_serial_litex = {
> +???????.match_table = serial_litex_match,
> +???????.init = serial_litex_init
> +};
> diff --git a/lib/utils/serial/litex-uart.c b/lib/utils/serial/litex-
> uart.c
> new file mode 100644
> index 0000000..e6afa53
> --- /dev/null
> +++ b/lib/utils/serial/litex-uart.c
> @@ -0,0 +1,64 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 Gabriel Somlo
> + *
> + * Authors:
> + *?? Gabriel Somlo <gsomlo@gmail.com>
> + */
> +
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi_utils/serial/litex-uart.h>
> +
> +/* clang-format off */
> +
> +#define UART_REG_RXTX??????????0
> +#define UART_REG_TXFULL????????????????1
> +#define UART_REG_RXEMPTY???????2
> +#define UART_REG_EV_STATUS?????3
> +#define UART_REG_EV_PENDING????4
> +#define UART_REG_EV_ENABLE?????5
> +
> +/* clang-format on */
> +
> +static volatile void *uart_base;
> +
> +static u32 get_reg(u32 num)
> +{
> +???????return readl(uart_base + (num * 0x4));
> +}
> +
> +static void set_reg(u32 num, u32 val)
> +{
> +???????writel(val, uart_base + (num * 0x4));
> +}
> +
> +static void litex_uart_putc(char ch)
> +{
> +???????while ((get_reg(UART_REG_TXFULL) & 0x01));
> +???????set_reg(UART_REG_RXTX, ch);
> +}
> +
> +static int litex_uart_getc(void)
> +{
> +???????int ret = -1;
> +???????if (!(get_reg(UART_REG_RXEMPTY) & 0x01)) {
> +???????????????ret = get_reg(UART_REG_RXTX);
> +???????????????set_reg(UART_REG_EV_PENDING, 0x02); /* ack UART_EV_RX
> */
> +???????}
> +???????return ret;
> +}
> +
> +static struct sbi_console_device litex_console = {
> +???????.name = "litex_uart",
> +???????.console_putc = litex_uart_putc,
> +???????.console_getc = litex_uart_getc
> +};
> +
> +int litex_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
> +{
> +???????uart_base = (volatile void *)base;
> +???????sbi_console_set_device(&litex_console);
> +???????return 0;
> +}
> diff --git a/lib/utils/serial/objects.mk
> b/lib/utils/serial/objects.mk
> index 9fb0902..4f751ba 100644
> --- a/lib/utils/serial/objects.mk
> +++ b/lib/utils/serial/objects.mk
> @@ -12,8 +12,10 @@ libsbiutils-objs-y += serial/fdt_serial_gaisler.o
> ?libsbiutils-objs-y += serial/fdt_serial_htif.o
> ?libsbiutils-objs-y += serial/fdt_serial_shakti.o
> ?libsbiutils-objs-y += serial/fdt_serial_sifive.o
> +libsbiutils-objs-y += serial/fdt_serial_litex.o
> ?libsbiutils-objs-y += serial/fdt_serial_uart8250.o
> ?libsbiutils-objs-y += serial/gaisler-uart.o
> ?libsbiutils-objs-y += serial/shakti-uart.o
> ?libsbiutils-objs-y += serial/sifive-uart.o
> +libsbiutils-objs-y += serial/litex-uart.o
> ?libsbiutils-objs-y += serial/uart8250.o
> -- 
> 2.31.1
> 
> 



