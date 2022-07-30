From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Jul 2022 15:54:58 +0530
Subject: [PATCH v3 2/4] lib: sbi: Add the bound check for events during
 config match
In-Reply-To: <20220721054629.lurwim3jm7ggr26h@kamzik>
References: <20220720215035.3453553-1-atishp@rivosinc.com> <20220720215035.3453553-3-atishp@rivosinc.com>
 <20220721054629.lurwim3jm7ggr26h@kamzik>
Message-ID: <CAAhSdy1Ka_1Xa_UBOao=Kyqiz2_womMHzQdTGzp1VTC-DnAWyQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 21, 2022 at 11:16 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Jul 20, 2022 at 02:50:33PM -0700, Atish Patra wrote:
> > Currently, there is no sanity check for firmware event code. We don't see
> > any issue as Linux kernel driver does a bound check on firmware events
> > already. However, OpenSBI can't assume sane supervisor mode software
> > always. Thus, an invalid event idx can cause a buffer overflow error.
> > For hardware events, the match will fail for invalid event code anyways.
> > However, a search is unecessary if event code is invalid.
> >
> > Add a event ID validation function to solve the issue.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  lib/sbi/sbi_pmu.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 44 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > index 31631a2fab80..bd1ef8665a70 100644
> > --- a/lib/sbi/sbi_pmu.c
> > +++ b/lib/sbi/sbi_pmu.c
> > @@ -107,6 +107,44 @@ static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
> >       return FALSE;
> >  }
> >
> > +static int pmu_event_validate(unsigned long event_idx)
> > +{
> > +     uint32_t event_idx_type = get_cidx_type(event_idx);
> > +     uint32_t event_idx_code = get_cidx_code(event_idx);
> > +     uint32_t event_idx_code_max = -1;
> > +     uint32_t cache_ops_result, cache_ops_id, cache_id;
> > +
> > +     switch(event_idx_type) {
> > +     case SBI_PMU_EVENT_TYPE_HW:
> > +             event_idx_code_max = SBI_PMU_HW_GENERAL_MAX;
> > +             break;
> > +     case SBI_PMU_EVENT_TYPE_FW:
> > +             event_idx_code_max = SBI_PMU_FW_MAX;
> > +             break;
> > +     case SBI_PMU_EVENT_TYPE_HW_CACHE:
> > +             cache_ops_result = event_idx_code & 0x1;
> > +             cache_ops_id = (event_idx_code & 0x06) >> 1;
> > +             cache_id = (event_idx_code & 0xfff8) >> 3;
>
> It'd be nice to introduce helper macros for these.

I have added appropriate defines in include/sbi/sbi_ecall_interface.h and
used it here at time of merging this patch.

>
> > +             if ((cache_ops_result < SBI_PMU_HW_CACHE_RESULT_MAX) &&
> > +                 (cache_ops_id < SBI_PMU_HW_CACHE_OP_MAX) &&
> > +                 (cache_id < SBI_PMU_HW_CACHE_MAX))
> > +                     return event_idx_type;
> > +             else
> > +                     return SBI_EINVAL;
> > +             break;
> > +     case SBI_PMU_EVENT_TYPE_HW_RAW:
> > +             event_idx_code_max = 1; // event_idx.code should be zero
> > +             break;
> > +     default:
> > +             return SBI_EINVAL;
> > +     }
> > +
> > +     if (event_idx_code < event_idx_code_max)
> > +             return event_idx_type;
> > +
> > +     return SBI_EINVAL;
> > +}
> > +
> >  static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
> >  {
> >       uint32_t event_idx_val;
> > @@ -614,12 +652,16 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
> >  {
> >       int ctr_idx = SBI_ENOTSUPP;
> >       u32 hartid = current_hartid();
> > -     int event_type = get_cidx_type(event_idx);
> > +     int event_type;
> >       struct sbi_pmu_fw_event *fevent;
> >       uint32_t fw_evt_code;
> >
> >       /* Do a basic sanity check of counter base & mask */
> > -     if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs || event_type >= SBI_PMU_EVENT_TYPE_MAX)
> > +     if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
> > +             return SBI_EINVAL;
> > +
> > +     event_type = pmu_event_validate(event_idx);
> > +     if (event_type < 0)
> >               return SBI_EINVAL;
> >
> >       if (flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
> > --
> > 2.25.1
> >
>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

