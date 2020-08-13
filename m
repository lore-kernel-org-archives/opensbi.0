From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 13 Aug 2020 14:14:21 -0700
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
In-Reply-To: <45937abd-a5b9-5c4d-4520-58c6c0505921@gmx.de>
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
 <B98172B0-5CAA-48D2-A2F3-B4DB6B66FB16@jrtc27.com>
 <e3f6b789-0fa6-51f1-4cc4-f5eaa625b8df@gmx.de>
 <B63355E7-4A46-4492-A97F-DE576FB0DDA0@jrtc27.com>
 <CAOnJCUJ8aD8momBWbKuQMv6Apta=LM-Sddoh0VhAVPQhBN-ZAw@mail.gmail.com>
 <e63dc1a5-fb1d-7488-5f59-c2f1165b34dc@gmx.de>
 <823E7031-FADE-4445-8DD6-E4775182712E@jrtc27.com>
 <45937abd-a5b9-5c4d-4520-58c6c0505921@gmx.de>
Message-ID: <CAOnJCU+qSHMq0pvEPBE0bu4cgVq2_9pNfOWxd8ZRPhe+vj9Hbg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 13, 2020 at 1:04 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 13.08.20 21:16, Jessica Clarke wrote:
> > On 13 Aug 2020, at 19:58, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >> On 13.08.20 19:45, Atish Patra wrote:
> >>> On Thu, Aug 13, 2020 at 10:03 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>>>
> >>>> On 13 Aug 2020, at 17:51, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>>>> On 13.08.20 18:36, Jessica Clarke wrote:
> >>>>>> On 13 Aug 2020, at 17:24, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>>>>>>
> >>>>>>> OpenSBI hangs in wake_coldboot_harts() indefinitely on the MaixDuino board
> >>>>>>> when trying to boot U-Boot as FW_PAYLOAD.
> >>>>>>
> >>>>>> This smells of there being a more fundamental issue that's not being
> >>>>>> addressed which this manages to work around, either reliably or by
> >>>>>> chance. What is the actual deadlock condition you observe?
> >>>>>
> >>>>> There are only two function using coldboot_lock spinlock:
> >>>>>
> >>>>> * wake_coldboot_harts()
> >>>>> * wait_for_coldboot()
> >>>>>
> >>>>> wake_coldboot_harts() was entered but never left without patching one of
> >>>>> the functions.
> >>>>>
> >>>>> The Kendryte K210 has two harts. One goes the cold boot path while the
> >>>>> other is sent to the warm boot path.
> >>>>
> >>>> The K210's platform definition uses clint_ipi_send, which as far as I
> >>>> can tell is entirely non-blocking. The only thing wake_coldboot_harts
> >>>> does with the lock held is set coldboot_done to 1 and send an IPI to
> >>>> all the other harts. Thus wake_coldboot_harts should never be able to
> >>>> block holding the spin lock, meaning wait_for_coldboot should
> >>>> eventually wake up and be able to acquire the lock (on platforms that
> >>>> implement WFI fully it shouldn't have to wait long for the lock, though
> >>>> on platforms that make it a NOP there might be a bit of .
> >>>>
> >>>
> >>> Yes. If wake_coldboot_harts is never able to acquire the spinlock,
> >>> that indicates spinlock
> >>> is always acquired by wait_for_coldboot. That can happen if
> >>>
> >>> 1. WFI is implemented as NOP as suggested by Jessica and MSIP in MIP
> >>> is set which
> >>> shouldn't happen unless there is an IPI sent.
> >>>
> >>> Can you try clearing the MIP just before acquiring the lock ? In qemu
> >>> & unleashed, modifying the MSIP bit in
> >>> MIP doesn't actually do anything. So we do sbi_platform_ipi_clear  to reset it.
> >>
> >> The following does *not* solve the problem:
> >
> > What if you do it before enabling MSIP in MIE? If that doesn't work it
> > sounds like something is very broken with that hardware.
>
> This *fails* too:
>

Probably, the hart executing warmboot invokes sbi_platform_ipi_clear
even before sbi_ipi_init is being called from the hart running coldboot.

Can we confirm the MSIP being set theory first by adding a long
outside the inner while loop
before acquiring the lock ? I don't see any other reason why the inner
loop will keep acquiring the spinlock
unless we are hitting some nasty spinlock bug with Kendryte.

You may need to directly write MIP value to the uart address
(0x38000000) if sbi_console_init is not invoked yet.

> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index a7fb848..a29de51 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -96,6 +96,8 @@ static void wait_for_coldboot(struct sbi_scratch
> *scratch, u32 hartid)
>         /* Save MIE CSR */
>         saved_mie = csr_read(CSR_MIE);
>
> +       sbi_platform_ipi_clear(plat, hartid);
> +
>         /* Set MSIE bit to receive IPI */
>         csr_set(CSR_MIE, MIP_MSIP);
>
> Sean mentioned that the Kendryte K210 implements RISC-V Privileged
> Architectures Specification 1.9.1. But I don't see anything in the
> change log of the spec that would be relevant here.
>

Yeah. I checked 1.9.1 as well. I couldn't find anything weird that can
cause this issue.

> To my knowledge the Kendryte K210 systems are the only really affordable
> 64bit RISC-V boards up to now. So it would be great to get them properly
> running in OpenSBI even if they deviate from the most current RISC-V specs.
>
> Best regards
>
> Heinrich
>
> >
> >> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> >> index a7fb848..a3111d3 100644
> >> --- a/lib/sbi/sbi_init.c
> >> +++ b/lib/sbi/sbi_init.c
> >> @@ -105,6 +105,8 @@ static void wait_for_coldboot(struct sbi_scratch
> >> *scratch, u32 hartid)
> >>        /* Mark current HART as waiting */
> >>        sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
> >>
> >> +       sbi_platform_ipi_clear(plat, hartid);
> >> +
> >>        /* Wait for coldboot to finish using WFI */
> >>        while (!coldboot_done) {
> >>                spin_unlock(&coldboot_lock);
> >>
> >> Anyway according to the RISC-V spec wfi may be implemented as a simple nop:
> >>
> >> "The purpose of the WFI instruction is to provide a hint to the
> >> implementation, and so a legal implementation is to simply implement WFI
> >> as a NOP."
> >
> > Yes, we know, that's not the problem here. The problem is that your
> > hardware _actually thinks there's a pending software interrupt_, since
> > the MSIP bit is set in MIP. An implementation that makes WFI a NOP is
> > perfectly fine because, as I've said at least once already, the _inner_
> > loop still checks MIP.MSIP before attempting to acquire the lock again.
> >
> > Jess
> >
> >>>> Please further investigate (or explain if you already know) exactly how
> >>>> you end up in a deadlock situation between wake_coldboot_harts and
> >>>> wait_for_coldboot, as I cannot currently see how it could ever be
> >>>> possible.
> >>>>
> >>>>>>> Even if reading and writing coldboot_done is not atomic it is safe to check
> >>>>>>> it without using a spinlock.
> >>>>>>
> >>>>>> Maybe microarchitecturally on the specific hardware in question (though
> >>>>>> I wouldn't even be so certain about that), but definitely not in C. You
> >>>>>> now have a data race in reading coldboot_done, which isn't even
> >>>>>> volatile^, so a sufficiently smart compiler would be completely within
> >>>>>> its right to do whatever it wants to the code, including things like
> >>>>>> delete the loop entirely (or, slightly less dramatic, turn it into an
> >>>>>> if). This patch introduces undefined behaviour.
> >>>>>>
> >>>>>> Jess
> >>>>>>
> >>>>>> ^ Please do not make it volatile as a workaround, that is not the right
> >>>>>> way to "fix" such issues.
> >>>>>
> >>>>> What do you suggest Jessica?
> >>>>
> >>>> My primary suggestion is above, since this does not look like a
> >>>> necessary fix.
> >>>>
> >>>> There is the separate question of whether this code should be using
> >>>> spin locks anyway. One could optimise it with suitable use of proper
> >>>> atomics to access coldboot_done, which would mask whatever issue you
> >>>> are seeing, but that should not be necessary, and in early boot code
> >>>> like this that's not on a hot code path it's better to keep things
> >>>> simple like it is currently rather than risk writing unsafe code
> >>>> through incorrect use of atomics. I would feel much more comfortable
> >>>> leaving the code using spin locks.
> >>>>
> >>>> Jess
> >>>>
> >>>>>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >>>>>>> ---
> >>>>>>> lib/sbi/sbi_init.c | 4 ++--
> >>>>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> >>>>>>> index a7fb848..a0e4f11 100644
> >>>>>>> --- a/lib/sbi/sbi_init.c
> >>>>>>> +++ b/lib/sbi/sbi_init.c
> >>>>>>> @@ -106,14 +106,14 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >>>>>>>    sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
> >>>>>>>
> >>>>>>>    /* Wait for coldboot to finish using WFI */
> >>>>>>> +   spin_unlock(&coldboot_lock);
> >>>>>>>    while (!coldboot_done) {
> >>>>>>> -           spin_unlock(&coldboot_lock);
> >>>>>>>            do {
> >>>>>>>                    wfi();
> >>>>>>>                    cmip = csr_read(CSR_MIP);
> >>>>>>>             } while (!(cmip & MIP_MSIP));
> >>>>>>> -           spin_lock(&coldboot_lock);
> >>>>>>>    };
> >>>>>>> +   spin_lock(&coldboot_lock);
> >>>>>>>
> >>>>>>>    /* Unmark current HART as waiting */
> >>>>>>>    sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
> >>>>>>> --
> >>>>>>> 2.28.0
> >>>>>>>
> >>>>>>>
> >>>>>>> --
> >>>>>>> opensbi mailing list
> >>>>>>> opensbi at lists.infradead.org
> >>>>>>> http://lists.infradead.org/mailman/listinfo/opensbi
> >>>>
> >>>>
> >>>> --
> >>>> opensbi mailing list
> >>>> opensbi at lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/opensbi
> >>>
> >>>
> >>>
> >>> --
> >>> Regards,
> >>> Atish
> >
> >
>


-- 
Regards,
Atish

