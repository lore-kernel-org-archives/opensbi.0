From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 12 Aug 2021 16:10:22 -0700
Subject: [PATCH v2 5/5] lib: utils/timer: Simplify MTIMER synchronization
In-Reply-To: <CAAhSdy1WgQ7fLTzrwyZ+S5oqw_yX0iHPd5c6FO0d=xosrN6m6g@mail.gmail.com>
References: <20210807133322.545675-1-anup.patel@wdc.com>
 <20210807133322.545675-6-anup.patel@wdc.com>
 <CAOnJCUJrAmB53o_rYX8Oam2T7D37cb24GX07K5FiJU8--UcVCA@mail.gmail.com>
 <CAAhSdy0LJHPy5smQp1zrmCMzWM=J_YWTysx7unC6WTMrQ81rHQ@mail.gmail.com>
 <CAOnJCUK6dCSDHaVhmh7KJ_W70CB34goAy7gWgTfePSDKKma96w@mail.gmail.com>
 <CAAhSdy1WgQ7fLTzrwyZ+S5oqw_yX0iHPd5c6FO0d=xosrN6m6g@mail.gmail.com>
Message-ID: <CAOnJCUJcZA-5KT3VqDSiuvKi2TShEwK+1yqVCD_MCt6FFOpLeA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 12, 2021 at 9:54 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Aug 12, 2021 at 8:39 PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Wed, Aug 11, 2021 at 9:19 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Thu, Aug 12, 2021 at 2:37 AM Atish Patra <atishp@atishpatra.org> wrote:
> > > >
> > > > On Sat, Aug 7, 2021 at 6:34 AM Anup Patel <anup.patel@wdc.com> wrote:
> > > > >
> > > > > We simplify MTIMER synchronization as follows:
> > > > >
> > > > > 1) Detect MTIMER devices with unique (or non-shared) MTIME
> > > > >    register at boot-time
> > > > > 2) Select first MTIMER device with no associated HART as our
> > > > >    reference MTIMER device
> > > > > 3) Only synchronize MTIMER devices with unique (or non-shared)
> > > > >    MTIME register using reference MTIMER device
> > > > > 4) Directly update the MTIME register at time of synchronization
> > > > >    because MTIME is a read/write register.
> > > > >
> > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > ---
> > > > >  include/sbi_utils/timer/aclint_mtimer.h |  7 ++-
> > > > >  lib/utils/timer/aclint_mtimer.c         | 67 +++++++++++++++----------
> > > > >  lib/utils/timer/fdt_timer_mtimer.c      | 39 ++++++++++++--
> > > > >  3 files changed, 80 insertions(+), 33 deletions(-)
> > > > >
> > > > > diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
> > > > > index fdc46cd..a9fe445 100644
> > > > > --- a/include/sbi_utils/timer/aclint_mtimer.h
> > > > > +++ b/include/sbi_utils/timer/aclint_mtimer.h
> > > > > @@ -31,14 +31,19 @@ struct aclint_mtimer_data {
> > > > >         u32 first_hartid;
> > > > >         u32 hart_count;
> > > > >         bool has_64bit_mmio;
> > > > > +       bool has_shared_mtime;
> > > > >         /* Private details (initialized and used by ACLINT MTIMER library) */
> > > > >         struct aclint_mtimer_data *time_delta_reference;
> > > > >         unsigned long time_delta_computed;
> > > > > -       u64 time_delta;
> > > > >         u64 (*time_rd)(volatile u64 *addr);
> > > > >         void (*time_wr)(bool timecmp, u64 value, volatile u64 *addr);
> > > > >  };
> > > > >
> > > > > +void aclint_mtimer_sync(struct aclint_mtimer_data *mt);
> > > > > +
> > > > > +void aclint_mtimer_set_reference(struct aclint_mtimer_data *mt,
> > > > > +                                struct aclint_mtimer_data *ref);
> > > > > +
> > > > >  int aclint_mtimer_warm_init(void);
> > > > >
> > > > >  int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
> > > > > diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> > > > > index 0e4e846..d612b12 100644
> > > > > --- a/lib/utils/timer/aclint_mtimer.c
> > > > > +++ b/lib/utils/timer/aclint_mtimer.c
> > > > > @@ -57,7 +57,7 @@ static u64 mtimer_value(void)
> > > > >         u64 *time_val = (void *)mt->mtime_addr;
> > > > >
> > > > >         /* Read MTIMER Time Value */
> > > > > -       return mt->time_rd(time_val) + mt->time_delta;
> > > > > +       return mt->time_rd(time_val);
> > > > >  }
> > > > >
> > > > >  static void mtimer_event_stop(void)
> > > > > @@ -77,7 +77,7 @@ static void mtimer_event_start(u64 next_event)
> > > > >         u64 *time_cmp = (void *)mt->mtimecmp_addr;
> > > > >
> > > > >         /* Program MTIMER Time Compare */
> > > > > -       mt->time_wr(true, next_event - mt->time_delta,
> > > > > +       mt->time_wr(true, next_event,
> > > > >                     &time_cmp[target_hart - mt->first_hartid]);
> > > > >  }
> > > > >
> > > > > @@ -88,36 +88,51 @@ static struct sbi_timer_device mtimer = {
> > > > >         .timer_event_stop = mtimer_event_stop
> > > > >  };
> > > > >
> > > > > +void aclint_mtimer_sync(struct aclint_mtimer_data *mt)
> > > > > +{
> > > > > +       u64 v1, v2, mv, delta;
> > > > > +       u64 *mt_time_val, *ref_time_val;
> > > > > +       struct aclint_mtimer_data *reference;
> > > > > +
> > > > > +       /* Sync-up non-shared MTIME if reference is available */
> > > > > +       if (mt->has_shared_mtime || !mt->time_delta_reference)
> > > > > +               return;
> > > > > +
> > > > > +       reference = mt->time_delta_reference;
> > > > > +       mt_time_val = (void *)mt->mtime_addr;
> > > > > +       ref_time_val = (void *)reference->mtime_addr;
> > > > > +       if (!atomic_raw_xchg_ulong(&mt->time_delta_computed, 1)) {
> > > > > +               v1 = mt->time_rd(mt_time_val);
> > > > > +               mv = reference->time_rd(ref_time_val);
> > > > > +               v2 = mt->time_rd(mt_time_val);
> > > > > +               delta = mv - ((v1 / 2) + (v2 / 2));
> > > > > +               mt->time_wr(false, mt->time_rd(mt_time_val) + delta,
> > > > > +                           mt_time_val);
> > > > > +       }
> > > > > +
> > > > > +}
> > > > > +
> > > > > +void aclint_mtimer_set_reference(struct aclint_mtimer_data *mt,
> > > > > +                                struct aclint_mtimer_data *ref)
> > > > > +{
> > > > > +       if (!mt || !ref || mt == ref)
> > > > > +               return;
> > > > > +
> > > > > +       mt->time_delta_reference = ref;
> > > > > +       mt->time_delta_computed = 0;
> > > > > +}
> > > > > +
> > > > >  int aclint_mtimer_warm_init(void)
> > > > >  {
> > > > > -       u64 v1, v2, mv;
> > > > > +       u64 *mt_time_cmp;
> > > > >         u32 target_hart = current_hartid();
> > > > > -       struct aclint_mtimer_data *reference;
> > > > > -       u64 *mt_time_val, *mt_time_cmp, *ref_time_val;
> > > > >         struct aclint_mtimer_data *mt = mtimer_hartid2data[target_hart];
> > > > >
> > > > >         if (!mt)
> > > > >                 return SBI_ENODEV;
> > > > >
> > > > > -       /*
> > > > > -        * Compute delta if reference available
> > > > > -        *
> > > > > -        * We deliberately compute time_delta in warm init so that time_delta
> > > > > -        * is computed on a HART which is going to use given MTIMER. We use
> > > > > -        * atomic flag timer_delta_computed to ensure that only one HART does
> > > > > -        * time_delta computation.
> > > > > -        */
> > > > > -       if (mt->time_delta_reference) {
> > > > > -               reference = mt->time_delta_reference;
> > > > > -               mt_time_val = (void *)mt->mtime_addr;
> > > > > -               ref_time_val = (void *)reference->mtime_addr;
> > > > > -               if (!atomic_raw_xchg_ulong(&mt->time_delta_computed, 1)) {
> > > > > -                       v1 = mt->time_rd(mt_time_val);
> > > > > -                       mv = reference->time_rd(ref_time_val);
> > > > > -                       v2 = mt->time_rd(mt_time_val);
> > > > > -                       mt->time_delta = mv - ((v1 / 2) + (v2 / 2));
> > > > > -               }
> > > > > -       }
> > > > > +       /* Sync-up MTIME register */
> > > > > +       aclint_mtimer_sync(mt);
> > > > >
> > > > >         /* Clear Time Compare */
> > > > >         mt_time_cmp = (void *)mt->mtimecmp_addr;
> > > > > @@ -173,9 +188,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
> > > > >                 return SBI_EINVAL;
> > > > >
> > > > >         /* Initialize private data */
> > > > > -       mt->time_delta_reference = reference;
> > > > > -       mt->time_delta_computed = 0;
> > > > > -       mt->time_delta = 0;
> > > > > +       aclint_mtimer_set_reference(mt, reference);
> > > > >         mt->time_rd = mtimer_time_rd32;
> > > > >         mt->time_wr = mtimer_time_wr32;
> > > > >
> > > > > diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> > > > > index 15a36ed..26b5a2a 100644
> > > > > --- a/lib/utils/timer/fdt_timer_mtimer.c
> > > > > +++ b/lib/utils/timer/fdt_timer_mtimer.c
> > > > > @@ -17,19 +17,18 @@
> > > > >
> > > > >  static unsigned long mtimer_count = 0;
> > > > >  static struct aclint_mtimer_data mtimer[MTIMER_MAX_NR];
> > > > > +static struct aclint_mtimer_data *mt_reference = NULL;
> > > > >
> > > > >  static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> > > > >                                   const struct fdt_match *match)
> > > > >  {
> > > > > -       int rc;
> > > > > +       int i, rc;
> > > > >         unsigned long offset, addr[2], size[2];
> > > > > -       struct aclint_mtimer_data *mt, *mtmaster = NULL;
> > > > > +       struct aclint_mtimer_data *mt;
> > > > >
> > > > >         if (MTIMER_MAX_NR <= mtimer_count)
> > > > >                 return SBI_ENOSPC;
> > > > >         mt = &mtimer[mtimer_count];
> > > > > -       if (0 < mtimer_count)
> > > > > -               mtmaster = &mtimer[0];
> > > > >
> > > > >         rc = fdt_parse_aclint_node(fdt, nodeoff, true,
> > > > >                                    &addr[0], &size[0], &addr[1], &size[1],
> > > > > @@ -37,6 +36,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> > > > >         if (rc)
> > > > >                 return rc;
> > > > >         mt->has_64bit_mmio = true;
> > > > > +       mt->has_shared_mtime = false;
> > > > >
> > > > >         if (match->data) { /* SiFive CLINT */
> > > > >                 /* Set CLINT addresses */
> > > > > @@ -63,10 +63,39 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> > > > >                         mt->has_64bit_mmio = false;
> > > > >         }
> > > > >
> > > > > -       rc = aclint_mtimer_cold_init(mt, mtmaster);
> > > > > +       /* Check if MTIMER device has shared MTIME address */
> > > > > +       mt->has_shared_mtime = false;
> > > > > +       for (i = 0; i < mtimer_count; i++) {
> > > > > +               if (mtimer[i].mtime_addr == mt->mtime_addr) {
> > > > > +                       mt->has_shared_mtime = true;
> > > > > +                       break;
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       /* Initialize the MTIMER device */
> > > > > +       rc = aclint_mtimer_cold_init(mt, mt_reference);
> > > > >         if (rc)
> > > > >                 return rc;
> > > > >
> > > > > +       /*
> > > > > +        * Select first MTIMER device with no associated HARTs as
> > > > > +        * our reference MTIMER device
> > > > > +        */
> > > > > +       if (!mt->hart_count && !mt_reference) {
> > > > > +               mt_reference = mt;
> > > > > +               /*
> > > > > +                * Set reference for already propbed MTIMER devices
> > > > > +                * with non-shared MTIME
> > > > > +                */
> > > > > +               for (i = 0; i < mtimer_count; i++)
> > > > > +                       if (!mtimer[i].has_shared_mtime)
> > > > > +                               aclint_mtimer_set_reference(&mtimer[i], mt);
> > > > > +       }
> > > > > +
> > > >
> > > > Is there a reason this is done after cold_init ?
> > >
> > > We should select a MTIMER device as reference only after it is
> > > successfully initialized by the cold_init(). This ensures that even the
> > > reference MTIMER device has gone through all sanity checks.
> >
> > Got it. Thanks.
> >
> > >
> > > Also, simply selecting the first successfully initialized MTIMER device is
> > > also not appropriate because we don't know how MTIMER devices are
> > > ordered in DT.
> > >
> > > For now, the strategy is to select a successfully initialized MTIMER
> > > device with hart_count = 0 as reference. In future, we might select
> >
> > Is this information documented somewhere ? The platform must have a
> > MTIMER device
> > with zero hart_count in order to get a reference.
>
> This is OpenSBI specific strategy. We can put comments in code if you
> want.
>

IMO, it should be in the docs. It should also say the below text about
this being a current strategy which
may change in future if a dedicated DT property is defined.

> >
> > Just for my understanding, when do we need multiple MTIMER devices
> > with zero hart count in multi-socket
> > scenarios ?
>
> If we define special DT properties in future for selecting a reference
> MTIMER device in a multi-socket or multi-die system then we don't
> need to MTIMER DT nodes with zero harts.
>
> The approach of selecting MTIMER devices with zero harts is
> temporary because I did not want to not define DT properties which
> are not immediately required.
>
> >
> > > optional DT property to help us select the reference MTIMER device.
> > >
> > > Regards,
> > > Anup
> > >
> > > >
> > > > > +       /* Explicitly sync-up MTIMER devices not associated with any HARTs */
> > > > > +       if (!mt->hart_count)
> > > > > +               aclint_mtimer_sync(mt);
> > > > > +
> > > > >         mtimer_count++;
> > > > >         return 0;
> > > > >  }
> > > > > --
> > > > > 2.25.1
> > > > >
> > > > >
> > > > > --
> > > > > opensbi mailing list
> > > > > opensbi at lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > > >
> > > >
> > > > --
> > > > Regards,
> > > > Atish
> >
> > Other than that, this patch looks good to me.
> >
> > Reviewed-by: Atish Patra <atish.patra@wdc.com>
> >
> >
> > --
> > Regards,
> > Atish
>
> Regards,
> Anup



-- 
Regards,
Atish

