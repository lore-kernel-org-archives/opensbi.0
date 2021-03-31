From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 31 Mar 2021 10:33:20 +0800
Subject: [PATCH] lib: utils: Add Xilinx uartlite implementation
In-Reply-To: <20210330025921.1776900-1-chenguokai17@mails.ucas.ac.cn>
References: <20210330025921.1776900-1-chenguokai17@mails.ucas.ac.cn>
Message-ID: <CAEUhbmW4h3GaUFkp=gymbqb7AGHDeSAYJ2L1xEW_v4+zBBJPig@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 30, 2021 at 11:01 AM Guokai Chen <chenguokai123@gmail.com> wrote:
>
> Uartlite is a device commonly used on Xilinx platforms. We add OpenSBI support for uartlite so that OpenSBI boots on SoCs that utilize uartlite for output.

Please wrap the commit message at ~70 characters a line

>
> Signed-off-by: Guokai Chen <chenguokai17@mails.ucas.ac.cn>
> ---
>  include/sbi_utils/serial/xilinx-uart.h | 20 ++++++++++++
>  lib/utils/serial/fdt_serial.c          |  2 ++
>  lib/utils/serial/fdt_serial_xilinx.c   | 36 ++++++++++++++++++++++
>  lib/utils/serial/objects.mk            |  2 ++
>  lib/utils/serial/xilinx-uart.c         | 42 ++++++++++++++++++++++++++
>  5 files changed, 102 insertions(+)
>  create mode 100644 include/sbi_utils/serial/xilinx-uart.h
>  create mode 100644 lib/utils/serial/fdt_serial_xilinx.c
>  create mode 100644 lib/utils/serial/xilinx-uart.c
>
> diff --git a/include/sbi_utils/serial/xilinx-uart.h b/include/sbi_utils/serial/xilinx-uart.h
> new file mode 100644
> index 0000000..e3d667e
> --- /dev/null
> +++ b/include/sbi_utils/serial/xilinx-uart.h

The name suggests you are adding Xilinx UART driver, instead of UART
lite driver. Are the same the IP?

> @@ -0,0 +1,20 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 Guokai Chen <chenguokai17@mails.ucas.ac.cn>
> + *
> + * This code is based on include/sbi_utils/serial/shakti-uart.h
> + */
> +
> +#ifndef __SERIAL_XILINX_UART_H__
> +#define __SERIAL_XILINX_UART_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +void xilinx_uart_putc(char ch);
> +
> +int xilinx_uart_getc(void);
> +
> +int xilinx_uart_init(unsigned long base, u32 in_freq, u32 baudrate);
> +
> +#endif
> diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
> index b9ce67e..8671ee3 100644
> --- a/lib/utils/serial/fdt_serial.c
> +++ b/lib/utils/serial/fdt_serial.c
> @@ -16,12 +16,14 @@ extern struct fdt_serial fdt_serial_uart8250;
>  extern struct fdt_serial fdt_serial_sifive;
>  extern struct fdt_serial fdt_serial_htif;
>  extern struct fdt_serial fdt_serial_shakti;
> +extern struct fdt_serial fdt_serial_xilinx;
>
>  static struct fdt_serial *serial_drivers[] = {
>         &fdt_serial_uart8250,
>         &fdt_serial_sifive,
>         &fdt_serial_htif,
>         &fdt_serial_shakti,
> +       &fdt_serial_xilinx,
>  };
>
>  static void dummy_putc(char ch)
> diff --git a/lib/utils/serial/fdt_serial_xilinx.c b/lib/utils/serial/fdt_serial_xilinx.c
> new file mode 100644
> index 0000000..8b52a7d
> --- /dev/null
> +++ b/lib/utils/serial/fdt_serial_xilinx.c
> @@ -0,0 +1,36 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 Guokai Chen <chenguokai17@mails.ucas.ac.cn>
> + *
> + * This code is based on lib/utils/serial/fdt_serial_shakti.c
> + */
> +
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/serial/fdt_serial.h>
> +#include <sbi_utils/serial/xilinx-uart.h>
> +
> +static int serial_xilinx_init(void *fdt, int nodeoff,
> +                               const struct fdt_match *match)
> +{
> +
> +       int rc;
> +       struct platform_uart_data uart;
> +       // no need to reinvent a wheel

Use /* */

> +       rc = fdt_parse_shakti_uart_node(fdt, nodeoff, &uart);

Can we refactor the existing _uart parse codes a little bit? Calling
into another hardware's parse routine is odd.

> +       if (rc)
> +               return rc;
> +       return xilinx_uart_init(uart.addr, uart.freq, uart.baud);
> +}
> +
> +static const struct fdt_match serial_xilinx_match[] = {
> +       { .compatible = "xilinx,uartlite" },

I didn't find such a compatible string in the upstream Linux kernel.
We should use the official DT bindings.

> +       { },
> +};
> +
> +struct fdt_serial fdt_serial_xilinx = {
> +       .match_table = serial_xilinx_match,
> +       .init = serial_xilinx_init,
> +       .getc = xilinx_uart_getc,
> +       .putc = xilinx_uart_putc
> +};
> diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
> index c0746f0..6089944 100644
> --- a/lib/utils/serial/objects.mk
> +++ b/lib/utils/serial/objects.mk
> @@ -10,8 +10,10 @@
>  libsbiutils-objs-y += serial/fdt_serial.o
>  libsbiutils-objs-y += serial/fdt_serial_htif.o
>  libsbiutils-objs-y += serial/fdt_serial_shakti.o
> +libsbiutils-objs-y += serial/fdt_serial_xilinx.o
>  libsbiutils-objs-y += serial/fdt_serial_sifive.o
>  libsbiutils-objs-y += serial/fdt_serial_uart8250.o
>  libsbiutils-objs-y += serial/shakti-uart.o
> +libsbiutils-objs-y += serial/xilinx-uart.o
>  libsbiutils-objs-y += serial/sifive-uart.o
>  libsbiutils-objs-y += serial/uart8250.o
> diff --git a/lib/utils/serial/xilinx-uart.c b/lib/utils/serial/xilinx-uart.c
> new file mode 100644
> index 0000000..ea32d47
> --- /dev/null
> +++ b/lib/utils/serial/xilinx-uart.c
> @@ -0,0 +1,42 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 Guokai Chen <chenguokai17@mails.ucas.ac.cn>
> + *
> + * This code is based on lib/utils/serial/xilinx-uart.c
> + */
> +
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi_utils/serial/xilinx-uart.h>
> +
> +#define REG_TX         0x04
> +#define REG_RX         0x00

Please put 0x00 before 0x04

> +#define REG_STATUS     0x08
> +#define REG_CONTROL    0x0C
> +
> +#define UART_TX_FULL    (1<<0x3)

nits: use _BITUL(3)

> +#define UART_RX_VALID   (1<<0x0)
> +
> +static volatile void *uart_base;
> +
> +void xilinx_uart_putc(char ch)
> +{
> +       while((readb(uart_base + REG_STATUS) & UART_TX_FULL))
> +               ;
> +       writeb(ch, uart_base + REG_TX);
> +}
> +
> +int xilinx_uart_getc(void)
> +{
> +       u16 status = readb(uart_base + REG_STATUS);
> +       if (status & UART_RX_VALID)
> +               return readb(uart_base + REG_RX);
> +       return -1;
> +}
> +
> +int xilinx_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
> +{
> +       uart_base = (volatile void *)base;
> +       return 0;
> +}
> --

Regards,
Bin

