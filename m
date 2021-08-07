From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Aug 2021 20:56:56 +0530
Subject: [PATCH 4/5] lib: utils/timer: Allow ACLINT MTIMER supporting only
 32-bit MMIO
In-Reply-To: <AE608946-D528-4B6C-B01B-B53D39B55E23@jrtc27.com>
References: <20210724122503.2486624-1-anup.patel@wdc.com>
 <20210724122503.2486624-5-anup.patel@wdc.com>
 <AE608946-D528-4B6C-B01B-B53D39B55E23@jrtc27.com>
Message-ID: <CAAhSdy2Eb-TTTBnwTEvgzPrh+YwSJXGWCCheBQWiDOzo2CusqA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 7, 2021 at 7:55 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 24 Jul 2021, at 13:25, Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We can have ACLINT MTIMER devices which only support 32-bit MMIO
> > accesses on RV64 system so this patch adds a boolean DT property
> > "mtimer,no-64bit-mmio" to detect this from MTIMER DT node.
>
> Can the ACLINT not just mandate 64-bit accesses must work? FreeBSD and
> Linux aren?t going to want to support such broken implementations, and
> I would hope at least the upcoming platform spec will mandate 64-bit
> access, if not the ACLINT itself.

This has been discussed on the AIA mailing lists.

The ACLINT spec can't mandate 64-bit MMIO access because there is
a cost associated in using wider bus between harts and ACLINT device
to support 64-bit MMIO accesses.

Andrew confirmed that the RISC-V privilege spec does not explicitly
state that 64-MMIO accesses are mandatory for MTIME and MTIMECMP
on RV64 systems.

Refer:
https://lists.riscv.org/g/tech-aia/message/114
https://lists.riscv.org/g/tech-aia/message/115
https://lists.riscv.org/g/tech-aia/message/117
https://lists.riscv.org/g/tech-aia/message/118
https://lists.riscv.org/g/tech-aia/message/119
https://lists.riscv.org/g/tech-aia/message/120


Regards,
Anup



>
> Jess
>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> > lib/utils/timer/fdt_timer_mtimer.c | 3 +++
> > 1 file changed, 3 insertions(+)
> >
> > diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> > index b08ed38..15a36ed 100644
> > --- a/lib/utils/timer/fdt_timer_mtimer.c
> > +++ b/lib/utils/timer/fdt_timer_mtimer.c
> > @@ -58,6 +58,9 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >               mt->mtime_size = size[0];
> >               mt->mtimecmp_addr = addr[1];
> >               mt->mtimecmp_size = size[1];
> > +             /* Parse additional ACLINT MTIMER properties */
> > +             if (fdt_getprop(fdt, nodeoff, "mtimer,no-64bit-mmio", &rc))
> > +                     mt->has_64bit_mmio = false;
> >       }
> >
> >       rc = aclint_mtimer_cold_init(mt, mtmaster);
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>

