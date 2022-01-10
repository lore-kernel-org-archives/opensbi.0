From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 10 Jan 2022 12:25:40 -0800
Subject: [PATCH v1 2/3] lib: sbi: Disable interrupt during config matching
In-Reply-To: <20220110085646.5a9339c5@redslave.neermore.group>
References: <20220107185409.1172221-1-atishp@rivosinc.com>
 <20220107185409.1172221-3-atishp@rivosinc.com>
 <20220108112404.7581b81b@redslave.neermore.group>
 <CAOnJCUL86HTDS7k9WYMu50orLGZ6qmd-RXv3MpcRJgkiHin9_w@mail.gmail.com>
 <20220110085646.5a9339c5@redslave.neermore.group>
Message-ID: <CAOnJCUJE+QS=27bK88JO0EzE9zkGf6FZRU3nmPo+CB6oPd+xrA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 9, 2022 at 9:56 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> Hello Atish!
>
> On Sun, 9 Jan 2022 17:19:10 -0800
> Atish Patra <atishp@atishpatra.org> wrote:
>
> > > > +      */
> > > >       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > > > -             mhpmevent_val = (mhpmevent_val &
> > > > ~MHPMEVENT_SSCOF_MASK) | MHPMEVENT_MINH;
> > > > +             mhpmevent_val = (mhpmevent_val &
> > > > ~MHPMEVENT_SSCOF_MASK) |
> > > > +                              MHPMEVENT_MINH | MHPMEVENT_OF;
> > >
> > > Is there some strong reason to inhibit M-Mode counting here or it is
> > > just a workaround until mode filtering support will come up ?
> > >
> >
> > As a security reason, any perf analysis shouldn't allow inspecting
> > the M-mode for hardware counters.
> >
>
> It looks a bit strange to me just to disable something that we have and
> it is working.
>

We have privilege mode filtering working at S/U level because current perf has
options for that. However, profiling the highest privilege mode(M-mode
in RISC-V) is not an option for current
perf tool.

> May be it's worth considering putting control of such a behavior in
> FW_OPTIONS or a compile option ?
>
> I see strong benefits in being able to profile M-Mode also.
>

Yes but with an user aware of doing that. That's why firmware events
are defined in the first place.
If we just enable the M-mode profiling by default without user
explicitly requesting for it, the profiling data
may be inaccurate as well apart from the security concerns.

I was thinking about enabling M-mode profiling via the following route:

1. Add a firmware option to perf tool. At first iteration, it will be
a RISC-V specific option.
2. If the user explicitly requests for firmware (M-mode in this case),
MINH bit should be cleared.
Otherwise, it should be enabled.

We should add this feature only after the kernel feature is accepted.
I am open to any other suggestions as well.

> > Privilege mode filtering is already supported in Qemu. You can set
> > exclude user/kernel
> > from perf command line for Qemu specific events (dTLB-load-misses,
> > dTLB-store-misses, iTLB-load-misses)
> >
>
> I see now - didn't study your v5 series carefully enough.
>
> > > >
> > > >       /* Update the inhibit flags based on inhibit flags received
> > > > from supervisor */ pmu_update_inhibit_flags(flags,
> > > > &mhpmevent_val);
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
> >
> >
> >
>


-- 
Regards,
Atish

