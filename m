From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 May 2022 15:25:02 +0530
Subject: [PATCH v3 2/3] lib: utils: check if CPU node is enabled
In-Reply-To: <CALXH3=+CnFyGiaqSJ+fDiJh0uqyekz0QjMMhyw-aOCiKYLs3MQ@mail.gmail.com>
References: <20220512175539.83942-1-jan.remes@codasip.com>
 <20220512175539.83942-3-jan.remes@codasip.com>
 <CAAhSdy107=q-nNnZPAHY==0uTGBGz5HZjmgjdzaZj4V8kRc0dw@mail.gmail.com>
 <CALXH3=+CnFyGiaqSJ+fDiJh0uqyekz0QjMMhyw-aOCiKYLs3MQ@mail.gmail.com>
Message-ID: <CAAhSdy0wh8Cj2SnN=VJDJZVr2vT8Q6s_a-pTxFsY0TJCaqBnxQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 13, 2022 at 3:07 PM Jan Reme? <jan.remes@codasip.com> wrote:
>
> On Fri, May 13, 2022 at 6:15 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Thu, May 12, 2022 at 11:26 PM Jan Remes <jan.remes@codasip.com> wrote:
> > >
> > > Ignore CPU nodes in FDT that are not enabled.
> > >
> > > Signed-off-by: Jan Remes <jan.remes@codasip.com>
> > > ---
> > >  lib/utils/fdt/fdt_domain.c | 14 +++++++++++++-
> > >  lib/utils/fdt/fdt_fixup.c  |  3 +++
> > >  lib/utils/fdt/fdt_helper.c |  3 +++
> > >  3 files changed, 19 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> > > index 676c757..bd0eec3 100644
> > > --- a/lib/utils/fdt/fdt_domain.c
> > > +++ b/lib/utils/fdt/fdt_domain.c
> > > @@ -165,6 +165,9 @@ void fdt_domain_fixup(void *fdt)
> > >                 if (err)
> > >                         continue;
> > >
> > > +               if (!fdt_node_is_enabled(fdt, doffset))
> > > +                       continue;
> > > +
> > >                 fdt_nop_property(fdt, doffset, "opensbi-domain");
> > >         }
> > >
> > > @@ -308,6 +311,9 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
> > >                         if (err)
> > >                                 return err;
> > >
> > > +                       if (!fdt_node_is_enabled(fdt, cpu_offset))
> > > +                               continue;
> > > +
> > >                         sbi_hartmask_set_hart(val32, mask);
> > >                 }
> > >         }
> > > @@ -347,7 +353,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
> > >         if (val && len >= 4) {
> > >                 cpu_offset = fdt_node_offset_by_phandle(fdt,
> > >                                                          fdt32_to_cpu(*val));
> > > -               if (cpu_offset >= 0)
> > > +               if (cpu_offset >= 0 && fdt_node_is_enabled(fdt, cpu_offset))
> > >                         fdt_parse_hart_id(fdt, cpu_offset, &val32);
> > >         } else {
> > >                 if (domain_offset == *cold_domain_offset)
> > > @@ -414,6 +420,9 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
> > >                 if (SBI_HARTMASK_MAX_BITS <= val32)
> > >                         continue;
> > >
> > > +               if (!fdt_node_is_enabled(fdt, cpu_offset))
> > > +                       continue;
> > > +
> > >                 val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
> > >                 if (!val || len < 4)
> > >                         return SBI_EINVAL;
> > > @@ -460,6 +469,9 @@ int fdt_domains_populate(void *fdt)
> > >                 if (hartid != cold_hartid)
> > >                         continue;
> > >
> > > +               if (!fdt_node_is_enabled(fdt, cpu_offset))
> > > +                       continue;
> > > +
> > >                 val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
> > >                 if (val && len >= 4)
> > >                         cold_domain_offset = fdt_node_offset_by_phandle(fdt,
> > > diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> > > index a80bd82..d1050bb 100644
> > > --- a/lib/utils/fdt/fdt_fixup.c
> > > +++ b/lib/utils/fdt/fdt_fixup.c
> > > @@ -38,6 +38,9 @@ void fdt_cpu_fixup(void *fdt)
> > >                 if (err)
> > >                         continue;
> > >
> > > +               if (!fdt_node_is_enabled(fdt, cpu_offset))
> > > +                       continue;
> > > +
> > >                 /*
> > >                  * Disable a HART DT node if one of the following is true:
> > >                  * 1. The HART is not assigned to the current domain
> > > diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> > > index 3b45ae8..5db3fbe 100644
> > > --- a/lib/utils/fdt/fdt_helper.c
> > > +++ b/lib/utils/fdt/fdt_helper.c
> > > @@ -283,6 +283,9 @@ int fdt_parse_max_hart_id(void *fdt, u32 *max_hartid)
> > >                 if (err)
> > >                         continue;
> > >
> > > +               if (!fdt_node_is_enabled(fdt, cpu_offset))
> > > +                       continue;
> > > +
> >
> > This change is not needed because maximum hartid supported in a
> > system remains the same irrespective of whether certain CPU are
> > disabled/fused.
>
> What should the fdt_parse_max_hart_id() function return? The highest hart-id
> of the harts *used* in the system or *supported* by a system?

Actually, it was meant to return the highest hard-id of the harts "supported"
by a system. Unfortunately, we have not added doxygen style comments for
various FDT helper functions.

>
> It makes sense to me to completely ignore the FDT nodes with status = "disabled"
> except in the code handling interrupts-extended which leads to them (where they
> should be skipped properly).

I am fine with what you are suggesting but the semantics of function should
be reflected in the name.

You can rename fdt_parse_max_hart_id() to fdt_parse_max_enabled_hart_id()
and have the fdt_node_is_enabled() check.

>
> For an FPGA based system where there can be a different number of harts for each
> build, it makes sense to maintain a base FDT with all harts disabled,
> and selectively
> enable just those present in the build. And then the disabled cores
> are very much
> not there at all.

I suggest you rename the function to reflect what you are suggesting here.

>
> >
> > >                 if (hartid > *max_hartid)
> > >                         *max_hartid = hartid;
> > >         }
> > > --
> > > 2.36.1
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
> >
> > Apart from the above minor comment, this looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
> > Regards,
> > Anup
>
> When we resolve the discussion above, I can send a v4 with correct
> Reviewed-by: tags.
>
> Thanks,
>   Jan

Regards,
Anup

