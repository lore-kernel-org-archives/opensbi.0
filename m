From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 3 Mar 2023 21:32:53 +0530
Subject: [PATCH v2 1/2] lib: sbi: Wait in sbi_hsm_hart_wait() till the
 hart is prepared to start
In-Reply-To: <d8abb931-4139-ba5d-79ac-987855cf3cf1@yadro.com>
References: <20230221210851.3145840-1-e.shatokhin@yadro.com>
 <20230221210851.3145840-2-e.shatokhin@yadro.com> <CAAhSdy2EwxbwNV2fvshUDr49h6Ja6K3j8Ah4w1_TbYEbZ4UaOA@mail.gmail.com>
 <6eb6ddad-6ddf-1b6a-aad8-7a4df8657641@yadro.com> <CAAhSdy1bS_yA290sPt6S2fxHiffq=-Dc5r28AeYFScBEmjd7hQ@mail.gmail.com>
 <d8abb931-4139-ba5d-79ac-987855cf3cf1@yadro.com>
Message-ID: <CAK9=C2XVmUD5cSYu+2vAm1g2Jr0zzt6hwVC+5W8kHkKdYym0hw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 3, 2023 at 8:31?PM Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
>
> On 02.03.2023 07:07, Anup Patel wrote:
> > On Tue, Feb 28, 2023 at 9:26 PM Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
> >>
> >> On 28.02.2023 08:06, Anup Patel wrote:
> >>> On Wed, Feb 22, 2023 at 2:39 AM Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
> >>>>
> >>>> "wfi" instruction is not guaranteed to wait for an interrupt to be received
> >>>> by the hart, it is just a hint for the CPU. According to RISC-V Privileged
> >>>> Architectures spec. v20211203, even an implementation of "wfi" as "nop" is
> >>>> legal.
> >>>>
> >>>> As a result, a secondary (non-boot) hart waiting in the while loop in
> >>>> sbi_hsm_hart_wait() might leave the loop and continue even if it got no
> >>>> IPI or it got an IPI unrelated to sbi_hsm_hart_start(). This could lead to
> >>>> the following race condition when booting Linux, for example:
> >>>>
> >>>>     Boot hart (#0)                        Secondary hart (#1)
> >>>>     runs Linux startup code               waits in sbi_hsm_hart_wait()
> >>>>
> >>>>     sbi_ecall(SBI_EXT_HSM,
> >>>>               SBI_EXT_HSM_HART_START,
> >>>>               ...)
> >>>>     enters sbi_hsm_hart_start()
> >>>>     sets state of hart #1 to START_PENDING
> >>>>                                           leaves sbi_hsm_hart_wait()
> >>>>                                           runs to the end of init_warmboot()
> >>>>                                           returns to scratch->next_addr
> >>>>                                           (next_addr can be garbage here)
> >>>>
> >>>>     sets next_addr, etc. for hart #1
> >>>>     (no good: hart #1 has already left)
> >>>>
> >>>>     sends IPI to hart #1
> >>>>     (no good either)
> >>>>
> >>>> If this happens, the secondary hart jumps to a wrong next_addr at the end
> >>>> of init_warmboot(), which leads to a system hang or crash.
> >>>>
> >>>> To reproduce the issue more reliably, one could add a delay in
> >>>> sbi_hsm_hart_start() after setting the hart's state but before sending
> >>>> IPI to that hart:
> >>>>
> >>>>       hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOPPED,
> >>>>                               SBI_HSM_STATE_START_PENDING);
> >>>>       ...
> >>>>     + sbi_timer_mdelay(10);
> >>>>       init_count = sbi_init_count(hartid);
> >>>>       rscratch->next_arg1 = arg1;
> >>>>       rscratch->next_addr = saddr;
> >>>>
> >>>> The issue can be reproduced, for example, in a QEMU VM with '-machine virt'
> >>>> and 2 or more CPUs, with Linux as the guest OS.
> >>>
> >>> Good catch. This is a valid issue which needs to be fixed.
> >>>
> >>>>
> >>>> This patch adds an auxiliary per-hart state variable, aux_state, as well as
> >>>> its accessor functions, to synchronize execution of the boot hart and the
> >>>> starting secondary hart.
> >>>>
> >>>> Initially, aux_state is 0: sbi_scratch_alloc_offset() zeroes the allocated
> >>>> memory. The boot hart sets it to 1 after it has set next_addr, etc., for the
> >>>> secondary hart, then sends the IPI to the latter.
> >>>>
> >>>> The secondary hart waits in sbi_hsm_hart_wait() both for aux_state to become
> >>>> non-zero and for an IPI to happen. This should be safe even if the secondary
> >>>> hart somehow gets an IPI unrelated to sbi_hsm_hart_start().
> >>>>
> >>>> Memory barriers are used to make sure the writes to next_addr, etc., in the
> >>>> boot hart are visible to the secondary hart if it reads non-zero aux_state.
> >>>>
> >>>> Only one bit of aux_state is actually used here, so, this per-hart variable
> >>>> can be used to hold other data in the future, if needed.
> >>>
> >>> Adding aux_state is an overly complicated solution in my opinion.
> >>>
> >>> Instead, you can simply do the following:
> >>>
> >>>       rscratch->next_arg1 = arg1;
> >>>       rscratch->next_addr = saddr;
> >>>       rscratch->next_mode = smode;
> >>>
> >>>       /*
> >>>        * Barrier to ensure that the above writes have happened before
> >>>        * updating the HART state.
> >>>        */
> >>>       smp_wmb();
> >>>
> >>> Before "hdata = sbi_scratch_offset_ptr(rscratch, hart_data_offset);" in
> >>> sbi_hsm_hart_start().
> >>
> >> True, the proposed fix it is more complicated than I would like it to
> >> be, but there is a reason.
> >>
> >> Should we worry about the scenario when two or more harts enter
> >> sbi_hsm_hart_start() with the same target hartid? It must not happen
> >> during normal operation of the OS, but, in theory, errors in the
> >> higher-level software could lead to this.
> >>
> >> Setting hstate to SBI_HSM_STATE_START_PENDING atomically and checking
> >> its previous values before changing *rscratch in sbi_hsm_hart_start()
> >> guarantees that the current hart has exclusive access to *rscratch after
> >> that. If we move rscratch->next_arg1 = arg1, etc., before hdata =
> >> sbi_scratch_offset_ptr(...), it would be possible for two harts to race
> >> and write different values to *rscratch for the same target hart. It is
> >> very unlikely to happen, but still.
> >>
> >> If it is somehow guaranteed that the current hart has exclusive access
> >> to *rscratch even at the beginning of sbi_hsm_hart_start(), then yes, we
> >> can drop aux_state, etc., and use a simpler fix.
> >>
> >> smp_wmb() will then be paired with rmb() in atomic_read(&hdata->state)
> >> from sbi_hsm_hart_wait() and it would make sure the writes are seen in
> >> correct order.
> >>
> >> So, should we worry about misbehaving OSes which could allow 2 or more
> >> harts to enter sbi_hsm_hart_start() for the same target hart in parallel?
> >>
> >> What do you think?
> >
> > I see your point but it is better to tackle the situation of 2 or more
> > harts entering sbi_hsm_hart_start() rather than aux_state which
> > less readable.
> >
> > How about this ?
> >
> > 1) Re-base on-top of the below patch
> > 2) Update this patch to:
> >      a) Move "rscratch->next_*" updates before
> >          "hdata = sbi_scratch_offset_ptr(rscratch, hart_data_offset);"
> >          in sbi_hsm_hart_start()
> >      b) Add "start_ticket" which needs to be acquired (0->1) before
> >          "rscratch->next_*" updates in sbi_hsm_hart_start() and
> >          if a HART fails to acquire it then sbi_hsm_hart_start() fails
> >     c) Read the "scratch->next_" data and release "start_ticket" (1->0)
> >         in sbi_hsm_hart_start_finish() before doing sbi_hart_switch_mode().
> >
>
> If 'start_ticket' is a global, rather than a per-hart variable, no hart
> would be allowed to run sbi_hsm_hart_start() till the secondary hart
> finishes init_warm_startup() and releases the ticket. This could prevent
> the boot hart to call sbi_hsm_hart_start() for other harts, e.g. if the
> boot hart executes sbi_hsm_hart_start() quickly, while the secondary
> hart is slow.
>
> I think, it would be sufficient to prevent entering sbi_hsm_hart_start()
> only for the *same* target hart rather than for *all* target harts.
>
> If it is OK to add fields to 'struct sbi_hsm_data', we could add
> 'start_ticket' there, instead of 'aux_data', and use it as you suggested.
>
> Would that be OK?

Sorry, I was not clear previously but I assumed "start_ticket" to be
per-HART. It should be added in 'struct sbi_hsm_data'

Regards,
Anup

>
> Regards,
> Evgenii
>
> > Regards,
> > Anup
> >
> > diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
> > index c0b4830..4b5601b 100644
> > --- a/include/sbi/sbi_hsm.h
> > +++ b/include/sbi/sbi_hsm.h
> > @@ -66,7 +66,8 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
> >                  u32 hartid, ulong saddr, ulong smode, ulong arg1);
> >   int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
> >   void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch);
> > -void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch);
> > +void __noreturn sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch,
> > +                       u32 hartid);
> >   int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
> >                ulong raddr, ulong rmode, ulong arg1);
> >   bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
> > @@ -76,6 +77,7 @@ int sbi_hsm_hart_get_state(const struct sbi_domain
> > *dom, u32 hartid);
> >   int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
> >                       ulong hbase, ulong *out_hmask);
> >   void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch);
> > -void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid);
> > +void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
> > +                      u32 hartid);
> >
> >   #endif
> > diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> > index 3eeeb58..100b8c0 100644
> > --- a/lib/sbi/sbi_hsm.c
> > +++ b/lib/sbi/sbi_hsm.c
> > @@ -110,7 +110,8 @@ int sbi_hsm_hart_interruptible_mask(const struct
> > sbi_domain *dom,
> >       return 0;
> >   }
> >
> > -void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
> > +void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
> > +                      u32 hartid)
> >   {
> >       struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
> >                                   hart_data_offset);
> > @@ -118,6 +119,9 @@ void sbi_hsm_prepare_next_jump(struct sbi_scratch
> > *scratch, u32 hartid)
> >       if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_START_PENDING,
> >                        SBI_HSM_STATE_STARTED))
> >           sbi_hart_hang();
> > +
> > +    sbi_hart_switch_mode(hartid, scratch->next_arg1, scratch->next_addr,
> > +                 scratch->next_mode, false);
> >   }
> >
> >   static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
> > @@ -381,7 +385,8 @@ void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
> >       hsm_device_hart_resume();
> >   }
> >
> > -void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch)
> > +void __noreturn sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch,
> > +                       u32 hartid)
> >   {
> >       struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
> >                                   hart_data_offset);
> > @@ -396,6 +401,10 @@ void sbi_hsm_hart_resume_finish(struct
> > sbi_scratch *scratch)
> >        * the warm-boot sequence.
> >        */
> >       __sbi_hsm_suspend_non_ret_restore(scratch);
> > +
> > +    sbi_hart_switch_mode(hartid, scratch->next_arg1,
> > +                 scratch->next_addr,
> > +                 scratch->next_mode, false);
> >   }
> >
> >   int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> > index bc60a42..dcca2c8 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -355,12 +355,11 @@ static void __noreturn init_coldboot(struct
> > sbi_scratch *scratch, u32 hartid)
> >       init_count = sbi_scratch_offset_ptr(scratch, init_count_offset);
> >       (*init_count)++;
> >
> > -    sbi_hsm_prepare_next_jump(scratch, hartid);
> > -    sbi_hart_switch_mode(hartid, scratch->next_arg1, scratch->next_addr,
> > -                 scratch->next_mode, false);
> > +    sbi_hsm_hart_start_finish(scratch, hartid);
> >   }
> >
> > -static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
> > +static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
> > +                     u32 hartid)
> >   {
> >       int rc;
> >       unsigned long *init_count;
> > @@ -412,10 +411,11 @@ static void init_warm_startup(struct sbi_scratch
> > *scratch, u32 hartid)
> >       init_count = sbi_scratch_offset_ptr(scratch, init_count_offset);
> >       (*init_count)++;
> >
> > -    sbi_hsm_prepare_next_jump(scratch, hartid);
> > +    sbi_hsm_hart_start_finish(scratch, hartid);
> >   }
> >
> > -static void init_warm_resume(struct sbi_scratch *scratch)
> > +static void __noreturn init_warm_resume(struct sbi_scratch *scratch,
> > +                    u32 hartid)
> >   {
> >       int rc;
> >
> > @@ -429,7 +429,7 @@ static void init_warm_resume(struct sbi_scratch *scratch)
> >       if (rc)
> >           sbi_hart_hang();
> >
> > -    sbi_hsm_hart_resume_finish(scratch);
> > +    sbi_hsm_hart_resume_finish(scratch, hartid);
> >   }
> >
> >   static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
> > @@ -443,13 +443,9 @@ static void __noreturn init_warmboot(struct
> > sbi_scratch *scratch, u32 hartid)
> >           sbi_hart_hang();
> >
> >       if (hstate == SBI_HSM_STATE_SUSPENDED)
> > -        init_warm_resume(scratch);
> > +        init_warm_resume(scratch, hartid);
> >       else
> >           init_warm_startup(scratch, hartid);
> > -
> > -    sbi_hart_switch_mode(hartid, scratch->next_arg1,
> > -                 scratch->next_addr,
> > -                 scratch->next_mode, false);
> >   }
> >
> >   static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
> >
>
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

