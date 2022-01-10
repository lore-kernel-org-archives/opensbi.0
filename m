From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Mon, 10 Jan 2022 08:56:46 +0300
Subject: [PATCH v1 2/3] lib: sbi: Disable interrupt during config matching
In-Reply-To: <CAOnJCUL86HTDS7k9WYMu50orLGZ6qmd-RXv3MpcRJgkiHin9_w@mail.gmail.com>
References: <20220107185409.1172221-1-atishp@rivosinc.com>
 <20220107185409.1172221-3-atishp@rivosinc.com>
 <20220108112404.7581b81b@redslave.neermore.group>
 <CAOnJCUL86HTDS7k9WYMu50orLGZ6qmd-RXv3MpcRJgkiHin9_w@mail.gmail.com>
Message-ID: <20220110085646.5a9339c5@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Atish!

On Sun, 9 Jan 2022 17:19:10 -0800
Atish Patra <atishp@atishpatra.org> wrote:

> > > +      */
> > >       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > > -             mhpmevent_val = (mhpmevent_val &
> > > ~MHPMEVENT_SSCOF_MASK) | MHPMEVENT_MINH;
> > > +             mhpmevent_val = (mhpmevent_val &
> > > ~MHPMEVENT_SSCOF_MASK) |
> > > +                              MHPMEVENT_MINH | MHPMEVENT_OF;  
> >
> > Is there some strong reason to inhibit M-Mode counting here or it is
> > just a workaround until mode filtering support will come up ?
> >  
> 
> As a security reason, any perf analysis shouldn't allow inspecting
> the M-mode for hardware counters.
> 

It looks a bit strange to me just to disable something that we have and
it is working.

May be it's worth considering putting control of such a behavior in
FW_OPTIONS or a compile option ?

I see strong benefits in being able to profile M-Mode also.

> Privilege mode filtering is already supported in Qemu. You can set
> exclude user/kernel
> from perf command line for Qemu specific events (dTLB-load-misses,
> dTLB-store-misses, iTLB-load-misses)
> 

I see now - didn't study your v5 series carefully enough.

> > >
> > >       /* Update the inhibit flags based on inhibit flags received
> > > from supervisor */ pmu_update_inhibit_flags(flags,
> > > &mhpmevent_val);  
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi  
> 
> 
> 


