From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 16:36:28 +0530
Subject: [PATCH 4/5] lib: sbi: Add generic timer delay loop function
In-Reply-To: <CAEUhbmV+L7iVPvM5m4GYWfb+ZyRk29LcER327N5vx0vMRDLFGA@mail.gmail.com>
References: <20210915092128.1029868-1-anup.patel@wdc.com>
 <20210915092128.1029868-5-anup.patel@wdc.com>
 <CAEUhbmV+L7iVPvM5m4GYWfb+ZyRk29LcER327N5vx0vMRDLFGA@mail.gmail.com>
Message-ID: <CAAhSdy0b96vcYqJwawuvZ55x7t02L=BpMNj8ZL-Fkm+nfhf3Eg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 16, 2021 at 1:03 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Sep 15, 2021 at 5:22 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We now have frequency of the timer device provided by the platform
> > support so we can emulate desired delay using a loop where the number
> > loop iterations are based on timer frequency.
> >
> > This patch provides sbi_timer_delay_loop() for above purpose.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/sbi_timer.h | 16 ++++++++++++++++
> >  lib/sbi/sbi_timer.c     | 31 +++++++++++++++++++++++++++++++
> >  2 files changed, 47 insertions(+)
> >
> > diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
> > index 211e83d..63ef1af 100644
> > --- a/include/sbi/sbi_timer.h
> > +++ b/include/sbi/sbi_timer.h
> > @@ -32,6 +32,22 @@ struct sbi_timer_device {
> >
> >  struct sbi_scratch;
> >
> > +/** Generic delay loop of desired granularity */
> > +void sbi_timer_delay_loop(ulong units, u64 unit_freq,
> > +                         void (*delay_fn)(void *), void *opaque);
> > +
> > +/** Provide delay in terms of milliseconds */
> > +static inline void sbi_timer_mdelay(ulong msecs)
> > +{
> > +       sbi_timer_delay_loop(msecs, 1000, NULL, NULL);
> > +}
> > +
> > +/** Provide delay in terms of microseconds */
> > +static inline void sbi_timer_udelay(ulong usecs)
> > +{
> > +       sbi_timer_delay_loop(usecs, 1000000, NULL, NULL);
> > +}
> > +
> >  /** Get timer value for current HART */
> >  u64 sbi_timer_value(void);
> >
> > diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> > index 2759501..0bf91bb 100644
> > --- a/lib/sbi/sbi_timer.c
> > +++ b/lib/sbi/sbi_timer.c
> > @@ -8,6 +8,7 @@
> >   */
> >
> >  #include <sbi/riscv_asm.h>
> > +#include <sbi/riscv_barrier.h>
> >  #include <sbi/riscv_encoding.h>
> >  #include <sbi/sbi_error.h>
> >  #include <sbi/sbi_hart.h>
> > @@ -47,6 +48,36 @@ static u64 get_platform_ticks(void)
> >         return timer_dev->timer_value();
> >  }
> >
> > +static void nop_delay_fn(void *opaque)
> > +{
> > +       cpu_relax();
> > +}
> > +
> > +void sbi_timer_delay_loop(ulong units, u64 unit_freq,
> > +                         void (*delay_fn)(void *), void *opaque)
> > +{
> > +       u64 start_val, delta;
> > +
> > +       /* Do nothing if we don't have timer device */
> > +       if (!timer_dev || !get_time_val)
>
> Should we output a warning here?

Yes, we should have a warning here but we don't have
dedicated warning helpers in sbi_console.h. For now, I
will just put a sbi_printf() here which can be later replaced
by a warning helper.

>
> > +               return;
> > +
> > +       /* Compute desired timer value delta */
> > +       delta = ((u64)timer_dev->timer_freq * (u64)units);
> > +       delta = delta / unit_freq;
> > +
> > +       /* Save starting timer value */
> > +       start_val = get_time_val();
> > +
> > +       /* Use NOP delay function if delay function not available */
> > +       if (!delay_fn)
> > +               delay_fn = nop_delay_fn;
> > +
> > +       /* Busy loop until desired timer value delta reached */
> > +       while ((get_time_val() - start_val) < delta)
> > +               delay_fn(opaque);
> > +}
> > +
> >  u64 sbi_timer_value(void)
> >  {
> >         if (get_time_val)
> > --
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Anup

