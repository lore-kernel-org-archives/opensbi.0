From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Mon, 31 Oct 2022 11:54:25 +0000
Subject: [PATCH RFC 2/7] lib: utils: serial: Add FDT driver for Renesas SCIF
In-Reply-To: <d606cbd105ffa3f557482f79e225a5181eb5d456.camel@126.com>
References: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028004042.135549-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <d606cbd105ffa3f557482f79e225a5181eb5d456.camel@126.com>
Message-ID: <CA+V-a8shm542P8oNyzL01N6rDEvGKM2qXcnavwU3z0KoDvh=Zg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Xiang,

Thank you for the review.

On Mon, Oct 31, 2022 at 11:29 AM Xiang W <wxjstz@126.com> wrote:
>
> ? 2022-10-28???? 01:40 +0100?Prabhakar???
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add FDT driver for Renesas SCIF.
> >
> >     dts example:
> >
> >     soc: soc {
> >           ....
> >             scif0: serial at 1004b800 {
> >                     compatible = "renesas,scif-r9a07g043",
> >                                  "renesas,scif-r9a07g044";
> >                     reg = <0 0x1004b800 0 0x400>;
> >                     interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
> >                                  <414 IRQ_TYPE_LEVEL_HIGH>,
> >                                  <415 IRQ_TYPE_LEVEL_HIGH>,
> >                                  <413 IRQ_TYPE_LEVEL_HIGH>,
> >                                  <416 IRQ_TYPE_LEVEL_HIGH>,
> >                                  <416 IRQ_TYPE_LEVEL_HIGH>;
> >                     interrupt-names = "eri", "rxi", "txi",
> >                                       "bri", "dri", "tei";
> >                     clocks = <&cpg CPG_MOD R9A07G043_SCIF0_CLK_PCK>;
> >                     clock-names = "fck";
> >                     power-domains = <&cpg>;
> >                     resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
> >                     status = "disabled";
> >             };
> >           ....
> >     };
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  include/sbi_utils/fdt/fdt_helper.h         |  3 +++
> >  lib/utils/fdt/fdt_helper.c                 | 23 ++++++++++++++++
> >  lib/utils/serial/Kconfig                   |  5 ++++
> >  lib/utils/serial/fdt_serial_renesas_scif.c | 31 ++++++++++++++++++++++
> >  lib/utils/serial/objects.mk                |  3 +++
> >  5 files changed, 65 insertions(+)
> >  create mode 100644 lib/utils/serial/fdt_serial_renesas_scif.c
> >
> > diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> > index c39f77a..09f3095 100644
> > --- a/include/sbi_utils/fdt/fdt_helper.h
> > +++ b/include/sbi_utils/fdt/fdt_helper.h
> > @@ -59,6 +59,9 @@ int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq);
> >  int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
> >                                 struct platform_uart_data *uart);
> >
> > +int fdt_parse_renesas_scif_node(void *fdt, int nodeoffset,
> > +                               struct platform_uart_data *uart);
> > +
> >  int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
> >                                struct platform_uart_data *uart);
> >
> > diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> > index d390436..483865e 100644
> > --- a/lib/utils/fdt/fdt_helper.c
> > +++ b/lib/utils/fdt/fdt_helper.c
> > @@ -23,6 +23,11 @@
> >  #define DEFAULT_UART_REG_IO_WIDTH      1
> >  #define DEFAULT_UART_REG_OFFSET                0
> >
> > +#define DEFAULT_RENESAS_SCIF_FREQ              100000000
> > +#define DEFAULT_RENESAS_SCIF_BAUD              115200
> > +#define DEFAULT_RENESAS_SCIF_REG_SHIFT         0
> > +#define DEFAULT_RENESAS_SCIF_REG_IO_WIDTH      4
> > +
> >  #define DEFAULT_SIFIVE_UART_FREQ               0
> >  #define DEFAULT_SIFIVE_UART_BAUD               115200
> >  #define DEFAULT_SIFIVE_UART_REG_SHIFT          0
> > @@ -370,6 +375,24 @@ int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
> >         return 0;
> >  }
> >
> > +int fdt_parse_renesas_scif_node(void *fdt, int nodeoffset,
> > +                               struct platform_uart_data *uart)
> > +{
> > +       int rc;
> > +
> > +       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
> > +                                       DEFAULT_RENESAS_SCIF_FREQ,
> > +                                       DEFAULT_RENESAS_SCIF_BAUD);
> > +
> > +       if (rc)
> > +               return rc;
> > +
> > +       uart->reg_shift = DEFAULT_RENESAS_SCIF_REG_SHIFT;
> > +       uart->reg_io_width = DEFAULT_RENESAS_SCIF_REG_IO_WIDTH;
> uart->reg_shift and uart->reg_io_width not used in your dirver.
> This 2 lines can be dropped.
>
Ok I will drop them. I was under the impression these fields had to be
initialized, for example the Sifive uart driver doesn't use them but
it's still being set in the helpers.

Cheers,
Prabhakar

