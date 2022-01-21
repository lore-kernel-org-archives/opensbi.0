From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 21 Jan 2022 15:21:33 +0000
Subject: [PATCH] lib: utils/serial: Round UART8250 baud rate divisor to
 nearest integer
In-Reply-To: <20220121150614.18877-1-jakub.luzny@codasip.com>
References: <20220121150614.18877-1-jakub.luzny@codasip.com>
Message-ID: <A3104355-DDBD-40BA-8605-8B50DF92F5B9@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21 Jan 2022, at 15:06, Jakub Luzny <jakub.luzny@codasip.com> wrote:
> 
> Previously, it was rounded down and that gives suboptimal results when
> non-standard clock sources or baud rates are used.
> 
> Signed-off-by: Jakub Luzny <jakub.luzny@codasip.com>
> ---
> lib/utils/serial/uart8250.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
> index 1cf6624..ccc7aa0 100644
> --- a/lib/utils/serial/uart8250.c
> +++ b/lib/utils/serial/uart8250.c
> @@ -101,7 +101,7 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
> 	uart8250_in_freq   = in_freq;
> 	uart8250_baudrate  = baudrate;
> 
> -	bdiv = uart8250_in_freq / (16 * uart8250_baudrate);
> +	bdiv = (uart8250_in_freq + 8 * uart8250_baudrate) / (16 * uart8250_baudrate);

This could do weird things if the numbers are sufficiently large to
overflow (unlikely but maybe possible). You can instead use the simpler:

  (uart8250_in_freq / (8 * uart8250_baudrate) + 1) / 2

which is approximately what FreeBSD does (it shifts rather than
multiplies and divides).

Jess


