From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Jul 2021 17:04:39 +0530
Subject: [PATCH] generic: fu740: add workaround for CIP-1200 errata
In-Reply-To: <CAOnJCULg8fC-GqbGmea_gve-9ixheXwYk7yU5jnZUNfSQ9nn+Q@mail.gmail.com>
References: <20210720170239.25804-1-xypron.glpk@gmx.de>
 <CAOnJCULg8fC-GqbGmea_gve-9ixheXwYk7yU5jnZUNfSQ9nn+Q@mail.gmail.com>
Message-ID: <CAAhSdy21bw-runh34SHg3OGZEu8eTiQO4U+nM58EpxcbJ8WXPQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 22, 2021 at 5:14 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Jul 20, 2021 at 10:03 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >
> > From: David Abdurachmanov <david.abdurachmanov@sifive.com>
> >
> > Instruction TLB can fail to respect a non-global SFENCE thus we need to
> > flush the TLB using SFENCE.VMA x0, x0
> >
> > See full description of CIP-1200 in Errata_FU740-C000_20210205 from
> > https://www.sifive.com/boards/hifive-unmatched
> >
> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@sifive.com>
> > Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> > ---
> >  platform/generic/objects.mk     |  1 +
> >  platform/generic/platform.c     |  2 ++
> >  platform/generic/sifive_fu740.c | 36 +++++++++++++++++++++++++++++++++
> >  3 files changed, 39 insertions(+)
> >  create mode 100644 platform/generic/sifive_fu740.c
> >
> > diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
> > index d6c8a42..cb15a18 100644
> > --- a/platform/generic/objects.mk
> > +++ b/platform/generic/objects.mk
> > @@ -9,3 +9,4 @@
> >
> >  platform-objs-y += platform.o
> >  platform-objs-y += sifive_fu540.o
> > +platform-objs-y += sifive_fu740.o
> > diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> > index 8c1e06f..2d5e930 100644
> > --- a/platform/generic/platform.c
> > +++ b/platform/generic/platform.c
> > @@ -23,9 +23,11 @@
> >  #include <sbi_utils/reset/fdt_reset.h>
> >
> >  extern const struct platform_override sifive_fu540;
> > +extern const struct platform_override sifive_fu740;
> >
> >  static const struct platform_override *special_platforms[] = {
> >         &sifive_fu540,
> > +       &sifive_fu740,
> >  };
> >
> >  static const struct platform_override *generic_plat = NULL;
> > diff --git a/platform/generic/sifive_fu740.c b/platform/generic/sifive_fu740.c
> > new file mode 100644
> > index 0000000..c8325d3
> > --- /dev/null
> > +++ b/platform/generic/sifive_fu740.c
> > @@ -0,0 +1,36 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 SiFive
> > + *
> > + * Authors:
> > + *   David Abdurachmanov <david.abdurachmanov@sifive.com>
> > + */
> > +
> > +#include <platform_override.h>
> > +#include <sbi_utils/fdt/fdt_helper.h>
> > +#include <sbi_utils/fdt/fdt_fixup.h>
> > +
> > +static u64 sifive_fu740_tlbr_flush_limit(const struct fdt_match *match)
> > +{
> > +       /*
> > +        * Needed to address CIP-1200 errata on SiFive FU740
> > +        * Title: Instruction TLB can fail to respect a non-global SFENCE
> > +        * Workaround: Flush the TLB using SFENCE.VMA x0, x0
> > +        * See Errata_FU740-C000_20210205 from
> > +        * https://www.sifive.com/boards/hifive-unmatched
> > +        */
> > +       return 0;
> > +}
> > +
> > +static const struct fdt_match sifive_fu740_match[] = {
> > +       { .compatible = "sifive,fu740" },
> > +       { .compatible = "sifive,fu740-c000" },
> > +       { .compatible = "sifive,hifive-unmatched-a00" },
> > +       { },
> > +};
> > +
> > +const struct platform_override sifive_fu740 = {
> > +       .match_table = sifive_fu740_match,
> > +       .tlbr_flush_limit = sifive_fu740_tlbr_flush_limit,
> > +};
> > --
> > 2.29.2
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> --
> Regards,
> Atish
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

