From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Feb 2022 11:18:25 +0530
Subject: [PATCH] lib: utils/serial: Round UART8250 baud rate divisor to
 nearest integer
In-Reply-To: <20220121150614.18877-1-jakub.luzny@codasip.com>
References: <20220121150614.18877-1-jakub.luzny@codasip.com>
Message-ID: <CAAhSdy1e8qgQz85fadjJ1rG5Gh3ZMs6cwp6tYCyeQ5_M1i1e1g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 21, 2022 at 8:36 PM Jakub Luzny <jakub.luzny@codasip.com> wrote:
>
> Previously, it was rounded down and that gives suboptimal results when
> non-standard clock sources or baud rates are used.
>
> Signed-off-by: Jakub Luzny <jakub.luzny@codasip.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/serial/uart8250.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
> index 1cf6624..ccc7aa0 100644
> --- a/lib/utils/serial/uart8250.c
> +++ b/lib/utils/serial/uart8250.c
> @@ -101,7 +101,7 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
>         uart8250_in_freq   = in_freq;
>         uart8250_baudrate  = baudrate;
>
> -       bdiv = uart8250_in_freq / (16 * uart8250_baudrate);
> +       bdiv = (uart8250_in_freq + 8 * uart8250_baudrate) / (16 * uart8250_baudrate);
>
>         /* Disable all interrupts */
>         set_reg(UART_IER_OFFSET, 0x00);
> --
> 2.20.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

