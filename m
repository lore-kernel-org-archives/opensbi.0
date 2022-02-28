From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Feb 2022 09:54:01 +0530
Subject: [PATCH v2] lib: utils: serial: Initial commit of xlnx-uartlite
In-Reply-To: <20220224050146.179139-1-alistair.francis@opensource.wdc.com>
References: <20220224050146.179139-1-alistair.francis@opensource.wdc.com>
Message-ID: <CAAhSdy01JUZ_iTuwJRV-2-RY9Bwfi+Zosskj_jdPxxwVwz_WYw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 24, 2022 at 10:32 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Initial commit of the xlnx-uartlite device and FDT support. This was
> tested by running OpenSBI on a modified QEMU virt machine using the
> xlnx-uartlite for serial.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi_utils/fdt/fdt_helper.h          |  3 +
>  include/sbi_utils/serial/xlnx_uartlite.h    | 16 +++++
>  lib/utils/fdt/fdt_helper.c                  | 18 ++++++
>  lib/utils/serial/fdt_serial.c               |  4 +-
>  lib/utils/serial/fdt_serial_xlnx_uartlite.c | 35 +++++++++++
>  lib/utils/serial/objects.mk                 |  2 +
>  lib/utils/serial/xlnx-uartlite.c            | 67 +++++++++++++++++++++
>  7 files changed, 144 insertions(+), 1 deletion(-)
>  create mode 100644 include/sbi_utils/serial/xlnx_uartlite.h
>  create mode 100644 lib/utils/serial/fdt_serial_xlnx_uartlite.c
>  create mode 100644 lib/utils/serial/xlnx-uartlite.c
>
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 1232b26..41ee826 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -68,6 +68,9 @@ int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
>  int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
>                        const char *compatible);
>
> +int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
> +                              struct platform_uart_data *uart);
> +
>  struct aplic_data;
>
>  int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic);
> diff --git a/include/sbi_utils/serial/xlnx_uartlite.h b/include/sbi_utils/serial/xlnx_uartlite.h
> new file mode 100644
> index 0000000..45927b7
> --- /dev/null
> +++ b/include/sbi_utils/serial/xlnx_uartlite.h
> @@ -0,0 +1,16 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Alistair Francis <alistair.francis@wdc.com>
> + */
> +#ifndef __SERIAL_XLNX_UARTLITE_H__
> +#define __SERIAL_XLNX_UARTLITE_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +int xlnx_uartlite_init(unsigned long base);
> +
> +#endif
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 3a306cb..4dd0602 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -467,6 +467,24 @@ int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
>         return fdt_parse_uart8250_node(fdt, nodeoffset, uart);
>  }
>
> +int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
> +                              struct platform_uart_data *uart)
> +{
> +       int rc;
> +       uint64_t reg_addr, reg_size;
> +
> +       if (nodeoffset < 0 || !uart || !fdt)
> +               return SBI_ENODEV;
> +
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> +                                   &reg_addr, &reg_size);
> +       if (rc < 0 || !reg_addr || !reg_size)
> +               return SBI_ENODEV;
> +       uart->addr = reg_addr;
> +
> +       return 0;
> +}
> +
>  int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic)
>  {
>         bool child_found;
> diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
> index f73d26a..45aea4a 100644
> --- a/lib/utils/serial/fdt_serial.c
> +++ b/lib/utils/serial/fdt_serial.c
> @@ -19,6 +19,7 @@ extern struct fdt_serial fdt_serial_litex;
>  extern struct fdt_serial fdt_serial_htif;
>  extern struct fdt_serial fdt_serial_shakti;
>  extern struct fdt_serial fdt_serial_gaisler;
> +extern struct fdt_serial fdt_serial_xlnx_uartlite;
>
>  static struct fdt_serial *serial_drivers[] = {
>         &fdt_serial_uart8250,
> @@ -26,7 +27,8 @@ static struct fdt_serial *serial_drivers[] = {
>         &fdt_serial_litex,
>         &fdt_serial_htif,
>         &fdt_serial_shakti,
> -       &fdt_serial_gaisler
> +       &fdt_serial_gaisler,
> +       &fdt_serial_xlnx_uartlite,
>  };
>
>  static struct fdt_serial dummy = {
> diff --git a/lib/utils/serial/fdt_serial_xlnx_uartlite.c b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
> new file mode 100644
> index 0000000..466e16e
> --- /dev/null
> +++ b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
> @@ -0,0 +1,35 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Alistair Francis <alistair.francis@wdc.com>
> + */
> +
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/serial/fdt_serial.h>
> +#include <sbi_utils/serial/xlnx_uartlite.h>
> +
> +static int serial_xlnx_uartlite_init(void *fdt, int nodeoff,
> +                               const struct fdt_match *match)
> +{
> +       int rc;
> +       struct platform_uart_data uart;
> +
> +       rc = fdt_parse_xlnx_uartlite_node(fdt, nodeoff, &uart);
> +       if (rc)
> +               return rc;
> +
> +       return xlnx_uartlite_init(uart.addr);
> +}
> +
> +static const struct fdt_match serial_xlnx_uartlite_match[] = {
> +       { .compatible = "xlnx,xps-uartlite-1.00.a" },
> +       { },
> +};
> +
> +struct fdt_serial fdt_serial_xlnx_uartlite = {
> +       .match_table = serial_xlnx_uartlite_match,
> +       .init = serial_xlnx_uartlite_init,
> +};
> diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
> index 4f751ba..4fb9627 100644
> --- a/lib/utils/serial/objects.mk
> +++ b/lib/utils/serial/objects.mk
> @@ -14,8 +14,10 @@ libsbiutils-objs-y += serial/fdt_serial_shakti.o
>  libsbiutils-objs-y += serial/fdt_serial_sifive.o
>  libsbiutils-objs-y += serial/fdt_serial_litex.o
>  libsbiutils-objs-y += serial/fdt_serial_uart8250.o
> +libsbiutils-objs-y += serial/fdt_serial_xlnx_uartlite.o
>  libsbiutils-objs-y += serial/gaisler-uart.o
>  libsbiutils-objs-y += serial/shakti-uart.o
>  libsbiutils-objs-y += serial/sifive-uart.o
>  libsbiutils-objs-y += serial/litex-uart.o
>  libsbiutils-objs-y += serial/uart8250.o
> +libsbiutils-objs-y += serial/xlnx-uartlite.o
> diff --git a/lib/utils/serial/xlnx-uartlite.c b/lib/utils/serial/xlnx-uartlite.c
> new file mode 100644
> index 0000000..1d8d440
> --- /dev/null
> +++ b/lib/utils/serial/xlnx-uartlite.c
> @@ -0,0 +1,67 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Alistair Francis <alistair.francis@wdc.com>
> + */
> +
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi_utils/serial/xlnx_uartlite.h>
> +
> +/* clang-format off */
> +
> +#define UART_RX_OFFSET         0x00
> +#define UART_TX_OFFSET         0x04
> +#define UART_STATUS_OFFSET     0x08
> +# define UART_STATUS_RXVALID   0x01
> +# define UART_STATUS_RXFULL    0x02
> +# define UART_STATUS_TXEMPTY   0x04
> +# define UART_STATUS_TXFULL    0x08
> +# define UART_STATUS_IE        0x10
> +# define UART_STATUS_OVERRUN   0x20
> +# define UART_STATUS_FRAME     0x40
> +# define UART_STATUS_PARITY    0x80
> +#define UART_CTRL_OFFSET       0x0C
> +# define UART_CTRL_RST_TX      0x01
> +# define UART_CTRL_RST_RX      0x02
> +# define UART_CTRL_IE          0x10
> +
> +/* clang-format on */
> +
> +static volatile char *xlnx_uartlite_base;
> +
> +static void xlnx_uartlite_putc(char ch)
> +{
> +       while((readb(xlnx_uartlite_base + UART_STATUS_OFFSET) & UART_STATUS_TXFULL))
> +               ;
> +
> +       writeb(ch, xlnx_uartlite_base + UART_TX_OFFSET);
> +}
> +
> +static int xlnx_uartlite_getc(void)
> +{
> +       u16 status = readb(xlnx_uartlite_base + UART_STATUS_OFFSET);
> +
> +       if (status & UART_STATUS_RXVALID)
> +               return readb(xlnx_uartlite_base + UART_RX_OFFSET);
> +
> +       return -1;
> +}
> +
> +static struct sbi_console_device xlnx_uartlite_console = {
> +       .name = "xlnx-uartlite",
> +       .console_putc = xlnx_uartlite_putc,
> +       .console_getc = xlnx_uartlite_getc
> +};
> +
> +int xlnx_uartlite_init(unsigned long base)
> +{
> +       xlnx_uartlite_base = (volatile char *)base;
> +
> +       sbi_console_set_device(&xlnx_uartlite_console);
> +
> +       return 0;
> +}
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

