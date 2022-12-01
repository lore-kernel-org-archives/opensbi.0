From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Thu, 1 Dec 2022 09:19:32 +0000
Subject: [PATCH v3 5/6] docs: platform: Add documentation for Renesas
 RZ/Five SoC
In-Reply-To: <OS0PR01MB59222316BFBB77BBFF448CE986149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221130220825.193693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221130220825.193693-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB592290E34578FBD6E6222B3686149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CA+V-a8ssxnXdU4_sCqMqtCSqsxTFjaa8gULwQyXmhZ9QdQYmxQ@mail.gmail.com> <OS0PR01MB59222316BFBB77BBFF448CE986149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <CA+V-a8tposUvzW+Z_BrUq8jFEmiVhEz61a4Ki75LNYg5ryJKew@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Biju,

On Thu, Dec 1, 2022 at 9:13 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Prabhakar,
>
> > Subject: Re: [PATCH v3 5/6] docs: platform: Add documentation for
> > Renesas RZ/Five SoC
> >
> > Hi Biju,
> >
> > Thank you for the review.
> >
> > On Thu, Dec 1, 2022 at 8:33 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Prabhakar Mahadev Lad
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Subject: [PATCH v3 5/6] docs: platform: Add documentation for
> > > > Renesas RZ/Five SoC
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > This patch adds documentation to build Renesas RZ/Five (R9A07G043F)
> > SoC.
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v2->v3
> > > > * Updated doc with new build command
> > > >
> > > > RFC->v2
> > > > * Updated doc
> > > > ---
> > > >  docs/platform/platform.md       |   5 ++
> > > >  docs/platform/renesas-rzfive.md | 145
> > > > ++++++++++++++++++++++++++++++++
> > > >  2 files changed, 150 insertions(+)
> > > >  create mode 100644 docs/platform/renesas-rzfive.md
> > > >
> > > > diff --git a/docs/platform/platform.md b/docs/platform/platform.md
> > > > index
> > > > f291931..4504d87 100644
> > > > --- a/docs/platform/platform.md
> > > > +++ b/docs/platform/platform.md
> > > > @@ -39,6 +39,10 @@ OpenSBI currently supports the following virtual
> > > > and hardware platforms:
> > > >    processor based SOCs. More details on this platform can be found
> > > > in the
> > > >    file *[shakti_cclass.md]*.
> > > >
> > > > +* **Renesas RZ/Five SoC**: Platform support for Renesas RZ/Five
> > > > +(R9A07G043F) SoC
> > > > +  used on the Renesas RZ/Five SMARC EVK board. More details on this
> > > > +platform can
> > > > +  be found in the file *[renesas-rzfive.md]*.
> > > > +
> > > >  The code for these supported platforms can be used as example to
> > > > implement  support for other platforms. The *platform/template*
> > > > directory also provides  template files for implementing support for
> > > > a new platform. The *objects.mk*, @@ -54,3 +58,4 @@ comments to
> > > > facilitate the implementation.
> > > >  [spike.md]: spike.md
> > > >  [fpga-openpiton.md]: fpga-openpiton.md
> > > >  [shakti_cclass.md]: shakti_cclass.md
> > > > +[renesas-rzfive.md]: renesas-rzfive.md
> > > > diff --git a/docs/platform/renesas-rzfive.md
> > > > b/docs/platform/renesas- rzfive.md new file mode 100644 index
> > > > 0000000..a900cc7
> > > > --- /dev/null
> > > > +++ b/docs/platform/renesas-rzfive.md
> > > > @@ -0,0 +1,145 @@
> > > > +Renesas RZ/Five SoC (R9A07G043F) Platform
> > > > +=========================================
> > > > +The RZ/Five microprocessor includes a single RISC-V CPU Core (Andes
> > > > +AX45MP)
> > > > +1.0 GHz, 16-bit DDR3L/DDR4 interface. Supported interfaces include:
> > > > +- Gigabit Ethernet 2ch
> > > > +- CAN interface (CAN-FD) 2ch
> > > > +- USB 2.0 interface 2ch
> > > > +- SD interface 2ch
> > > > +- AD converter 2ch
> > > > +making it ideal for applications such as entry-class social
> > > > +infrastructure gateway control and industrial gateway control.
> > > > +
> > > > +To build platform specific library and firmwares, provide the
> > > > +*PLATFORM=generic* parameter to the top level make command.
> > > > +
> > > > +Platform Options
> > > > +----------------
> > > > +
> > > > +The Renesas RZ/Five platform does not have any platform-specific
> > > > options.
> > > > +
> > > > +Building Renesas RZ/Five Platform
> > > > +---------------------------------
> > > > +
> > > > +```
> > > > +make PLATFORM=generic
> > > > +```
> > > > +
> > > > +DTS Example: (RZ/Five AX45MP)
> > > > +-----------------------------
> > > > +
> > > > +```
> > > > +     compatible = "renesas,r9a07g043";
> > > > +
> > > > +     cpus {
> > > > +             #address-cells = <1>;
> > > > +             #size-cells = <0>;
> > > > +             timebase-frequency = <12000000>;
> > > > +
> > > > +             cpu0: cpu at 0 {
> > > > +                     compatible = "andestech,ax45mp", "riscv";
> > > > +                     device_type = "cpu";
> > > > +                     reg = <0x0>;
> > > > +                     status = "okay";
> > > > +                     riscv,isa = "rv64imafdc";
> > > > +                     mmu-type = "riscv,sv39";
> > > > +                     i-cache-size = <0x8000>;
> > > > +                     i-cache-line-size = <0x40>;
> > > > +                     d-cache-size = <0x8000>;
> > > > +                     d-cache-line-size = <0x40>;
> > > > +                     clocks = <&cpg CPG_CORE
> > R9A07G043_AX45MP_CORE0_CLK>,
> > > > +                              <&cpg CPG_CORE
> > > > + R9A07G043_AX45MP_ACLK>;
> > >
> > > Missing clock names.
> > >
> > > > +                     cpu0_intc: interrupt-controller {
> > > > +                             #interrupt-cells = <1>;
> > > > +                             compatible = "riscv,cpu-intc";
> > > > +                             interrupt-controller;
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +
> > > > +     soc {
> > > > +             compatible = "simple-bus";
> > > > +             #address-cells = <1>;
> > > > +             #size-cells = <0>;
> > > > +             ranges;
> > > > +
> > > > +             scif0: serial at 1004b800 {
> > > > +                     compatible = "renesas,scif-r9a07g043",
> > > > +                                  "renesas,scif-r9a07g044";
> > > > +                     reg = <0 0x1004b800 0 0x400>;
> > > > +                     interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                                  <414 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                                  <415 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                                  <413 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                                  <416 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                                  <416 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                     interrupt-names = "eri", "rxi", "txi",
> > > > +                                       "bri", "dri", "tei";
> > > > +                     clocks = <&cpg CPG_MOD
> > R9A07G043_SCIF0_CLK_PCK>;
> > > > +                     clock-names = "fck";
> > > > +                     power-domains = <&cpg>;
> > > > +                     resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
> > > > +                     status = "disabled";
> > > > +             };
> > > > +
> > > > +             cpg: clock-controller at 11010000 {
> > > > +                     compatible = "renesas,r9a07g043-cpg";
> > > > +                     reg = <0 0x11010000 0 0x10000>;
> > > > +                     clocks = <&extal_clk>;
> > > > +                     clock-names = "extal";
> > > > +                     #clock-cells = <2>;
> > > > +                     #reset-cells = <1>;
> > > > +                     #power-domain-cells = <0>;
> > > > +             };
> > > > +
> > > > +             sysc: system-controller at 11020000 {
> > > > +                     compatible = "renesas,r9a07g043-sysc";
> > > > +                     reg = <0 0x11020000 0 0x10000>;
> > > > +                     status = "disabled";
> > > > +             };
> > > > +
> > > > +             pinctrl: pinctrl at 11030000 {
> > > > +                     compatible = "renesas,r9a07g043-pinctrl";
> > > > +                     reg = <0 0x11030000 0 0x10000>;
> > > > +                     gpio-controller;
> > > > +                     #gpio-cells = <2>;
> > > > +                     #interrupt-cells = <2>;
> > > > +                     interrupt-controller;
> > > > +                     gpio-ranges = <&pinctrl 0 0 152>;
> > > > +                     clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
> > > > +                     power-domains = <&cpg>;
> > > > +                     resets = <&cpg R9A07G043_GPIO_RSTN>,
> > > > +                              <&cpg R9A07G043_GPIO_PORT_RESETN>,
> > > > +                              <&cpg R9A07G043_GPIO_SPARE_RESETN>;
> > > Missing reset names.
> > >
> > Binding doesn't have reset names.
>
> Maybe add here and upstream the same patch to Linux.
>
OK, I'll only add here once it's accepted in upstream Linux (as what
if it's not accepted there I dont want to misguide).

Cheers,
Prabhakar

