From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Mon, 13 Feb 2023 21:46:30 +0000
Subject: [PATCH v4 1/3] platform: generic: renesas: rzfive: Add support to
 configure the PMA
In-Reply-To: <CAAhSdy1TWkVHpWCz7Ada=7tT62qjPDmqskn1HL-iWLn7eb4=8g@mail.gmail.com>
References: <20230206000624.6544-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230206000624.6544-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAAhSdy1TWkVHpWCz7Ada=7tT62qjPDmqskn1HL-iWLn7eb4=8g@mail.gmail.com>
Message-ID: <CA+V-a8vUAFqHK2ydgPDdu1n=cKS67haewR5oTc3SoNFR84OcSQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

Thank you for the review.

On Mon, Feb 13, 2023 at 4:07 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Feb 6, 2023 at 5:36 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > external non-caching masters, such as DMA controllers. The accesses
> > from IOCP are coherent with D-Caches and L2 Cache.
> >
> > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > SoC due to this reason IP blocks using DMA will fail.
> >
> > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > block that allows dynamic adjustment of memory attributes in the runtime.
> > It contains a configurable amount of PMA entries implemented as CSR
> > registers to control the attributes of memory locations in interest.
> > Below are the memory attributes supported:
> > * Device, Non-bufferable
> > * Device, bufferable
> > * Memory, Non-cacheable, Non-bufferable
<snip>
> >  platform/generic/Kconfig                      |   8 +
> >  platform/generic/include/andes45_pma.h        |  48 +++
> >  platform/generic/renesas/rzfive/andes45-pma.c | 350 ++++++++++++++++++
> >  platform/generic/renesas/rzfive/objects.mk    |   1 +
>
> This file organization does not make sense because after all
> these PMA configurations are Andes specific and RZFive
> simply using it.
>
> I suggest the following:
> 1) Rename
>     platform/generic/include/andes45_pma.h
>     to
>     platform/generic/include/andes/andes45_pma.h
> 2) Rename
>     platform/generic/renesas/rzfive/andes45-pma.c
>     to
>     platform/generic/andes/andes45-pma.c
> 3) Add platform/generic/andes/Kconfig which defines
>     "config ANDES45_PMA" but does not depend on
>     PLATFORM_RENESAS_RZFIVE
> 4) Include platform/generic/andes/Kconfig in
>     platform/generic/Kconfig and select ANDES45_PMA
>     for PLATFORM_RENESAS_RZFIVE
>
Ok, I'll do the above in the next version.

Cheers,
Prabhakar

