From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Mon, 27 Feb 2023 09:03:43 +0000
Subject: [PATCH v5 0/3] Renesas RZ/Five add support to configure PMA and
 add vendor specific SBI extension
In-Reply-To: <CAAhSdy3PepnH+xoqWhnurK1Rn+q51vp579FeG3VnZfFV+n-5ww@mail.gmail.com>
References: <20230213215111.32017-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAAhSdy3PepnH+xoqWhnurK1Rn+q51vp579FeG3VnZfFV+n-5ww@mail.gmail.com>
Message-ID: <CA+V-a8v7AGOTTm2J5-rX8Xyhyvt-u97WNShTGm0qfHb7NUE6sA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On Mon, Feb 27, 2023 at 6:13?AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Feb 14, 2023 at 3:21 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Hi All,
> >
> > This patch series aims to add support to configure the PMA regions present
> > on the Andes AX45MP core (andes45-pma.c which can be shared with other
> > Andes vendors) and configures the required PMA region for RZ/Five SoC.
> >
> > This patch series also adds the SBI vendor extension
> > RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND to check if IOCP is present on
> > the core and if un-available it also checks if SW workaround for cache
> > management needs to be applied.
> >
> > v4 -> v5
> > -> Included RB tags from Yu Chien Peter Lin
> > -> Moved PMA configuration code into andes folder
> > -> Rebased the changes on top of [0]
> > [0] https://patchwork.ozlabs.org/project/opensbi/list/?series=341535
> >
> > RFC v3 -> v4
> > -> Used bit field for flags in struct andes45_pma_region
> > -> Renamed andes45-pma.h -> andes45_pma.h
> > -> Included RB tag from Lin san for patch 2/3
> > -> Moved CSR to platform/generic/include/andes/andes45.h
> > -> Included sbi/sbi_error.h in andes45-pma.c to fix build issue
> >
> > RFC v2 -> RFC v3
> > -> Fixed review comments pointed by Lin-san
> >    * Used switch case macro
> >    * Added a check to verify the PMA size is power-of-2
> >    * Dropped un-needed calculation done in PMA code for NAPOT.
> >    * Dropped MISA macro
> > -> Fixed comments pointed by Himanshu
> > -> Fixed check patch issue
> >
> > RFC v2 -> RFC v1
> > -> Fixed review comments pointed by Lin-san
> > -> Implemented PMA as library so that it can be shared
> >
> > RFC v1:
> > https://patchwork.ozlabs.org/project/opensbi/patch/20221212094421.14556-1-prabhakar.mahadev-lad.rj at bp.renesas.com/
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (3):
> >   platform: generic: renesas: rzfive: Add support to configure the PMA
> >   platform: generic: renesas: rzfive: Configure the PMA region
> >   platform: generic: renesas: rzfive: Add SBI EXT to check for enabling
> >     IOCP errata
>
> Applied first two patches of this series. Please work with Andes folks
> and send v6 of PATCH3.
>
Sure will do, thanks.

Cheers,
Prabhakar

