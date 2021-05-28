From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 28 May 2021 08:45:37 -0700
Subject: [PATCH v2 05/15] lib: sbi: Disable m/scounteren & enable
 mcountinhibit
In-Reply-To: <B004F75E-695F-420F-8AD9-B324B0E1FCC2@jrtc27.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
 <20210527003044.889681-6-atish.patra@wdc.com>
 <FD4B53F2-A813-49D8-AB08-A38BE3A6BF2C@jrtc27.com>
 <CAOnJCUKAkMb=pg_1e1OUsp5UXrKgV72nFBTfoVJn==_cQffJQQ@mail.gmail.com>
 <B004F75E-695F-420F-8AD9-B324B0E1FCC2@jrtc27.com>
Message-ID: <CAOnJCU+Ogd0F9J2oG-7SveeNTi+ozyVHTD9iWXeSPGnL4j1QUA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 27, 2021 at 3:15 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 27 May 2021, at 23:06, Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Wed, May 26, 2021 at 5:36 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>
> >> On 27 May 2021, at 01:30, Atish Patra <atish.patra@wdc.com> wrote:
> >>>
> >>> Currently, all bits in mcountern are enabled unconditionally at
> >>> boot time. With SBI PMU extension, this should enabled only during
> >>> performance monitoring for a particular event except the TM bit. However,
> >>> this is done only if mcountinhibit is implemented because the supervisor
> >>> mode can not start/stop any event without mcountinhibit.
> >>>
> >>> Similarly, supervisor should take care enabling scounteren which allows
> >>> U-mode to access pmu counters. Disable all bits in scounteren in M-mode.
> >>
> >> Turning off CY or IR seems like a bad idea to me. Similarly, all of CY, IR and
> >> TM should be enabled in scounteren by default, this is just needlessly hostile.
> >
> > This happens only if the platform supports mcountinhibit. As per the
> > priv spec, no counter should run unless the corresponding bit in
> > mcountinhibit
> > is cleared. This patch just follows the spec.
>
> I don?t understand your reply. The privileged spec just says how the CSRs
> behave, it doesn?t say that you need to make an SBI call (which isn?t part of
> the privileged spec) for cycle and instret to count. Requiring that is
> unnecessarily hostile; in practice, everything will want those two counters to
> be enabled, because arbitrary userspace software wants to use them.

That's a security risk. One rogue process can have access to cycle &
instructions of the entire kernel & M-mode firmware.
The counters should report a value only if it is being asked to
start/stop a userspace application (e.g. perf).

We can keep CY & IR bits enabled in OpenSBI but it must be disabled by
the Linux kernel PMU driver by default.
The effect will remain the same.

Once sscopmf is implemented, there is a plan to set MINH bit always so
that supervisor/userspace don't know how many cycles
are spent while running OpenSBI.

They should
> never be disabled by OpenSBI unless S-mode explicitly asks for them to be
> disabled.
>
> Jess
>


-- 
Regards,
Atish

