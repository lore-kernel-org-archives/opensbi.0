From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 14:13:52 +0530
Subject: [RFC PATCH 7/9] lib: sbi: Allow programmable counters to monitor
 cycle/instret events
In-Reply-To: <20210909204031.1239254-8-atish.patra@wdc.com>
References: <20210909204031.1239254-1-atish.patra@wdc.com>
 <20210909204031.1239254-8-atish.patra@wdc.com>
Message-ID: <CAAhSdy1nZ70aO8yR6O0fYO83TBRL7xnRuuO6zBTm6itcUQGxFw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 2:10 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> A platform may use programmable counters for cycle/instret events.
> The priv spec allows that provided that cycle/instret also report those

s/spec allows that/spec allows this/

> events in addition to the programmable counters. We should allow that
> functionality in OpenSBI.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_pmu.c | 57 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 16 deletions(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index dbad4478e7e7..20f78c75200e 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -175,9 +175,7 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
>         struct sbi_pmu_hw_event *event = &hw_event_map[num_hw_events];
>
>         /* The first two counters are reserved by priv spec */
> -       if ((eidx_start == SBI_PMU_HW_CPU_CYCLES && cmap != 0x1) ||
> -           (eidx_start == SBI_PMU_HW_INSTRUCTIONS && cmap != 0x4) ||
> -           (eidx_start > SBI_PMU_HW_INSTRUCTIONS && (cmap & 0x07)))
> +       if (eidx_start > SBI_PMU_HW_INSTRUCTIONS && (cmap & 0x07))
>                 return SBI_EDENIED;
>
>         if (num_hw_events >= SBI_PMU_HW_EVENT_MAX - 1) {
> @@ -188,8 +186,6 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
>
>         event->start_idx = eidx_start;
>         event->end_idx = eidx_end;
> -       event->counters = cmap;
> -       event->select = select;
>
>         /* Sanity check */
>         for (i = 0; i < num_hw_events; i++) {
> @@ -199,11 +195,19 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
>                 else
>                         is_overlap = pmu_event_range_overlap(&hw_event_map[i], event);
>                 if (is_overlap)
> -                       return SBI_EINVALID_ADDR;
> +                       goto reset_event;
>         }
> +
> +       event->counters = cmap;
> +       event->select = select;
>         num_hw_events++;
>
>         return 0;
> +
> +reset_event:
> +       event->start_idx = 0;
> +       event->end_idx = 0;
> +       return SBI_EINVAL;
>  }
>
>  /**
> @@ -436,23 +440,36 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
>         return 0;
>  }
>
> +static int pmu_ctr_find_fixed_fw(unsigned long evt_idx_code)
> +{
> +       /* Non-programmables counters are enabled always. No need to do lookup */

s/are enabled always/are always enabled/

> +       if (evt_idx_code == SBI_PMU_HW_CPU_CYCLES)
> +               return 0;
> +       else if (evt_idx_code == SBI_PMU_HW_INSTRUCTIONS)
> +               return 2;
> +       else
> +               return SBI_EINVAL;
> +}
> +
>  static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned long flags,
>                            unsigned long event_idx, uint64_t data)
>  {
>         unsigned long ctr_mask;
> -       int i, ret = 0, ctr_idx = SBI_ENOTSUPP;
> +       int i, ret = 0, fixed_ctr, ctr_idx = SBI_ENOTSUPP;
>         struct sbi_pmu_hw_event *temp;
>         unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
> -       int evt_idx_code = get_cidx_code(event_idx);
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       bool sscof_present = sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOF);
>
>         if (cbase > num_hw_ctrs)
>                 return SBI_EINVAL;
>
> -       /* Non-programmables counters are enabled always. No need to do lookup */
> -       if (evt_idx_code == SBI_PMU_HW_CPU_CYCLES)
> -               return 0;
> -       else if (evt_idx_code == SBI_PMU_HW_INSTRUCTIONS)
> -               return 2;
> +       /* If Sscof is present try to find the programmable counter for
> +        * cycle/instret as well.
> +        */

Please use a double winged comment block.

> +       fixed_ctr = pmu_ctr_find_fixed_fw(event_idx);
> +       if (fixed_ctr >= 0 && !sscof_present)
> +               return fixed_ctr;
>
>         for (i = 0; i < num_hw_events; i++) {
>                 temp = &hw_event_map[i];
> @@ -464,7 +481,8 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>                 if ((event_idx == SBI_PMU_EVENT_RAW_IDX) && temp->select != data)
>                         continue;
>
> -               ctr_mask = temp->counters & (cmask << cbase);
> +               /* Fixed counters should not be part of the search */
> +               ctr_mask = temp->counters & (cmask << cbase) & (~0x07);

Please use #define for fixed counters here and other places.

>                 for_each_set_bit_from(cbase, &ctr_mask, SBI_PMU_HW_CTR_MAX) {
>                         if (__test_bit(cbase, &mctr_inhbt)) {
>                                 ctr_idx = cbase;
> @@ -473,8 +491,15 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>                 }
>         }
>
> -       if (ctr_idx == SBI_ENOTSUPP)
> -               return SBI_EFAIL;
> +       if (ctr_idx == SBI_ENOTSUPP) {
> +               /* We can't find any programmable counters for cycle/instret.
> +                * Return the fixed counter as they are mandatory anyways.
> +                */

Please use a double winged comment block here.

> +               if (fixed_ctr >= 0)
> +                       return fixed_ctr;
> +               else
> +                       return SBI_EFAIL;
> +       }
>
>         ret = pmu_update_hw_mhpmevent(temp, ctr_idx, flags, event_idx, data);
>
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

