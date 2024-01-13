From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sat, 13 Jan 2024 01:03:04 -0800
Subject: [RFC PATCH v2 0/2] lib: sbi_pmu: Add PMU snapshot extension
In-Reply-To: <IA1PR20MB4953961AECED4AEB4544DBAFBB6F2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <CAHBxVyGFODOrxNPKWeCdFpAGLbhPCj1a_+pTq44=8Q7pREkoBQ@mail.gmail.com>
 <IA1PR20MB4953961AECED4AEB4544DBAFBB6F2@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAHBxVyF-+pC72+jLTLqoYv7tY6isLycEMsM1bu9f+43oeS_ndw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 12, 2024 at 3:22?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> >On Wed, Jan 10, 2024 at 4:34?PM Inochi Amaoto <inochiama@outlook.com> wrote:
> >>
> >> Although PMU snapshot extension is not very useful for normal use,
> >> it can provide a recoverable snapshot for the PMU system. It is useful
> >> for KVM VMs, especially for VM snapshot.
> >>
> >
> >Can you please further clarify how adding the PMU snapshot support in
> >OpenSBI helps the KVM VM snapshot?
> >During a VM snapshot, the host would have saved the values in the vcpu
> >structure already.
> >The PMU snapshot save/restore happens only in SBI calls. Thus, the
> >host has to invoke the SBI call (in context switch path)
> >to get an updated copy in the shared memory. PMU snapshot helps in
> >Virtualization as the host virtualizes the counters which
> >results in traps for each CSR read access within the guest. However,
> >the host can directly read the CSR as well.
> >
>
> Yes, I have already notice the vcpu have saved these values. IIRC, only
> `SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT` can restore the interrupt state.
> This is not useful for the normal run, but may be required when needing
> a persistent snapshot, (migration and VM snapshot). As a result, the host
> should only call this when saving/restoring the VM to persistent storage,
> and should not call this in the normal run for performance issue.
>
> >Adding PMU snapshot in OpenSBI may affect negatively as well depending
> >on the state of the L1 cache and the access latency.
> >CSR access should be quite fast in most of the implementations. If it
> >results in a miss, the latency would be even higher as you have to
> >fetch the data from L2 or DRAM.
> >
>
> I have already notice this latency problem. As I mention before, this
> should be called by the hypervisor when vcpu init/exit. So this problem

Why would a hypervisor call counter start/stop calls during the vcpu
init/exit path ?
These are PMU specific snapshots for counters that are in use already.
Every time there is a context switch
of a vcpu, the perf subsystem in the host would collect the counter
value anyways.
During the VM snapshot, those values would be used. The SBI
implementation should save the counters
specified in the counter mask specified in the stop call. If a PMU is
not in use, it wouldn't matter.

> may be acceptable. In fact, I found that we can directly implement the
> vcpu PMU sampling by pass a page for guset to host SBI. But I struggle on

Not sure what do you mean by that. vcpu PMU sampling support patches
can be found here here[1]

[1] https://lore.kernel.org/lkml/20240110231359.1239367-2-atishp at rivosinc.com/T/#m9943791909628f90ede01303def7f647db81bf9d

> improving it because fetching snapshot is too costly as you said.

