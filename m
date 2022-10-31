From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Mon, 31 Oct 2022 11:41:39 +0000
Subject: [PATCH RFC 1/7] lib: utils: serial: Add Renesas SCIF driver
In-Reply-To: <030a2e82674b61b9f190c0bab30fab46bfb88058.camel@126.com>
References: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028004042.135549-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <030a2e82674b61b9f190c0bab30fab46bfb88058.camel@126.com>
Message-ID: <CA+V-a8vUjxBTvTQ50b=PccKFPqP5ggEeGkJwB330hAffjxRLyQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Xiang,

Thank you for the review.

On Mon, Oct 31, 2022 at 11:27 AM Xiang W <wxjstz@126.com> wrote:
>
> ? 2022-10-28???? 01:40 +0100?Prabhakar???
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add Renesas SCIF driver.
> >
> > Based on a patch in the BSP by Takeki Hamada
> > <takeki.hamada.ak@bp.renesas.com>
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  include/sbi_utils/serial/renesas-scif.h |  11 ++
> >  lib/utils/serial/Kconfig                |   4 +
> >  lib/utils/serial/objects.mk             |   1 +
> >  lib/utils/serial/renesas_scif.c         | 140 ++++++++++++++++++++++++
> >  4 files changed, 156 insertions(+)
> >  create mode 100644 include/sbi_utils/serial/renesas-scif.h
> >  create mode 100644 lib/utils/serial/renesas_scif.c
> >
> > diff --git a/include/sbi_utils/serial/renesas-scif.h b/include/sbi_utils/serial/renesas-scif.h
> > new file mode 100644
> > index 0000000..0002a1a
> > --- /dev/null
> > +++ b/include/sbi_utils/serial/renesas-scif.h
> > @@ -0,0 +1,11 @@
<snip>
> > +#define SCIF_SPTR_SPB2DT       0x1 /* if SCR.TE setting, don't care */
> > +#define SCIF_SPTR_SPB2IO       0x2 /* if SCR.TE setting, don't care */
> > +
> > +#define SCIF_SEMR_BRME         0x20 /* bit-rate modulation enable */
> > +#define SCIF_SEMR_MDDRS                0x10 /* MDDR access enable */
> > +
> > +#define SCIF_SIZE(reg)         ((reg == SCIF_REG_BRR) || \
> > +                                (reg == SCIF_REG_FTDR) || \
> > +                                (reg == SCIF_REG_FRDR) || \
> > +                                (reg == SCIF_REG_SEMR))
> > +
> > +#define SCBRR_VALUE(clk, baudrate) ((clk) / (64 / 2 * (baudrate)) - 1)
> replace 62 /2 to 32
>
OK.

> > +
> > +/* clang-format on */
> > +
> > +static volatile char *scif_base;
> > +
> > +static u32 get_reg(u32 offset)
> > +{
> > +       if (SCIF_SIZE(offset))
> > +               return readb(scif_base + offset);
> > +
> > +       return readw(scif_base + offset);
> > +}
> > +
> > +static void set_reg(u32 offset, u32 val)
> > +{
> > +       if (SCIF_SIZE(offset))
> > +               return writeb(val, scif_base + offset);
> > +
> > +       return writew(val, scif_base + offset);
> > +}
> > +
> > +static void scif_wait(unsigned long baudrate)
> > +{
> > +       unsigned long utime;
> > +
> > +       utime = 1000000 / baudrate;
> > +       utime += 1;
> replace before 2 line to:
>           utime = 1000000 / baudrate + 1;
>
Agreed, will do.

Cheers,
Prabhakar

