From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 12 Jan 2024 11:42:04 -0800
Subject: [RFC PATCH v2 0/2] lib: sbi_pmu: Add PMU snapshot extension
In-Reply-To: <IA1PR20MB4953A6BEE8F94F7287527A9FBB682@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953A6BEE8F94F7287527A9FBB682@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAHBxVyGFODOrxNPKWeCdFpAGLbhPCj1a_+pTq44=8Q7pREkoBQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 10, 2024 at 4:34?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Although PMU snapshot extension is not very useful for normal use,
> it can provide a recoverable snapshot for the PMU system. It is useful
> for KVM VMs, especially for VM snapshot.
>

Can you please further clarify how adding the PMU snapshot support in
OpenSBI helps the KVM VM snapshot?
During a VM snapshot, the host would have saved the values in the vcpu
structure already.
The PMU snapshot save/restore happens only in SBI calls. Thus, the
host has to invoke the SBI call (in context switch path)
to get an updated copy in the shared memory. PMU snapshot helps in
Virtualization as the host virtualizes the counters which
results in traps for each CSR read access within the guest. However,
the host can directly read the CSR as well.

Adding PMU snapshot in OpenSBI may affect negatively as well depending
on the state of the L1 cache and the access latency.
CSR access should be quite fast in most of the implementations. If it
results in a miss, the latency would be even higher as you have to
fetch the data from L2 or DRAM.

> Add the PMU snapshot function.
>
> Changed from RFC v1:
> 1. fix wrong function in sbi_shm header.
>
> Inochi Amaoto (2):
>   lib: sbi: Add shared memory region support
>   lib: sbi_pmu: Add PMU snapshot implementation
>
>  include/sbi/sbi_bitops.h |   3 +
>  include/sbi/sbi_pmu.h    |   4 ++
>  include/sbi/sbi_shm.h    | 129 +++++++++++++++++++++++++++++++++++
>  lib/sbi/objects.mk       |   1 +
>  lib/sbi/sbi_ecall_pmu.c  |   3 +-
>  lib/sbi/sbi_pmu.c        | 143 +++++++++++++++++++++++++++++++++++++--
>  lib/sbi/sbi_shm.c        | 114 +++++++++++++++++++++++++++++++
>  7 files changed, 390 insertions(+), 7 deletions(-)
>  create mode 100644 include/sbi/sbi_shm.h
>  create mode 100644 lib/sbi/sbi_shm.c
>
> --
> 2.43.0
>

