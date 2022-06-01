From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Jun 2022 16:21:01 +0530
Subject: [PATCH] lib: sbi_timer: Drop unnecessary get_platform_ticks wrapper
In-Reply-To: <CAAhSdy1=LbZCtVOiQG_E4MAHOTixMu2hsrG_jP=AcUL3NzgFNg@mail.gmail.com>
References: <20220529170048.60646-1-samuel@sholland.org> <CAAhSdy1=LbZCtVOiQG_E4MAHOTixMu2hsrG_jP=AcUL3NzgFNg@mail.gmail.com>
Message-ID: <CAAhSdy1+2jXiyASqqqnnncP2AjQoskXmrM==n-GAuX+ddW2pdw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 30, 2022 at 10:48 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Sun, May 29, 2022 at 10:31 PM Samuel Holland <samuel@sholland.org> wrote:
> >
> > The device's timer_value callback is already the right prototype to use
> > for the get_time_val function pointer.
> >
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> >
> >  lib/sbi/sbi_timer.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> > index 353886f..b0a6e63 100644
> > --- a/lib/sbi/sbi_timer.c
> > +++ b/lib/sbi/sbi_timer.c
> > @@ -44,11 +44,6 @@ static u64 get_ticks(void)
> >  }
> >  #endif
> >
> > -static u64 get_platform_ticks(void)
> > -{
> > -       return timer_dev->timer_value();
> > -}
> > -
> >  static void nop_delay_fn(void *opaque)
> >  {
> >         cpu_relax();
> > @@ -167,7 +162,7 @@ void sbi_timer_set_device(const struct sbi_timer_device *dev)
> >
> >         timer_dev = dev;
> >         if (!get_time_val && timer_dev->timer_value)
> > -               get_time_val = get_platform_ticks;
> > +               get_time_val = timer_dev->timer_value;
> >  }
> >
> >  int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
> > --
> > 2.35.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

