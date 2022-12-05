From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 5 Dec 2022 18:55:44 +0530
Subject: [PATCH v3 0/6] Add support for Renesas RZ/Five SoC
In-Reply-To: <CA+V-a8uR8EuSUGdz773P_U2gzDmQRe458yDTdgU2n4fQkMwUrA@mail.gmail.com>
References: <20221130220825.193693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAAhSdy2R2t9QENdi7qn-hx1_3xQMFi5D=cnT9AyL_k485YafBw@mail.gmail.com> <CA+V-a8uR8EuSUGdz773P_U2gzDmQRe458yDTdgU2n4fQkMwUrA@mail.gmail.com>
Message-ID: <CAK9=C2UFNLemX-k3d_=u8gn_oTfNfPx4b-EgMrV743AV=vqiPw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 5, 2022 at 6:40 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Anup,
>
> On Mon, Dec 5, 2022 at 12:53 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Thu, Dec 1, 2022 at 3:38 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > >
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Hi All,
> > >
> > > This patch series adds initial support to RZ/Five (R9A07G043F) SoC (which
> > > is equipped with AX45MP AndesCore). Platform supports DT based probing.
> > >
> > > Linux support is currently being upstreamed the latest patchset can be
> > > found at [0](currently in linux-next, DT bindings can be seen here)
> > >
> > > [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221028165921.94487-1-prabhakar.mahadev-lad.rj at bp.renesas.com/
> > >
> > > - PLIC binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml#L57
> > > - PLMT and PLICSW are not used by any driver in kernel hence DT bindings for it
> > >   and is used in a similar manner as compared Andes AE350 [1]
> > >   [1] https://github.com/andestech/linux/commits/v6.0.y_ae350-ax45mp/Documentation/devicetree/bindings
> > > - SCIF binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/serial/renesas,scif.yaml#L79
> > >
> > > Note:
> > > - The PMA implementation is still in discussion [1] once its decided
> > > corresponding patch to OpenSBI will be added to reserve the memory nodes
> > > and vendor specific SBI EXT.
> > > - U-boot from BSP release wont work with these patches, it requires additional
> > >   patches (happy to share the u-boot branch if anyone wants to test this patchset)
> > > - Patches apply on top of [2]
> > >
> > > [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221124172207.153718-8-prabhakar.mahadev-lad.rj at bp.renesas.com/
> > > [2] https://patchwork.ozlabs.org/project/opensbi/cover/20221128083046.6799-1-peterlin at andestech.com/
> > >
> > > v2->v3
> > > * Switched to generic platform
> > > * Dropped all vendor specific SBI EXT
> > > * Fixed review comments pointed by Bin for SCIF driver
> > > * Updated doc
> > >
> > > RFC->v2
> > > * Fixed comments pointed by Xiang W
> > > * Included RB tag from Yu Chien Peter Lin for patch #3
> > >
> > > RFC: https://patchwork.ozlabs.org/project/opensbi/cover/20221028004042.135549-1-prabhakar.mahadev-lad.rj at bp.renesas.com/
> > >
> > > Below are the logs for U-Boot (2022.10), OpenSBI and Linux:
> > > -----------------------------------------------------------
> > > U-Boot SPL 2022.10-00194-g8fe71ee1da (Nov 30 2022 - 17:32:32 +0000)
> > > Trying to boot from NOR
> > >
> > > OpenSBI v1.1-109-gfa85d48
> > >    ____                    _____ ____ _____
> > >   / __ \                  / ____|  _ \_   _|
> > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > >   \____/| .__/ \___|_| |_|_____/|____/_____|
> > >         | |
> > >         |_|
> > >
> > > Platform Name             : Renesas SMARC EVK based on r9a07g043f01
> > > Platform Features         : medeleg
> > > Platform HART Count       : 1
> > > Platform IPI Device       : andes_plicsw
> > > Platform Timer Device     : andes_plmt @ 12000000Hz
> > > Platform Console Device   : renesas_scif
> > > Platform HSM Device       : ---
> > > Platform PMU Device       : ---
> > > Platform Reboot Device    : ---
> > > Platform Shutdown Device  : ---
> >
> > Any plans for a system reboot/shutdown driver for OpenSBI ?
> >
> Not with the current patchest, but going forward we will.
>
> I need to investigate this (can you please point me to an example for this).
>
> BTW when do you plan to plan for the next OpenSBI release (I'll plan
> accordingly to send a v4 for this series).

It would be nice if we can conclude this series before the end of next week.

Regards,
Anup

>
> Cheers,
> Prabhakar
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

