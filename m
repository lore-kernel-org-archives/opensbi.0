From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Tue, 8 Nov 2022 08:42:44 +0000
Subject: [PATCH RFC 0/7] Add support for Renesas RZ/Five SoC
In-Reply-To: <CAEUhbmUAT_Ho3EGfuFbXnXEOeqi+RuU3F0TgYX=oVmEPW3WvhQ@mail.gmail.com>
References: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8tLeQ8Zj_r72mqhOCypz_CJTkf0c7-muAVUtVrE=6n7EQ@mail.gmail.com> <CAEUhbmUAT_Ho3EGfuFbXnXEOeqi+RuU3F0TgYX=oVmEPW3WvhQ@mail.gmail.com>
Message-ID: <CA+V-a8v2yUniKsXrV_ZyBoDb=L=GQ-e-=uvVDUhjT+cJxrY0-A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Tue, Nov 8, 2022 at 1:39 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> On Mon, Nov 7, 2022 at 6:30 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > On Fri, Oct 28, 2022 at 1:40 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > >
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Hi All,
> > >
> > > This patch series adds initial support to RZ/Five SoC (which is equipped
> > > with AX45MP AndesCore). Platform supports DT based probing.
> > >
> > > Linux support is currently being upstreamed the latest patchset can be
> > > found at [0].(DT bindings can be seen here)
> > >
> > > [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220920184904.90495-1-prabhakar.mahadev-lad.rj at bp.renesas.com/
> > >
> > > - PLIC binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml#L57
> > > - PLMT and PLICSW are not used by any driver in kernel hence DT bindings for it
> > >   and is used in a similar manner as compared Andes AE350 [1]
> > >   [1] https://github.com/andestech/linux/commits/v6.0.y_ae350-ax45mp/Documentation/devicetree/bindings
> > > - SCIF binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/serial/renesas,scif.yaml#L79
> > >
> > Gentle ping for review.
> >
> > Cheers,
> > Prabhakar
> >
> > > Below are the logs for U-Boot (2022.10) and OpenSBI:
> > > --------------------------------------------------
> > > U-Boot SPL 2022.10-00192-g0cf0a0919b-dirty (Oct 28 2022 - 01:09:54 +0100)
> > > Trying to boot from NOR
>
> Has U-Boot support been upstreamed?
>
It's in the pipeline (and should be done soon as you can see we are on
the latest u-boot release). I can share the repo link if you need.

Cheers,
Prabhakar

