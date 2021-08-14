From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Aug 2021 09:20:51 +0530
Subject: [PATCH v2 4/5] lib: utils/timer: Allow ACLINT MTIMER supporting
 only 32-bit MMIO
In-Reply-To: <CAOnJCUKht+Wjw05KO3FNVNS4ND8HLXWrc+i0pYCws2_ZnaupYw@mail.gmail.com>
References: <20210807133322.545675-1-anup.patel@wdc.com>
 <20210807133322.545675-5-anup.patel@wdc.com>
 <CAOnJCUKht+Wjw05KO3FNVNS4ND8HLXWrc+i0pYCws2_ZnaupYw@mail.gmail.com>
Message-ID: <CAAhSdy2_+z9+=QaeY+bc9+uV-+iYkj-psmBmH85MBkTBXRvw+Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 11, 2021 at 9:58 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sat, Aug 7, 2021 at 6:34 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We can have ACLINT MTIMER devices which only support 32-bit MMIO
> > accesses on RV64 system so this patch adds a boolean DT property
> > "mtimer,no-64bit-mmio" to detect this from MTIMER DT node.
> >
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
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

>
> --
> Regards,
> Atish

