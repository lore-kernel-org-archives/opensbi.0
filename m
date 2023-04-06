From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Thu, 6 Apr 2023 11:43:12 +0000
Subject: [PATCH v9] platform: generic: andes/renesas: Add SBI EXT to check
 for enabling IOCP errata
In-Reply-To: <ZC8d+a4FXMO/J11p@APC323>
References: <20230406100845.25856-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <ZC8d+a4FXMO/J11p@APC323>
Message-ID: <CA+V-a8vheU5GAyYcZcaj=rO3aMF+_GXGzG-dsbrybcmSR=+y1g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Lin-san,

Thank you for the review.

On Thu, Apr 6, 2023 at 12:37?PM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi Prabhakar,
>
> On Thu, Apr 06, 2023 at 11:08:45AM +0100, Lad Prabhakar wrote:
> > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > external non-caching masters, such as DMA controllers. The accesses
> > from IOCP are coherent with D-Caches and L2 Cache.
> >
> > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > SoC (which is based on Andes AX45MP core) due to this reason IP blocks
> > using DMA will fail.
> >
> > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> > software. Firstly OpenSBI configures the memory region as
> > "Memory, Non-cacheable, Bufferable" and passes this region as a global
> > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> > allocations happen from this region and synchronization callbacks are
> > implemented to synchronize when doing DMA transactions.
> >
> > SBI_EXT_ANDES_IOCP_SW_WORKAROUND checks if the IOCP errata should be
> > applied to handle cache management.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v8->v9
> > * Moved vendor_ext_provider callback to andes45_sbi.c
> > * Updated commit message
> > * Dropped RB tags
> >
> > v7->v8
> > * Fixed typo controlable -> controllable
> > * Included RB tag from Lin-san and Conor
> >
> > v6->v7
> > * Added a new section for conf and control registers
> > * Made use of misa_extension('U')
> > * For unsupported funcid's now returning SBI_EINVAL
> > * Renamed ANDES_SBI_EXT_IOCP_SW_WORKAROUND -> SBI_EXT_ANDES_IOCP_SW_WORKAROUND
> >
> > v5->v6
> > * Moved ANDES_SBI_EXT_IOCP_SW_WORKAROUND to andes_sbi.h
> > * Moved helpers to check IOCP to common header so that we re-use code
> >
> > v5:
> > https://patchwork.ozlabs.org/project/opensbi/patch/20230213215111.32017-4-prabhakar.mahadev-lad.rj at bp.renesas.com/
> > ---
> >  platform/generic/Kconfig                     |  1 +
> >  platform/generic/andes/Kconfig               |  4 ++
> >  platform/generic/andes/andes45_sbi.c         | 51 ++++++++++++++++++++
> >  platform/generic/andes/objects.mk            |  1 +
> >  platform/generic/include/andes/andes45.h     | 23 ++++++++-
> >  platform/generic/include/andes/andes45_sbi.h | 13 +++++
> >  platform/generic/renesas/rzfive/rzfive.c     |  2 +
> >  7 files changed, 93 insertions(+), 2 deletions(-)
> >  create mode 100644 platform/generic/andes/andes45_sbi.c
> >  create mode 100644 platform/generic/include/andes/andes45_sbi.h
> >
> > diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> > index 1f4f8e1..6ec25db 100644
> > --- a/platform/generic/Kconfig
> > +++ b/platform/generic/Kconfig
> > @@ -36,6 +36,7 @@ config PLATFORM_ANDES_AE350
> >  config PLATFORM_RENESAS_RZFIVE
> >       bool "Renesas RZ/Five support"
> >       select ANDES45_PMA
> > +     select ANDES45_SBI
>
> andes_sbi is preferred,
> the other CPU series can reuse these files and functions.
>
Ok I'll do as per below:
* Rename ANDES45_SBI -> ANDES_SBI
* Rename andes45_sbi.c -> andes_sbi.c
* Renabme andes45_sbi.h -> andes_sbi.h

I assume you are OK with the rest of the implementation.

Cheers,
Prabhakar

