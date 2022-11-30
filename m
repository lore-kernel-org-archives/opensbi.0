From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Wed, 30 Nov 2022 12:40:53 +0000
Subject: [PATCH 1/4] platform: generic/andes: Enable generic platform
 support for AE350
In-Reply-To: <Y4UZ+rcUBTUG152q@APC323>
References: <20221128083046.6799-1-peterlin@andestech.com> <20221128083046.6799-2-peterlin@andestech.com>
 <CA+V-a8urkMz-Fwj9OFLEp2FAYG9_ZpFG9S_QBNK1=zR1g4svFg@mail.gmail.com> <Y4UZ+rcUBTUG152q@APC323>
Message-ID: <CA+V-a8vWWVAgRZsZA+62CCUYs2rS_eoEtB9_dZDdFK90W6swOA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Lin-san,

On Mon, Nov 28, 2022 at 12:32 PM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> On Mon, Nov 28, 2022 at 10:34:06AM +0000, Lad, Prabhakar wrote:
> > Hi Lin-san,
> >
> > On Mon, Nov 28, 2022 at 8:32 AM Yu Chien Peter Lin
> > <peterlin@andestech.com> wrote:
> > >
> > > We move andes directory to platform/generic since the necessary fdt
> > > drivers are available, the users can enable the console, timer, ipi,
> > > irqchip and reset devices by adding device tree nodes stated in the
> > > docs/platform/andes-ae350.md.
> > >
> > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > ---
> > > Although generic/platform.c has been able to boot the system
> > > on AE350, we will add HSM device for it soon so let's keep
> > > ae350.c as a placeholder.
> > > ---
> > >  platform/andes/ae350/Kconfig           |  34 -----
> > >  platform/andes/ae350/cache.c           |  89 -------------
> > >  platform/andes/ae350/cache.h           |  17 ---
> > >  platform/andes/ae350/configs/defconfig |   0
> > >  platform/andes/ae350/objects.mk        |  40 ------
> > >  platform/andes/ae350/platform.c        | 169 -------------------------
> > >  platform/andes/ae350/platform.h        | 109 ----------------
> > >  platform/generic/Kconfig               |   4 +
> > >  platform/generic/andes/ae350.c         |  21 +++
> > >  platform/generic/andes/objects.mk      |   6 +
> > >  platform/generic/configs/defconfig     |   4 +
> > >  11 files changed, 35 insertions(+), 458 deletions(-)
> > >  delete mode 100644 platform/andes/ae350/Kconfig
> > >  delete mode 100644 platform/andes/ae350/cache.c
> > >  delete mode 100644 platform/andes/ae350/cache.h
> > You have got rid of cache functions and also the vendor specific EXT
> > handler, wouldn't that break things?
>
> Hi Prabhakar,
>
> I want to take this opportunity to drop unnecessary functions, most of
> the andes SBI calls were experimental/debugging features in kernel that
> won't affact the boot flow.
>
Thanks for the clarification.

> You can still keep them in generic/renesas/rzfive.c. The renesas vendor
> SBI call fid does not need to be the same as ours.
>
Agreed, that's the reason RZ/Five had a different enum for SBI vendor IDs.

> As for common Andes CSR which you separated into andes/ae350/common-platform.h
> can be moved to generic/include/andes45.h.
>
Agreed.

Cheers,
Prabhakar

