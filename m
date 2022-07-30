From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Jul 2022 15:50:29 +0530
Subject: [PATCH 3/4] lib: serial: Clean up coding style in sifive-uart.c
In-Reply-To: <CAAhSdy1HfEsFeXxZJK=3JJx1BygeQ4dnYejFJfQ4+kZiauqi=g@mail.gmail.com>
References: <20220718172028.2006166-1-ajones@ventanamicro.com>
 <20220718172028.2006166-4-ajones@ventanamicro.com> <CAAhSdy1HfEsFeXxZJK=3JJx1BygeQ4dnYejFJfQ4+kZiauqi=g@mail.gmail.com>
Message-ID: <CAAhSdy16T8i-GzUYY-uBmvSQiJw7khPBWsfrL5C4i+zMMzo7=g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 30, 2022 at 10:57 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jul 18, 2022 at 10:50 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> >  lib/utils/serial/sifive-uart.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/utils/serial/sifive-uart.c b/lib/utils/serial/sifive-uart.c
> > index 9478a77f8054..7078611a5274 100644
> > --- a/lib/utils/serial/sifive-uart.c
> > +++ b/lib/utils/serial/sifive-uart.c
> > @@ -48,12 +48,12 @@ static inline unsigned int uart_min_clk_divisor(uint64_t in_freq,
> >                                                 uint64_t max_target_hz)
> >  {
> >         uint64_t quotient = (in_freq + max_target_hz - 1) / (max_target_hz);
> > +
> >         /* Avoid underflow */
> > -       if (quotient == 0) {
> > +       if (quotient == 0)
> >                 return 0;
> > -       } else {
> > +       else
> >                 return quotient - 1;
> > -       }
> >  }
> >
> >  static u32 get_reg(u32 num)
> > @@ -77,8 +77,10 @@ static void sifive_uart_putc(char ch)
> >  static int sifive_uart_getc(void)
> >  {
> >         u32 ret = get_reg(UART_REG_RXFIFO);
> > +
> >         if (!(ret & UART_RXFIFO_EMPTY))
> >                 return ret & UART_RXFIFO_DATA;
> > +
> >         return -1;
> >  }
> >
> > @@ -97,10 +99,13 @@ int sifive_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
> >         /* Configure baudrate */
> >         if (in_freq)
> >                 set_reg(UART_REG_DIV, uart_min_clk_divisor(in_freq, baudrate));
> > +
> >         /* Disable interrupts */
> >         set_reg(UART_REG_IE, 0);
> > +
> >         /* Enable TX */
> >         set_reg(UART_REG_TXCTRL, UART_TXCTRL_TXEN);
> > +
> >         /* Enable Rx */
> >         set_reg(UART_REG_RXCTRL, UART_RXCTRL_RXEN);
> >
> > --
> > 2.36.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

