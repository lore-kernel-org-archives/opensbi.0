From: Xiang W <wxjstz@126.com>
Date: Wed, 20 Jul 2022 23:12:18 +0800
Subject: [PATCH 4/4] lib: utils/serial: Ensure baudrate is non-zero
 before using
In-Reply-To: <20220718172028.2006166-5-ajones@ventanamicro.com>
References: <20220718172028.2006166-1-ajones@ventanamicro.com>
	 <20220718172028.2006166-5-ajones@ventanamicro.com>
Message-ID: <a2f95ffcea25b6da6270c509e0dc7e5c64be7e92.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-07-18???? 19:20 +0200?Andrew Jones???
> RISC-V doesn't generate exceptions on divide-by-zero, but the result,
> all bits set, is not likely what people expect either. In all cases
> where we divide by baudrate there's a chance it's zero (when the DT
> it came from is "bad"). To avoid difficult to debug situations, leave
> baudrate dependent registers alone when baudrate is zero, as, also in
> all cases, it appears we can skip initialization of those registers
> and still [hopefully] have a functioning UART.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
If the parameter is wrong we should skip initialization and should not
execute sbi_console_set_device.

Regards,
Xiang W
> ---
> ?lib/utils/serial/gaisler-uart.c | 2 +-
> ?lib/utils/serial/shakti-uart.c? | 8 ++++++--
> ?lib/utils/serial/sifive-uart.c? | 2 +-
> ?lib/utils/serial/uart8250.c???? | 7 +++++--
> ?4 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/utils/serial/gaisler-uart.c b/lib/utils/serial/gaisler-uart.c
> index 5f30ee43b719..eec75cca0c98 100644
> --- a/lib/utils/serial/gaisler-uart.c
> +++ b/lib/utils/serial/gaisler-uart.c
> @@ -70,7 +70,7 @@ int gaisler_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
> ????????uart_base = (volatile char *)base;
> ?
> ????????/* Configure baudrate */
> -???????if (in_freq)
> +???????if (in_freq && baudrate)
> ????????????????set_reg(UART_REG_SCALER, in_freq / (baudrate * 8 + 7));
> ?
> ????????ctrl = get_reg(UART_REG_CTRL);
> diff --git a/lib/utils/serial/shakti-uart.c b/lib/utils/serial/shakti-uart.c
> index 5f2fe75c9f33..2f09f141b9cf 100644
> --- a/lib/utils/serial/shakti-uart.c
> +++ b/lib/utils/serial/shakti-uart.c
> @@ -47,8 +47,12 @@ static struct sbi_console_device shakti_console = {
> ?int shakti_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
> ?{
> ????????uart_base = (volatile char *)base;
> -???????u16 baud = (u16)(in_freq/(16 * baudrate));
> -???????writew(baud, uart_base + REG_BAUD);
> +???????u16 baud;
> +
> +???????if (baudrate) {
> +???????????????baud = (u16)(in_freq / (16 * baudrate));
> +???????????????writew(baud, uart_base + REG_BAUD);
> +???????}
> ?
> ????????sbi_console_set_device(&shakti_console);
> ?
> diff --git a/lib/utils/serial/sifive-uart.c b/lib/utils/serial/sifive-uart.c
> index 7078611a5274..3581d47a6d4b 100644
> --- a/lib/utils/serial/sifive-uart.c
> +++ b/lib/utils/serial/sifive-uart.c
> @@ -97,7 +97,7 @@ int sifive_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
> ????????uart_baudrate = baudrate;
> ?
> ????????/* Configure baudrate */
> -???????if (in_freq)
> +???????if (in_freq && baudrate)
> ????????????????set_reg(UART_REG_DIV, uart_min_clk_divisor(in_freq, baudrate));
> ?
> ????????/* Disable interrupts */
> diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
> index 38ea11af4d31..99bf1bf733f2 100644
> --- a/lib/utils/serial/uart8250.c
> +++ b/lib/utils/serial/uart8250.c
> @@ -93,7 +93,7 @@ static struct sbi_console_device uart8250_console = {
> ?int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
> ????????????????? u32 reg_width, u32 reg_offset)
> ?{
> -???????u16 bdiv;
> +???????u16 bdiv = 0;
> ?
> ????????uart8250_base????? = (volatile char *)base + reg_offset;
> ????????uart8250_reg_shift = reg_shift;
> @@ -101,7 +101,10 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
> ????????uart8250_in_freq?? = in_freq;
> ????????uart8250_baudrate? = baudrate;
> ?
> -???????bdiv = (uart8250_in_freq + 8 * uart8250_baudrate) / (16 * uart8250_baudrate);
> +???????if (uart8250_baudrate) {
> +???????????????bdiv = (uart8250_in_freq + 8 * uart8250_baudrate) /
> +????????????????????? (16 * uart8250_baudrate);
> +???????}
> ?
> ????????/* Disable all interrupts */
> ????????set_reg(UART_IER_OFFSET, 0x00);
> -- 
> 2.36.1
> 
> 



