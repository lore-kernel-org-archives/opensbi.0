From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Wed, 25 Jan 2023 19:50:45 +0000
Subject: [RFC PATCH v2 3/3] platform: generic: renesas: rzfive: Add SBI
 EXT to check for enabling IOCP errata
In-Reply-To: <Y8tP5J+JAgLnLKyz@Thinkpad-L14>
References: <20230111130540.22722-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230111130540.22722-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y8tP5J+JAgLnLKyz@Thinkpad-L14>
Message-ID: <CA+V-a8uwEcUndy5am-aMnXdEpHNRYV2FbOxydyJomncaMwAszg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yu-Chien,

Thank you for the review.

On Sat, Jan 21, 2023 at 2:34 AM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jan 11, 2023 at 01:05:40PM +0000, Lad Prabhakar wrote:
> > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > external non-caching masters, such as DMA controllers. The accesses
> > from IOCP are coherent with D-Caches and L2 Cache.
> >
> > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > SoC due to this reason IP blocks using DMA will fail.
> >
> > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> > software. Firstly OpenSBI configures the memory region as
> > "Memory, Non-cacheable, Bufferable" and passes this region as a global
> > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> > allocations happen from this region and synchronization callbacks are
> > implemented to synchronize when doing DMA transactions.
> >
> > RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP
> > errata should be applied to handle cache management.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Hi Lin-san,
> >
> > If Andes plan to use similar approach I can move this code into some common
> > file so that it can be shared. Please share your thoughts.
>
> Sorry for the late reply.
>
> The functions can be kept in your own file for now, I will separate it
> out later if there is a common part that can be reused, as we may need
> some time to prepare and submit the PMA related patch for AE350.
>
> > Cheers, Prabhakar
> > ---
> >  platform/generic/renesas/rzfive/rzfive.c | 63 ++++++++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >
> > diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> > index 54a4c29..2cb9b3b 100644
> > --- a/platform/generic/renesas/rzfive/rzfive.c
> > +++ b/platform/generic/renesas/rzfive/rzfive.c
> > @@ -9,6 +9,33 @@
> >  #include <sbi/sbi_domain.h>
> >  #include <sbi_utils/fdt/fdt_helper.h>
> >
> > +#define RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND    0
> > +
> > +/* AX45MP registers */
> > +#define AX45MP_CSR_MISA_CFG                  0x301
>
> misa is a standard CSR, it can be found in include/sbi/riscv_encoding.h
>
OK, I'll  make use of the CSR_MISA macro instead and drop the above.

Cheers,
Prabhakar

