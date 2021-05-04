From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 4 May 2021 17:24:40 +0800
Subject: [PATCH 1/1] lib: utils/serial: Add support for Gaisler APBUART
In-Reply-To: <DM6PR04MB6201013CA513476C5E9933E48D5A9@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20210430063556.4153719-1-cederman@gaisler.com>
 <DM6PR04MB6201013CA513476C5E9933E48D5A9@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <CAEUhbmXbAsTr9dxy=-tujXk__oCN9Azp5GbTT4HXZeKsnz1vFQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 4, 2021 at 11:46 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Daniel
> > Cederman
> > Sent: 30 April 2021 12:06
> > To: opensbi at lists.infradead.org
> > Cc: daniel at gaisler.com
> > Subject: [PATCH 1/1] lib: utils/serial: Add support for Gaisler APBUART
> >
> > This patch adds support for the UART used by the NOEL-V processor.
> >
> > Cobham Gaisler's NOEL-V RISC-V processor IP is available under GPL and
> > commercial license and is described in more detail at
> > https://www.gaisler.com/noelv.
> >
> > Signed-off-by: Daniel Cederman <cederman@gaisler.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
>
> > ---
> >  include/sbi_utils/fdt/fdt_helper.h      |  3 +
> >  include/sbi_utils/serial/gaisler-uart.h | 17 +++++
> >  lib/utils/fdt/fdt_helper.c              | 40 ++++++++++++
> >  lib/utils/serial/fdt_serial.c           |  2 +
> >  lib/utils/serial/fdt_serial_gaisler.c   | 35 ++++++++++
> >  lib/utils/serial/gaisler-uart.c         | 86 +++++++++++++++++++++++++
> >  lib/utils/serial/objects.mk             |  2 +
> >  7 files changed, 185 insertions(+)
> >  create mode 100644 include/sbi_utils/serial/gaisler-uart.h
> >  create mode 100644 lib/utils/serial/fdt_serial_gaisler.c
> >  create mode 100644 lib/utils/serial/gaisler-uart.c
> >
> > diff --git a/include/sbi_utils/fdt/fdt_helper.h
> > b/include/sbi_utils/fdt/fdt_helper.h
> > index f5222de..c89f2e6 100644
> > --- a/include/sbi_utils/fdt/fdt_helper.h
> > +++ b/include/sbi_utils/fdt/fdt_helper.h
> > @@ -39,6 +39,9 @@ int fdt_parse_hart_id(void *fdt, int cpu_offset, u32
> > *hartid);
> >
> >  int fdt_parse_max_hart_id(void *fdt, u32 *max_hartid);
> >
> > +int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
> > +                             struct platform_uart_data *uart);
> > +
> >  int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
> >                              struct platform_uart_data *uart);
> >
> > diff --git a/include/sbi_utils/serial/gaisler-uart.h
> > b/include/sbi_utils/serial/gaisler-uart.h
> > new file mode 100644
> > index 0000000..11d1f20
> > --- /dev/null
> > +++ b/include/sbi_utils/serial/gaisler-uart.h
> > @@ -0,0 +1,17 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 Cobham Gaisler AB.
> > + *
> > + * Authors:
> > + *   Daniel Cederman <cederman@gaisler.com>
> > + */
> > +
> > +#ifndef __SERIAL_GAISLER_APBUART_H__
> > +#define __SERIAL_GAISLER_APBUART_H__
> > +
> > +#include <sbi/sbi_types.h>
> > +
> > +int gaisler_uart_init(unsigned long base, u32 in_freq, u32 baudrate);
> > +
> > +#endif
> > diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c index
> > 909de01..9143e44 100644
> > --- a/lib/utils/fdt/fdt_helper.c
> > +++ b/lib/utils/fdt/fdt_helper.c
> > @@ -26,6 +26,8 @@
> >  #define DEFAULT_SIFIVE_UART_REG_SHIFT                0
> >  #define DEFAULT_SIFIVE_UART_REG_IO_WIDTH     4
> >
> > +#define DEFAULT_GAISLER_UART_REG_IO_WIDTH    4
> > +
> >  #define DEFAULT_SHAKTI_UART_FREQ             50000000
> >  #define DEFAULT_SHAKTI_UART_BAUD             115200
> >
> > @@ -213,6 +215,44 @@ int fdt_parse_max_hart_id(void *fdt, u32
> > *max_hartid)
> >       return 0;
> >  }
> >
> > +int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
> > +                             struct platform_uart_data *uart)
> > +{
> > +     int len, rc;
> > +     const fdt32_t *val;
> > +     unsigned long reg_addr, reg_size;
> > +
> > +     if (nodeoffset < 0 || !uart || !fdt)
> > +             return SBI_ENODEV;
> > +
> > +     rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr,
> > &reg_size);
> > +     if (rc < 0 || !reg_addr || !reg_size)
> > +             return SBI_ENODEV;
> > +     uart->addr = reg_addr;
> > +
> > +     /**
> > +      * UART address is mandatory. clock-frequency and current-speed
> > +      * may not be present. Don't return error.
> > +      */
> > +     val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "clock-frequency",
> > &len);
> > +     if (len > 0 && val)
> > +             uart->freq = fdt32_to_cpu(*val);
> > +     else
> > +             uart->freq = DEFAULT_UART_FREQ;
> > +
> > +     val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "current-speed",
> > &len);
> > +     if (len > 0 && val)
> > +             uart->baud = fdt32_to_cpu(*val);
> > +     else
> > +             uart->baud = DEFAULT_UART_BAUD;
> > +
> > +     /* For Gaisler APBUART, the reg-shift and reg-io-width are fixed .*/
> > +     uart->reg_shift    = DEFAULT_UART_REG_SHIFT;
> > +     uart->reg_io_width = DEFAULT_GAISLER_UART_REG_IO_WIDTH;
> > +
> > +     return 0;
> > +}
> > +
> >  int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
> >                              struct platform_uart_data *uart)  { diff --git
> > a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c index
> > 43c55e8..bad3387 100644
> > --- a/lib/utils/serial/fdt_serial.c
> > +++ b/lib/utils/serial/fdt_serial.c
> > @@ -16,12 +16,14 @@ extern struct fdt_serial fdt_serial_uart8250;  extern
> > struct fdt_serial fdt_serial_sifive;  extern struct fdt_serial fdt_serial_htif;
> > extern struct fdt_serial fdt_serial_shakti;
> > +extern struct fdt_serial fdt_serial_gaisler;
> >
> >  static struct fdt_serial *serial_drivers[] = {
> >       &fdt_serial_uart8250,
> >       &fdt_serial_sifive,
> >       &fdt_serial_htif,
> >       &fdt_serial_shakti,
> > +     &fdt_serial_gaisler
> >  };
> >
> >  static struct fdt_serial dummy = {
> > diff --git a/lib/utils/serial/fdt_serial_gaisler.c
> > b/lib/utils/serial/fdt_serial_gaisler.c
> > new file mode 100644
> > index 0000000..9a9f9a8
> > --- /dev/null
> > +++ b/lib/utils/serial/fdt_serial_gaisler.c
> > @@ -0,0 +1,35 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 Cobham Gaisler AB.
> > + *
> > + * Authors:
> > + *   Daniel Cederman <cederman@gaisler.com>
> > + */
> > +
> > +#include <sbi_utils/fdt/fdt_helper.h>
> > +#include <sbi_utils/serial/fdt_serial.h> #include
> > +<sbi_utils/serial/gaisler-uart.h>
> > +
> > +static int serial_gaisler_init(void *fdt, int nodeoff,
> > +                            const struct fdt_match *match) {
> > +     int rc;
> > +     struct platform_uart_data uart;
> > +
> > +     rc = fdt_parse_gaisler_uart_node(fdt, nodeoff, &uart);
> > +     if (rc)
> > +             return rc;
> > +
> > +     return gaisler_uart_init(uart.addr, uart.freq, uart.baud); }
> > +
> > +static const struct fdt_match serial_gaisler_match[] = {
> > +     { .compatible = "gaisler,apbuart" },
>
> We do have compatible strings in OpenSBI which are not standardized by
> Linux DT bindings so this compatible string is okay for now.
>
> It is very important that whenever Linux DT bindings are accepted, we
> add the accepted compatible string here as well.

Good to know :)

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

