From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Thu, 1 Dec 2022 10:48:48 +0000
Subject: [PATCH v3 5/6] docs: platform: Add documentation for Renesas
 RZ/Five SoC
In-Reply-To: <OS0PR01MB5922D1C0E260B213BE28F6EB86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221130220825.193693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221130220825.193693-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB592290E34578FBD6E6222B3686149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592250B3E8AA94226E1DE36B86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CA+V-a8tBtMfRJVs9m9Zhjv3ew9nFwPBLNq+=xvG=L0Cp3PywEw@mail.gmail.com> <OS0PR01MB5922D1C0E260B213BE28F6EB86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <CA+V-a8t9DrqkakvDts0YuM35GFUrBByaXeLnLE=yDcG1DTCwxQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 1, 2022 at 9:38 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 01 December 2022 09:12
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Anup Patel <anup@brainfault.org>; Atish Patra
> > <atishp@atishpatra.org>; opensbi at lists.infradead.org; Yu Chien Peter Lin
> > <peterlin@andestech.com>; Bin Meng <bmeng.cn@gmail.com>; Andrew Jones
> > <ajones@ventanamicro.com>; Chris Paterson <Chris.Paterson2@renesas.com>;
> > Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH v3 5/6] docs: platform: Add documentation for
> > Renesas RZ/Five SoC
> >
> > Hi Biju,
> >
> > On Thu, Dec 1, 2022 at 8:41 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > > Subject: RE: [PATCH v3 5/6] docs: platform: Add documentation for
> > > > Renesas RZ/Five SoC
> > > >
> > > > Hi Prabhakar,
> > > >
> > > > Prabhakar Mahadev Lad
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Subject: [PATCH v3 5/6] docs: platform: Add documentation for
> > > > > Renesas RZ/Five SoC
> > > > >
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > This patch adds documentation to build Renesas RZ/Five
> > > > > (R9A07G043F)
> > > > SoC.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > > v2->v3
> > > > > * Updated doc with new build command
> > > > >
> > > > > RFC->v2
> > > > > * Updated doc
> > > > > ---
> > > > >  docs/platform/platform.md       |   5 ++
> > > > >  docs/platform/renesas-rzfive.md | 145
> > > > > ++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 150 insertions(+)  create mode 100644
> > > > > docs/platform/renesas-rzfive.md
> > > > >
> > > > > diff --git a/docs/platform/platform.md b/docs/platform/platform.md
> > > > > index
> > > > > f291931..4504d87 100644
> > > > > --- a/docs/platform/platform.md
> > > > > +++ b/docs/platform/platform.md
> > > > > @@ -39,6 +39,10 @@ OpenSBI currently supports the following
> > > > > virtual and hardware platforms:
> > > > >    processor based SOCs. More details on this platform can be
> > > > > found in the
> > > > >    file *[shakti_cclass.md]*.
> > > > >
> > > > > +* **Renesas RZ/Five SoC**: Platform support for Renesas RZ/Five
> > > > > +(R9A07G043F) SoC
> > > > > +  used on the Renesas RZ/Five SMARC EVK board. More details on
> > > > > +this platform can
> > > > > +  be found in the file *[renesas-rzfive.md]*.
> > > > > +
> > > > >  The code for these supported platforms can be used as example to
> > > > > implement  support for other platforms. The *platform/template*
> > > > > directory also provides  template files for implementing support
> > > > > for a new platform. The *objects.mk*, @@ -54,3 +58,4 @@ comments
> > > > > to facilitate the implementation.
> > > > >  [spike.md]: spike.md
> > > > >  [fpga-openpiton.md]: fpga-openpiton.md
> > > > >  [shakti_cclass.md]: shakti_cclass.md
> > > > > +[renesas-rzfive.md]: renesas-rzfive.md
> > > > > diff --git a/docs/platform/renesas-rzfive.md
> > > > > b/docs/platform/renesas- rzfive.md new file mode 100644 index
> > > > > 0000000..a900cc7
> > > > > --- /dev/null
> > > > > +++ b/docs/platform/renesas-rzfive.md
> > > > > @@ -0,0 +1,145 @@
> > > > > +Renesas RZ/Five SoC (R9A07G043F) Platform
> > > > > +=========================================
> > > > > +The RZ/Five microprocessor includes a single RISC-V CPU Core
> > > > > +(Andes
> > > > > +AX45MP)
> > > > > +1.0 GHz, 16-bit DDR3L/DDR4 interface. Supported interfaces
> > include:
> > > > > +- Gigabit Ethernet 2ch
> > > > > +- CAN interface (CAN-FD) 2ch
> > > > > +- USB 2.0 interface 2ch
> > > > > +- SD interface 2ch
> > > > > +- AD converter 2ch
> > >
> > > Only few interfaces. Maybe better add remaining one to avoid updating
> > > this document every time.
> > >
> > The above list is from the Renesas website [0] (Features tab)
> >
> > Can you please list out which all you want me to add?
> >
>
> Maybe you add all
>
> ? Memory controller for DDR4-1600 / DDR3L-1333 with 16 bits,
> ? USB2.0 host / function interface,
> ? Gigabit Ethernet interface,
> ? SD card host interface,
> ? CAN interface,
> ? Sound interface
> - SPI Multi I/O Bus Controller
> - Multi-function Timer Pulse Unit 3(MTU3a)
> - Port Output Enable 3(POE3)
> - Watchdog Timer(WDT)
> - General Timer(GTM)
> - I2C Bus Interface (I2C)
> - Serial Communication Interface with FIFO (SCIFA)
> - Serial Communication Interface(SCI)
> - Renesas Serial Peripheral Interface (RSPI)
>
OK I will add the above.

Cheers,
Prabhakar

