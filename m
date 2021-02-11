From: Vijai Kumar K <vijai@behindbytes.com>
Date: Thu, 11 Feb 2021 07:08:36 +0530
Subject: [PATCH] lib: utils: Fix shakti uart implementation
In-Reply-To: <DM6PR04MB6201B845AC1D6633E7D9C8588DAF0@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20201207165416.7279-1-vijai@behindbytes.com>
 <DM6PR04MB6201B845AC1D6633E7D9C8588DAF0@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <1778ebd7394.1201e055317946.4205030000856071672@behindbytes.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit




---- On Thu, 07 Jan 2021 10:27:17 +0530 Anup Patel <Anup.Patel@wdc.com> wrote ----

 > 
 > 
 > > -----Original Message----- 
 > > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Vijai 
 > > Kumar K 
 > > Sent: 07 December 2020 22:24 
 > > To: opensbi at lists.infradead.org 
 > > Cc: Vijai Kumar K <vijai@behindbytes.com> 
 > > Subject: [PATCH] lib: utils: Fix shakti uart implementation 
 > > 
 > > Fix uart_putc implementation. 
 > > Due to a bug in the IP, this went unnoticed. 
 > > Use macros instead of magic numbers to make the code more readable. 
 > > 
 > > Signed-off-by: Vijai Kumar K <vijai@behindbytes.com> 
 > > --- 
 > >  lib/utils/serial/shakti-uart.c | 7 +++++-- 
 > >  1 file changed, 5 insertions(+), 2 deletions(-) 
 > > 
 > > diff --git a/lib/utils/serial/shakti-uart.c b/lib/utils/serial/shakti-uart.c index 
 > > 493edcf..b2deb70 100644 
 > > --- a/lib/utils/serial/shakti-uart.c 
 > > +++ b/lib/utils/serial/shakti-uart.c 
 > > @@ -18,18 +18,21 @@ 
 > >  #define REG_IQ_CYCLES    0x1C 
 > >  #define REG_RX_THRES    0x20 
 > > 
 > > +#define UART_TX_FULL  0x2 
 > > +#define UART_RX_FULL  0x8 
 > > + 
 > >  static volatile void *uart_base; 
 > > 
 > >  void shakti_uart_putc(char ch) 
 > >  { 
 > > -    while((readw(uart_base + REG_STATUS) & 0x2) == 0); 
 > > +    while((readw(uart_base + REG_STATUS) & UART_TX_FULL)); 
 > >      writeb(ch, uart_base + REG_TX); 
 > >  } 
 > > 
 > >  int shakti_uart_getc(void) 
 > >  { 
 > >      u16 status = readw(uart_base + REG_STATUS); 
 > > -    if (status & 0x8) 
 > > +    if (status & UART_RX_FULL) 
 > >          return readb(uart_base + REG_RX); 
 > >      return -1; 
 > >  } 
 > > -- 
 > > 2.25.1 
 > > 
 > > 
 > > 
 > > -- 
 > > opensbi mailing list 
 > > opensbi at lists.infradead.org 
 > > http://lists.infradead.org/mailman/listinfo/opensbi 
 >  
 > Reviewed-by: Anup Patel <anup.patel@wdc.com> 
 >  
 > I have taken care of style comment from Jessica at time of 
 > applying this patch. 
 >  
 > Applied this patch to riscv/opensbi repo. 
 >  
 > Thanks, 
 > Anup

Thanks a lot Anup. Sorry for replying late on this. I was on vacation at that time and somehow missed following up on this.

Best,
Vijai


 > 
 > -- 
 > opensbi mailing list 
 > opensbi at lists.infradead.org 
 > http://lists.infradead.org/mailman/listinfo/opensbi 
 > 




