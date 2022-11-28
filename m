From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Mon, 28 Nov 2022 12:08:14 +0000
Subject: [PATCH v4 7/7] soc: renesas: Add L2 cache management for RZ/Five SoC
In-Reply-To: <CAMuHMdWQO_usrJwmVYDx6o-CpzmotVZLt176eKbqLzY-GXiDng@mail.gmail.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <bf8e33fd-a752-d5d5-859e-14302d069f2d@sholland.org> <CA+V-a8sz4i_wenTyA5tVTVB8dQWLmuXCf3CGYOPC+C07GJ8WTw@mail.gmail.com>
 <CAMuHMdWQO_usrJwmVYDx6o-CpzmotVZLt176eKbqLzY-GXiDng@mail.gmail.com>
Message-ID: <CA+V-a8s5mZoLMhjjpo_89taaBx+M_EwXMZUu-TUpZc8Q3bw4ug@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Geert,

On Sun, Nov 27, 2022 at 9:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Sat, Nov 26, 2022 at 10:10 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Nov 25, 2022 at 7:43 PM Samuel Holland <samuel@sholland.org> wrote:
> > > On 11/24/22 11:22, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > On the AX45MP core, cache coherency is a specification option so it may
> > > > not be supported. In this case DMA will fail. As a workaround, firstly we
> > > > allocate a global dma coherent pool from which DMA allocations are taken
> > > > and marked as non-cacheable + bufferable using the PMA region as specified
> > > > in the device tree. Synchronization callbacks are implemented to
> > > > synchronize when doing DMA transactions.
> > > >
> > > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > > > block that allows dynamic adjustment of memory attributes in the runtime.
> > > > It contains a configurable amount of PMA entries implemented as CSR
> > > > registers to control the attributes of memory locations in interest.
> > > >
> > > > Below are the memory attributes supported:
> > > > * Device, Non-bufferable
> > > > * Device, bufferable
> > > > * Memory, Non-cacheable, Non-bufferable
> > > > * Memory, Non-cacheable, Bufferable
> > > > * Memory, Write-back, No-allocate
> > > > * Memory, Write-back, Read-allocate
> > > > * Memory, Write-back, Write-allocate
> > > > * Memory, Write-back, Read and Write-allocate
> > > >
> > > > This patch adds support to configure the memory attributes of the memory
> > > > regions as passed from the l2 cache node and exposes the cache management
> > > > ops.
> > >
> > > Forgive my ignorance, but why do you need both a DMA pool and explicit
> > > cache maintenance? Wouldn't the purpose of marking a memory region as
> > > permanently non-cacheable be to avoid cache maintenance? And likewise,
> > > if you are doing cache maintenance anyway, why does it matter if/how the
> > > memory is cacheable?
> > >
> > "Memory, Non-cacheable, Bufferable" raises an AXI signal for
> > transactions hence needing SW implementation for cache maintenance.
> >
> > > > More info about PMA (section 10.3):
> > > > Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > > > +static int ax45mp_configure_pma_regions(struct device_node *np)
> > > > +{
> > > > +     const char *propname = "andestech,pma-regions";
> > > > +     u32 start, size, flags;
> > > > +     unsigned int entry_id;
> > > > +     unsigned int i;
> > > > +     int count;
> > > > +     int ret;
> > > > +
> > > > +     count = of_property_count_elems_of_size(np, propname, sizeof(u32) * 3);
> > > > +     if (count < 0)
> > > > +             return count;
> > > > +
> > > > +     if (count > AX45MP_MAX_PMA_REGIONS)
> > > > +             return -EINVAL;
> > > > +
> > > > +     for (i = 0, entry_id = 0 ; entry_id < count ; i += 3, entry_id++) {
> > > > +             of_property_read_u32_index(np, propname, i, &start);
> > > > +             of_property_read_u32_index(np, propname, i + 1, &size);
> > > > +             of_property_read_u32_index(np, propname, i + 2, &flags);
> > > > +             ret = ax45mp_sbi_set_pma(start, size, flags, entry_id);
> > > > +             if (!ret)
> > > > +                     pr_err("Failed to setup PMA region 0x%x - 0x%x flags: 0x%x",
> > > > +                            start, start + size, flags);
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > >
> > > If firmware support is required to set up these PMA regions, why is
> > > Linux doing this at all? The firmware has access to the devicetree as
> > > well. It can set this up before entering S-mode, and then you don't need
> > > to expose this capability via an SBI extension. In fact, firmware could
> > > generate the reserved-memory node based on these regions at runtime (or
> > > vice versa).
> > >
> > That's a good point. I'll do some research on this and get back.
> >
> > Btw are there any existing examples where the firmware adds DT nodes?
>
> /memory, reserved-memory, optee on ARM, RPC status on R-Car Gen3/4, ...
>
On the TF-A we pass the FDT blob to u-boot and this does the magic.

On the RISC-V what would be the correct approach?
- We setup the PMA regions in OpenSBI
- We provide a vendor specific EXT to check if the PMA is setup
- In u-boot ft_board_setup() callback add the reserved-memory node

Does the above approach sound good or is there a better approach I'm missing?

Cheers,
Prabhakar

