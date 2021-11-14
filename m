From: Xiang W <wxjstz@126.com>
Date: Sun, 14 Nov 2021 08:23:44 +0800
Subject: [PATCH] lib: utils/serial: Modify uart_getc to a blocking function
In-Reply-To: <81552989-313B-46A5-9C21-DFF37C527C06@jrtc27.com>
References: <20211113070622.90364-1-wxjstz@126.com>
 <81552989-313B-46A5-9C21-DFF37C527C06@jrtc27.com>
Message-ID: <3c0b5c46afeb692a8d98da4e9645f114251a5db2.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-11-13???? 22:11 +0000?Jessica Clarke???
> On 13 Nov 2021, at 07:06, Xiang W <wxjstz@126.com> wrote:
> > 
> > If uart_getc is non-blocking, if the sending end is faster than the
> > receiving end, the data received by some functions(sbi_gets) is
> > incomplete
> 
> Without hardware flow control this is always going to be true. Making
> getc blocking does not change that. Moreover, making it blocking
> means
> there is no longer a way to poll, whereas having it be non-blocking
> means you can poll, and if you want to make it blocking you can
> always
> put a loop in the caller (which also avoids putting it in every
> single
> driver).
> 
> Also, this breaks the SBI getchar call; it?s supposed to be
> non-blocking, but this makes it blocking, so it is impossible for an
> OS
> to poll the SBI console.

uart get does not support and returns the same value without receiving
data. So polling will also cause problems

int sbi_getc(void)
{
	if (console_dev && console_dev->console_getc)
		// Return -1 without valid data
		return console_dev->console_getc();
	return -1;
}

Regards,
Xiang W
> 
> Thus, NACK of the entire concept.
> 
> Jess
> 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> > lib/utils/serial/gaisler-uart.c |? 5 ++---
> > lib/utils/serial/shakti-uart.c? |? 7 +++----
> > lib/utils/serial/sifive-uart.c? |? 9 +++++----
> > lib/utils/serial/uart8250.c???? |? 6 +++---
> > lib/utils/sys/htif.c??????????? | 11 +++++------
> > 5 files changed, 18 insertions(+), 20 deletions(-)
> > 
> > diff --git a/lib/utils/serial/gaisler-uart.c
> > b/lib/utils/serial/gaisler-uart.c
> > index 49298e9..1dc5ae0 100644
> > --- a/lib/utils/serial/gaisler-uart.c
> > +++ b/lib/utils/serial/gaisler-uart.c
> > @@ -51,9 +51,8 @@ static void gaisler_uart_putc(char ch)
> > 
> > static int gaisler_uart_getc(void)
> > {
> > -???????u32 ret = get_reg(UART_REG_STATUS);
> > -???????if (!(ret & UART_STATUS_DATAREADY))
> > -???????????????return -1;
> > +???????while (!(get_reg(UART_REG_STATUS) & UART_STATUS_DATAREADY))
> > +???????????????;
> > ????????return get_reg(UART_REG_DATA) & UART_DATA_DATA;
> > }
> > 
> > diff --git a/lib/utils/serial/shakti-uart.c
> > b/lib/utils/serial/shakti-uart.c
> > index e77a985..a5b72aa 100644
> > --- a/lib/utils/serial/shakti-uart.c
> > +++ b/lib/utils/serial/shakti-uart.c
> > @@ -32,10 +32,9 @@ static void shakti_uart_putc(char ch)
> > 
> > static int shakti_uart_getc(void)
> > {
> > -???????u16 status = readw(uart_base + REG_STATUS);
> > -???????if (status & UART_RX_FULL)
> > -???????????????return readb(uart_base + REG_RX);
> > -???????return -1;
> > +???????while (!(readw(uart_base + REG_STATUS) & UART_RX_FULL))
> > +???????????????;
> > +???????return readb(uart_base + REG_RX);
> > }
> > 
> > static struct sbi_console_device shakti_console = {
> > diff --git a/lib/utils/serial/sifive-uart.c
> > b/lib/utils/serial/sifive-uart.c
> > index 57d80fa..68a9ca7 100644
> > --- a/lib/utils/serial/sifive-uart.c
> > +++ b/lib/utils/serial/sifive-uart.c
> > @@ -76,10 +76,11 @@ static void sifive_uart_putc(char ch)
> > 
> > static int sifive_uart_getc(void)
> > {
> > -???????u32 ret = get_reg(UART_REG_RXFIFO);
> > -???????if (!(ret & UART_RXFIFO_EMPTY))
> > -???????????????return ret & UART_RXFIFO_DATA;
> > -???????return -1;
> > +???????u32 ret;
> > +???????do
> > +???????????????ret = get_reg(UART_REG_RXFIFO);
> > +???????while (ret & UART_RXFIFO_EMPTY);
> > +???????return ret & UART_RXFIFO_DATA;
> > }
> > 
> > static struct sbi_console_device sifive_console = {
> > diff --git a/lib/utils/serial/uart8250.c
> > b/lib/utils/serial/uart8250.c
> > index 1cf6624..bab8111 100644
> > --- a/lib/utils/serial/uart8250.c
> > +++ b/lib/utils/serial/uart8250.c
> > @@ -79,9 +79,9 @@ static void uart8250_putc(char ch)
> > 
> > static int uart8250_getc(void)
> > {
> > -???????if (get_reg(UART_LSR_OFFSET) & UART_LSR_DR)
> > -???????????????return get_reg(UART_RBR_OFFSET);
> > -???????return -1;
> > +???????while (!(get_reg(UART_LSR_OFFSET) & UART_LSR_DR))
> > +???????????????;
> > +???????return get_reg(UART_RBR_OFFSET);
> > }
> > 
> > static struct sbi_console_device uart8250_console = {
> > diff --git a/lib/utils/sys/htif.c b/lib/utils/sys/htif.c
> > index 7c69c7f..dfda30a 100644
> > --- a/lib/utils/sys/htif.c
> > +++ b/lib/utils/sys/htif.c
> > @@ -47,7 +47,7 @@
> > 
> > volatile uint64_t tohost __attribute__((section(".htif")));
> > volatile uint64_t fromhost __attribute__((section(".htif")));
> > -static int htif_console_buf;
> > +static int htif_console_buf = -1;
> > static spinlock_t htif_lock = SPIN_LOCK_INITIALIZER;
> > 
> > static void __check_fromhost()
> > @@ -130,12 +130,11 @@ static int htif_getc(void)
> > 
> > ????????spin_lock(&htif_lock);
> > 
> > -???????__check_fromhost();
> > +???????while (htif_console_buf < 0)
> > +???????????????__check_fromhost();
> > ????????ch = htif_console_buf;
> > -???????if (ch >= 0) {
> > -???????????????htif_console_buf = -1;
> > -???????????????__set_tohost(HTIF_DEV_CONSOLE,
> > HTIF_CONSOLE_CMD_GETC, 0);
> > -???????}
> > +???????htif_console_buf = -1;
> > +???????__set_tohost(HTIF_DEV_CONSOLE, HTIF_CONSOLE_CMD_GETC, 0);
> > 
> > ????????spin_unlock(&htif_lock);
> > 
> > -- 
> > 2.30.2
> > 
> > 
> > -- 
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 



