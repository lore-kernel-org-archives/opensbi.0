From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 24 Jun 2022 13:01:53 +0300
Subject: [PATCH 1/1] lib: pmu: allow to use the highest available counter
In-Reply-To: <CAK9=C2UMN3g9Kwtn-L7nu0vmj7pcvDCH3MMbmN8DfcivLJQ3Ew@mail.gmail.com>
References: <20220623141335.360952-1-geomatsi@gmail.com>
 <CAAhSdy35CK1J+ZdMMU6ZPDA4hvcQbLe==YcO6en6-+0o-gcaYA@mail.gmail.com>
 <CAOnJCUKMfPAJEGgkhT5c-EKC7XXO9tDwNY7Me5vcZm-Sbt-fcw@mail.gmail.com>
 <YrVsJKq4vsf8giuH@curiosity>
 <CAK9=C2UMN3g9Kwtn-L7nu0vmj7pcvDCH3MMbmN8DfcivLJQ3Ew@mail.gmail.com>
Message-ID: <YrWLkUidwKEJZZac@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

> > > > > Both OpenSBI and OS explicitly assume that there is no hardware counter
> > > > > with index 1: hardware uses that bit for TM control. So OpenSBI filters
> > > > > out that index in sanity checks. However the range sanity checks do not
> > > > > treat that index in a special way. As a result, OpenSBI does not allow
> > > > > to use the firmware counter with the highest index. This change modifies
> > > > > range checks to allow access to the highest index firmware counter.
> > > > >
> > > > > The simple test is to make sure that there is no counter multiplexing
> > > > > in the following command:
> > > > >
> > > > > $ perf stat -e \
> > > > >         r8000000000000000,r8000000000000001,r8000000000000002,r8000000000000003, \
> > > > >         r8000000000000004,r8000000000000005,r8000000000000006,r8000000000000007, \
> > > > >         r8000000000000008,r8000000000000009,r800000000000000a,r800000000000000b, \
> > > > >         r800000000000000c,r800000000000000d,r800000000000000e,r800000000000000f  \
> > > > >         ls
> > > > >
> > > > > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > > > >
> > > > > ---
> > > > >
> > > > > Note that perf RISC-V SBI Linux driver is adapted for the current OpenSBI
> > > > > behavior: it passes counters mask with exluded highest valid index. So the
> > > > > accompanying fix is also required for Linux, see the patches posted to
> > > > > the risc-v mailing list:
> > > > >
> > > > > https://lore.kernel.org/linux-riscv/20220623112735.357093-1-geomatsi at gmail.com/T/#m4811c83cf767cdaaeb31e2530d4a51034fcf6c3c
> > > > >
> > > > >  lib/sbi/sbi_pmu.c | 18 +++++++++---------
> > > > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > > > > index 3ecf536..b386d33 100644
> > > > > --- a/lib/sbi/sbi_pmu.c
> > > > > +++ b/lib/sbi/sbi_pmu.c
> > > > > @@ -115,7 +115,7 @@ static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
> > > > >
> > > > >         event_idx_val = active_events[hartid][cidx];
> > > > >
> > > > > -       if (cidx >= total_ctrs || (event_idx_val == SBI_PMU_EVENT_IDX_INVALID))
> > > > > +       if (cidx > total_ctrs || (event_idx_val == SBI_PMU_EVENT_IDX_INVALID))
> > > >
> > > > Instead of changing all comparisons of total_ctrs, why not set
> > > > "num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 3;" in sbi_pmu_init() ?
> > > >
> > >
> > > Yes. That is simpler. We need a few other fixes along with that as
> > > well. Here is the diff
> >
> > Indeed, this is simpler. But as I mentioned in my reply to v2, this way
> > you report incorrect number of hw counters to kernel just to get the
> > correct mask of counters in response. And that behavior will have to
> > be followed by all the other SBI implementations.
> 
> I don't think this patch reports an incorrect number of counters because
> the time CSR is indeed a counter which counts timer ticks.
> 
> Just like cycle and instret CSRs, the time CSR is also a fixed counter
> which cannot count any other HW event.
> 
> The only special thing about time CSR is that as-per RISC-V privilege
> specification the time CSR is always counting and there is no way to
> halt/resume it because it is an alias of platform-level free-running
> mtime counter.
> 
> It's totally up to the SBI implementation whether it wants to expose
> fixed HW counters (cycle, time, and insret) as SBI PMU counters
> or not. In fact, the SBI PMU specification defines counter_idx as
> logical counter with no relation to HW counter numbering.
> 
> A perfectly valid SBI implementation is allowed to do various things:
> 1) Intermix HW counters and FW counters (e.g. counter_idx = 0 is
>     FW counter but counter_idx = 1 is HW counter)
> 2) Make a particular HW counter unusable through SBI PMU due
>     to some errata (e.g. If mhpmcounter3 is broken then platform
>     will not set bit[3] in any of the counter-mask provided in the
>    "riscv,pmu" DT node which is parsed by OpenSBI). The
>    sbi_pmu_config_matching() will never select a counter_idx
>    which is not part of any counter-mask provided by the platform.
> 3) Create on-demand mapping of counter_idx to HW counters
>    because SBI implementation is doing trap-n-emulate of
>    counters. This is particularly true for hypervisors like KVM
>    when counters are shared between host and guest so the
>    hypervisor will on-demand allocate a HW counter and map
>    it to a logical counter_idx seen by the guest. (Note: same
>    approach is taken by KVM ARM)
> 
> >
> > Current OpenSBI implementation implies the only gap in counters: index 1.
> > So my approach in v1 version of this patch was as follows:
> > - send the accurate number of counters to the kernel (hw + fw)
> > - fix range checks to take into account gap for index 1
> > This way OpenSBI just sends correct information to the kernel and
> > expects (and verifies) correct data in response. Accompanying kernel
> > fixes are the first two patches in the kernel series, see:
> > https://lore.kernel.org/linux-riscv/20220623112735.357093-1-geomatsi at gmail.com/T/#m4811c83cf767cdaaeb31e2530d4a51034fcf6c3c
> >
> > The 3rd kernel patch switches from array to IDR. With that change kernel
> > driver will support any gaps in counters, not only index 1. So OpenSBI
> > or any other SBI implementation will be able to exclude some hw or fw
> > counters if needed without changing kernel driver. So far I can see
> > two possible examples where it could be useful:
> > - platform specific quirks in OpenSBI to exclude non-functional counters
> > - keep some hw counters for internal use in OpenSBI or any other SBI implementation
> 
> I think there is some confusion with regards to counter_idx.
> 
> As-per SBI spec, the counter_idx is a logical number so if there are N
> counters then 0 <= counter_idx < N. There are no gaps in counter_idx
> numbering. Of course, an SBI implementation might intentionally never
> configure a particular counter_idx because it is special or broken.

Thanks for clarifications! So, in brief, it is OK for valid SBI
implementation to do the following:

- to report _total_ number of counters (hw + fw), including special
  ones (like timer) or broken ones or reserved ones
- sbi_pmu_ctr_cfg_match should never send special/reserved/broken
  counters to OS

That makes sense to me. So v2 changes suggested by Atish look reasonable.
But I guess commit message needs to be clarified. 

I will shortly send you v3 version of the OpenSBI patch with updated
commit message. I will also send v2 of the kernel patches. 

Regards,
Sergey

