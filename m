From: Xiang W <wxjstz@126.com>
Date: Wed, 23 Feb 2022 16:05:26 +0800
Subject: [PATCH] lib: utils: serial: Initial commit of xlnx-uartlite
In-Reply-To: <20220222014707.2983794-1-alistair.francis@opensource.wdc.com>
References: <20220222014707.2983794-1-alistair.francis@opensource.wdc.com>
Message-ID: <1cba95644d07f004a92a46049f967eff9d5d92b7.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-02-22???? 11:47 +1000?Alistair Francis???
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Initial commit of the xlnx-uartlite device and FDT support. This was
> tested by running OpenSBI on a modified QEMU virt machine using the
> xlnx-uartlite for serial.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> ?include/sbi_utils/fdt/fdt_helper.h????????? |? 3 +
> ?include/sbi_utils/serial/xlnx_uartlite.h??? | 17 ++++++
> ?lib/utils/fdt/fdt_helper.c????????????????? | 35 +++++++++++
> ?lib/utils/serial/fdt_serial.c?????????????? |? 4 +-
> ?lib/utils/serial/fdt_serial_xlnx_uartlite.c | 36 +++++++++++
> ?lib/utils/serial/objects.mk???????????????? |? 2 +
> ?lib/utils/serial/xlnx-uartlite.c??????????? | 68
> +++++++++++++++++++++
> ?7 files changed, 164 insertions(+), 1 deletion(-)
> ?create mode 100644 include/sbi_utils/serial/xlnx_uartlite.h
> ?create mode 100644 lib/utils/serial/fdt_serial_xlnx_uartlite.c
> ?create mode 100644 lib/utils/serial/xlnx-uartlite.c
> 
> diff --git a/include/sbi_utils/fdt/fdt_helper.h
> b/include/sbi_utils/fdt/fdt_helper.h
> index 1232b26..41ee826 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -68,6 +68,9 @@ int fdt_parse_uart8250_node(void *fdt, int
> nodeoffset,
> ?int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
> ?????????????????????? const char *compatible);
> ?
> +int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
> +????????????????????????????? struct platform_uart_data *uart);
> +
> ?struct aplic_data;
> ?
> ?int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data
> *aplic);
> diff --git a/include/sbi_utils/serial/xlnx_uartlite.h
> b/include/sbi_utils/serial/xlnx_uartlite.h
> new file mode 100644
> index 0000000..2291e69
> --- /dev/null
> +++ b/include/sbi_utils/serial/xlnx_uartlite.h
> @@ -0,0 +1,17 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *?? Alistair Francis <alistair.francis@wdc.com>
> + */
> +#ifndef __SERIAL_XLNX_UARTLITE_H__
> +#define __SERIAL_XLNX_UARTLITE_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +int xlnx_uartlite_init(unsigned long base, u32 in_freq, u32 baudrate,
> u32 reg_shift,
> +???????????????? u32 reg_width);
> +
> +#endif
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 3a306cb..46ef340 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -467,6 +467,41 @@ int fdt_parse_uart8250(void *fdt, struct
> platform_uart_data *uart,
> ????????return fdt_parse_uart8250_node(fdt, nodeoffset, uart);
> ?}
> ?
> +int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
> +????????????????????????????? struct platform_uart_data *uart)
> +{
> +???????int len, rc;
> +???????const fdt32_t *val;
> +???????uint64_t reg_addr, reg_size;
> +
> +???????if (nodeoffset < 0 || !uart || !fdt)
> +???????????????return SBI_ENODEV;
> +
> +???????rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> +?????????????????????????????????? &reg_addr, &reg_size);
> +???????if (rc < 0 || !reg_addr || !reg_size)
> +???????????????return SBI_ENODEV;
> +???????uart->addr = reg_addr;
I checked that only reg_addr is used, the following code can be
optimized.
> +
> +???????/**
> +??????? * UART address is mandaotry. clock-frequency and current-
> speed
> +??????? * may not be present. Don't return error.
> +??????? */
> +???????val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "clock-
> frequency", &len);
> +???????if (len > 0 && val)
> +???????????????uart->freq = fdt32_to_cpu(*val);
> +???????else
> +???????????????uart->freq = 125000000;
> +
> +???????val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "current-speed",
> &len);
> +???????if (len > 0 && val)
> +???????????????uart->baud = fdt32_to_cpu(*val);
> +???????else
> +???????????????uart->baud = 19200;
> +
> +???????return 0;
> +}
> +
> ?int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data
> *aplic)
> ?{
> ????????bool child_found;
> diff --git a/lib/utils/serial/fdt_serial.c
> b/lib/utils/serial/fdt_serial.c
> index f73d26a..45aea4a 100644
> --- a/lib/utils/serial/fdt_serial.c
> +++ b/lib/utils/serial/fdt_serial.c
> @@ -19,6 +19,7 @@ extern struct fdt_serial fdt_serial_litex;
> ?extern struct fdt_serial fdt_serial_htif;
> ?extern struct fdt_serial fdt_serial_shakti;
> ?extern struct fdt_serial fdt_serial_gaisler;
> +extern struct fdt_serial fdt_serial_xlnx_uartlite;
> ?
> ?static struct fdt_serial *serial_drivers[] = {
> ????????&fdt_serial_uart8250,
> @@ -26,7 +27,8 @@ static struct fdt_serial *serial_drivers[] = {
> ????????&fdt_serial_litex,
> ????????&fdt_serial_htif,
> ????????&fdt_serial_shakti,
> -???????&fdt_serial_gaisler
> +???????&fdt_serial_gaisler,
> +???????&fdt_serial_xlnx_uartlite,
> ?};
> ?
> ?static struct fdt_serial dummy = {
> diff --git a/lib/utils/serial/fdt_serial_xlnx_uartlite.c
> b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
> new file mode 100644
> index 0000000..09ad20e
> --- /dev/null
> +++ b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
> @@ -0,0 +1,36 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *?? Alistair Francis <alistair.francis@wdc.com>
> + */
> +
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/serial/fdt_serial.h>
> +#include <sbi_utils/serial/xlnx_uartlite.h>
> +
> +static int serial_xlnx_uartlite_init(void *fdt, int nodeoff,
> +???????????????????????????????const struct fdt_match *match)
> +{
> +???????int rc;
> +???????struct platform_uart_data uart;
> +
> +???????rc = fdt_parse_xlnx_uartlite_node(fdt, nodeoff, &uart);
> +???????if (rc)
> +???????????????return rc;
> +
> +???????return xlnx_uartlite_init(uart.addr, uart.freq, uart.baud,
> +??????????????????????????? uart.reg_shift, uart.reg_io_width);
> +}
> +
> +static const struct fdt_match serial_xlnx_uartlite_match[] = {
> +???????{ .compatible = "xlnx,xps-uartlite-1.00.a" },
> +???????{ },
> +};
> +
> +struct fdt_serial fdt_serial_xlnx_uartlite = {
> +???????.match_table = serial_xlnx_uartlite_match,
> +???????.init = serial_xlnx_uartlite_init,
> +};
> diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
> index 4f751ba..4fb9627 100644
> --- a/lib/utils/serial/objects.mk
> +++ b/lib/utils/serial/objects.mk
> @@ -14,8 +14,10 @@ libsbiutils-objs-y += serial/fdt_serial_shakti.o
> ?libsbiutils-objs-y += serial/fdt_serial_sifive.o
> ?libsbiutils-objs-y += serial/fdt_serial_litex.o
> ?libsbiutils-objs-y += serial/fdt_serial_uart8250.o
> +libsbiutils-objs-y += serial/fdt_serial_xlnx_uartlite.o
> ?libsbiutils-objs-y += serial/gaisler-uart.o
> ?libsbiutils-objs-y += serial/shakti-uart.o
> ?libsbiutils-objs-y += serial/sifive-uart.o
> ?libsbiutils-objs-y += serial/litex-uart.o
> ?libsbiutils-objs-y += serial/uart8250.o
> +libsbiutils-objs-y += serial/xlnx-uartlite.o
> diff --git a/lib/utils/serial/xlnx-uartlite.c b/lib/utils/serial/xlnx-
> uartlite.c
> new file mode 100644
> index 0000000..caab6a8
> --- /dev/null
> +++ b/lib/utils/serial/xlnx-uartlite.c
> @@ -0,0 +1,68 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *?? Alistair Francis <alistair.francis@wdc.com>
> + */
> +
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi_utils/serial/xlnx_uartlite.h>
> +
> +/* clang-format off */
> +
> +#define UART_RX_OFFSET?????????0x00
> +#define UART_TX_OFFSET?????????0x04
> +#define UART_STATUS_OFFSET?????0x08
> +# define UART_STATUS_RXVALID???0x01
> +# define UART_STATUS_RXFULL????0x02
> +# define UART_STATUS_TXEMPTY???0x04
> +# define UART_STATUS_TXFULL????0x08
> +# define UART_STATUS_IE????????0x10
> +# define UART_STATUS_OVERRUN???0x20
> +# define UART_STATUS_FRAME?????0x40
> +# define UART_STATUS_PARITY????0x80
> +#define UART_CTRL_OFFSET???????0x0C
> +# define UART_CTRL_RST_TX??????0x01
> +# define UART_CTRL_RST_RX??????0x02
> +# define UART_CTRL_IE??????????0x10
> +
> +/* clang-format on */
> +
> +static volatile char *xlnx_uartlite_base;
> +
> +static void xlnx_uartlite_putc(char ch)
> +{
> +???????while((readb(xlnx_uartlite_base + UART_STATUS_OFFSET) &
> UART_STATUS_TXFULL))
> +???????????????;
> +
> +???????writeb(ch, xlnx_uartlite_base + UART_TX_OFFSET);
> +}
> +
> +static int xlnx_uartlite_getc(void)
> +{
> +???????u16 status = readb(xlnx_uartlite_base + UART_STATUS_OFFSET);
> +
> +???????if (status & UART_STATUS_RXVALID)
> +???????????????return readb(xlnx_uartlite_base + UART_RX_OFFSET);
> +
> +???????return -1;
> +}
> +
> +static struct sbi_console_device xlnx_uartlite_console = {
> +???????.name = "xlnx-uartlite",
> +???????.console_putc = xlnx_uartlite_putc,
> +???????.console_getc = xlnx_uartlite_getc
> +};
> +
> +int xlnx_uartlite_init(unsigned long base, u32 in_freq, u32 baudrate,
> u32 reg_shift,
> +???????????????? u32 reg_width)
The function prototype can be simplified to:?
int xlnx_uartlite_init(unsigned long base)
> +{
> +???????xlnx_uartlite_base = (volatile char *)base;
> +
> +???????sbi_console_set_device(&xlnx_uartlite_console);
> +
> +???????return 0;
> +}

Except for the above, Look good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> -- 
> 2.35.1
> 
> 



