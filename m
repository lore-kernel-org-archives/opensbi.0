From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 18 Feb 2022 14:42:19 +0530
Subject: [PATCH 3/3] lib: utils/timer: check if addr exists
In-Reply-To: <20220218114500.01eb34e2@redslave.neermore.group>
References: <20220211111155.16121-1-nikita.shubin@maquefel.me>
 <20220211111155.16121-4-nikita.shubin@maquefel.me>
 <CAAhSdy09-_PLevRFmqzWwx3S-DXPrfm+FsLxEBSxLe-VN8TNZg@mail.gmail.com>
 <20220214150916.1cba020e@redslave.neermore.group>
 <CAAhSdy1cyzNWi-ur3+hOr4wMD8BrbG3orVX7bAiBZ0FCPzHjVA@mail.gmail.com>
 <20220214161015.2ab93fe9@redslave.neermore.group>
 <CAAhSdy1YpCU5BHC1NTFAbJGQXHmdKDq1Xp-Di8Jp7BgYGR72zA@mail.gmail.com>
 <20220218114500.01eb34e2@redslave.neermore.group>
Message-ID: <CAK9=C2WxpV0mNUgHics_SHoBw0hF_cpKD=PdFN3sSh+8wB94YA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 18, 2022 at 2:15 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> Hello Anup!
>
> On Fri, 18 Feb 2022 10:59:56 +0530
> Anup Patel <anup@brainfault.org> wrote:
>
> Thas't a bit more complicated than i thought, if we remove the region
> bounds checks in aclint_mtimer driver we run into following:
>
>
> ```
> aclint_mtimer_add_regions : addr=0x200bff8, size=0x4008
> aclint_mtimer_add_regions : pos=0x200bff8, rsize=0x8
> aclint_mtimer_add_regions : reg->base=0x200bff8, size=0x7
> aclint_mtimer_add_regions : pos=0x200c000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x200c000, size=0xfff
> aclint_mtimer_add_regions : pos=0x200d000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x200d000, size=0xfff
> aclint_mtimer_add_regions : pos=0x200e000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x200e000, size=0xfff
> aclint_mtimer_add_regions : pos=0x200f000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x200f000, size=0xfff
> aclint_mtimer_add_regions : addr=0x2004000, size=0x7ff8
> aclint_mtimer_add_regions : pos=0x2004000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x2004000, size=0xfff
> aclint_mtimer_add_regions : pos=0x2005000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x2005000, size=0xfff
> aclint_mtimer_add_regions : pos=0x2006000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x2006000, size=0xfff
> aclint_mtimer_add_regions : pos=0x2007000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x2007000, size=0xfff
> aclint_mtimer_add_regions : pos=0x2008000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x2008000, size=0xfff
> aclint_mtimer_add_regions : pos=0x2009000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x2009000, size=0xfff
> aclint_mtimer_add_regions : pos=0x200a000, rsize=0x1000
> aclint_mtimer_add_regions : reg->base=0x200a000, size=0xfff
> aclint_mtimer_add_regions : pos=0x200b000, rsize=0xff8
> aclint_mtimer_add_regions : reg->base=0x200b000, size=0xfff
> sbi_domain_root_add_memregion: is_region_conflict check failed
> 0x200b000 conflicts existing 0x200bff8
> init_coldboot: timer init failed (error -6)
> ```
>
> QEMU virt machine dts with aclint=on:
>
> mtimer at 2004000 {
>         interrupts-extended = <0x04 0x07 0x02 0x07>;
>         reg = <0x00 0x200bff8 0x00 0x4008
>                 0x00 0x2004000 0x00 0x7ff8>;
>         compatible = "riscv,aclint-mtimer";
> };
>
> Indeed:
>
> ```
> (gdb) p/x 0x2004000 + 0x7ff8 + 0x4008
> $8 = 0x2010000
> ```
>
> Give's us proper aligned region, while adding separate mtime/mtimecmp
> gives us an overlap on adding, so i have to think about this.

When mtime and mtimecmp are at separate locations, we should at least
check whether the mtime region is already added.
OR
Maybe we can do something similar to this patch except we don't need
skip_timecmp_addr since every mtimer device will have a unique set of
mtimecmp registers.

Regards,
Anup

>
>
> > On Mon, Feb 14, 2022 at 6:40 PM Nikita Shubin
> > <nikita.shubin@maquefel.me> wrote:
> > >
> > > On Mon, 14 Feb 2022 17:57:44 +0530
> > > Anup Patel <anup@brainfault.org> wrote:
> > >
> > > > On Mon, Feb 14, 2022 at 5:39 PM Nikita Shubin
> > > > <nikita.shubin@maquefel.me> wrote:
> > > > >
> > > > > Hello Anup!
> > > > >
> > > > > On Mon, 14 Feb 2022 17:08:36 +0530
> > > > > Anup Patel <anup@brainfault.org> wrote:
> > > > >
> > > > > > On Fri, Feb 11, 2022 at 4:42 PM Nikita Shubin
> > > > > > <nikita.shubin@maquefel.me> wrote:
> > > > > > >
> > > > > > > From: Nikita Shubin <n.shubin@yadro.com>
> > > > > > >
> > > > > > > In case we want shared time addr register for different
> > > > > > > mtimer's, we need to check if region was already added to
> > > > > > > domain, otherwise sbi_domain_root_add_memregion will fail
> > > > > > > and will couse init to fail with:
> > > > > > > init_coldboot: timer init failed (error -3)
> > > > > >
> > > > > > A mtimer device has two separate base addresses:
> > > > > > 1) mtime base address
> > > > > > 2) mtimecmp base address
> > > > > >
> > > > > > Two separate mtimer devices can share the same mtime register
> > > > > > but cannot share mtimecmp registers.
> > > > >
> > > > > In case mtimecmp is less than mtime it is possible to run in
> > > > > following situation:
> > > > >
> > > > > - mtimecmp 0 - N - 1 and mtime are not adjusted and treated
> > > > > separately, mtime exists check succeed
> > > > > - mtimecmp N is adjusted to mtime and gets merged to
> > > > > mt->mtimecmp_addr
> > > > >   + mt->mtime_size + mt->mtimecmp_size and fails with region
> > > > > conflict with existing mtime region added from previous steps
> > > > >
> > > > > How about dropping these two checks:
> > > > >
> > > > > if (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
> > > > > ...
> > > > > } else if (mt->mtimecmp_addr == (mt->mtime_addr +
> > > > > mt->mtime_size)) {
> > > > >
> > > > > sbi_domain will take care of and merge these separate regions,
> > > > > so we can check only mtime addr.
> > > > >
> > > > > What do you think about this ?
> > > >
> > > > I am still trying to understand the issue.
> > > >
> > > > Can you share example DT nodes ?
> > >
> > > That's a bit modified example from your presentation on plumbers:
> > >
> > > mtimer0: mtimer at 30000000 {
> > >         compatible = "riscv,aclint-mtimer";
> > >         reg = <0x3a000000 0x8>,
> > >          /* MTIME */
> > >         <0x30000000 0x20>; /* MTIMECMPs */
> > >         interrupts-extended = <0x04 7>;
> > > };
> > >
> > > mtimer1: mtimer at 31000000 {
> > >         compatible = "riscv,aclint-mtimer";
> > >         reg = <0x3a000000 0x8>,
> > >          /* MTIME */
> > >         <0x31000000 0x20>; /* MTIMECMPs */
> > >         interrupts-extended = <0x02 7>;
> > > };
> > >
> > > The regions are not adjusted and this will fail.
> > >
> > > Adjusted regions like i described:
> > >
> > > mtimer0: mtimer at 30000000 {
> > >         compatible = "riscv,aclint-mtimer";
> > >         reg = <0x30000000 0x1000>,
> > >          /* MTIME */
> > >         <0x2ffff000 0x1000>; /* MTIMECMPs */
> > >         interrupts-extended = <0x04 7>;
> > > };
> > >
> > > mtimer1: mtimer at 31000000 {
> > >         compatible = "riscv,aclint-mtimer";
> > >         reg = <0x30000000 0x1000>,
> > >          /* MTIME */
> > >         <0x2fffe000 0x1000>; /* MTIMECMPs */
> > >         interrupts-extended = <0x02 7>;
> > > };
> > >
> > > The main reason why earlier worked becouse qemu generates mtimer
> > > bindings like this:
> > >
> > > reg = <0x00 0x200bff8 0x00 0x4008 0x00 0x2004000 0x00 0x7ff8>;
> > >
> > > In other words everything bigger than 0x1000 will succeed becouse of
> > > sbi_domain bug corrected in patch 1.
> >
> > I understand the problem now.
> >
> > I agree with your suggestion. We should let sbi_domain do all the
> > region merging so we should drop following checks:
> > f (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
> > ...
> > } else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
> >
> > Also, we should only add mtime region if it is not already added by
> > other mtimer devices.
> >
> > Can you send a v2 patch ?
> >
> > Regards,
> > Anup
> >
> > >
> > >
> > > >
> > > > Regards,
> > > > Anup
> > > >
> > > > >
> > > > >
> > > > > >
> > > > > > Regards,
> > > > > > Anup
> > > > > >
> > > > > > >
> > > > > > > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > > > > > > ---
> > > > > > >  lib/utils/timer/aclint_mtimer.c | 51
> > > > > > > ++++++++++++++++++++++++++------- 1 file changed, 40
> > > > > > > insertions(+), 11 deletions(-)
> > > > > > >
> > > > > > > diff --git a/lib/utils/timer/aclint_mtimer.c
> > > > > > > b/lib/utils/timer/aclint_mtimer.c index a957b1c..2c90e22
> > > > > > > 100644 --- a/lib/utils/timer/aclint_mtimer.c
> > > > > > > +++ b/lib/utils/timer/aclint_mtimer.c
> > > > > > > @@ -175,6 +175,9 @@ int aclint_mtimer_cold_init(struct
> > > > > > > aclint_mtimer_data *mt, {
> > > > > > >         u32 i;
> > > > > > >         int rc;
> > > > > > > +       struct aclint_mtimer_data *last_mt = NULL;
> > > > > > > +       bool skip_time_addr = false;
> > > > > > > +       bool skip_timecmp_addr = false;
> > > > > > >
> > > > > > >         /* Sanity checks */
> > > > > > >         if (!mt || !mt->mtime_size ||
> > > > > > > @@ -206,27 +209,53 @@ int aclint_mtimer_cold_init(struct
> > > > > > > aclint_mtimer_data *mt, for (i = 0; i < mt->hart_count; i++)
> > > > > > >                 mtimer_hartid2data[mt->first_hartid + i] =
> > > > > > > mt;
> > > > > > >
> > > > > > > +       /* Check if timer or timercmp addr already exists
> > > > > > > +        * otherwise aclint_mtimer_add_regions will fail
> > > > > > > +        * becouse of regions conflict.
> > > > > > > +        */
> > > > > > > +       for (i = 0; i < mt->first_hartid; i++) {
> > > > > > > +               if (last_mt && last_mt ==
> > > > > > > mtimer_hartid2data[i])
> > > > > > > +                       continue;
> > > > > > > +
> > > > > > > +               if (mtimer_hartid2data[i]->mtime_addr ==
> > > > > > > mt->mtime_addr)
> > > > > > > +                       skip_time_addr = true;
> > > > > > > +
> > > > > > > +               if (mtimer_hartid2data[i]->mtimecmp_addr ==
> > > > > > > mt->mtimecmp_addr)
> > > > > > > +                       skip_timecmp_addr = true;
> > > > > > > +
> > > > > > > +               if (skip_time_addr && skip_timecmp_addr)
> > > > > > > +                       break;
> > > > > > > +
> > > > > > > +               last_mt = mtimer_hartid2data[i];
> > > > > > > +       }
> > > > > > > +
> > > > > > >         /* Add MTIMER regions to the root domain */
> > > > > > > -       if (mt->mtime_addr == (mt->mtimecmp_addr +
> > > > > > > mt->mtimecmp_size)) {
> > > > > > > +       if ((mt->mtime_addr == (mt->mtimecmp_addr +
> > > > > > > mt->mtimecmp_size)) &&
> > > > > > > +               !skip_timecmp_addr) {
> > > > > > >                 rc =
> > > > > > > aclint_mtimer_add_regions(mt->mtimecmp_addr, mt->mtime_size
> > > > > > > + mt->mtimecmp_size); if (rc)
> > > > > > >                         return rc;
> > > > > > > -       } else if (mt->mtimecmp_addr == (mt->mtime_addr +
> > > > > > > mt->mtime_size)) {
> > > > > > > +       } else if (mt->mtimecmp_addr == (mt->mtime_addr +
> > > > > > > mt->mtime_size) &&
> > > > > > > +               !skip_time_addr) {
> > > > > > >                 rc =
> > > > > > > aclint_mtimer_add_regions(mt->mtime_addr, mt->mtime_size +
> > > > > > > mt->mtimecmp_size); if (rc)
> > > > > > >                         return rc;
> > > > > > >         } else {
> > > > > > > -               rc =
> > > > > > > aclint_mtimer_add_regions(mt->mtime_addr,
> > > > > > > -
> > > > > > > mt->mtime_size);
> > > > > > > -               if (rc)
> > > > > > > -                       return rc;
> > > > > > > -
> > > > > > > -               rc =
> > > > > > > aclint_mtimer_add_regions(mt->mtimecmp_addr,
> > > > > > > -
> > > > > > > mt->mtimecmp_size);
> > > > > > > -               if (rc)
> > > > > > > -                       return rc;
> > > > > > > +               if (!skip_time_addr) {
> > > > > > > +                       rc =
> > > > > > > aclint_mtimer_add_regions(mt->mtime_addr,
> > > > > > > +
> > > > > > > mt->mtime_size);
> > > > > > > +                       if (rc)
> > > > > > > +                               return rc;
> > > > > > > +               }
> > > > > > > +
> > > > > > > +               if (!skip_timecmp_addr) {
> > > > > > > +                       rc =
> > > > > > > aclint_mtimer_add_regions(mt->mtimecmp_addr,
> > > > > > > +
> > > > > > > mt->mtimecmp_size);
> > > > > > > +                       if (rc)
> > > > > > > +                               return rc;
> > > > > > > +               }
> > > > > > >         }
> > > > > > >
> > > > > > >         mtimer.timer_freq = mt->mtime_freq;
> > > > > > > --
> > > > > > > 2.31.1
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > opensbi mailing list
> > > > > > > opensbi at lists.infradead.org
> > > > > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > > > >
> > >
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

