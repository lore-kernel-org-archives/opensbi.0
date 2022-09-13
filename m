From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 13 Sep 2022 14:40:31 +0530
Subject: [PATCH] lib: utils/fdt: Fix DT parsing in fdt_pmu_setup()
In-Reply-To: <20220905131326.wmiy2osvz2e6bnuc@kamzik>
References: <20220905070242.150149-1-apatel@ventanamicro.com> <20220905131326.wmiy2osvz2e6bnuc@kamzik>
Message-ID: <CAK9=C2XAeCeCuUH_NB3uP=1BMSF1MhiSRDfrsFUEa7+2PN6XFA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 5, 2022 at 6:43 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Sep 05, 2022 at 12:32:42PM +0530, Anup Patel wrote:
> > This patch does following fixes in fdt_pmu_setup():
> > 1) If any of the event mapping DT property is absent or too small
> >    then don't skip parsing of other DT properties.
> > 2) Return failure if sbi_pmu_add_hw_event_counter_map() fails.
> > 3) Return failure if sbi_pmu_add_raw_event_counter_map() fails.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  lib/utils/fdt/fdt_pmu.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
> > index 8ba6b08..8ced8e1 100644
> > --- a/lib/utils/fdt/fdt_pmu.c
> > +++ b/lib/utils/fdt/fdt_pmu.c
> > @@ -77,18 +77,21 @@ int fdt_pmu_setup(void *fdt)
> >
> >       event_ctr_map = fdt_getprop(fdt, pmu_offset, "riscv,event-to-mhpmcounters", &len);
> >       if (!event_ctr_map || len < 8)
> > -             return SBI_EFAIL;
> > +             goto skip_event_to_mhpmcounters;
> >       len = len / (sizeof(u32) * 3);
> >       for (i = 0; i < len; i++) {
> >               event_idx_start = fdt32_to_cpu(event_ctr_map[3 * i]);
> >               event_idx_end = fdt32_to_cpu(event_ctr_map[3 * i + 1]);
> >               ctr_map = fdt32_to_cpu(event_ctr_map[3 * i + 2]);
> > -             sbi_pmu_add_hw_event_counter_map(event_idx_start, event_idx_end, ctr_map);
> > +             result = sbi_pmu_add_hw_event_counter_map(event_idx_start, event_idx_end, ctr_map);
> > +             if (result)
> > +                     return result;
> >       }
> > +skip_event_to_mhpmcounters:
> >
> >       event_val = fdt_getprop(fdt, pmu_offset, "riscv,event-to-mhpmevent", &len);
> >       if (!event_val || len < 8)
> > -             return SBI_EFAIL;
> > +             goto skip_event_to_mhpmevent;
> >       len = len / (sizeof(u32) * 3);
> >       for (i = 0; i < len; i++) {
> >               event = &fdt_pmu_evt_select[hw_event_count];
> > @@ -97,10 +100,11 @@ int fdt_pmu_setup(void *fdt)
> >               event->select = (event->select << 32) | fdt32_to_cpu(event_val[3 * i + 2]);
> >               hw_event_count++;
> >       }
> > +skip_event_to_mhpmevent:
> >
> >       event_val = fdt_getprop(fdt, pmu_offset, "riscv,raw-event-to-mhpmcounters", &len);
> >       if (!event_val || len < 20)
> > -             return SBI_EFAIL;
> > +             goto skip_raw_event_to_mhpmcounters;
> >       len = len / (sizeof(u32) * 5);
> >       for (i = 0; i < len; i++) {
> >               raw_selector = fdt32_to_cpu(event_val[5 * i]);
> > @@ -109,9 +113,10 @@ int fdt_pmu_setup(void *fdt)
> >               select_mask = (select_mask  << 32) | fdt32_to_cpu(event_val[5 * i + 3]);
> >               ctr_map = fdt32_to_cpu(event_val[5 * i + 4]);
> >               result = sbi_pmu_add_raw_event_counter_map(raw_selector, select_mask, ctr_map);
> > -             if (!result)
> > -                     hw_event_count++;
> > +             if (result)
> > +                     return result;
> >       }
> > +skip_raw_event_to_mhpmcounters:
> >
> >       return 0;
> >  }
> > --
> > 2.34.1
>
> I think I'd prefer putting the for-loops into if-blocks to the gotos, but
> otherwise

Okay, I will put for-loops under if-blocks in the next revision.

>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Regards,
Anup

