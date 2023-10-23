From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 23 Oct 2023 14:05:47 +0530
Subject: [PATCH v2] lib: utils/serial: Optimize semihosting_putc implementation
In-Reply-To: <CAJF2gTTop12wvxoZ7_M1r+mbrpihbfeNp1j=v1p=6Xtmx1PbYg@mail.gmail.com>
References: <20231018024205.270-1-cp0613@linux.alibaba.com> <CAJF2gTTop12wvxoZ7_M1r+mbrpihbfeNp1j=v1p=6Xtmx1PbYg@mail.gmail.com>
Message-ID: <CAK9=C2XEY3VjQOjdjs6Y55JtNGE=-WAHA5Y6=+BQTraEqiSfig@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 23, 2023 at 12:05?PM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Oct 18, 2023 at 10:42?AM <cp0613@linux.alibaba.com> wrote:
> >
> > From: Chen Pei <cp0613@linux.alibaba.com>
> >
> > For some debuggers that do not implement SYSWRITEC and SYSREADC
> > operations, we can use SYSWRITE and SYSREAD instead like the
> > implementation of semihosting_getc().
> >
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> > Reviewed-by: Xiang W <wxjstz@126.com>
> >
> > Changed from v1:
> > 1. simplified by calling semihosting_puts directly.
> >
> > ---
> >  lib/utils/serial/semihosting.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> > index ce65887..a27c69e 100644
> > --- a/lib/utils/serial/semihosting.c
> > +++ b/lib/utils/serial/semihosting.c
> > @@ -160,11 +160,6 @@ static long semihosting_write(long fd, const void *memp, size_t len)
> >
> >  /* clang-format on */
> >
> > -static void semihosting_putc(char ch)
> > -{
> > -       semihosting_trap(SYSWRITEC, &ch);
> > -}
> > -
> >  static unsigned long semihosting_puts(const char *str, unsigned long len)
> >  {
> >         char ch;
> > @@ -183,6 +178,11 @@ static unsigned long semihosting_puts(const char *str, unsigned long len)
> >         return (ret < 0) ? 0 : ret;
> >  }
> >
> > +static void semihosting_putc(char ch)
> > +{
> > +       semihosting_puts(&ch, 1);
> > +}
> > +
> When console_puts() was introduced by commit c43903c4eae41 ("lib: sbi:
> Add console_puts() callback in the console device"), sbi_putc() became
> unnecessary and confusing. See below code:
>
> void sbi_putc(char ch)
> {
>         if (console_dev && console_dev->console_putc) {
>                 if (ch == '\n')
>                         console_dev->console_putc('\r');
>                 console_dev->console_putc(ch);
>         }
> }
>
> static unsigned long nputs(const char *str, unsigned long len)
> {
>         unsigned long i, ret;
>
>         if (console_dev && console_dev->console_puts) {
>                 ret = console_dev->console_puts(str, len);
>         } else {
>                 for (i = 0; i < len; i++)
>                         sbi_putc(str[i]);
>                 ret = len;
>         }
>
>         return ret;
> }
>
> Actually, sbi_putc() is duplicated from inputs(), and it's time to
> remove sbi_putc to make the opensbi code clearer. Here are the
> statistics of the work:
>
> lib/utils/serial/uart8250.c-static struct sbi_console_device
> uart8250_console = {
> lib/utils/serial/uart8250.c-    .name = "uart8250",
> lib/utils/serial/uart8250.c:    .console_putc = uart8250_putc,
> lib/utils/serial/uart8250.c-    .console_getc = uart8250_getc
> lib/utils/serial/uart8250.c-};
> --
> lib/utils/serial/renesas_scif.c-static struct sbi_console_device
> renesas_scif_console = {
> lib/utils/serial/renesas_scif.c-        .name           = "renesas_scif",
> lib/utils/serial/renesas_scif.c:        .console_putc   = renesas_scif_putc,
> lib/utils/serial/renesas_scif.c-};
> --
> lib/utils/serial/semihosting.c-static struct sbi_console_device
> semihosting_console = {
> lib/utils/serial/semihosting.c- .name = "semihosting",
> lib/utils/serial/semihosting.c: .console_putc = semihosting_putc,
> lib/utils/serial/semihosting.c- .console_puts = semihosting_puts,
> lib/utils/serial/semihosting.c- .console_getc = semihosting_getc
> lib/utils/serial/semihosting.c-};
> --
> lib/utils/serial/shakti-uart.c-static struct sbi_console_device
> shakti_console = {
> lib/utils/serial/shakti-uart.c- .name = "shakti_uart",
> lib/utils/serial/shakti-uart.c: .console_putc = shakti_uart_putc,
> lib/utils/serial/shakti-uart.c- .console_getc = shakti_uart_getc
> lib/utils/serial/shakti-uart.c-};
> --
> lib/utils/serial/sifive-uart.c-static struct sbi_console_device
> sifive_console = {
> lib/utils/serial/sifive-uart.c- .name = "sifive_uart",
> lib/utils/serial/sifive-uart.c: .console_putc = sifive_uart_putc,
> lib/utils/serial/sifive-uart.c- .console_getc = sifive_uart_getc
> lib/utils/serial/sifive-uart.c-};
> --
> lib/utils/serial/litex-uart.c-static struct sbi_console_device litex_console = {
> lib/utils/serial/litex-uart.c-  .name = "litex_uart",
> lib/utils/serial/litex-uart.c:  .console_putc = litex_uart_putc,
> lib/utils/serial/litex-uart.c-  .console_getc = litex_uart_getc
> lib/utils/serial/litex-uart.c-};
> --
> lib/utils/serial/gaisler-uart.c-static struct sbi_console_device
> gaisler_console = {
> lib/utils/serial/gaisler-uart.c-        .name         = "gaisler_uart",
> lib/utils/serial/gaisler-uart.c:        .console_putc = gaisler_uart_putc,
> lib/utils/serial/gaisler-uart.c-        .console_getc = gaisler_uart_getc
> lib/utils/serial/gaisler-uart.c-};
> --
> lib/utils/serial/xlnx-uartlite.c-static struct sbi_console_device
> xlnx_uartlite_console = {
> lib/utils/serial/xlnx-uartlite.c-       .name = "xlnx-uartlite",
> lib/utils/serial/xlnx-uartlite.c:       .console_putc = xlnx_uartlite_putc,
> lib/utils/serial/xlnx-uartlite.c-       .console_getc = xlnx_uartlite_getc
> lib/utils/serial/xlnx-uartlite.c-};
> --
> lib/utils/serial/cadence-uart.c-static struct sbi_console_device
> cadence_console = {
> lib/utils/serial/cadence-uart.c-        .name = "cadence_uart",
> lib/utils/serial/cadence-uart.c:        .console_putc = cadence_uart_putc,
> lib/utils/serial/cadence-uart.c-        .console_getc = cadence_uart_getc
> lib/utils/serial/cadence-uart.c-};
> --
> lib/utils/sys/htif.c-static struct sbi_console_device htif_console = {
> lib/utils/sys/htif.c-   .name = "htif",
> lib/utils/sys/htif.c:   .console_putc = htif_putc,
> lib/utils/sys/htif.c-   .console_getc = htif_getc
> lib/utils/sys/htif.c-};
>
> Is it worth removing .console_putc by implementing .console_puts.?

NACK, having console_puts in all serial drivers would mean
duplicating generic code into all drivers.

Regards,
Anup

>
> >  static int semihosting_getc(void)
> >  {
> >         char ch = 0;
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
>
>
> --
> Best Regards
>  Guo Ren
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

