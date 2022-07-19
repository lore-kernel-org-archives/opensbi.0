From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 19 Jul 2022 12:33:47 -0700
Subject: [PATCH 1/2] lib: sbi: Add the bound check for firmware events
In-Reply-To: <20220719071029.te2tqptafw7kilxm@kamzik>
References: <20220718200458.3015600-1-atishp@rivosinc.com> <20220719071029.te2tqptafw7kilxm@kamzik>
Message-ID: <CAHBxVyG-1=wzch+p7ZDb2pMYHZHwks-oj-aBg9_At5_Ug4E=ng@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 19, 2022 at 12:10 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
>
> Hi Atish,
>
> Top posting because there's no cover letter to reply to. While reviewing
> for this patch I see another buffer overrun possibility in
> pmu_ctr_validate()
>
> static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
> {
>         uint32_t event_idx_val;
>         uint32_t event_idx_type;
>         u32 hartid = current_hartid();
>
>         event_idx_val = active_events[hartid][cidx]; <--- Here, because...
>
> ...we have...
>
> int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval)
> {
>         int event_idx_type;
>         uint32_t event_code;
>         uint64_t cval64;
>
>         event_idx_type = pmu_ctr_validate(cidx, &event_code);
>
> ...where sbi_pmu_ctr_read() is called directly from the ecall handler
> passing a0 for cidx.
>

Yes. I do have the check cidx >= total_ctrs but it is placed after the
array access by mistake.
I will fix it in v2. Thanks for catching this.

> Thanks,
> drew
>
>
> On Mon, Jul 18, 2022 at 01:04:57PM -0700, Atish Patra wrote:
> > Currently, there is no sanity check for firmware event code. We don't see
> > any issue as Linux kernel driver does a bound check on firmware events
> > already. However, OpenSBI can't assume sane supervisor mode software
> > always. Thus, an invalid event idx can cause a buffer overflow error.
> >
> > Improve the sanity check for firmware events.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  lib/sbi/sbi_pmu.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > index 3f5fd1031b25..65bc9dd63f6b 100644
> > --- a/lib/sbi/sbi_pmu.c
> > +++ b/lib/sbi/sbi_pmu.c
> > @@ -123,6 +123,9 @@ static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
> >               return SBI_EINVAL;
> >
> >       *event_idx_code = get_cidx_code(event_idx_val);
> > +     if ((event_idx_type == SBI_PMU_EVENT_TYPE_FW) &&
> > +         (*event_idx_code >= SBI_PMU_FW_MAX))
> > +             return SBI_EINVAL;
> >
> >       return event_idx_type;
> >  }
> > @@ -652,6 +655,8 @@ skip_match:
> >                       pmu_ctr_start_hw(ctr_idx, 0, false);
> >       } else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
> >               fw_evt_code = get_cidx_code(event_idx);
> > +             if (unlikely(fw_evt_code >= SBI_PMU_FW_MAX))
> > +                     return SBI_ENOTSUPP;
> >               fevent = &fw_event_map[hartid][fw_evt_code];
> >               if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
> >                       fevent->curr_count = 0;
> > @@ -721,7 +726,7 @@ static void pmu_reset_event_map(u32 hartid)
> >       /* Initialize the counter to event mapping table */
> >       for (j = 3; j < total_ctrs; j++)
> >               active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
> > -     for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
> > +     for (j = 0; j < SBI_PMU_FW_EVENT_MAX; j++)
> >               sbi_memset(&fw_event_map[hartid][j], 0,
> >                          sizeof(struct sbi_pmu_fw_event));
> >  }
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

