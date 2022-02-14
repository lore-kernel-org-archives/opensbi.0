From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Mon, 14 Feb 2022 16:10:15 +0300
Subject: [PATCH 3/3] lib: utils/timer: check if addr exists
In-Reply-To: <CAAhSdy1cyzNWi-ur3+hOr4wMD8BrbG3orVX7bAiBZ0FCPzHjVA@mail.gmail.com>
References: <20220211111155.16121-1-nikita.shubin@maquefel.me>
 <20220211111155.16121-4-nikita.shubin@maquefel.me>
 <CAAhSdy09-_PLevRFmqzWwx3S-DXPrfm+FsLxEBSxLe-VN8TNZg@mail.gmail.com>
 <20220214150916.1cba020e@redslave.neermore.group>
 <CAAhSdy1cyzNWi-ur3+hOr4wMD8BrbG3orVX7bAiBZ0FCPzHjVA@mail.gmail.com>
Message-ID: <20220214161015.2ab93fe9@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 14 Feb 2022 17:57:44 +0530
Anup Patel <anup@brainfault.org> wrote:

> On Mon, Feb 14, 2022 at 5:39 PM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:
> >
> > Hello Anup!
> >
> > On Mon, 14 Feb 2022 17:08:36 +0530
> > Anup Patel <anup@brainfault.org> wrote:
> >  
> > > On Fri, Feb 11, 2022 at 4:42 PM Nikita Shubin
> > > <nikita.shubin@maquefel.me> wrote:  
> > > >
> > > > From: Nikita Shubin <n.shubin@yadro.com>
> > > >
> > > > In case we want shared time addr register for different
> > > > mtimer's, we need to check if region was already added to
> > > > domain, otherwise sbi_domain_root_add_memregion will fail and
> > > > will couse init to fail with:
> > > > init_coldboot: timer init failed (error -3)  
> > >
> > > A mtimer device has two separate base addresses:
> > > 1) mtime base address
> > > 2) mtimecmp base address
> > >
> > > Two separate mtimer devices can share the same mtime register
> > > but cannot share mtimecmp registers.  
> >
> > In case mtimecmp is less than mtime it is possible to run in
> > following situation:
> >
> > - mtimecmp 0 - N - 1 and mtime are not adjusted and treated
> > separately, mtime exists check succeed
> > - mtimecmp N is adjusted to mtime and gets merged to
> > mt->mtimecmp_addr
> >   + mt->mtime_size + mt->mtimecmp_size and fails with region
> > conflict with existing mtime region added from previous steps
> >
> > How about dropping these two checks:
> >
> > if (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
> > ...
> > } else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
> >
> > sbi_domain will take care of and merge these separate regions, so we
> > can check only mtime addr.
> >
> > What do you think about this ?  
> 
> I am still trying to understand the issue.
> 
> Can you share example DT nodes ?

That's a bit modified example from your presentation on plumbers:

mtimer0: mtimer at 30000000 {
	compatible = "riscv,aclint-mtimer";
	reg = <0x3a000000 0x8>,
	 /* MTIME */
	<0x30000000 0x20>; /* MTIMECMPs */
	interrupts-extended = <0x04 7>;
};

mtimer1: mtimer at 31000000 {
	compatible = "riscv,aclint-mtimer";
	reg = <0x3a000000 0x8>,
	 /* MTIME */
	<0x31000000 0x20>; /* MTIMECMPs */
	interrupts-extended = <0x02 7>;
};

The regions are not adjusted and this will fail.

Adjusted regions like i described:

mtimer0: mtimer at 30000000 {
	compatible = "riscv,aclint-mtimer";
	reg = <0x30000000 0x1000>,
	 /* MTIME */
	<0x2ffff000 0x1000>; /* MTIMECMPs */
	interrupts-extended = <0x04 7>;
};

mtimer1: mtimer at 31000000 {
	compatible = "riscv,aclint-mtimer";
	reg = <0x30000000 0x1000>,
	 /* MTIME */
	<0x2fffe000 0x1000>; /* MTIMECMPs */
	interrupts-extended = <0x02 7>;
};

The main reason why earlier worked becouse qemu generates mtimer
bindings like this:

reg = <0x00 0x200bff8 0x00 0x4008 0x00 0x2004000 0x00 0x7ff8>;

In other words everything bigger than 0x1000 will succeed becouse of
sbi_domain bug corrected in patch 1.


> 
> Regards,
> Anup
> 
> >
> >  
> > >
> > > Regards,
> > > Anup
> > >  
> > > >
> > > > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > > > ---
> > > >  lib/utils/timer/aclint_mtimer.c | 51
> > > > ++++++++++++++++++++++++++------- 1 file changed, 40
> > > > insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/lib/utils/timer/aclint_mtimer.c
> > > > b/lib/utils/timer/aclint_mtimer.c index a957b1c..2c90e22 100644
> > > > --- a/lib/utils/timer/aclint_mtimer.c
> > > > +++ b/lib/utils/timer/aclint_mtimer.c
> > > > @@ -175,6 +175,9 @@ int aclint_mtimer_cold_init(struct
> > > > aclint_mtimer_data *mt, {
> > > >         u32 i;
> > > >         int rc;
> > > > +       struct aclint_mtimer_data *last_mt = NULL;
> > > > +       bool skip_time_addr = false;
> > > > +       bool skip_timecmp_addr = false;
> > > >
> > > >         /* Sanity checks */
> > > >         if (!mt || !mt->mtime_size ||
> > > > @@ -206,27 +209,53 @@ int aclint_mtimer_cold_init(struct
> > > > aclint_mtimer_data *mt, for (i = 0; i < mt->hart_count; i++)
> > > >                 mtimer_hartid2data[mt->first_hartid + i] = mt;
> > > >
> > > > +       /* Check if timer or timercmp addr already exists
> > > > +        * otherwise aclint_mtimer_add_regions will fail
> > > > +        * becouse of regions conflict.
> > > > +        */
> > > > +       for (i = 0; i < mt->first_hartid; i++) {
> > > > +               if (last_mt && last_mt == mtimer_hartid2data[i])
> > > > +                       continue;
> > > > +
> > > > +               if (mtimer_hartid2data[i]->mtime_addr ==
> > > > mt->mtime_addr)
> > > > +                       skip_time_addr = true;
> > > > +
> > > > +               if (mtimer_hartid2data[i]->mtimecmp_addr ==
> > > > mt->mtimecmp_addr)
> > > > +                       skip_timecmp_addr = true;
> > > > +
> > > > +               if (skip_time_addr && skip_timecmp_addr)
> > > > +                       break;
> > > > +
> > > > +               last_mt = mtimer_hartid2data[i];
> > > > +       }
> > > > +
> > > >         /* Add MTIMER regions to the root domain */
> > > > -       if (mt->mtime_addr == (mt->mtimecmp_addr +
> > > > mt->mtimecmp_size)) {
> > > > +       if ((mt->mtime_addr == (mt->mtimecmp_addr +
> > > > mt->mtimecmp_size)) &&
> > > > +               !skip_timecmp_addr) {
> > > >                 rc =
> > > > aclint_mtimer_add_regions(mt->mtimecmp_addr, mt->mtime_size +
> > > > mt->mtimecmp_size); if (rc)
> > > >                         return rc;
> > > > -       } else if (mt->mtimecmp_addr == (mt->mtime_addr +
> > > > mt->mtime_size)) {
> > > > +       } else if (mt->mtimecmp_addr == (mt->mtime_addr +
> > > > mt->mtime_size) &&
> > > > +               !skip_time_addr) {
> > > >                 rc = aclint_mtimer_add_regions(mt->mtime_addr,
> > > >                                         mt->mtime_size +
> > > > mt->mtimecmp_size); if (rc)
> > > >                         return rc;
> > > >         } else {
> > > > -               rc = aclint_mtimer_add_regions(mt->mtime_addr,
> > > > -                                               mt->mtime_size);
> > > > -               if (rc)
> > > > -                       return rc;
> > > > -
> > > > -               rc =
> > > > aclint_mtimer_add_regions(mt->mtimecmp_addr,
> > > > -
> > > > mt->mtimecmp_size);
> > > > -               if (rc)
> > > > -                       return rc;
> > > > +               if (!skip_time_addr) {
> > > > +                       rc =
> > > > aclint_mtimer_add_regions(mt->mtime_addr,
> > > > +
> > > > mt->mtime_size);
> > > > +                       if (rc)
> > > > +                               return rc;
> > > > +               }
> > > > +
> > > > +               if (!skip_timecmp_addr) {
> > > > +                       rc =
> > > > aclint_mtimer_add_regions(mt->mtimecmp_addr,
> > > > +
> > > > mt->mtimecmp_size);
> > > > +                       if (rc)
> > > > +                               return rc;
> > > > +               }
> > > >         }
> > > >
> > > >         mtimer.timer_freq = mt->mtime_freq;
> > > > --
> > > > 2.31.1
> > > >
> > > >
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi  
> >  


