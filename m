From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 1 Jul 2022 06:42:00 +0100
Subject: [PATCH] Changes specific to Shakti uart
In-Reply-To: <20220701050404.12688-1-ptprasanna@gmail.com>
References: <20220701050404.12688-1-ptprasanna@gmail.com>
Message-ID: <5AA321C6-BB01-4E2E-824C-9B640095E6AC@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1 Jul 2022, at 06:04, Prasanna T <ptprasanna@gmail.com> wrote:
> 

No commit message and a vague subject.

> ---
> include/sbi_utils/serial/shakti-uart.h | 4 ++++
> lib/utils/fdt/fdt_helper.c             | 2 +-
> lib/utils/serial/shakti-uart.c         | 7 ++++---
> 3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sbi_utils/serial/shakti-uart.h b/include/sbi_utils/serial/shakti-uart.h
> index bcb019e..08043be 100644
> --- a/include/sbi_utils/serial/shakti-uart.h
> +++ b/include/sbi_utils/serial/shakti-uart.h
> @@ -9,6 +9,10 @@
> 
> #include <sbi/sbi_types.h>
> 
> +void shakti_uart_putc(char ch);
> +
> +int shakti_uart_getc(void);
> +

These are wrong to add.

> int shakti_uart_init(unsigned long base, u32 in_freq, u32 baudrate);
> 
> #endif
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 2bdb1ef..40597e7 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -31,7 +31,7 @@
> #define DEFAULT_GAISLER_UART_REG_IO_WIDTH	4
> 
> #define DEFAULT_SHAKTI_UART_FREQ		50000000
> -#define DEFAULT_SHAKTI_UART_BAUD		115200
> +#define DEFAULT_SHAKTI_UART_BAUD		19200

Why change this?

> const struct fdt_match *fdt_match_node(void *fdt, int nodeoff,
> 				       const struct fdt_match *match_table)
> diff --git a/lib/utils/serial/shakti-uart.c b/lib/utils/serial/shakti-uart.c
> index 5f2fe75..d3fd5f1 100644
> --- a/lib/utils/serial/shakti-uart.c
> +++ b/lib/utils/serial/shakti-uart.c
> @@ -20,20 +20,21 @@
> 
> #define UART_TX_FULL  0x2
> #define UART_RX_FULL  0x8
> +#define UART_RX_NOT_EMPTY 0x4

Keep these sorted by their value.

> static volatile char *uart_base;
> 
> static void shakti_uart_putc(char ch)
> {
> -	while((readw(uart_base + REG_STATUS) & UART_TX_FULL))
> +	while((readb(uart_base + REG_STATUS) & UART_TX_FULL))

Why does this need changing? Was it always broken or did something
change?

> 		;
> 	writeb(ch, uart_base + REG_TX);
> }
> 
> static int shakti_uart_getc(void)
> {
> -	u16 status = readw(uart_base + REG_STATUS);
> -	if (status & UART_RX_FULL)
> +	u16 status = readb(uart_base + REG_STATUS);

As with putc.

> +	if (status & UART_RX_NOT_EMPTY) // MASKING 3rd bit for UARTv2. If UARTv1 use MASK UART_RX_FULL.

So this seems to explain the changes, UARTv2 needs a different driver,
so don?t break UARTv1, extend this driver to support both
simultaneously?

Jess

> 		return readb(uart_base + REG_RX);
> 	return -1;
> }
> -- 
> 2.17.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


