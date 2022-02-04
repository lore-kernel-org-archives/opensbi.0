From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Feb 2022 10:16:40 +0530
Subject: [PATCH v1 1/3] lib: sbi: Map only the counters enabled in hardware
In-Reply-To: <CAAhSdy2ue2m=czFx=PRnhDo+tU_69Qrq0N5bLXrn5EHrj0VjNw@mail.gmail.com>
References: <20220107185409.1172221-1-atishp@rivosinc.com>
 <20220107185409.1172221-2-atishp@rivosinc.com>
 <CAAhSdy2ue2m=czFx=PRnhDo+tU_69Qrq0N5bLXrn5EHrj0VjNw@mail.gmail.com>
Message-ID: <CAAhSdy2oRrc_YhEWU_F9g-nShDOwXrQ562WZyTbL9XD_S3wEJA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 31, 2022 at 6:26 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Jan 8, 2022 at 12:24 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > The counter mapping in DT may be incorrect if all the counters specified
> > in the mapping are actually not physically present in the hardware.
> > OpenSBI should only keep a mapping of counters enabled in hardware and
> > defined in DT. This assume that all the programmable hpmcounters are
> > consecutive as it doesn't make sense to build a system with sparse
> > hpmcounters.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/openbis repo.

Regards,
Anup

>
> Regards,
> Anup
>
> > ---
> >  lib/sbi/sbi_pmu.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > index 5b845f835e79..376afec13491 100644
> > --- a/lib/sbi/sbi_pmu.c
> > +++ b/lib/sbi/sbi_pmu.c
> > @@ -181,6 +181,9 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
> >         int i = 0;
> >         bool is_overlap;
> >         struct sbi_pmu_hw_event *event = &hw_event_map[num_hw_events];
> > +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> > +       int hw_ctr_avail = sbi_hart_mhpm_count(scratch);
> > +       uint32_t ctr_avail_mask = ((uint32_t)(~0) >> (32 - (hw_ctr_avail + 3)));
> >
> >         /* The first two counters are reserved by priv spec */
> >         if (eidx_start > SBI_PMU_HW_INSTRUCTIONS && (cmap & SBI_PMU_FIXED_CTR_MASK))
> > @@ -208,7 +211,8 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
> >         }
> >
> >         event->select_mask = select_mask;
> > -       event->counters = cmap;
> > +       /* Map the only the counters that are available in the hardware */
> > +       event->counters = cmap & ctr_avail_mask;
> >         event->select = select;
> >         num_hw_events++;
> >
> > --
> > 2.30.2
> >

