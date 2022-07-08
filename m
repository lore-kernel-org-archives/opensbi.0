From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Jul 2022 23:19:33 +0530
Subject: [PATCH v3] lib: utils/serial: Update Shakti UART based on latest implementation
In-Reply-To: <17C8D809-438B-4C78-B507-7AE6029CCD2A@jrtc27.com>
References: <20220708115244.556074-1-apatel@ventanamicro.com> <17C8D809-438B-4C78-B507-7AE6029CCD2A@jrtc27.com>
Message-ID: <CAAhSdy17F5=jYBsZyYhcvcRt3Sp3zSO6r54yOPSBq8EtYZbUTw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 8, 2022 at 11:11 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 8 Jul 2022, at 12:52, Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > From: Prasanna T <ptprasanna@gmail.com>
> >
> > The age old version of Shakti UART was upgraded long back, but we missed
> > updating the driver in OpenSBI. The old version of UART is not supported
> > anymore, hence removed the inline comment which is also outdated now.
>
> This part of the description is referencing a comment that was
> *introduced* by an earlier version of this patch; there is no comment
> in the source being removed and so this part of the commit message is
> inaccurate.
>
> I?m also rather concerned about reusing an existing compatible string
> for an incompatible device, it seems like even if you?re dropping
> support for an old UART the new one should have its own compatible with
> the version suffix bumped. They have versions in them for a reason.

My understanding is that they (Shakti folks) never used the old version
of UART on any actual silicon. It seems they are already using the newer
UART everywhere and they just forgot to change the code here.

@Prasanna Thandabani Is the above understanding correct ?

Regards,
Anup

>
> Jess
>
> > Signed-off-by: Prasanna T <ptprasanna@gmail.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> > Changes since v2:
> > - Updated patch subject and description
> > - Minor fix in shakti_uart_getc()
> > ---
> > lib/utils/serial/shakti-uart.c | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/utils/serial/shakti-uart.c b/lib/utils/serial/shakti-uart.c
> > index 5f2fe75..3556935 100644
> > --- a/lib/utils/serial/shakti-uart.c
> > +++ b/lib/utils/serial/shakti-uart.c
> > @@ -19,21 +19,21 @@
> > #define REG_RX_THRES  0x20
> >
> > #define UART_TX_FULL  0x2
> > +#define UART_RX_NOT_EMPTY 0x4
> > #define UART_RX_FULL  0x8
> >
> > static volatile char *uart_base;
> >
> > static void shakti_uart_putc(char ch)
> > {
> > -     while((readw(uart_base + REG_STATUS) & UART_TX_FULL))
> > +     while ((readb(uart_base + REG_STATUS) & UART_TX_FULL))
> >               ;
> >       writeb(ch, uart_base + REG_TX);
> > }
> >
> > static int shakti_uart_getc(void)
> > {
> > -     u16 status = readw(uart_base + REG_STATUS);
> > -     if (status & UART_RX_FULL)
> > +     if (readb(uart_base + REG_STATUS) & UART_RX_NOT_EMPTY)
> >               return readb(uart_base + REG_RX);
> >       return -1;
> > }
> > --
> > 2.34.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>

