From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 19 Jul 2022 12:40:37 -0700
Subject: [PATCH 1/2] lib: sbi: Add the bound check for firmware events
In-Reply-To: <20220719070235.yzfne4bwamh7a43n@kamzik>
References: <20220718200458.3015600-1-atishp@rivosinc.com> <20220719070235.yzfne4bwamh7a43n@kamzik>
Message-ID: <CAHBxVyG_7pcGw-prUi7oXK_YgVFxXt81i4xH6AAay9WF=DBx5w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 19, 2022 at 12:02 AM Andrew Jones <ajones@ventanamicro.com> wrote:
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
>
> I think it would be better to only write *event_idx_code if we know
> it's valid. Actually, maybe at the start of pmu_ctr_validate() we
> should initialize it to something we know is invalid and then at the
> bottom write it after we're sure we have something worth writing.
>
> If pmu_ctr_validate() should be used to validate all event types, then
> shouldn't we have a switch here, something like...
>
>   switch (event_idx_type) {
>   case SBI_PMU_EVENT_TYPE_HW:
>     if (code >= SBI_PMU_HW_MAX)
>         return SBI_EINVAL;
>     break;
>   case SBI_PMU_EVENT_TYPE_HW_CACHE:
>     if (code >= SBI_PMU_HW_CACHE_MAX)
>         return SBI_EINVAL;
>     break;
>   ...
>

We should probably do event id validation in cfg_match. If invalid
event id is passed in cfg_match,
the corresponding entry in active_events will always be set to
SBI_PMU_EVENT_IDX_INVALID.

Thus, we can avoid any kind of event validation here. I will improve
the cfg_match function instead
of this change.

> >
> >       return event_idx_type;
> >  }
> > @@ -652,6 +655,8 @@ skip_match:
> >                       pmu_ctr_start_hw(ctr_idx, 0, false);
> >       } else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
> >               fw_evt_code = get_cidx_code(event_idx);
> > +             if (unlikely(fw_evt_code >= SBI_PMU_FW_MAX))
> > +                     return SBI_ENOTSUPP;
>
> Validation buried down here is a bit scary. It would be much nicer if we
> could pull all the validation up to the ecall entry points.
>

Agreed. We should have event_validate called earlier in the
sbi_pmu_ctr_cfg_match.
Will fix it.

> >               fevent = &fw_event_map[hartid][fw_evt_code];
> >               if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
> >                       fevent->curr_count = 0;
> > @@ -721,7 +726,7 @@ static void pmu_reset_event_map(u32 hartid)
> >       /* Initialize the counter to event mapping table */
> >       for (j = 3; j < total_ctrs; j++)
> >               active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
> > -     for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
> > +     for (j = 0; j < SBI_PMU_FW_EVENT_MAX; j++)
>
> This change is not related to what the commit message is talking about,
> so it belongs in a separate patch.
>

Sure. Will do that.

> Thanks,
> drew
>
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

