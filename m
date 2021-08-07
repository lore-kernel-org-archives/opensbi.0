From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Aug 2021 18:47:33 +0530
Subject: [PATCH 4/5] lib: utils/timer: Allow ACLINT MTIMER supporting only
 32-bit MMIO
In-Reply-To: <CAOnJCUJovbgfLGuCQtYbRBDWsM0o8SXqjFkb3gCbsSzW7SSQzg@mail.gmail.com>
References: <20210724122503.2486624-1-anup.patel@wdc.com>
 <20210724122503.2486624-5-anup.patel@wdc.com>
 <CAOnJCUJovbgfLGuCQtYbRBDWsM0o8SXqjFkb3gCbsSzW7SSQzg@mail.gmail.com>
Message-ID: <CAAhSdy2nzPuNXFvJPMUn_=wpp83SeUpZps8_AWCcHBEBqz2XTw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 3, 2021 at 1:19 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sat, Jul 24, 2021 at 5:25 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We can have ACLINT MTIMER devices which only support 32-bit MMIO
> > accesses on RV64 system so this patch adds a boolean DT property
> > "mtimer,no-64bit-mmio" to detect this from MTIMER DT node.
> >
>
> Where is this property documented ? I couldn't find it in your v3
> aclint patch [1].
> Did I miss something?

I have updated DT bindings in linux v3 series. Please check again.

>
> I also think "mtimer,32bit-mmio" may be a better choice than
> "mtimer,no-64bit-mmio"
>
> [1]https://github.com/avpatel/linux/commits/riscv_aclint_v3

Actually, "mtimer,no-64bit-mmio" is more appropriate because
all registers of MTIMER are 64-bits wide so by default RV64
systems should support 64-bit MMIO for MTIMER. In fact, most
existing RV64 systems do support 64-bit MMIO for MTIMER.

Regards,
Anup

> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  lib/utils/timer/fdt_timer_mtimer.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> > index b08ed38..15a36ed 100644
> > --- a/lib/utils/timer/fdt_timer_mtimer.c
> > +++ b/lib/utils/timer/fdt_timer_mtimer.c
> > @@ -58,6 +58,9 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >                 mt->mtime_size = size[0];
> >                 mt->mtimecmp_addr = addr[1];
> >                 mt->mtimecmp_size = size[1];
> > +               /* Parse additional ACLINT MTIMER properties */
> > +               if (fdt_getprop(fdt, nodeoff, "mtimer,no-64bit-mmio", &rc))
> > +                       mt->has_64bit_mmio = false;
> >         }
> >
> >         rc = aclint_mtimer_cold_init(mt, mtmaster);
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
>
>
> --
> Regards,
> Atish

