From: Anup Patel <anup@brainfault.org>
Date: Sat, 17 Dec 2022 09:09:03 +0530
Subject: [PATCH v3 5/5] lib: utils/irqchip: plic: Ensure no out-of-bound
 access in context save/restore helpers
In-Reply-To: <17261da5-b988-f1f2-2a39-34cd4c0321ae@sholland.org>
References: <20221211065424.806478-1-bmeng@tinylab.org> <20221211065424.806478-5-bmeng@tinylab.org>
 <17261da5-b988-f1f2-2a39-34cd4c0321ae@sholland.org>
Message-ID: <CAAhSdy0G+E8ynXNsZP4Y4bP33Vz7XpJiS9UnoBYN62Zyp6CBMg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 12:30 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 12/11/22 00:54, Bin Meng wrote:
> > Currently the context save/restore helpers writes/reads the provided
> > array using an index whose maximum value is determined by PLIC, which
> > potentially may disagree with the caller to these helpers.
> >
> > Add a parameter to ask the caller to provide the size limit of the
> > array to ensure no out-of-bound access happens.
> >
> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> >
> > ---
> >
> > Changes in v3:
> > - move the size limit check to plic_context_save/restore
> >
> > Changes in v2:
> > - new patch: lib: utils/irqchip: plic: Ensure no out-of-bound access in context save/restore helpers
> >
> >  include/sbi_utils/irqchip/fdt_irqchip_plic.h |  5 +++--
> >  include/sbi_utils/irqchip/plic.h             |  4 ++--
> >  lib/utils/irqchip/fdt_irqchip_plic.c         |  9 +++++----
> >  lib/utils/irqchip/plic.c                     | 14 ++++++++++----
> >  platform/generic/allwinner/sun20i-d1.c       |  5 +++--
> >  5 files changed, 23 insertions(+), 14 deletions(-)
> >
> [...]
> > diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> > index 1f27575..1da9e5b 100644
> > --- a/platform/generic/allwinner/sun20i-d1.c
> > +++ b/platform/generic/allwinner/sun20i-d1.c
> > @@ -78,7 +78,7 @@ static u32 plic_threshold;
> >
> >  static void sun20i_d1_plic_save(void)
> >  {
> > -     fdt_plic_context_save(true, plic_sie, &plic_threshold);
> > +     fdt_plic_context_save(true, plic_sie, &plic_threshold, PLIC_IE_WORDS);
>
> While the actual value ends up being the same, you should update the
> definition of PLIC_IE_WORDS to use the same formula used elsewhere.

Let's have a separate patch for this.

Regards,
Anup

>
> Regards,
> Samuel
>
> >       fdt_plic_priority_save(plic_priority, PLIC_SOURCES);
> >  }
> >
> > @@ -86,7 +86,8 @@ static void sun20i_d1_plic_restore(void)
> >  {
> >       thead_plic_restore();
> >       fdt_plic_priority_restore(plic_priority, PLIC_SOURCES);
> > -     fdt_plic_context_restore(true, plic_sie, plic_threshold);
> > +     fdt_plic_context_restore(true, plic_sie, plic_threshold,
> > +                              PLIC_IE_WORDS);
> >  }
> >
> >  /*
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

