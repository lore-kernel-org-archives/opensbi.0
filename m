From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Mon, 30 Jan 2023 15:09:09 +0000
Subject: [RFC PATCH v3 2/3] platform: generic: renesas: rzfive: Configure
 the PMA region
In-Reply-To: <8BDFDDD1-DA9C-4A76-9936-176B1A50028B@jrtc27.com>
References: <20230126095832.21566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230126095832.21566-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <8BDFDDD1-DA9C-4A76-9936-176B1A50028B@jrtc27.com>
Message-ID: <CA+V-a8uwH3NDrU1WtHBXQUcEks8MSCkjgDDhP3a3A+ggmM=DWQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jessica,

Thank you for the review.

On Sat, Jan 28, 2023 at 3:05 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 26 Jan 2023, at 09:58, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > On the Renesas RZ/Five SoC by default we want to configure 128MiB of memory
> > ranging from 0x58000000 as a non-cacheable + bufferable region in the PMA
> > and populate this region as PMA reserve DT node with shared DMA pool and
> > no-map flags set so that Linux drivers requesting any DMA'able memory go
> > through this region.
> >
> > PMA node passed to the above stack:
> >
> >        reserved-memory {
> >            #address-cells = <2>;
> >            #size-cells = <2>;
> >            ranges;
> >
> >            pma_resv0 at 58000000 {
> >                compatible = "shared-dma-pool";
> >                reg = <0x0 0x58000000 0x0 0x08000000>;
> >                no-map;
> >                linux,dma-default;
> >            };
> >        };
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > platform/generic/Kconfig                 |  1 +
> > platform/generic/renesas/rzfive/rzfive.c | 21 +++++++++++++++++++++
> > 2 files changed, 22 insertions(+)
> >
> > diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> > index 9ee9fe3..bc5c280 100644
> > --- a/platform/generic/Kconfig
> > +++ b/platform/generic/Kconfig
> > @@ -35,6 +35,7 @@ config PLATFORM_ANDES_AE350
> >
> > config PLATFORM_RENESAS_RZFIVE
> >       bool "Renesas RZ/Five support"
> > +     select ANDES45_PMA
> >       default n
> >
> > config PLATFORM_SIFIVE_FU540
> > diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> > index ee9c9c4..0a8c9f9 100644
> > --- a/platform/generic/renesas/rzfive/rzfive.c
> > +++ b/platform/generic/renesas/rzfive/rzfive.c
> > @@ -4,10 +4,30 @@
> >  *
> >  */
> >
> > +#include <andes45-pma.h>
>
> This name looks inconsistent.
>
As the RZ/Five has the Andes AX45MP core and the PMA code will be
re-used by other non-coherent  Andes AX45MP platforms hence the
andes45-pma.h (Also suggested by Andes maintainer)

Cheers,
Prabhakar

