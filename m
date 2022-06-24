From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 24 Jun 2022 10:47:48 +0300
Subject: [PATCH 1/1] lib: pmu: allow to use the highest available counter
In-Reply-To: <CAOnJCUKMfPAJEGgkhT5c-EKC7XXO9tDwNY7Me5vcZm-Sbt-fcw@mail.gmail.com>
References: <20220623141335.360952-1-geomatsi@gmail.com>
 <CAAhSdy35CK1J+ZdMMU6ZPDA4hvcQbLe==YcO6en6-+0o-gcaYA@mail.gmail.com>
 <CAOnJCUKMfPAJEGgkhT5c-EKC7XXO9tDwNY7Me5vcZm-Sbt-fcw@mail.gmail.com>
Message-ID: <YrVsJKq4vsf8giuH@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

> > > Both OpenSBI and OS explicitly assume that there is no hardware counter
> > > with index 1: hardware uses that bit for TM control. So OpenSBI filters
> > > out that index in sanity checks. However the range sanity checks do not
> > > treat that index in a special way. As a result, OpenSBI does not allow
> > > to use the firmware counter with the highest index. This change modifies
> > > range checks to allow access to the highest index firmware counter.
> > >
> > > The simple test is to make sure that there is no counter multiplexing
> > > in the following command:
> > >
> > > $ perf stat -e \
> > >         r8000000000000000,r8000000000000001,r8000000000000002,r8000000000000003, \
> > >         r8000000000000004,r8000000000000005,r8000000000000006,r8000000000000007, \
> > >         r8000000000000008,r8000000000000009,r800000000000000a,r800000000000000b, \
> > >         r800000000000000c,r800000000000000d,r800000000000000e,r800000000000000f  \
> > >         ls
> > >
> > > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > >
> > > ---
> > >
> > > Note that perf RISC-V SBI Linux driver is adapted for the current OpenSBI
> > > behavior: it passes counters mask with exluded highest valid index. So the
> > > accompanying fix is also required for Linux, see the patches posted to
> > > the risc-v mailing list:
> > >
> > > https://lore.kernel.org/linux-riscv/20220623112735.357093-1-geomatsi at gmail.com/T/#m4811c83cf767cdaaeb31e2530d4a51034fcf6c3c
> > >
> > >  lib/sbi/sbi_pmu.c | 18 +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > > index 3ecf536..b386d33 100644
> > > --- a/lib/sbi/sbi_pmu.c
> > > +++ b/lib/sbi/sbi_pmu.c
> > > @@ -115,7 +115,7 @@ static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
> > >
> > >         event_idx_val = active_events[hartid][cidx];
> > >
> > > -       if (cidx >= total_ctrs || (event_idx_val == SBI_PMU_EVENT_IDX_INVALID))
> > > +       if (cidx > total_ctrs || (event_idx_val == SBI_PMU_EVENT_IDX_INVALID))
> >
> > Instead of changing all comparisons of total_ctrs, why not set
> > "num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 3;" in sbi_pmu_init() ?
> >
> 
> Yes. That is simpler. We need a few other fixes along with that as
> well. Here is the diff

Indeed, this is simpler. But as I mentioned in my reply to v2, this way
you report incorrect number of hw counters to kernel just to get the
correct mask of counters in response. And that behavior will have to
be followed by all the other SBI implementations. 

Current OpenSBI implementation implies the only gap in counters: index 1.
So my approach in v1 version of this patch was as follows:
- send the accurate number of counters to the kernel (hw + fw)
- fix range checks to take into account gap for index 1
This way OpenSBI just sends correct information to the kernel and
expects (and verifies) correct data in response. Accompanying kernel
fixes are the first two patches in the kernel series, see:
https://lore.kernel.org/linux-riscv/20220623112735.357093-1-geomatsi at gmail.com/T/#m4811c83cf767cdaaeb31e2530d4a51034fcf6c3c

The 3rd kernel patch switches from array to IDR. With that change kernel
driver will support any gaps in counters, not only index 1. So OpenSBI
or any other SBI implementation will be able to exclude some hw or fw
counters if needed without changing kernel driver. So far I can see
two possible examples where it could be useful:
- platform specific quirks in OpenSBI to exclude non-functional counters
- keep some hw counters for internal use in OpenSBI or any other SBI implementation

Regards,
Sergey

