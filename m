From: Vincent Chen <vincent.chen@sifive.com>
Date: Wed, 20 Apr 2022 18:16:18 +0800
Subject: [PATCH v4] lib: pmu: support the event ID encoded by a bitmap.
In-Reply-To: <CAOnJCU+6iTKcBB19pouiiGsGNYMZYF4QCm=hoPrfLGx+NNTGHw@mail.gmail.com>
References: <20211202014517.1888248-1-atishp@rivosinc.com>
 <CABvJ_xiOdOUKx+ggcBDTotEvnk9v+cq=TL6t+ism6Dq_Nn2ZhA@mail.gmail.com>
 <CABvJ_xgqR3khXjrqQdtdx8zckiioYszqJBk9Xxb=HCHrwWit-A@mail.gmail.com>
 <CAOnJCULWZxMoNxgxHa=VrRAStWFeZ7roteiABXkx8+39qVU4ww@mail.gmail.com>
 <CABvJ_ximAtz50UB6SCeHKHi_XzW2dnHQaKJ0JGpj2PTk5yEXOg@mail.gmail.com>
 <CAOnJCU+6iTKcBB19pouiiGsGNYMZYF4QCm=hoPrfLGx+NNTGHw@mail.gmail.com>
Message-ID: <CABvJ_xjCtqBggyzujZd-MQ-10qGPSPz3F9_DEuVAqZyeSRBjng@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 20, 2022 at 8:57 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Apr 19, 2022 at 1:17 AM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > On Fri, Apr 15, 2022 at 2:41 PM Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Thu, Apr 14, 2022 at 7:32 PM Vincent Chen <vincent.chen@sifive.com> wrote:
> > > >
> > > > On Fri, Apr 8, 2022 at 1:51 PM Vincent Chen <vincent.chen@sifive.com> wrote:
> > > > >
> > > > > On Thu, Dec 2, 2021 at 9:45 AM Atish Patra <atishp@rivosinc.com> wrote:
> > > > > >
> > > > > > From: Vincent Chen <vincent.chen@sifive.com>
> > > > > >
> > > > > > RISC-V privilege specification does not specify how to encode the event ID.
> > > > > > Therefore, each platform is allowed to customize its own encoding rule.
> > > > > > The common encoding methods are as follow, directly assigning a number to an
> > > > > > event, or every bit in the mphmevent CSR controls one specified event or
> > > > > > mixes the above two methods.
> > > > > >
> > > > > > To enable OpenSBI to support the above three encoding methods simultaneously,
> > > > > > this patch repurpose the dt property "riscv,raw-event-to-mhpmcounters". The
> > > > > > "riscv,raw-event-to-mhpmcounters" will describes the one or multiple raw
> > > > > > events that could be counted by a set of counters. But, the column number
> > > > > > of "riscv,raw-event-to-mhpmcounters" is extended from 2 to 3. The 1st column
> > > > > > (64bit) is the ID of the raw events. The 2nd column (64bit) represents a
> > > > > > select_mask now to represent the bits used for event ID encoding.
> > > > > > If a platform directly encodes each raw PMU event as a unique ID,
> > > > > > the value of select_mask will be 0xffffffff_ffffffff.
> > > > > >
> > > > > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > > > > Signed-off-by: Atish Patra<atishp@rivosinc.com>
> > > > > > ---
> > > > > > Changes from v3->v4:
> > > > > > 1. Fixed few instances of pmu prefix.
> > > > > > 2. Improved the DT property description.
> > > > > > 3. Simplified *find_hw implementation by just masking the selector_mask to
> > > > > >    event_data and comparing it with the select value.
> > > > > > 4. Dropped the reviewed by recieved in PATCH 3 as the selector/mask scheme
> > > > > >    is changed in this patch.
> > > > > >
> > > > > > Changes from v2->v3:
> > > > > > 1. Rebased on top of the master which changed the dt property prefix to riscv.
> > > > > > 2. Fixed typos.
> > > > > > ---
> > > > > > ---
> > > > > >  docs/pmu_support.md     | 24 ++++++++++++++++--------
> > > > > >  include/sbi/sbi_pmu.h   |  2 +-
> > > > > >  lib/sbi/sbi_pmu.c       | 35 ++++++++++++++++++++++++-----------
> > > > > >  lib/utils/fdt/fdt_pmu.c | 16 +++++++++-------
> > > > > >  4 files changed, 50 insertions(+), 27 deletions(-)
> > > > > >
> > > > > > diff --git a/docs/pmu_support.md b/docs/pmu_support.md
> > > > > > index a60b75cf9efa..b9803f643593 100644
> > > > > > --- a/docs/pmu_support.md
> > > > > > +++ b/docs/pmu_support.md
> > > > > > @@ -50,12 +50,20 @@ event-to-mhpmevent is present. Otherwise, it can be omitted. This property
> > > > > >  shouldn't encode any raw event.
> > > > > >
> > > > > >  * **riscv,raw-event-to-mhpmcounters**(Optional) - It represents an ONE-to-MANY
> > > > > > -mapping between a raw event and all the MHPMCOUNTERx in a bitmap format that can
> > > > > > -be used to monitor that raw event. The information is encoded in a table format
> > > > > > -where each raw represent a specific raw event. The first column stores the
> > > > > > -expected event selector value that should be encoded in the expected value to be
> > > > > > -written in MHPMEVENTx. The second column stores a bitmap of all the MHPMCOUNTERx
> > > > > > -that can be used for monitoring the specified event.
> > > > > > +or MANY-to-MANY mapping between the raw event(s) and all the MHPMCOUNTERx in
> > > > > > +a bitmap format that can be used to monitor that raw event, which depends on
> > > > > > +how the platform encodes the monitor events. Currently, only the following three
> > > > > > +encoding methods are supported, encoding each event as a number, using a bitmap
> > > > > > +to encode monitor events, and mixing the previous two methods. The information
> > > > > > +is encoded in a table format where each row represent the specific raw event(s).
> > > > > > +The first column represents a 64-bit selector value which can indicate an
> > > > > > +monitor event ID (encoded by a number) or an event set (encoded by a bitmap).
> > > > > > +In case of the latter, the lower bits used to encode a set of events should be
> > > > > > +set to zero. The second column is a 64-bit selector mask where any bits used
> > > > > > +for event encoding will be cleared. If a platform directly encodes each raw PMU
> > > > > > +event as a unique ID, the value of select_mask will be 0xffffffff_ffffffff.
> > > > > > +The third column represent a bitmap of all the MHPMCOUNTERx that can be used for
> > > > > > +monitoring the specified event(s).
> > > > > >
> > > > > >  *Note:* A platform may choose to provide the mapping between event & counters
> > > > > >  via platform hooks rather than the device tree.
> > > > > > @@ -72,8 +80,8 @@ pmu {
> > > > > >                                                   <0x00002 0x00002 0x00000004>,
> > > > > >                                                   <0x00003 0x0000A 0x00000ff8>,
> > > > > >                                                   <0x10000 0x10033 0x000ff000>,
> > > > > > -       riscv,raw-event-to-mhpmcounters         = <0x0000 0x0002 0x00000f8>,
> > > > > > -                                         <0x0000 0x0003 0x00000ff0>,
> > > > > > +       riscv,raw-event-to-mhpmcounters = <0x0000     0x0002 0xffffffff 0xffffffff 0x00000f8>,
> > > > > > +                                         <0xffffffff 0xfffffff0 0xffffffff 0xfffffff0 0x00000ff0>,
> > > > > >  };
> > > > > >
> > > > > >  ```
> > > > > > diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> > > > > > index f0185566cd6d..6a1c62ccfbef 100644
> > > > > > --- a/include/sbi/sbi_pmu.h
> > > > > > +++ b/include/sbi/sbi_pmu.h
> > > > > > @@ -51,7 +51,7 @@ int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap);
> > > > > >   * @return 0 on success, error otherwise.
> > > > > >   */
> > > > > >
> > > > > > -int sbi_pmu_add_raw_event_counter_map(uint64_t select, u32 cmap);
> > > > > > +int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32 cmap);
> > > > > >
> > > > > >  int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval);
> > > > > >
> > > > > > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > > > > > index 5950a2001637..10668a358cb2 100644
> > > > > > --- a/lib/sbi/sbi_pmu.c
> > > > > > +++ b/lib/sbi/sbi_pmu.c
> > > > > > @@ -21,8 +21,16 @@ struct sbi_pmu_hw_event {
> > > > > >         uint32_t counters;
> > > > > >         uint32_t start_idx;
> > > > > >         uint32_t end_idx;
> > > > > > -       /* Event selector value used only for raw events */
> > > > > > +       /* Event selector value used only for raw events. The event select value
> > > > > > +        * can be a even id or a selector value for set of events encoded in few
> > > > > > +        * bits. In case latter, the bits used for encoding of the events should
> > > > > > +        * be zeroed out in the select value.
> > > > > > +        */
> > > > > >         uint64_t select;
> > > > > > +        /**
> > > > > > +         * The select_mask indicates which bits are encoded for the event(s).
> > > > > > +         */
> > > > > > +       uint64_t select_mask;
> > > > > >  };
> > > > > >
> > > > > >  /** Representation of a firmware event */
> > > > > > @@ -91,9 +99,9 @@ static bool pmu_event_range_overlap(struct sbi_pmu_hw_event *evtA,
> > > > > >  }
> > > > > >
> > > > > >  static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
> > > > > > -                                    uint64_t select_val)
> > > > > > +                                    uint64_t select_val, uint64_t select_mask)
> > > > > >  {
> > > > > > -       if (evt->select == select_val)
> > > > > > +       if ((evt->select == select_val) && (evt->select_mask == select_mask))
> > > > > >                 return TRUE;
> > > > > >
> > > > > >         return FALSE;
> > > > > > @@ -168,7 +176,7 @@ int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval)
> > > > > >  }
> > > > > >
> > > > > >  static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
> > > > > > -                               uint64_t select)
> > > > > > +                               uint64_t select, uint64_t select_mask)
> > > > > >  {
> > > > > >         int i = 0;
> > > > > >         bool is_overlap;
> > > > > > @@ -191,13 +199,15 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
> > > > > >         for (i = 0; i < num_hw_events; i++) {
> > > > > >                 if (eidx_start == SBI_PMU_EVENT_RAW_IDX)
> > > > > >                 /* All raw events have same event idx. Just do sanity check on select */
> > > > > > -                       is_overlap = pmu_event_select_overlap(&hw_event_map[i], select);
> > > > > > +                       is_overlap = pmu_event_select_overlap(&hw_event_map[i],
> > > > > > +                                                             select, select_mask);
> > > > > >                 else
> > > > > >                         is_overlap = pmu_event_range_overlap(&hw_event_map[i], event);
> > > > > >                 if (is_overlap)
> > > > > >                         goto reset_event;
> > > > > >         }
> > > > > >
> > > > > > +       event->select_mask = select_mask;
> > > > > >         event->counters = cmap;
> > > > > >         event->select = select;
> > > > > >         num_hw_events++;
> > > > > > @@ -221,13 +231,13 @@ int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap)
> > > > > >              eidx_end == SBI_PMU_EVENT_RAW_IDX)
> > > > > >                 return SBI_EINVAL;
> > > > > >
> > > > > > -       return pmu_add_hw_event_map(eidx_start, eidx_end, cmap, 0);
> > > > > > +       return pmu_add_hw_event_map(eidx_start, eidx_end, cmap, 0, 0);
> > > > > >  }
> > > > > >
> > > > > > -int sbi_pmu_add_raw_event_counter_map(uint64_t select, u32 cmap)
> > > > > > +int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32 cmap)
> > > > > >  {
> > > > > >         return pmu_add_hw_event_map(SBI_PMU_EVENT_RAW_IDX,
> > > > > > -                                   SBI_PMU_EVENT_RAW_IDX, cmap, select);
> > > > > > +                                   SBI_PMU_EVENT_RAW_IDX, cmap, select, select_mask);
> > > > > >  }
> > > > > >
> > > > > >  static int pmu_ctr_enable_irq_hw(int ctr_idx)
> > > > > > @@ -514,9 +524,13 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
> > > > > >                         continue;
> > > > > >
> > > > > >                 /* For raw events, event data is used as the select value */
> > > > > > -               if ((event_idx == SBI_PMU_EVENT_RAW_IDX) && temp->select != data)
> > > > > > -                       continue;
> > > > > > +               if (event_idx == SBI_PMU_EVENT_RAW_IDX) {
> > > > > > +                       uint64_t select_mask = temp->select_mask;
> > > > > >
> > > > > > +                       /* The non-event map bits of data should match the selector */
> > > > > > +                       if (temp->select != (data & select_mask))
> > > > > > +                               continue;
> > > > >
> > > > > Dear Atish:
> > > > > I am sorry that I didn't follow up on this change at that time, so
> > > > > this is a late reply.
> > > > > I found the v4 patch set lacks the following code which casues the
> > > > > bitmap encoding feature not to work properly.
> > > > >
> > > > > + if (event_idx == SBI_PMU_EVENT_RAW_IDX) {
> > > > > + uint64_t select_mask = temp->select_mask;
> > > > >
> > > > > + /* Check the bit filed encoded by a real number */
> > > > > + if ((temp->select & select_mask) != (data & select_mask))
> > > > > + continue;
> > > > > ********************************* Missing part
> > > > > ********************************************
> > > > > + /* Check the bit filed encoded by a bitmap */
> > > > > + else if ((temp->select & ~select_mask & data) != (~select_mask & data))
> > > > > + continue;
> > > > > ***********************************************************************************************
> > > > > + }
> > > > > I found the above code exists in my v2 patch but was removed in your
> > > > > v4 patch. I guess this might be an accident. If yes, I can send
> > > > > another patch to add this code back. If not, please tell me the reason
> > > > > and I need to come out with another solution to get the bitmap
> > > > > encoding feature to work.
> > > > >
> > >
> > > Sorry for missing your message last friday. I did not notice it this week.
> > > I flipped the meaning of the mask in this case to keep it simple.
> > > IIRC, your earlier implementation was
> > > setting the bits for encoding of the events in the mask.
> > >
> > > In my implementation, the mask would clear out those bits meant to
> > > encode the value.
> > > In other words, the lower bits used to encode a set of events should
> > > be set to zero.
> > > The 1st column represents the match value of the mask & possible encoded events.
> > >
> > > The documentation in the pmu_support.md is a bit confusing and the
> > > example is incorrect. I will send a patch to fix it.
> > >
> > Hi Atish,
> > Thank you for your reply and explanations. However, I still felt a
> > little confused about the current implementation.
> > IIUC, according to your descriptions, if the select value is composed
> > of value and bitmap, users should set the corresponding bits of the
> > select mask to 1 to indicate these bits encoded by a value. For
>
> I think you misunderstood again. There is a mask and match value.
> The bits encoding the value of the event should be cleared in the mask.
> The bits common across all the event set should be set in the match.
>

You are right, I misunderstand again. Currently, I have successfully
applied the current implementation to our scenario. Thank you for your
explanations.

By the way, IIRC, the example in pmu_support.md is for the unmatched
board, right?
If yes, according to the document
https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf,
the riscv,raw-event-to-mhpmcounters will be
riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0xc>,
                             <0x0 0x1 0xffffffff 0xfff800ff 0xc>,
                             <0x0 0x2 0xffffffff 0xffffe0ff 0xc>,
If you think the update is correct, I can send a patch to revise the
example in pmu_support.md. In addition, I will follow the same
document to correct the value of "riscv,event-to-mhpmevent" and
"riscv,event-to-mhpmcounters". Hope it can make pmu_support.md
clearer.


> > example, if the mhpmevent3 can support the raw event 0xffff01, whose
> > bit[0:8] is encoded by a value, and bit[9:63] is encoded by a bit map.
> > In this case, the corresponding dts node for it will be <0 0xffff01
> > 0x0 0xff 0x8>.
>
> Let's say: The raw event are 0xffff01 - 0xffffff
> Here the bit[0:8] must be cleared in the mask. The mask should
>
> select_mask <0xFFFFFFFF 0xFFFFFF00>
>
>  select          <0x0 0xFFFF00>
>
> riscv,raw-event-to-mhpmcounters = <0x0 0xFFFF00 0xFFFFFFFF 0xFFFFFF00 0x8>;
>
> For any raw event id 0xffff01 will pass the condition below condition
>
> (temp->select != (data & select_mask))
>
>
> Another use case:
> raw event range that needs to be supported : 0x0001 - 0xFFFF
> (consecutive event ids)
> In this case, there are no common bits across all the events. Thus,
> the select value
> should be 0x0.
> The DT node should look like:
> riscv,raw-event-to-mhpmcounters = <0x00 0x00 0xFFFFFFFF 0xFFFF0000 0x00008>;
>
>
> >
> > Now, users want to find a mhpmevent which can support the raw event
> > 0x3f01. The mhpmevent3 definitely can satisfy the user's requirements.
>
> What's the expected event ID range here ? Earlier you mentioned
> bits[0:8] are used for encoding.
> If it is a different set of event IDs e.g. 0x3f01 -- 0x3fff, it has to
> be a separate entry in the DT.
>
> Assuming : The event ID range is 0x3f01 -- 0x3fff
> The DT node would be
> riscv,raw-event-to-mhpmcounters = <0x0 0x3F00 0xFFFFFFFF 0xFFFFFF00 0x00008>;
>                                                            |
> ----select---||-------- mask ------------------|
> bits[0:8] are cleared in the mask because they are used to encode the
> individual event ID
> bits[9:14] are set because they are common across all the events. So
> it is the match value.
>
> > However, the pmu_ctr_find_hw() will not pick up the mhpmevent3 because
> > the if (temp->select != (data & select_mask)) condition will be true.
> > Therefore, it will execute the continue to skip mhpmevent3.
> >
> >     for (i = 0; i < num_hw_events; i++) {
> >         ....
> >         if (event_idx == SBI_PMU_EVENT_RAW_IDX) {
> >             uint64_t select_mask = temp->select_mask;
> >             ...
> >             if (temp->select != (data & select_mask))
> >             // The temp->select is 0xffff01, the data is 0x3f01 and
> > the select_mask is 0xff. Therefore, the value in the if condition will
> > be if(0xffff01 != (0x3f01 & 0xff))
> >                 continue;
> >         }
> >
> >
> > I believe my v2 patch has the same definition of the select and
> > select_mask as your v4 patch. The following is my implementation in my
>
> No. your v2 had the reverse definition of my v4 patch. Your mask sets
> the bits used for encoding of
> the events while mine clears. This helped to simplify the code without any loss.
>
> > v2 patch,
> >     for (i = 0; i < num_hw_events; i++) {
> >         ....
> >         if (event_idx == SBI_PMU_EVENT_RAW_IDX) {
> >             uint64_t select_mask = temp->select_mask;
> >
> >             if ((temp->select & select_mask) != (data & select_mask))
> >                  continue;
> >             else if ((temp->select & ~select_mask & data) !=
> > (~select_mask & data))
> >                  continue;
> >          }
> > when addressing the above example, the first condition will be false because
> > if ((0xffff01 & 0xff) != (0x3f01 & 0xff)). Them the second condition
> > will be false as well because if ((0xffff01 & 0xffffffffffffffff00 &
> > 0x3f01) != (0x3f01 & 0xffffffffffffffff00)). Therefore, the mhpmevent3
> > will be chosen.
> >
> > Hope I don't misunderstand your means. If you want to review the
> > related implementations in my v2 patch, the link to it is here
> > http://lists.infradead.org/pipermail/opensbi/2021-November/002110.html.
> > Thank you!
> >
> >
> > > > > Sorry again for the late reply.
> > > > >
> > > > > Regards,
> > > > > Vincent
> > > > >
> > > > >
> > > >
> > > > Hi Atish,
> > > > This is a gentle ping. Do you have any idea about this?
> > > > If not, I will revise this part code as my v2 patch and send it to the
> > > > mailing list for review.
> > > > Thank you.
> > > >
> > > > Best regards,
> > > > Vincent
> > > >
> > > > > > +               }
> > > > > >                 /* Fixed counters should not be part of the search */
> > > > > >                 ctr_mask = temp->counters & (cmask << cbase) &
> > > > > >                            (~SBI_PMU_FIXED_CTR_MASK);
> > > > > > @@ -546,7 +560,6 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
> > > > > >                 else
> > > > > >                         return SBI_EFAIL;
> > > > > >         }
> > > > > > -
> > > > > >         ret = pmu_update_hw_mhpmevent(temp, ctr_idx, flags, event_idx, data);
> > > > > >
> > > > > >         if (!ret)
> > > > > > diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
> > > > > > index 529ee420554f..a2b048f0ab29 100644
> > > > > > --- a/lib/utils/fdt/fdt_pmu.c
> > > > > > +++ b/lib/utils/fdt/fdt_pmu.c
> > > > > > @@ -65,7 +65,7 @@ int fdt_pmu_setup(void *fdt)
> > > > > >         const u32 *event_val;
> > > > > >         const u32 *event_ctr_map;
> > > > > >         struct fdt_pmu_hw_event_select *event;
> > > > > > -       uint64_t raw_selector;
> > > > > > +       uint64_t raw_selector, select_mask;
> > > > > >         u32 event_idx_start, event_idx_end, ctr_map;
> > > > > >
> > > > > >         if (!fdt)
> > > > > > @@ -99,14 +99,16 @@ int fdt_pmu_setup(void *fdt)
> > > > > >         }
> > > > > >
> > > > > >         event_val = fdt_getprop(fdt, pmu_offset, "riscv,raw-event-to-mhpmcounters", &len);
> > > > > > -       if (!event_val || len < 8)
> > > > > > +       if (!event_val || len < 20)
> > > > > >                 return SBI_EFAIL;
> > > > > > -       len = len / (sizeof(u32) * 3);
> > > > > > +       len = len / (sizeof(u32) * 5);
> > > > > >         for (i = 0; i < len; i++) {
> > > > > > -               raw_selector = fdt32_to_cpu(event_val[3 * i]);
> > > > > > -               raw_selector = (raw_selector << 32) | fdt32_to_cpu(event_val[3 * i + 1]);
> > > > > > -               ctr_map = fdt32_to_cpu(event_val[3 * i + 2]);
> > > > > > -               result = sbi_pmu_add_raw_event_counter_map(raw_selector, ctr_map);
> > > > > > +               raw_selector = fdt32_to_cpu(event_val[5 * i]);
> > > > > > +               raw_selector = (raw_selector << 32) | fdt32_to_cpu(event_val[5 * i + 1]);
> > > > > > +               select_mask = fdt32_to_cpu(event_val[5 * i + 2]);
> > > > > > +               select_mask = (select_mask  << 32) | fdt32_to_cpu(event_val[5 * i + 3]);
> > > > > > +               ctr_map = fdt32_to_cpu(event_val[5 * i + 4]);
> > > > > > +               result = sbi_pmu_add_raw_event_counter_map(raw_selector, select_mask, ctr_map);
> > > > > >                 if (!result)
> > > > > >                         hw_event_count++;
> > > > > >         }
> > > > > > --
> > > > > > 2.33.1
> > > > > >
> > > >
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > >
> > >
> > >
> > > --
> > > Regards,
> > > Atish
>
>
>
> --
> Regards,
> Atish

