From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 28 Apr 2021 12:12:50 +0000
Subject: [PATCH 2/7] lib: sbi: Simplify console platform operations
In-Reply-To: <1b5430e4abd8e1a6a704c4c68873956c85e86cdf.camel@126.com>
References: <20210422112023.670521-1-anup.patel@wdc.com>
 <20210422112023.670521-3-anup.patel@wdc.com>
 <1b5430e4abd8e1a6a704c4c68873956c85e86cdf.camel@126.com>
Message-ID: <DM6PR04MB6201759A657F6D53C34094B48D409@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Xiang W <wxjstz@126.com>
> Sent: 23 April 2021 14:59
> To: Anup Patel <Anup.Patel@wdc.com>; Atish Patra
> <Atish.Patra@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org
> Subject: Re: [PATCH 2/7] lib: sbi: Simplify console platform operations
> 
> ? 2021-04-22?? 16:50 +0530?Anup Patel???
> > Instead of having console_putc() and console_getc() callbacks in
> > platform operations, it will be much simpler for console driver to
> > directly register these operations as device to the sbi_console
> > implementation.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Look good to me.
> 
> Reviewed-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> 
> Regards,
> Xiang W
> > ---
> >  include/sbi/sbi_console.h              | 15 +++++++++++++
> >  include/sbi/sbi_platform.h             | 31 ------------------------
> > --
> >  include/sbi_utils/serial/fdt_serial.h  |  6 -----
> > include/sbi_utils/serial/shakti-uart.h |  4 ----
> > include/sbi_utils/serial/sifive-uart.h |  4 ----
> >  include/sbi_utils/serial/uart8250.h    |  4 ----
> >  include/sbi_utils/sys/htif.h           |  4 +---
> >  lib/sbi/sbi_console.c                  | 31 +++++++++++++++++++-----
> > --
> >  lib/utils/serial/fdt_serial.c          | 21 -----------------
> >  lib/utils/serial/fdt_serial_htif.c     | 10 ++++++---
> >  lib/utils/serial/fdt_serial_shakti.c   |  4 +---
> >  lib/utils/serial/fdt_serial_sifive.c   |  4 +---
> >  lib/utils/serial/fdt_serial_uart8250.c |  2 --
> >  lib/utils/serial/shakti-uart.c         | 12 ++++++++--
> >  lib/utils/serial/sifive-uart.c         | 12 ++++++++--
> >  lib/utils/serial/uart8250.c            | 13 +++++++++--
> >  lib/utils/sys/htif.c                   | 20 ++++++++++++++---
> >  platform/andes/ae350/platform.c        |  2 --
> >  platform/fpga/ariane/platform.c        |  2 --
> >  platform/fpga/openpiton/platform.c     |  2 --
> >  platform/generic/platform.c            |  2 --
> >  platform/kendryte/k210/platform.c      |  2 --
> >  platform/nuclei/ux600/platform.c       |  2 --
> >  platform/sifive/fu540/platform.c       |  2 --
> >  platform/template/platform.c           | 19 ----------------
> >  25 files changed, 96 insertions(+), 134 deletions(-)
> >
> > diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> > index 7d648f0..e24ba5f 100644
> > --- a/include/sbi/sbi_console.h
> > +++ b/include/sbi/sbi_console.h
> > @@ -12,6 +12,17 @@
> >
> >  #include <sbi/sbi_types.h>
> >
> > +struct sbi_console_device {
> > +	/** Name of the console device */
> > +	char name[32];
> > +
> > +	/** Write a character to the console output */
> > +	void (*console_putc)(char ch);
> > +
> > +	/** Read a character from the console input */
> > +	int (*console_getc)(void);
> > +};
> > +
> >  #define __printf(a, b) __attribute__((format(printf, a, b)))
> >
> >  bool sbi_isprintable(char ch);
> > @@ -32,6 +43,10 @@ int __printf(1, 2) sbi_printf(const char *format,
> > ...);
> >
> >  int __printf(1, 2) sbi_dprintf(const char *format, ...);
> >
> > +const struct sbi_console_device *sbi_console_get_device(void);
> > +
> > +void sbi_console_set_device(const struct sbi_console_device *dev);
> > +
> >  struct sbi_scratch;
> >
> >  int sbi_console_init(struct sbi_scratch *scratch); diff --git
> > a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h index
> > 6736169..0d18ef2 100644
> > --- a/include/sbi/sbi_platform.h
> > +++ b/include/sbi/sbi_platform.h
> > @@ -95,10 +95,6 @@ struct sbi_platform_operations {
> >  	/** Initialize (or populate) domains for the platform */
> >  	int (*domains_init)(void);
> >
> > -	/** Write a character to the platform console output */
> > -	void (*console_putc)(char ch);
> > -	/** Read a character from the platform console input */
> > -	int (*console_getc)(void);
> >  	/** Initialize the platform console */
> >  	int (*console_init)(void);
> >
> > @@ -496,33 +492,6 @@ static inline int sbi_platform_domains_init(const
> > struct sbi_platform *plat)
> >  	return 0;
> >  }
> >
> > -/**
> > - * Write a character to the platform console output
> > - *
> > - * @param plat pointer to struct sbi_platform
> > - * @param ch character to write
> > - */
> > -static inline void sbi_platform_console_putc(const struct
> > sbi_platform *plat,
> > -						char ch)
> > -{
> > -	if (plat && sbi_platform_ops(plat)->console_putc)
> > -		sbi_platform_ops(plat)->console_putc(ch);
> > -}
> > -
> > -/**
> > - * Read a character from the platform console input
> > - *
> > - * @param plat pointer to struct sbi_platform
> > - *
> > - * @return character read from console input
> > - */
> > -static inline int sbi_platform_console_getc(const struct sbi_platform
> > *plat) -{
> > -	if (plat && sbi_platform_ops(plat)->console_getc)
> > -		return sbi_platform_ops(plat)->console_getc();
> > -	return -1;
> > -}
> > -
> >  /**
> >   * Initialize the platform console
> >   *
> > diff --git a/include/sbi_utils/serial/fdt_serial.h
> > b/include/sbi_utils/serial/fdt_serial.h
> > index 08f9799..6451c23 100644
> > --- a/include/sbi_utils/serial/fdt_serial.h
> > +++ b/include/sbi_utils/serial/fdt_serial.h
> > @@ -15,14 +15,8 @@
> >  struct fdt_serial {
> >  	const struct fdt_match *match_table;
> >  	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
> > -	void (*putc)(char ch);
> > -	int (*getc)(void);
> >  };
> >
> > -void fdt_serial_putc(char ch);
> > -
> > -int fdt_serial_getc(void);
> > -
> >  int fdt_serial_init(void);
> >
> >  #endif
> > diff --git a/include/sbi_utils/serial/shakti-uart.h
> > b/include/sbi_utils/serial/shakti-uart.h
> > index 08043be..bcb019e 100644
> > --- a/include/sbi_utils/serial/shakti-uart.h
> > +++ b/include/sbi_utils/serial/shakti-uart.h
> > @@ -9,10 +9,6 @@
> >
> >  #include <sbi/sbi_types.h>
> >
> > -void shakti_uart_putc(char ch);
> > -
> > -int shakti_uart_getc(void);
> > -
> >  int shakti_uart_init(unsigned long base, u32 in_freq, u32 baudrate);
> >
> >  #endif
> > diff --git a/include/sbi_utils/serial/sifive-uart.h
> > b/include/sbi_utils/serial/sifive-uart.h
> > index f323392..9c465ec 100644
> > --- a/include/sbi_utils/serial/sifive-uart.h
> > +++ b/include/sbi_utils/serial/sifive-uart.h
> > @@ -12,10 +12,6 @@
> >
> >  #include <sbi/sbi_types.h>
> >
> > -void sifive_uart_putc(char ch);
> > -
> > -int sifive_uart_getc(void);
> > -
> >  int sifive_uart_init(unsigned long base, u32 in_freq, u32 baudrate);
> >
> >  #endif
> > diff --git a/include/sbi_utils/serial/uart8250.h
> > b/include/sbi_utils/serial/uart8250.h
> > index 0a1b5d3..6b9b48b 100644
> > --- a/include/sbi_utils/serial/uart8250.h
> > +++ b/include/sbi_utils/serial/uart8250.h
> > @@ -12,10 +12,6 @@
> >
> >  #include <sbi/sbi_types.h>
> >
> > -void uart8250_putc(char ch);
> > -
> > -int uart8250_getc(void);
> > -
> >  int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32
> > reg_shift,
> >  		  u32 reg_width);
> >
> > diff --git a/include/sbi_utils/sys/htif.h
> > b/include/sbi_utils/sys/htif.h index a431723..8073a44 100644
> > --- a/include/sbi_utils/sys/htif.h
> > +++ b/include/sbi_utils/sys/htif.h
> > @@ -10,9 +10,7 @@
> >
> >  #include <sbi/sbi_types.h>
> >
> > -void htif_putc(char ch);
> > -
> > -int htif_getc(void);
> > +int htif_serial_init(void);
> >
> >  int htif_system_reset_check(u32 type, u32 reason);
> >
> > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c index
> > 7189b9b..b54f7a2 100644
> > --- a/lib/sbi/sbi_console.c
> > +++ b/lib/sbi/sbi_console.c
> > @@ -12,7 +12,7 @@
> >  #include <sbi/sbi_platform.h>
> >  #include <sbi/sbi_scratch.h>
> >
> > -static const struct sbi_platform *console_plat = NULL;
> > +static const struct sbi_console_device *console_dev = NULL;
> >  static spinlock_t console_out_lock	       = SPIN_LOCK_INITIALIZER;
> >
> >  bool sbi_isprintable(char c)
> > @@ -26,14 +26,18 @@ bool sbi_isprintable(char c)
> >
> >  int sbi_getc(void)
> >  {
> > -	return sbi_platform_console_getc(console_plat);
> > +	if (console_dev && console_dev->console_getc)
> > +		return console_dev->console_getc();
> > +	return -1;
> >  }
> >
> >  void sbi_putc(char ch)
> >  {
> > -	if (ch == '\n')
> > -		sbi_platform_console_putc(console_plat, '\r');
> > -	sbi_platform_console_putc(console_plat, ch);
> > +	if (console_dev && console_dev->console_putc) {
> > +		if (ch == '\n')
> > +			console_dev->console_putc('\r');
> > +		console_dev->console_putc(ch);
> > +	}
> >  }
> >
> >  void sbi_puts(const char *str)
> > @@ -390,9 +394,20 @@ int sbi_dprintf(const char *format, ...)
> >  	return retval;
> >  }
> >
> > -int sbi_console_init(struct sbi_scratch *scratch)
> > +const struct sbi_console_device *sbi_console_get_device(void) {
> > +	return console_dev;
> > +}
> > +
> > +void sbi_console_set_device(const struct sbi_console_device *dev)
> >  {
> > -	console_plat = sbi_platform_ptr(scratch);
> > +	if (!dev || console_dev)
> > +		return;
> >
> > -	return sbi_platform_console_init(console_plat);
> > +	console_dev = dev;
> > +}
> > +
> > +int sbi_console_init(struct sbi_scratch *scratch) {
> > +	return sbi_platform_console_init(sbi_platform_ptr(scratch));
> >  }
> > diff --git a/lib/utils/serial/fdt_serial.c
> > b/lib/utils/serial/fdt_serial.c index b9ce67e..43c55e8 100644
> > --- a/lib/utils/serial/fdt_serial.c
> > +++ b/lib/utils/serial/fdt_serial.c
> > @@ -24,34 +24,13 @@ static struct fdt_serial *serial_drivers[] = {
> >  	&fdt_serial_shakti,
> >  };
> >
> > -static void dummy_putc(char ch)
> > -{
> > -}
> > -
> > -static int dummy_getc(void)
> > -{
> > -	return -1;
> > -}
> > -
> >  static struct fdt_serial dummy = {
> >  	.match_table = NULL,
> >  	.init = NULL,
> > -	.putc = dummy_putc,
> > -	.getc = dummy_getc,
> >  };
> >
> >  static struct fdt_serial *current_driver = &dummy;
> >
> > -void fdt_serial_putc(char ch)
> > -{
> > -	current_driver->putc(ch);
> > -}
> > -
> > -int fdt_serial_getc(void)
> > -{
> > -	return current_driver->getc();
> > -}
> > -
> >  int fdt_serial_init(void)
> >  {
> >  	const void *prop;
> > diff --git a/lib/utils/serial/fdt_serial_htif.c
> > b/lib/utils/serial/fdt_serial_htif.c
> > index 32d6953..fae55b8 100644
> > --- a/lib/utils/serial/fdt_serial_htif.c
> > +++ b/lib/utils/serial/fdt_serial_htif.c
> > @@ -16,9 +16,13 @@ static const struct fdt_match serial_htif_match[] =
> > {
> >  	{ },
> >  };
> >
> > +static int serial_htif_init(void *fdt, int nodeoff,
> > +			    const struct fdt_match *match) {
> > +	return htif_serial_init();
> > +}
> > +
> >  struct fdt_serial fdt_serial_htif = {
> >  	.match_table = serial_htif_match,
> > -	.init = NULL,
> > -	.getc = htif_getc,
> > -	.putc = htif_putc
> > +	.init = serial_htif_init
> >  };
> > diff --git a/lib/utils/serial/fdt_serial_shakti.c
> > b/lib/utils/serial/fdt_serial_shakti.c
> > index c6385a5..4f91419 100644
> > --- a/lib/utils/serial/fdt_serial_shakti.c
> > +++ b/lib/utils/serial/fdt_serial_shakti.c
> > @@ -29,7 +29,5 @@ static const struct fdt_match serial_shakti_match[]
> > = {
> >
> >  struct fdt_serial fdt_serial_shakti = {
> >  	.match_table = serial_shakti_match,
> > -	.init = serial_shakti_init,
> > -	.getc = shakti_uart_getc,
> > -	.putc = shakti_uart_putc
> > +	.init = serial_shakti_init
> >  };
> > diff --git a/lib/utils/serial/fdt_serial_sifive.c
> > b/lib/utils/serial/fdt_serial_sifive.c
> > index 9e487a2..f4c833c 100644
> > --- a/lib/utils/serial/fdt_serial_sifive.c
> > +++ b/lib/utils/serial/fdt_serial_sifive.c
> > @@ -32,7 +32,5 @@ static const struct fdt_match serial_sifive_match[]
> > = {
> >
> >  struct fdt_serial fdt_serial_sifive = {
> >  	.match_table = serial_sifive_match,
> > -	.init = serial_sifive_init,
> > -	.getc = sifive_uart_getc,
> > -	.putc = sifive_uart_putc
> > +	.init = serial_sifive_init
> >  };
> > diff --git a/lib/utils/serial/fdt_serial_uart8250.c
> > b/lib/utils/serial/fdt_serial_uart8250.c
> > index 5030b82..918193a 100644
> > --- a/lib/utils/serial/fdt_serial_uart8250.c
> > +++ b/lib/utils/serial/fdt_serial_uart8250.c
> > @@ -34,6 +34,4 @@ static const struct fdt_match
> > serial_uart8250_match[] = {  struct fdt_serial fdt_serial_uart8250 = {
> >  	.match_table = serial_uart8250_match,
> >  	.init = serial_uart8250_init,
> > -	.getc = uart8250_getc,
> > -	.putc = uart8250_putc
> >  };
> > diff --git a/lib/utils/serial/shakti-uart.c
> > b/lib/utils/serial/shakti-uart.c index 7c1148e..e77a985 100644
> > --- a/lib/utils/serial/shakti-uart.c
> > +++ b/lib/utils/serial/shakti-uart.c
> > @@ -23,14 +23,14 @@
> >
> >  static volatile void *uart_base;
> >
> > -void shakti_uart_putc(char ch)
> > +static void shakti_uart_putc(char ch)
> >  {
> >  	while((readw(uart_base + REG_STATUS) & UART_TX_FULL))
> >  		;
> >  	writeb(ch, uart_base + REG_TX);
> >  }
> >
> > -int shakti_uart_getc(void)
> > +static int shakti_uart_getc(void)
> >  {
> >  	u16 status = readw(uart_base + REG_STATUS);
> >  	if (status & UART_RX_FULL)
> > @@ -38,11 +38,19 @@ int shakti_uart_getc(void)
> >  	return -1;
> >  }
> >
> > +static struct sbi_console_device shakti_console = {
> > +	.name = "shakti_uart",
> > +	.console_putc = shakti_uart_putc,
> > +	.console_getc = shakti_uart_getc
> > +};
> > +
> >  int shakti_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
> > {
> >  	uart_base = (volatile void *)base;
> >  	u16 baud = (u16)(in_freq/(16 * baudrate));
> >  	writew(baud, uart_base + REG_BAUD);
> >
> > +	sbi_console_set_device(&shakti_console);
> > +
> >  	return 0;
> >  }
> > diff --git a/lib/utils/serial/sifive-uart.c
> > b/lib/utils/serial/sifive-uart.c index 72c8a62..57d80fa 100644
> > --- a/lib/utils/serial/sifive-uart.c
> > +++ b/lib/utils/serial/sifive-uart.c
> > @@ -66,7 +66,7 @@ static void set_reg(u32 num, u32 val)
> >  	writel(val, uart_base + (num * 0x4));  }
> >
> > -void sifive_uart_putc(char ch)
> > +static void sifive_uart_putc(char ch)
> >  {
> >  	while (get_reg(UART_REG_TXFIFO) & UART_TXFIFO_FULL)
> >  		;
> > @@ -74,7 +74,7 @@ void sifive_uart_putc(char ch)
> >  	set_reg(UART_REG_TXFIFO, ch);
> >  }
> >
> > -int sifive_uart_getc(void)
> > +static int sifive_uart_getc(void)
> >  {
> >  	u32 ret = get_reg(UART_REG_RXFIFO);
> >  	if (!(ret & UART_RXFIFO_EMPTY))
> > @@ -82,6 +82,12 @@ int sifive_uart_getc(void)
> >  	return -1;
> >  }
> >
> > +static struct sbi_console_device sifive_console = {
> > +	.name = "sifive_uart",
> > +	.console_putc = sifive_uart_putc,
> > +	.console_getc = sifive_uart_getc
> > +};
> > +
> >  int sifive_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
> > {
> >  	uart_base     = (volatile void *)base;
> > @@ -98,5 +104,7 @@ int sifive_uart_init(unsigned long base, u32
> > in_freq, u32 baudrate)
> >  	/* Enable Rx */
> >  	set_reg(UART_REG_RXCTRL, UART_RXCTRL_RXEN);
> >
> > +	sbi_console_set_device(&sifive_console);
> > +
> >  	return 0;
> >  }
> > diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
> > index 9635ba8..1cf6624 100644
> > --- a/lib/utils/serial/uart8250.c
> > +++ b/lib/utils/serial/uart8250.c
> > @@ -8,6 +8,7 @@
> >   */
> >
> >  #include <sbi/riscv_io.h>
> > +#include <sbi/sbi_console.h>
> >  #include <sbi_utils/serial/uart8250.h>
> >
> >  /* clang-format off */
> > @@ -68,7 +69,7 @@ static void set_reg(u32 num, u32 val)
> >  		writel(val, uart8250_base + offset);  }
> >
> > -void uart8250_putc(char ch)
> > +static void uart8250_putc(char ch)
> >  {
> >  	while ((get_reg(UART_LSR_OFFSET) & UART_LSR_THRE) == 0)
> >  		;
> > @@ -76,13 +77,19 @@ void uart8250_putc(char ch)
> >  	set_reg(UART_THR_OFFSET, ch);
> >  }
> >
> > -int uart8250_getc(void)
> > +static int uart8250_getc(void)
> >  {
> >  	if (get_reg(UART_LSR_OFFSET) & UART_LSR_DR)
> >  		return get_reg(UART_RBR_OFFSET);
> >  	return -1;
> >  }
> >
> > +static struct sbi_console_device uart8250_console = {
> > +	.name = "uart8250",
> > +	.console_putc = uart8250_putc,
> > +	.console_getc = uart8250_getc
> > +};
> > +
> >  int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32
> > reg_shift,
> >  		  u32 reg_width)
> >  {
> > @@ -121,5 +128,7 @@ int uart8250_init(unsigned long base, u32 in_freq,
> > u32 baudrate, u32 reg_shift,
> >  	/* Set scratchpad */
> >  	set_reg(UART_SCR_OFFSET, 0x00);
> >
> > +	sbi_console_set_device(&uart8250_console);
> > +
> >  	return 0;
> >  }
> > diff --git a/lib/utils/sys/htif.c b/lib/utils/sys/htif.c index
> > fd70fb9..2fd38a7 100644
> > --- a/lib/utils/sys/htif.c
> > +++ b/lib/utils/sys/htif.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <sbi/riscv_locks.h>
> > +#include <sbi/sbi_console.h>
> >  #include <sbi_utils/sys/htif.h>
> >
> >  #define HTIF_DATA_BITS		48
> > @@ -98,7 +99,7 @@ static void do_tohost_fromhost(uint64_t dev,
> > uint64_t cmd, uint64_t data)
> >  	spin_unlock(&htif_lock);
> >  }
> >
> > -void htif_putc(char ch)
> > +static void htif_putc(char ch)
> >  {
> >  	/* HTIF devices are not supported on RV32, so do a proxy write call
> > */
> >  	volatile uint64_t magic_mem[8];
> > @@ -109,7 +110,7 @@ void htif_putc(char ch)
> >  	do_tohost_fromhost(HTIF_DEV_SYSTEM, 0,
> > (uint64_t)(uintptr_t)magic_mem);  }  #else -void htif_putc(char ch)
> > +static void htif_putc(char ch)
> >  {
> >  	spin_lock(&htif_lock);
> >  	__set_tohost(HTIF_DEV_CONSOLE, HTIF_CONSOLE_CMD_PUTC,
> ch); @@ -117,7
> > +118,7 @@ void htif_putc(char ch)  }  #endif
> >
> > -int htif_getc(void)
> > +static int htif_getc(void)
> >  {
> >  	int ch;
> >
> > @@ -140,6 +141,19 @@ int htif_getc(void)
> >  	return ch - 1;
> >  }
> >
> > +static struct sbi_console_device htif_console = {
> > +	.name = "htif",
> > +	.console_putc = htif_putc,
> > +	.console_getc = htif_getc
> > +};
> > +
> > +int htif_serial_init(void)
> > +{
> > +	sbi_console_set_device(&htif_console);
> > +
> > +	return 0;
> > +}
> > +
> >  int htif_system_reset_check(u32 type, u32 reason)  {
> >  	return 1;
> > diff --git a/platform/andes/ae350/platform.c
> > b/platform/andes/ae350/platform.c index aec91cd..338159d 100644
> > --- a/platform/andes/ae350/platform.c
> > +++ b/platform/andes/ae350/platform.c
> > @@ -164,8 +164,6 @@ const struct sbi_platform_operations platform_ops
> > = {
> >  	.final_init = ae350_final_init,
> >
> >  	.console_init = ae350_console_init,
> > -	.console_putc = uart8250_putc,
> > -	.console_getc = uart8250_getc,
> >
> >  	.irqchip_init = ae350_irqchip_init,
> >
> > diff --git a/platform/fpga/ariane/platform.c
> > b/platform/fpga/ariane/platform.c index ea179e5..4f32c42 100644
> > --- a/platform/fpga/ariane/platform.c
> > +++ b/platform/fpga/ariane/platform.c
> > @@ -154,8 +154,6 @@ const struct sbi_platform_operations platform_ops
> > = {
> >  	.early_init = ariane_early_init,
> >  	.final_init = ariane_final_init,
> >  	.console_init = ariane_console_init,
> > -	.console_putc = uart8250_putc,
> > -	.console_getc = uart8250_getc,
> >  	.irqchip_init = ariane_irqchip_init,
> >  	.ipi_init = ariane_ipi_init,
> >  	.ipi_send = clint_ipi_send,
> > diff --git a/platform/fpga/openpiton/platform.c
> > b/platform/fpga/openpiton/platform.c
> > index 5eae477..77403c9 100644
> > --- a/platform/fpga/openpiton/platform.c
> > +++ b/platform/fpga/openpiton/platform.c
> > @@ -180,8 +180,6 @@ const struct sbi_platform_operations platform_ops
> > = {
> >  	.early_init = openpiton_early_init,
> >  	.final_init = openpiton_final_init,
> >  	.console_init = openpiton_console_init,
> > -	.console_putc = uart8250_putc,
> > -	.console_getc = uart8250_getc,
> >  	.irqchip_init = openpiton_irqchip_init,
> >  	.ipi_init = openpiton_ipi_init,
> >  	.ipi_send = clint_ipi_send,
> > diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> > index 8c1e06f..445cbcf 100644
> > --- a/platform/generic/platform.c
> > +++ b/platform/generic/platform.c
> > @@ -210,8 +210,6 @@ const struct sbi_platform_operations platform_ops
> > = {
> >  	.early_exit		= generic_early_exit,
> >  	.final_exit		= generic_final_exit,
> >  	.domains_init		= generic_domains_init,
> > -	.console_putc		= fdt_serial_putc,
> > -	.console_getc		= fdt_serial_getc,
> >  	.console_init		= fdt_serial_init,
> >  	.irqchip_init		= fdt_irqchip_init,
> >  	.irqchip_exit		= fdt_irqchip_exit,
> > diff --git a/platform/kendryte/k210/platform.c
> > b/platform/kendryte/k210/platform.c
> > index 0c50af5..495d214 100644
> > --- a/platform/kendryte/k210/platform.c
> > +++ b/platform/kendryte/k210/platform.c
> > @@ -149,8 +149,6 @@ const struct sbi_platform_operations platform_ops
> > = {
> >  	.final_init	= k210_final_init,
> >
> >  	.console_init	= k210_console_init,
> > -	.console_putc	= sifive_uart_putc,
> > -	.console_getc	= sifive_uart_getc,
> >
> >  	.irqchip_init = k210_irqchip_init,
> >
> > diff --git a/platform/nuclei/ux600/platform.c
> > b/platform/nuclei/ux600/platform.c
> > index d0a45a2..4f4f884 100644
> > --- a/platform/nuclei/ux600/platform.c
> > +++ b/platform/nuclei/ux600/platform.c
> > @@ -202,8 +202,6 @@ static void ux600_system_reset(u32 type, u32
> > reason)
> >  const struct sbi_platform_operations platform_ops = {
> >  	.early_init		= ux600_early_init,
> >  	.final_init		= ux600_final_init,
> > -	.console_putc		= sifive_uart_putc,
> > -	.console_getc		= sifive_uart_getc,
> >  	.console_init		= ux600_console_init,
> >  	.irqchip_init		= ux600_irqchip_init,
> >  	.ipi_send		= clint_ipi_send,
> > diff --git a/platform/sifive/fu540/platform.c
> > b/platform/sifive/fu540/platform.c
> > index cdd8293..82f6f75 100644
> > --- a/platform/sifive/fu540/platform.c
> > +++ b/platform/sifive/fu540/platform.c
> > @@ -156,8 +156,6 @@ static u32
> fu540_hart_index2id[FU540_HART_COUNT -
> > 1] = {
> >
> >  const struct sbi_platform_operations platform_ops = {
> >  	.final_init		= fu540_final_init,
> > -	.console_putc		= sifive_uart_putc,
> > -	.console_getc		= sifive_uart_getc,
> >  	.console_init		= fu540_console_init,
> >  	.irqchip_init		= fu540_irqchip_init,
> >  	.ipi_send		= clint_ipi_send,
> > diff --git a/platform/template/platform.c
> > b/platform/template/platform.c index 5bdb186..fbbac30 100644
> > --- a/platform/template/platform.c
> > +++ b/platform/template/platform.c
> > @@ -63,23 +63,6 @@ static int platform_console_init(void)
> >  			     PLATFORM_UART_BAUDRATE, 0, 1);  }
> >
> > -/*
> > - * Write a character to the platform console output.
> > - */
> > -static void platform_console_putc(char ch) -{
> > -	/* Example if the generic UART8250 driver is used */
> > -	uart8250_putc(ch);
> > -}
> > -
> > -/*
> > - * Read a character from the platform console input.
> > - */
> > -static int platform_console_getc(void) -{
> > -	return uart8250_getc();
> > -}
> > -
> >  /*
> >   * Initialize the platform interrupt controller for current HART.
> >   */
> > @@ -198,8 +181,6 @@ static void platform_system_reset(u32 type, u32
> > reason)
> >  const struct sbi_platform_operations platform_ops = {
> >  	.early_init		= platform_early_init,
> >  	.final_init		= platform_final_init,
> > -	.console_putc		= platform_console_putc,
> > -	.console_getc		= platform_console_getc,
> >  	.console_init		= platform_console_init,
> >  	.irqchip_init		= platform_irqchip_init,
> >  	.ipi_send		= platform_ipi_send,
> > --
> > 2.25.1
> >
> >

