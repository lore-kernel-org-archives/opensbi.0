From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 16 May 2022 17:01:15 +0530
Subject: An Uart bug for sifive model
In-Reply-To: <CAFNws9muz=6cSu+Y=cUo3RFd-RcgTytyX4T2ej_-T=x36hH_qg@mail.gmail.com>
References: <CAFNws9muz=6cSu+Y=cUo3RFd-RcgTytyX4T2ej_-T=x36hH_qg@mail.gmail.com>
Message-ID: <CAK9=C2UkCci9bM=6AzOFcvOz=a3ymvJpyTLu-rb_VXJpyA_+Mg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022 at 3:55 PM ??? <chen20010131@gmail.com> wrote:
>
> Hi,
> I recently use the opensbi as the bios on the sifive unmatched board.
> I use the ecall instruction (set register a0 to the character and
> register a7 to 2) to output a character, but failed. I read the source
> code and find the get character function sifive_uart_getc, it only
> receive one character from FIFO queue.
>
> static int sifive_uart_getc(void)
> {
>     u32 ret = get_reg(UART_REG_RXFIFO);
>     if (!(ret & UART_RXFIFO_EMPTY))
>         return ret & UART_RXFIFO_DATA;
>     return -1;
> }
>
> Actually the get character process should be the same with the putchar
> process.When the kernel wait for one character, it should keep waiting
> until we type on the keyboard.The process should change like this:
>
> static int sifive_uart_getc(void)
> {
>     u32 ret = get_reg(UART_REG_RXFIFO);
>     while (ret & UART_RXFIFO_EMPTY) {
>         ret = get_reg(UART_REG_RXFIFO);
>     }
>     return ret & UART_RXFIFO_DATA;
> }
>
> If I have the wrong understanding of the uart, please let me know as
> soon as possible.

There is no issue here.

The sifive_uart_putc() and sifive_uart_getc() implementations are
aligned with the SBI spec which says that sbi_console_putchar()
should be blocking and sbi_console_getchar() can fail if there is
no input character.

The getc() polling happens in Linux SBI HVC console driver which
will keep trying sbi_console_getchar() until a valid character is
available.

Regards,
Anup

>
> Yours sincerely,
> ZergingChen3
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

