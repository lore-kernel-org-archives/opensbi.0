From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Jul 2022 10:12:49 +0530
Subject: [PATCH v3] lib: utils/serial: Update Shakti UART based on latest implementation
In-Reply-To: <20220708115244.556074-1-apatel@ventanamicro.com>
References: <20220708115244.556074-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy1PGGVHcbEgNr3vhOntLyoGqXZH-_qz3WkfnEC_Muezzw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 8, 2022 at 5:23 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Prasanna T <ptprasanna@gmail.com>
>
> The age old version of Shakti UART was upgraded long back, but we missed
> updating the driver in OpenSBI. The old version of UART is not supported
> anymore, hence removed the inline comment which is also outdated now.
>
> Signed-off-by: Prasanna T <ptprasanna@gmail.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

@Prasanna, Please make sure that Shakti UART compatible string is
documented in the upstream Linux kernel. This time it's okay since there
is no HW with the old version of Shakti UART but subsequent changes to
Shakti UART should require a new compatible string.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Changes since v2:
>  - Updated patch subject and description
>  - Minor fix in shakti_uart_getc()
> ---
>  lib/utils/serial/shakti-uart.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/utils/serial/shakti-uart.c b/lib/utils/serial/shakti-uart.c
> index 5f2fe75..3556935 100644
> --- a/lib/utils/serial/shakti-uart.c
> +++ b/lib/utils/serial/shakti-uart.c
> @@ -19,21 +19,21 @@
>  #define REG_RX_THRES   0x20
>
>  #define UART_TX_FULL  0x2
> +#define UART_RX_NOT_EMPTY 0x4
>  #define UART_RX_FULL  0x8
>
>  static volatile char *uart_base;
>
>  static void shakti_uart_putc(char ch)
>  {
> -       while((readw(uart_base + REG_STATUS) & UART_TX_FULL))
> +       while ((readb(uart_base + REG_STATUS) & UART_TX_FULL))
>                 ;
>         writeb(ch, uart_base + REG_TX);
>  }
>
>  static int shakti_uart_getc(void)
>  {
> -       u16 status = readw(uart_base + REG_STATUS);
> -       if (status & UART_RX_FULL)
> +       if (readb(uart_base + REG_STATUS) & UART_RX_NOT_EMPTY)
>                 return readb(uart_base + REG_RX);
>         return -1;
>  }
> --
> 2.34.1
>

