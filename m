From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Jul 2022 17:22:05 +0530
Subject: Shakti-platform-UART-Update
In-Reply-To: <20220701144241.9082-1-ptprasanna@gmail.com>
References: <20220701144241.9082-1-ptprasanna@gmail.com>
Message-ID: <CAAhSdy1A6oHXWMJnQacA3WrJ1j3DRV2HNEjAp653iZFSAaJmhA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 1, 2022 at 8:13 PM Prasanna T <ptprasanna@gmail.com> wrote:
>
> Please find the attached revised patch, with respect to the latest changes made. Have dealt other amendments through dts. A primary change that was made as part of this patch is follows.The age old version of UART was upgraded long back, but that was missed out in the code which we did updated now (The old version of UART is not supported anymore, hence removed the inline comment which is also outdated now), The current version is the only UART supported right now by Shakti

The patch subject should be:
lib: utils/serial: Update Shakti UART based on latest implementation

The patch description should be simplified and each line should
be less than 75 characters.

Also, a "Signed-off-by" is mandatory for each patch which is
missing here.

Further with every patch revision, you should use "--subject-prefix"
parameter of "git format-patch". For example, to generate v3 patch
you can do: git format-patch -M -C --subject-prefix="PATCH v3" ...

I will send a PATCH v3 on your behalf but please take care next time.

Regards,
Anup

> ---
>
> diff --git a/lib/utils/serial/shakti-uart.c b/lib/utils/serial/shakti-uart.c
> index 5f2fe75..122218b 100644
> --- a/lib/utils/serial/shakti-uart.c
> +++ b/lib/utils/serial/shakti-uart.c
> @@ -19,21 +19,22 @@
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
> +       while((readb(uart_base + REG_STATUS) & UART_TX_FULL))
>                 ;
>         writeb(ch, uart_base + REG_TX);
>  }
>
>  static int shakti_uart_getc(void)
>  {
> -       u16 status = readw(uart_base + REG_STATUS);
> -       if (status & UART_RX_FULL)
> +       u16 status = readb(uart_base + REG_STATUS);
> +       if (status & UART_RX_NOT_EMPTY)
>                 return readb(uart_base + REG_RX);
>         return -1;
>  }
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

