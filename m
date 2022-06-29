From: Adnan Chowdhury <adnan.chowdhury@sifive.com>
Date: Wed, 29 Jun 2022 16:33:44 +0100
Subject: [RFC PATCH 1/1] lib: sbi_timer: Added a blocking wait function
 that waits until a certain condition is true or timeout occurs
In-Reply-To: <E084D9FD-D992-487F-B699-BFE8E2C73E16@jrtc27.com>
References: <20220629134257.374341-1-adnan.chowdhury@sifive.com>
 <20220629134257.374341-2-adnan.chowdhury@sifive.com> <E084D9FD-D992-487F-B699-BFE8E2C73E16@jrtc27.com>
Message-ID: <CAAsT5XodOzAWWJCJDzeq2RURguWg0UgNX_bo8urFvCEA6fzzRg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 29, 2022 at 4:04 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 29 Jun 2022, at 14:42, Adnan Rahman Chowdhury <adnan.chowdhury@sifive.com> wrote:
> >
> > Motivation: Suppose a peripheral needs to be configured to transmit data.
> > There is an SFR bit which indicates that the peripheral is ready to transmit.
> > The firmware should check the bit and will only transmit data when the
> > peripheral is ready. When the firmware starts polling the SFR, the peripheral
> > could be busy transmitting/receiving other data so the firmware must wait
> > till that completes. Assuming that there is no other way, the
> > firmware shouldn't wait indefinitely.
> >
> > The function sbi_timer_waitms_until() will constantly check whether a certain
> > condition is met, or timeout occurs. It can be used for the cases when a
> > timeout is required.
> >
> > Signed-off-by: Adnan Rahman Chowdhury <adnan.chowdhury@sifive.com>
> > ---
> > include/sbi/sbi_timer.h |  3 +++
> > lib/sbi/sbi_timer.c     | 18 ++++++++++++++++++
> > 2 files changed, 21 insertions(+)
> >
> > diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
> > index 63ef1af..ea3dbdd 100644
> > --- a/include/sbi/sbi_timer.h
> > +++ b/include/sbi/sbi_timer.h
> > @@ -48,6 +48,9 @@ static inline void sbi_timer_udelay(ulong usecs)
> >       sbi_timer_delay_loop(usecs, 1000000, NULL, NULL);
> > }
> >
> > +bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
> > +                         uint64_t timeout_ms);
> > +
> > /** Get timer value for current HART */
> > u64 sbi_timer_value(void);
> >
> > diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> > index acdba92..d93036d 100644
> > --- a/lib/sbi/sbi_timer.c
> > +++ b/lib/sbi/sbi_timer.c
> > @@ -81,6 +81,24 @@ void sbi_timer_delay_loop(ulong units, u64 unit_freq,
> >               delay_fn(opaque);
> > }
> >
> > +bool sbi_timer_waitms_until(bool(*predicate)(void*), void* arg,
> > +                         uint64_t timeout_ms)
>
> bool (*predicate)(void *) and void *arg

Thanks for pointing this out.

>
> > +{
> > +     bool ret = true;
> > +     uint64_t start_time = sbi_timer_value();
> > +     uint64_t ticks =
> > +             (sbi_timer_get_device()->timer_freq / 1000) *
> > +             (timeout_ms);
>
> Parens around a variable?

This was actually a macro in the project I'm working on. Later I moved
it to be a function, looks suitable for sbi_timer. The parentheses came
from the macro. Will remove it.

>
> > +     do {
> > +             if (predicate(arg))
> > +                     break;
> > +             if (sbi_timer_value() - start_time  >= ticks)
>
> if (sbi_timer_value() - start_time >= ticks)
>
> > +                     ret = false;
> > +     } while(ret);
>
> while (ret)
>
> Though this would be much more natural as:
>
> while (!prediate(arg)) {
>         if (sbi_timer_value() - start_time >= ticks)
>                 return false;
> }
>
> return true;

This version is cleaner. Will update the patch. Thank you.

>
> Or if you really want to avoid early return:
>
> ret = true;
> while (!prediate(arg)) {
>         if (sbi_timer_value() - start_time >= ticks) {
>                 ret = false;
>                 break;
>         }
> }
>
> return ret;
>
> But I think early return is clearer here.
>
> Jess
>
> > +
> > +     return ret;
> > +}
> > +
> > u64 sbi_timer_value(void)
> > {
> >       if (get_time_val)
> > --
> > 2.30.2
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>

--
Best Regards,
Adnan Rahman Chowdhury

