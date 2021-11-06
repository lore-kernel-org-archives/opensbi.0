From: Vincent Chen <vincent.chen@sifive.com>
Date: Sat, 6 Nov 2021 09:17:27 +0800
Subject: [PATCH] lib: pmu: support the event ID encoded by a bitmap.
In-Reply-To: <CAOnJCUL+2VZi4qXP75Kpqg-KRmjc-B1b3dp82E7j-ynN5R0L5g@mail.gmail.com>
References: <20211105013301.27656-1-vincent.chen@sifive.com>
 <CAOnJCUL+2VZi4qXP75Kpqg-KRmjc-B1b3dp82E7j-ynN5R0L5g@mail.gmail.com>
Message-ID: <CABvJ_xhi8gnAurFTPK5i1Ta_C=LrZQ9hhE90Bd6L-VEWuRKeCA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 6, 2021 at 2:29 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Nov 4, 2021 at 6:33 PM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > RISC-V privilege specification does not specify how to encode the event ID.
> > Therefore, each platform is allowed to customize its own encoding rule.
> > The common encoding methods are as follow, directly assigning a number to an
> > event, or every bit in the mphmevent CSR controls one specified event or
> > mixes the above two methods.
> >
> > To enable OpenSBI to support the above three encoding methods simultaneously,
> > this patch modifies the content of "pmu,raw-event-to-mhpmcounters". The
> > "pmu,raw-event-to-mhpmcounters" still describes the one or multiple raw
> > events that could be counted by which mhpmcounters. But, the column number
> > of "pmu,raw-event-to-mhpmcounters" is extended from 2 to 3. The 1st column
> > (64bit) is the ID of the raw events. The 2nd column (64bit) is bitmap_region.
> > It indicates which bits in the 1st column are encoded by a bitmap. If a
> > platform directly encoded every pmu event as a number, in this case, the
> > value of bitmap_region will be 0. The 3rd column (32bit) is the counter map
> > used to describe which mhpmcounters support the raw events. All the
> > modifications in this patch are all based on the above change in
> > "pmu,raw-event-to-mhpmcounters".
> >
>
> Thanks for the quick turnaround with this patch. Few broad comments.
>
> 1. docs/pmu_support.adoc with the new binding is missing.
> 2. You may want to post the U-Boot DT updates as well
> so that it is easier for other developers to use perf on HiFive Unmatched.
>

The suggestion is good for me. I will add the above stuff in my next
version patch.
Thank you.

> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  include/sbi/sbi_pmu.h   |  2 +-
> >  lib/sbi/sbi_pmu.c       | 34 ++++++++++++++++++++++++----------
> >  lib/utils/fdt/fdt_pmu.c | 16 +++++++++-------
> >  3 files changed, 34 insertions(+), 18 deletions(-)
> >
> > diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> > index f018556..d1e27bd 100644
> > --- a/include/sbi/sbi_pmu.h
> > +++ b/include/sbi/sbi_pmu.h
> > @@ -51,7 +51,7 @@ int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap);
> >   * @return 0 on success, error otherwise.
> >   */
> >
> > -int sbi_pmu_add_raw_event_counter_map(uint64_t select, u32 cmap);
> > +int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t bitmap_region, u32 cmap);
> >
> >  int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval);
> >
> > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > index 6948a71..eb59baf 100644
> > --- a/lib/sbi/sbi_pmu.c
> > +++ b/lib/sbi/sbi_pmu.c
> > @@ -23,6 +23,13 @@ struct sbi_pmu_hw_event {
> >         uint32_t end_idx;
> >         /* Event selector value used only for raw events */
> >         uint64_t select;
> > +       /* A event selector value may be formed by a number and
> > +        * a bitmap. The bitmap_region is used to indicate which bits
> > +        * are encoded by a bitamp. When the value of bitmap_region
> > +        * is zero, it means that the encoding methods of this select
> > +        * value is to use a number directly.
> > +        */
> > +       uint64_t bitmap_region;
> >  };
> >
> >  /** Representation of a firmware event */
> > @@ -91,9 +98,9 @@ static bool pmu_event_range_overlap(struct sbi_pmu_hw_event *evtA,
> >  }
> >
> >  static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
> > -                                    uint64_t select_val)
> > +                                    uint64_t select_val, uint64_t bitmap_region)
> >  {
> > -       if (evt->select == select_val)
> > +       if ((evt->select == select_val) && (evt->bitmap_region == bitmap_region))
> >                 return TRUE;
> >
> >         return FALSE;
> > @@ -168,7 +175,7 @@ int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval)
> >  }
> >
> >  static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
> > -                               uint64_t select)
> > +                               uint64_t select, uint64_t bitmap_region)
> >  {
> >         int i = 0;
> >         bool is_overlap;
> > @@ -191,13 +198,14 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
> >         for (i = 0; i < num_hw_events; i++) {
> >                 if (eidx_start == SBI_PMU_EVENT_RAW_IDX)
> >                 /* All raw events have same event idx. Just do sanity check on select */
> > -                       is_overlap = pmu_event_select_overlap(&hw_event_map[i], select);
> > +                       is_overlap = pmu_event_select_overlap(&hw_event_map[i], select, bitmap_region);
> >                 else
> >                         is_overlap = pmu_event_range_overlap(&hw_event_map[i], event);
> >                 if (is_overlap)
> >                         goto reset_event;
> >         }
> >
> > +       event->bitmap_region = bitmap_region;
> >         event->counters = cmap;
> >         event->select = select;
> >         num_hw_events++;
> > @@ -221,13 +229,13 @@ int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap)
> >              eidx_end == SBI_PMU_EVENT_RAW_IDX)
> >                 return SBI_EINVAL;
> >
> > -       return pmu_add_hw_event_map(eidx_start, eidx_end, cmap, 0);
> > +       return pmu_add_hw_event_map(eidx_start, eidx_end, cmap, 0, 0);
> >  }
> >
> > -int sbi_pmu_add_raw_event_counter_map(uint64_t select, u32 cmap)
> > +int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t bitmap_region, u32 cmap)
> >  {
> >         return pmu_add_hw_event_map(SBI_PMU_EVENT_RAW_IDX,
> > -                                   SBI_PMU_EVENT_RAW_IDX, cmap, select);
> > +                                   SBI_PMU_EVENT_RAW_IDX, cmap, select, bitmap_region);
> >  }
> >
> >  static int pmu_ctr_enable_irq_hw(int ctr_idx)
> > @@ -510,9 +518,16 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
> >                         continue;
> >
> >                 /* For raw events, event data is used as the select value */
> > -               if ((event_idx == SBI_PMU_EVENT_RAW_IDX) && temp->select != data)
> > -                       continue;
> > +               if (event_idx == SBI_PMU_EVENT_RAW_IDX) {
> > +                       uint64_t bitmap_region = temp->bitmap_region;
> >
> > +                       /* Check the bit filed encoded by a real number */
> > +                       if ((temp->select & ~bitmap_region) != (data & ~bitmap_region))
> > +                               continue;
> > +                       /* Check the bit filed encoded by a bitmap */
> > +                       else if ((temp->select & bitmap_region & data) != (bitmap_region & data))
> > +                               continue;
> > +               }
> >                 /* Fixed counters should not be part of the search */
> >                 ctr_mask = temp->counters & (cmask << cbase) &
> >                            (~SBI_PMU_FIXED_CTR_MASK);
> > @@ -542,7 +557,6 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
> >                 else
> >                         return SBI_EFAIL;
> >         }
> > -
> >         ret = pmu_update_hw_mhpmevent(temp, ctr_idx, flags, event_idx, data);
> >
> >         if (!ret)
> > diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
> > index 4d86e77..28bac76 100644
> > --- a/lib/utils/fdt/fdt_pmu.c
> > +++ b/lib/utils/fdt/fdt_pmu.c
> > @@ -65,7 +65,7 @@ int fdt_pmu_setup(void *fdt)
> >         const u32 *event_val;
> >         const u32 *event_ctr_map;
> >         struct fdt_pmu_hw_event_select *event;
> > -       uint64_t raw_selector;
> > +       uint64_t raw_selector, bitmap_region;
> >         u32 event_idx_start, event_idx_end, ctr_map;
> >
> >         if (!fdt)
> > @@ -99,14 +99,16 @@ int fdt_pmu_setup(void *fdt)
> >         }
> >
> >         event_val = fdt_getprop(fdt, pmu_offset, "pmu,raw-event-to-mhpmcounters", &len);
> > -       if (!event_val || len < 8)
> > +       if (!event_val || len < 20)
> >                 return SBI_EFAIL;
> > -       len = len / (sizeof(u32) * 3);
> > +       len = len / (sizeof(u32) * 5);
> >         for (i = 0; i < len; i++) {
> > -               raw_selector = fdt32_to_cpu(event_val[3 * i]);
> > -               raw_selector = (raw_selector << 32) | fdt32_to_cpu(event_val[3 * i + 1]);
> > -               ctr_map = fdt32_to_cpu(event_val[3 * i + 2]);
> > -               result = sbi_pmu_add_raw_event_counter_map(raw_selector, ctr_map);
> > +               raw_selector = fdt32_to_cpu(event_val[5 * i]);
> > +               raw_selector = (raw_selector << 32) | fdt32_to_cpu(event_val[5 * i + 1]);
> > +               bitmap_region = fdt32_to_cpu(event_val[5 * i + 2]);
> > +               bitmap_region = (bitmap_region  << 32) | fdt32_to_cpu(event_val[5 * i + 3]);
> > +               ctr_map = fdt32_to_cpu(event_val[5 * i + 4]);
> > +               result = sbi_pmu_add_raw_event_counter_map(raw_selector, bitmap_region, ctr_map);
> >                 if (!result)
> >                         hw_event_count++;
> >         }
> > --
> > 2.17.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
>
>
> --
> Regards,
> Atish

