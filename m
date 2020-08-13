From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 13 Aug 2020 10:45:49 -0700
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
In-Reply-To: <B63355E7-4A46-4492-A97F-DE576FB0DDA0@jrtc27.com>
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
 <B98172B0-5CAA-48D2-A2F3-B4DB6B66FB16@jrtc27.com>
 <e3f6b789-0fa6-51f1-4cc4-f5eaa625b8df@gmx.de>
 <B63355E7-4A46-4492-A97F-DE576FB0DDA0@jrtc27.com>
Message-ID: <CAOnJCUJ8aD8momBWbKuQMv6Apta=LM-Sddoh0VhAVPQhBN-ZAw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 13, 2020 at 10:03 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 13 Aug 2020, at 17:51, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > On 13.08.20 18:36, Jessica Clarke wrote:
> >> On 13 Aug 2020, at 17:24, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>>
> >>> OpenSBI hangs in wake_coldboot_harts() indefinitely on the MaixDuino board
> >>> when trying to boot U-Boot as FW_PAYLOAD.
> >>
> >> This smells of there being a more fundamental issue that's not being
> >> addressed which this manages to work around, either reliably or by
> >> chance. What is the actual deadlock condition you observe?
> >
> > There are only two function using coldboot_lock spinlock:
> >
> > * wake_coldboot_harts()
> > * wait_for_coldboot()
> >
> > wake_coldboot_harts() was entered but never left without patching one of
> > the functions.
> >
> > The Kendryte K210 has two harts. One goes the cold boot path while the
> > other is sent to the warm boot path.
>
> The K210's platform definition uses clint_ipi_send, which as far as I
> can tell is entirely non-blocking. The only thing wake_coldboot_harts
> does with the lock held is set coldboot_done to 1 and send an IPI to
> all the other harts. Thus wake_coldboot_harts should never be able to
> block holding the spin lock, meaning wait_for_coldboot should
> eventually wake up and be able to acquire the lock (on platforms that
> implement WFI fully it shouldn't have to wait long for the lock, though
> on platforms that make it a NOP there might be a bit of .
>

Yes. If wake_coldboot_harts is never able to acquire the spinlock,
that indicates spinlock
is always acquired by wait_for_coldboot. That can happen if

1. WFI is implemented as NOP as suggested by Jessica and MSIP in MIP
is set which
shouldn't happen unless there is an IPI sent.

Can you try clearing the MIP just before acquiring the lock ? In qemu
& unleashed, modifying the MSIP bit in
MIP doesn't actually do anything. So we do sbi_platform_ipi_clear  to reset it.

> Please further investigate (or explain if you already know) exactly how
> you end up in a deadlock situation between wake_coldboot_harts and
> wait_for_coldboot, as I cannot currently see how it could ever be
> possible.
>
> >>> Even if reading and writing coldboot_done is not atomic it is safe to check
> >>> it without using a spinlock.
> >>
> >> Maybe microarchitecturally on the specific hardware in question (though
> >> I wouldn't even be so certain about that), but definitely not in C. You
> >> now have a data race in reading coldboot_done, which isn't even
> >> volatile^, so a sufficiently smart compiler would be completely within
> >> its right to do whatever it wants to the code, including things like
> >> delete the loop entirely (or, slightly less dramatic, turn it into an
> >> if). This patch introduces undefined behaviour.
> >>
> >> Jess
> >>
> >> ^ Please do not make it volatile as a workaround, that is not the right
> >>  way to "fix" such issues.
> >
> > What do you suggest Jessica?
>
> My primary suggestion is above, since this does not look like a
> necessary fix.
>
> There is the separate question of whether this code should be using
> spin locks anyway. One could optimise it with suitable use of proper
> atomics to access coldboot_done, which would mask whatever issue you
> are seeing, but that should not be necessary, and in early boot code
> like this that's not on a hot code path it's better to keep things
> simple like it is currently rather than risk writing unsafe code
> through incorrect use of atomics. I would feel much more comfortable
> leaving the code using spin locks.
>
> Jess
>
> >>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >>> ---
> >>> lib/sbi/sbi_init.c | 4 ++--
> >>> 1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> >>> index a7fb848..a0e4f11 100644
> >>> --- a/lib/sbi/sbi_init.c
> >>> +++ b/lib/sbi/sbi_init.c
> >>> @@ -106,14 +106,14 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >>>     sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
> >>>
> >>>     /* Wait for coldboot to finish using WFI */
> >>> +   spin_unlock(&coldboot_lock);
> >>>     while (!coldboot_done) {
> >>> -           spin_unlock(&coldboot_lock);
> >>>             do {
> >>>                     wfi();
> >>>                     cmip = csr_read(CSR_MIP);
> >>>              } while (!(cmip & MIP_MSIP));
> >>> -           spin_lock(&coldboot_lock);
> >>>     };
> >>> +   spin_lock(&coldboot_lock);
> >>>
> >>>     /* Unmark current HART as waiting */
> >>>     sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
> >>> --
> >>> 2.28.0
> >>>
> >>>
> >>> --
> >>> opensbi mailing list
> >>> opensbi at lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/opensbi
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



--
Regards,
Atish

