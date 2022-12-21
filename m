From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Wed, 21 Dec 2022 18:04:34 +0000
Subject: [RFC PATCH] platform: generic: renesas: Add support to configure
 the PMA
In-Reply-To: <Y6MWqO71cISuLEOk@APC323>
References: <20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAEUhbmW5WmNSPNNe4UWq6o7ZtOgT=9N5f2=F6L+ScLSzW_K8dQ@mail.gmail.com> <Y6MWqO71cISuLEOk@APC323>
Message-ID: <CA+V-a8vB2u2yjYno=Y_jAAjYg3gC1qCrrg7X6gQjAD1gbkr=_g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yu-Chien,

On Wed, Dec 21, 2022 at 6:26 AM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> On Wed, Dec 21, 2022 at 09:23:21AM +0800, Bin Meng wrote:
> > On Mon, Dec 12, 2022 at 5:44 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > Add support to configure the PMA regions and create a corresponding
> > > reserve memory node and propagate it to the higher boot stack.
> > >
> > > &L2 {
> > >        andestech,pma-regions = <0x0 0x58000000 0x0 0x08000000
> > >                                 (AX45MP_PMACFG_ETYP_NAPOT |
> > >                                  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
> > > };
> > >
> > > PMA regions are passed as part of L2 cache node to OpenSBI, these regions
> > > are parsed and configured in the OpenSBI.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > Hi All,
> > >
> > > This patch is based on the discussion [0] so sending this as an RFC
> > > patch so that we get the Linux side of things accepeted first and once its
> > > finalized I'll send a non RFC patch for this.
> > >
> > > [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221124172207.153718-8-prabhakar.mahadev-lad.rj at bp.renesas.com/
> > >
> > > Cheers,
> > > Prabhakar
> > > ---
> > >  platform/generic/renesas/rzfive/objects.mk   |   1 +
> > >  platform/generic/renesas/rzfive/rzfive-pma.c | 181 +++++++++++++++
> > >  platform/generic/renesas/rzfive/rzfive-pma.h |  12 +
> >
> > I feel we should name this to something like ax45mp-pma instead of
> > rzfive-pma, as this is at the core configuration level not SoC's, no?
>
> Agreed, Andes PMA CSRs also exist in A45MP (RV32) so it's better if we
> call it andes45-pma.c and andes45_{read|write}_pma{cfg|addr} as function
> name.
>
Ok, I will rename it.

Cheers,
Prabhakar

> Any suggestion to add these functions which will be shared between the
> platforms?
>
> >
> > >  platform/generic/renesas/rzfive/rzfive.c     | 227 +++++++++++++++++++
> > >  4 files changed, 421 insertions(+)
> > >  create mode 100644 platform/generic/renesas/rzfive/rzfive-pma.c
> > >  create mode 100644 platform/generic/renesas/rzfive/rzfive-pma.h
> > >
>
> Best regards,
> Peter Lin

