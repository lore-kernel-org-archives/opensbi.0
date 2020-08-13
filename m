From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 13 Aug 2020 18:17:10 +0000
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
In-Reply-To: <126C21E4-08E4-42BE-9BE2-FA2D1C2B4EB6@jrtc27.com>
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
 <B98172B0-5CAA-48D2-A2F3-B4DB6B66FB16@jrtc27.com>
 <e3f6b789-0fa6-51f1-4cc4-f5eaa625b8df@gmx.de>
 <B63355E7-4A46-4492-A97F-DE576FB0DDA0@jrtc27.com>
 <6d7b8314-499e-07ef-36e9-8a14e8461bba@gmx.de>
 <126C21E4-08E4-42BE-9BE2-FA2D1C2B4EB6@jrtc27.com>
Message-ID: <DM6PR04MB6201BEC325F68916D0A94BCB8D430@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Jessica Clarke <jrtc27@jrtc27.com>
> Sent: 13 August 2020 23:42
> To: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Cc: Anup Patel <Anup.Patel@wdc.com>; Atish Patra
> <Atish.Patra@wdc.com>; Bin Meng <bmeng.cn@gmail.com>; Xiang Wang
> <merle@hardenedlinux.org>; opensbi at lists.infradead.org; Sean Anderson
> <seanga2@gmail.com>
> Subject: Re: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
> 
> On 13 Aug 2020, at 19:03, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > On 13.08.20 19:03, Jessica Clarke wrote:
> >> On 13 Aug 2020, at 17:51, Heinrich Schuchardt <xypron.glpk@gmx.de>
> wrote:
> >>> On 13.08.20 18:36, Jessica Clarke wrote:
> >>>> On 13 Aug 2020, at 17:24, Heinrich Schuchardt <xypron.glpk@gmx.de>
> wrote:
> >>>>>
> >>>>> OpenSBI hangs in wake_coldboot_harts() indefinitely on the
> >>>>> MaixDuino board when trying to boot U-Boot as FW_PAYLOAD.
> >>>>
> >>>> This smells of there being a more fundamental issue that's not
> >>>> being addressed which this manages to work around, either reliably
> >>>> or by chance. What is the actual deadlock condition you observe?
> >>>
> >>> There are only two function using coldboot_lock spinlock:
> >>>
> >>> * wake_coldboot_harts()
> >>> * wait_for_coldboot()
> >>>
> >>> wake_coldboot_harts() was entered but never left without patching
> >>> one of the functions.
> >>>
> >>> The Kendryte K210 has two harts. One goes the cold boot path while
> >>> the other is sent to the warm boot path.
> >>
> >> The K210's platform definition uses clint_ipi_send, which as far as I
> >> can tell is entirely non-blocking. The only thing wake_coldboot_harts
> >> does with the lock held is set coldboot_done to 1 and send an IPI to
> >> all the other harts. Thus wake_coldboot_harts should never be able to
> >> block holding the spin lock, meaning wait_for_coldboot should
> >> eventually wake up and be able to acquire the lock (on platforms that
> >> implement WFI fully it shouldn't have to wait long for the lock,
> >> though on platforms that make it a NOP there might be a bit of .
> >>
> >> Please further investigate (or explain if you already know) exactly
> >> how you end up in a deadlock situation between wake_coldboot_harts
> >> and wait_for_coldboot, as I cannot currently see how it could ever be
> >> possible.
> >>
> >>>>> Even if reading and writing coldboot_done is not atomic it is safe
> >>>>> to check it without using a spinlock.
> >>>>
> >>>> Maybe microarchitecturally on the specific hardware in question
> >>>> (though I wouldn't even be so certain about that), but definitely
> >>>> not in C. You now have a data race in reading coldboot_done, which
> >>>> isn't even volatile^, so a sufficiently smart compiler would be
> >>>> completely within its right to do whatever it wants to the code,
> >>>> including things like delete the loop entirely (or, slightly less
> >>>> dramatic, turn it into an if). This patch introduces undefined behaviour.
> >
> > The cold boot path prints out over the serial console so it is the
> > slow path. When it arrives at wake_coldboot_harts() the spinlock is
> > already held by wait_for_coldboot().
> >
> > You have two loops running at the same time:
> >
> > A loop in wait_for_coldboot() which switches the lock on and off
> > repeatedly and a second loop in wake_coldboot_harts' spin_lock().
> >
> > The warm hart releases the spin lock. This is detected by the cold
> > hart in spin_lock_check(). In the meantime the warm hart locks the
> > spinlock again and the cold hart fails in amoswap.w. This can go forever.
> >
> > It is only by different relative speed of the loops if other processor
> > got out of this situation.
> >
> > A loop as in wait_for_coldboot() reaquiring a lock immediately without
> > giving sufficient time for other threads to acquire the lock is simply
> > incorrect coding.
> >
> > The following change also resolves the problem:
> >
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c index
> > a7fb848..68be58f 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -132,12 +132,12 @@ static void wake_coldboot_harts(struct
> > sbi_scratch *scratch, u32 hartid) {
> >        const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> >
> > -       /* Acquire coldboot lock */
> > -       spin_lock(&coldboot_lock);
> > -
> >        /* Mark coldboot done */
> >        coldboot_done = 1;
> >
> > +       /* Acquire coldboot lock */
> > +       spin_lock(&coldboot_lock);
> > +
> >        /* Send an IPI to all HARTs waiting for coldboot */
> >        for (int i = 0; i <= sbi_scratch_last_hartid(); i++) {
> >                if ((i != hartid) &&
> 
> You don't want that; that causes the same kinds of data races for
> coldboot_done as before. What could be done is to instead release
> coldboot_lock earlier, provided it doesn't matter that the IPIs haven't been
> sent yet (I don't think it does, because they're already inherently
> asynchronous, so there's currently no guarantee that the IPIs have actually
> occurred when coldboot_lock is unlocked in its original location), but that
> won't fix anything for you if the issue is acquiring the lock in the first place in
> wake_coldboot_harts.
> 
> So, ok, your problem is not deadlock but livelock. As Atish has suggested,
> please try clearing MIP at some point during boot before wait_for_coldboot,
> as it really should not be repeatedly trying to acquire the lock.

I suggest we:
1. Convert coldboot_done into atomic variable don't use coldboot_lock for it
2. Use coldboot_lock only to protect coldboot_wait_hmask

This way we will not have cold boot path starve for coldboot_lock.

Another suggestion is to ticket based spinlocks in OpenSBI.

Regards,
Anup

