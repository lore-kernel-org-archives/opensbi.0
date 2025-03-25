From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 25 Mar 2025 11:35:54 +0000
Subject: [PATCH] lib: utils/serial: Add PXA UARTs support
In-Reply-To: <CAAhSdy2Zo40=f4=U8LzfxSZEASnKJGKZ4OkW1dH4Q3au_FAX2w@mail.gmail.com>
Message-ID: <183008a3b42e42a0.c6073fff1fbc590.91f5676b44adc350@Jude-Air.local>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 25/03/2025 12:08, Anup Patel wrote:
> On Sun, Feb 23, 2025 at 8:59?PM Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>>
>> The PXA variant of the uart8250 adds the UART Unit Enable bit (UUE) that
>> needs to be set to enable the XScale PXA UART. And it is required for
>> some RISC-V SoCs like the Spacemit K1 that implement the PXA UART.
>>
>> This introduces the "intel,xscale-uart" compatible to handle setting the
>> UUE bit.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  include/sbi_utils/serial/uart8250.h    |  4 +++-
>>  lib/utils/serial/fdt_serial_uart8250.c |  7 +++++--
>>  lib/utils/serial/uart8250.c            | 11 +++++++++--
>>  3 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/sbi_utils/serial/uart8250.h b/include/sbi_utils/serial/uart8250.h
>> index d4a8c136a4552c8045a3c83820a35ae2ae86e810..39f4b316ff631159cc81284460fcaf92490be310 100644
>> --- a/include/sbi_utils/serial/uart8250.h
>> +++ b/include/sbi_utils/serial/uart8250.h
>> @@ -12,7 +12,9 @@
>>
>>  #include <sbi/sbi_types.h>
>>
>> +#define UART_CAP_UUE   BIT(0)  /* Check UUE capability for XScale PXA UARTs */
>> +
>>  int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
>> -                 u32 reg_width, u32 reg_offset);
>> +                 u32 reg_width, u32 reg_offset, u32 capabilities);
> 
> This patch does not update all uses of uart8250_init(). Please update.

Thanks for your reminding, I will update it.

> 
>>
>>  #endif
>> diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
>> index af5ceac924873216a85374b6c937af1b067841d0..02ca92e1ae4659f712559efed4f4399c80f9871e 100644
>> --- a/lib/utils/serial/fdt_serial_uart8250.c
>> +++ b/lib/utils/serial/fdt_serial_uart8250.c
>> @@ -14,8 +14,9 @@
>>  static int serial_uart8250_init(const void *fdt, int nodeoff,
>>                                 const struct fdt_match *match)
>>  {
>> -       int rc;
>>         struct platform_uart_data uart = { 0 };
>> +       ulong capabilities = (ulong)match->data;
>> +       int rc;
>>
>>         rc = fdt_parse_uart_node(fdt, nodeoff, &uart);
>>         if (rc)
>> @@ -23,13 +24,15 @@ static int serial_uart8250_init(const void *fdt, int nodeoff,
>>
>>         return uart8250_init(uart.addr, uart.freq, uart.baud,
>>                              uart.reg_shift, uart.reg_io_width,
>> -                            uart.reg_offset);
>> +                            uart.reg_offset, capabilities);
>>  }
>>
>>  static const struct fdt_match serial_uart8250_match[] = {
>>         { .compatible = "ns16550" },
>>         { .compatible = "ns16550a" },
>>         { .compatible = "snps,dw-apb-uart" },
>> +       { .compatible = "intel,xscale-uart",
>> +         .data = (void *)UART_CAP_UUE },
>>         { },
>>  };
>>
>> diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
>> index 1fe053f860e56e7a447259dadb649734ff5016b0..4932fe9f1cc6f5ae196cefa08393eb2f21c8244c 100644
>> --- a/lib/utils/serial/uart8250.c
>> +++ b/lib/utils/serial/uart8250.c
>> @@ -39,6 +39,12 @@
>>  #define UART_LSR_DR            0x01    /* Receiver data ready */
>>  #define UART_LSR_BRK_ERROR_BITS        0x1E    /* BI, FE, PE, OE bits */
>>
>> +/* The XScale PXA UARTs define these bits */
>> +#define UART_IER_DMAE          0x80    /* DMA Requests Enable */
>> +#define UART_IER_UUE           0x40    /* UART Unit Enable */
>> +#define UART_IER_NRZE          0x20    /* NRZ coding Enable */
>> +#define UART_IER_RTOIE         0x10    /* Receiver Time Out Interrupt Enable */
>> +
>>  /* clang-format on */
>>
>>  static volatile char *uart8250_base;
>> @@ -93,7 +99,7 @@ static struct sbi_console_device uart8250_console = {
>>  };
>>
>>  int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
>> -                 u32 reg_width, u32 reg_offset)
>> +                 u32 reg_width, u32 reg_offset, u32 capabilities)
>>  {
>>         u16 bdiv = 0;
>>
>> @@ -109,7 +115,8 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
>>         }
>>
>>         /* Disable all interrupts */
>> -       set_reg(UART_IER_OFFSET, 0x00);
>> +       set_reg(UART_IER_OFFSET, (capabilities & UART_CAP_UUE) ?
>> +                                UART_IER_UUE : 0x00);
>>         /* Enable DLAB */
>>         set_reg(UART_LCR_OFFSET, 0x80);
>>
>>
>> ---
>> base-commit: 1ad199124479b9944d5dddc2119e6da9f088f7a7
>> change-id: 20250223-pxa-uart-support-b9482a6b7297
>>
>> Best regards,
>> --
>> Junhui Liu <junhui.liu@pigmoral.tech>
>>
>>
>> --
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi
> 
> Regards,
> Anup

-- 
Best regards,
Junhui Liu

