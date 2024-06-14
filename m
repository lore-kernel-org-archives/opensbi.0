From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Jun 2024 08:35:59 +0530
Subject: [PATCH] lib: serial: fix RX path in litex-uart
In-Reply-To: <20240607182342.117143-1-gsomlo@gmail.com>
References: <20240607182342.117143-1-gsomlo@gmail.com>
Message-ID: <CAAhSdy2cA=voj41y02x=48PA94grQt5DFoGoK2cug1hc_LBSaA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 7, 2024 at 11:54?PM Gabriel Somlo <gsomlo@gmail.com> wrote:
>
> When used to read characters from the terminal (e.g., when the SBI
> console is used via ecall from linux with `console=hvc0`), we must
> acknowledge receipt of each character to "pop" it off the LiteUART
> hardware queue, and allow the next character to be made available.
>
> Fixes: 52af6e4b ("lib: utils: Add LiteX UART support")
> Suggested-by: Dolu1990 <charles.papon.90@gmail.com>
> Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/serial/litex-uart.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/lib/utils/serial/litex-uart.c b/lib/utils/serial/litex-uart.c
> index f843bf3..caf8699 100644
> --- a/lib/utils/serial/litex-uart.c
> +++ b/lib/utils/serial/litex-uart.c
> @@ -20,6 +20,8 @@
>  #define UART_REG_EV_PENDING    4
>  #define UART_REG_EV_ENABLE     5
>
> +#define UART_EV_RX             0x2
> +
>  /* clang-format on */
>
>  static volatile u32 *uart_base;
> @@ -42,10 +44,14 @@ static void litex_uart_putc(char ch)
>
>  static int litex_uart_getc(void)
>  {
> +       int ret;
> +
>         if (get_reg(UART_REG_RXEMPTY))
>                 return -1;
> -       else
> -               return get_reg(UART_REG_RXTX);
> +
> +       ret = get_reg(UART_REG_RXTX);
> +       set_reg(UART_REG_EV_PENDING, UART_EV_RX); /* ack. char read */
> +       return ret;
>  }
>
>  static struct sbi_console_device litex_console = {
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

