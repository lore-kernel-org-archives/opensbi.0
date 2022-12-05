From: Eric Lin <eric.lin@sifive.com>
Date: Mon, 5 Dec 2022 10:31:29 +0800
Subject: [PATCH] lib: sbi: Bypass CY and IR bit setting in mcountinhibit
In-Reply-To: <CAOnJCUKi8NSqNgDyKaT9u7w-bPFeMbCM=K6DYTzW+e+3srYfnA@mail.gmail.com>
References: <20221116101826.10465-1-eric.lin@sifive.com> <E95DA6B1-DCB9-45D9-BB30-8EC53F2D1596@jrtc27.com>
 <CAOnJCUKi8NSqNgDyKaT9u7w-bPFeMbCM=K6DYTzW+e+3srYfnA@mail.gmail.com>
Message-ID: <CAPqJEFoe0R1aY=P8NEwaAipg=jSYaAJ4Prz=VJ7txp3vqqG-PQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

(Resend to OpenSBI mailing list)

Hi Aitsh,

On Fri, Nov 18, 2022 at 7:00 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Nov 16, 2022 at 6:57 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >
> > On 16 Nov 2022, at 10:18, Eric Lin <eric.lin@sifive.com> wrote:
> > >
> > > CYCLE and INSTRET counters are part of uABI and they were
> > > re-enable for userspace in Linux riscv pmu driver.
> > >
> > > To make these counters increase normally in userspace, we bypass
> > > CY and IR bit checking when setting mcountinhibit register.
> > >
> > > LINK:https://lore.kernel.org/all/20220928131807.30386-1-palmer at rivosinc.com/
> > > Signed-off-by: Eric Lin <eric.lin@sifive.com>
> >
> > If Linux is making SBI calls it doesn?t want then it should stop making
> > those calls. S-mode requesting CY and IR inhibit bits be set is totally
> > legitimate in some circumstances, it?s not up to firmware to enforce a
> > specific S-mode OS policy.
> >
>
> Yes. Start/sop is required when the user is doing perf stat or record
> for these counters.
>
> To increase the CYCLE and INSTRET,
> pmu_sbi_starting_cpu( in drivers/perf/riscv_pmu_sbi.c)
> should be modified to stop only the programmable counters. Not all.
>
Since CYCLE and INSTRET counters are re-enabled in userspace, user
applications will use rdcycle and rdinstert pseudoinstruction for
performance monitoring.

IMO, when a user uses rdcycle and rdinstert pseudoinstruction to get
cycle and instructions count, they would assume that CYCLE and INSTRET
counters are strictly increasing and no need to initialize in Linux.
Is the assumption right?

However, if another user uses the perf tool to get cycle and
instruction count, the perf framework will start and stop counters
when events are scheduled in and out.
This will make the CYCLE and INSTRET counters not strictly increase
and the rdcycle and rdinstert results are not what the user expects.

Therefore, I think two places need to modify in Linux riscv pmu driver.

The first one is that when booting, we should only stop programmable
counters in pmu_sbi_stop_all().
The patch is as below:
 static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 {
+       unsigned long cmask = 0;
        /*
-        * No need to check the error because we are disabling all the counters
+        * No need to check the error because we are disabling
programmable counters
         * which may include counters that are not enabled yet.
         */
+       cmask = pmu->cmask & (~(BIT(0) | BIT(2)));
        sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-                 0, pmu->cmask, 0, 0, 0, 0);
+                 0, cmask, 0, 0, 0, 0);

The second one is that when the user uses the perf stat -e
cycles/instructions command, it will stop counters when the event
stop.
We should skip stopping CYCLE and INSTRET counters in pmu_sbi_ctr_stop().
The patch is as below:
@@ -446,6 +446,10 @@ static void pmu_sbi_ctr_stop(struct perf_event
*event, unsigned long flag)
        struct sbiret ret;
        struct hw_perf_event *hwc = &event->hw;

+       /* Skip to stop CYCLE and INSTRET counters */
+       if (hwc->idx == 0 || hwc->idx == 2)
+               return;
+
        ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
hwc->idx, 1, flag, 0, 0, 0);
        if (ret.error && (ret.error != SBI_ERR_ALREADY_STOPPED) &&
                flag != SBI_PMU_STOP_FLAG_RESET)

Is this the right way to fix rdcycle and rdinstert increase issue in
userspace? Or is there something that I miss?
Thanks.

Regards,
Eric Lin


> > Jess
> >
> > > ---
> > > lib/sbi/sbi_pmu.c | 4 ++--
> > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > > index 91d9ccc..28107e5 100644
> > > --- a/lib/sbi/sbi_pmu.c
> > > +++ b/lib/sbi/sbi_pmu.c
> > > @@ -318,7 +318,7 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
> > >       if (cidx >= num_hw_ctrs || cidx == 1)
> > >               return SBI_EINVAL;
> > >
> > > -     if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
> > > +     if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11 || cidx == 0 || cidx == 2)
> > >               goto skip_inhibit_update;
> > >
> > >       /*
> > > @@ -413,7 +413,7 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
> > >       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> > >       unsigned long mctr_inhbt;
> > >
> > > -     if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
> > > +     if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11 || cidx == 0 || cidx == 2)
> > >               return 0;
> > >
> > >       mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
> > > --
> > > 2.36.1
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
>
>
> --
> Regards,
> Atish

