From: Vijai Kumar K <vijai@behindbytes.com>
Date: Tue, 08 Dec 2020 09:38:29 +0530
Subject: [PATCH] lib: utils: Fix shakti uart implementation
In-Reply-To: <16EAD3C7-4751-4F66-BBBD-7E91D2ACF459@jrtc27.com>
References: <20201207165416.7279-1-vijai@behindbytes.com>
 <16EAD3C7-4751-4F66-BBBD-7E91D2ACF459@jrtc27.com>
Message-ID: <1764089509b.8974ff6f44639.1467000852420876777@behindbytes.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jessica,

Thank you for reviewing the code. Please see the inline responses.


---- On Mon, 07 Dec 2020 22:44:06 +0530 Jessica Clarke <jrtc27@jrtc27.com> wrote ----

 > > On 7 Dec 2020, at 16:54, Vijai Kumar K <vijai@behindbytes.com> wrote: 
 > > 
 > > Fix uart_putc implementation. 
 > > Due to a bug in the IP, this went unnoticed. 
 > > Use macros instead of magic numbers to make the code 
 > > more readable. 
 >  
 > Yeah, using macros is good, but this patch isn't doing anything other 
 > than adding macros; there's no change of behaviour? Either you've 
 > missed something or your commit message needs to be fixed. 

If you see we are dropping the "==0" comparison. That UART_TX_FULL
bit is set when TX is full. So that comparison is wrong and we are dropping
it.

 >  
 > Also see below for a style comment. 
 >  
 > Jess 
 >  
 > > Signed-off-by: Vijai Kumar K <vijai@behindbytes.com> 
 > > --- 
 > > lib/utils/serial/shakti-uart.c | 7 +++++-- 
 > > 1 file changed, 5 insertions(+), 2 deletions(-) 
 > > 
 > > diff --git a/lib/utils/serial/shakti-uart.c b/lib/utils/serial/shakti-uart.c 
 > > index 493edcf..b2deb70 100644 
 > > --- a/lib/utils/serial/shakti-uart.c 
 > > +++ b/lib/utils/serial/shakti-uart.c 
 > > @@ -18,18 +18,21 @@ 
 > > #define REG_IQ_CYCLES    0x1C 
 > > #define REG_RX_THRES    0x20 
 > > 
 > > +#define UART_TX_FULL  0x2 
 > > +#define UART_RX_FULL  0x8 
 > > + 
 > > static volatile void *uart_base; 
 > > 
 > > void shakti_uart_putc(char ch) 
 > > { 
 > > -    while((readw(uart_base + REG_STATUS) & 0x2) == 0); 
 > > +    while((readw(uart_base + REG_STATUS) & UART_TX_FULL)); 
 >  
 > You should have a space after the while. Also, the existing style is to 
 > put the semicolon on a new line so it's not accidentally overlooked. 

Got it. Will add the space. However, I don't see the style recommendation
for putting the semicolon in a new line. Have I overlooked it, or is it
just an undocumented practice or a personal taste?

Thanks
Vijai

 >  
 > >     writeb(ch, uart_base + REG_TX); 
 > > } 
 > > 
 > > int shakti_uart_getc(void) 
 > > { 
 > >     u16 status = readw(uart_base + REG_STATUS); 
 > > -    if (status & 0x8) 
 > > +    if (status & UART_RX_FULL) 
 > >         return readb(uart_base + REG_RX); 
 > >     return -1; 
 > > } 
 > > -- 
 > > 2.25.1 
 >  
 > -- 
 > opensbi mailing list 
 > opensbi at lists.infradead.org 
 > http://lists.infradead.org/mailman/listinfo/opensbi 
 > 




