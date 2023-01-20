From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 20 Jan 2023 12:34:06 +0000
Subject: [RFC PATCH v2 1/3] platform: generic: renesas: rzfive: Add
 support to configure the PMA
In-Reply-To: <20230119154131.dkiq2s5354iqxahz@arcolinux>
References: <20230111130540.22722-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230111130540.22722-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230119154131.dkiq2s5354iqxahz@arcolinux>
Message-ID: <CA+V-a8sEk5pCrv3GR=3WYsUdGvXBELHimue+E5f63sjsph2opQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Himanshu,

On Thu, Jan 19, 2023 at 3:41 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> On Wed, Jan 11, 2023 at 01:05:38PM +0000, Lad Prabhakar wrote:
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
> > * Memory, Non-cacheable, Bufferable
> > * Memory, Write-back, No-allocate
> > * Memory, Write-back, Read-allocate
> > * Memory, Write-back, Write-allocate
> > * Memory, Write-back, Read and Write-allocate
<snip>
> > +
> > +static unsigned long andes45_pma_setup(unsigned long addr,
> > +                                    unsigned long size,
> > +                                    unsigned int entry_id,
> > +                                    u32 flag)
> IMHO, we should be consistent with types that are used. Better to
> stick with u32 sorts.
>
Ok, I'll switch to unsigned int and while doing that I'll pass a
pointer to struct andes45_pma_region instead of passing the
addr/size/flag separately.

Cheers,
Prabhakar

