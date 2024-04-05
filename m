From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Apr 2024 17:16:13 +0530
Subject: [PATCH v3 0/3] Add support for Supervisor Software Events extension
In-Reply-To: <20240321155720.1966860-1-cleger@rivosinc.com>
References: <20240321155720.1966860-1-cleger@rivosinc.com>
Message-ID: <CAAhSdy0tpU4=Kn6XjqztDxWUdU5gAwP-9V_V+DctJKY-6ySOcQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 21, 2024 at 9:27?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
> to inject software events from an SBI implementation to supervisor
> software such that it preempts all other supervisor level traps and
> interrupts [1]. This series implements the V3 version of the spec.
>
> Various events are defined and can be send asynchronously to supervisor
> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> as platform specific events. Events can be either local (per-hart) or
> global. Events can be nested on top of each other based on priority and
> can interrupt the supervisor mode at any time.
>
> This implementation can be tested using kvm-unit-tests [2] with the
> following commands:
>
> Build kvm-unit-tests:
>
> $ git clone https://github.com/clementleger/kvm-unit-tests.git
> $ cd kvm-unit-tests
> $ git switch dev/cleger/sse
> $ ./configure --arch=riscv64 --cross-prefix=$CROSS_COMPILE
> $ make
>
> Run using Qemu:
>
> $ ./qemu-system-riscv64 \
>         -smp 4 \
>         -M virt \
>         -cpu rv64 \
>         -nographic \
>         -serial mon:stdio \
>         -bios <opensbi>/build/platform/generic/firmware/fw_jump.bin \
>         -kernel <kvm-unit-tests>/riscv/sbi_sse.flat
>
> An implementation of a SSE "client" in linux is available [3].
> This series can be found on github [5].
>
> Link: https://lists.riscv.org/g/tech-prs/message/798 [1]
> Link: https://github.com/clementleger/kvm-unit-tests/tree/dev/cleger/sse [2]
> Link: https://github.com/rivosinc/linux/tree/dev/cleger/sse [3]
> Link: http://lists.infradead.org/pipermail/opensbi/2024-March/006670.html [4]
> Link: https://github.com/rivosinc/opensbi/tree/dev/cleger/sse_v3 [5]
>
> ---
>
> Changes from v3:
>  - Changes to follow v3 SSE specification
>  - Use masks instead of struct with bitfields for status
>  - Rework locking
>  - SSE pending event processing is now done upon returning to previous
>    mode
>
> v2: http://lists.infradead.org/pipermail/opensbi/2024-January/006223.html
>
> Changes from v2:
>  - Move local/global event count initialization out of sse_global_init()
>  - Remove PMU_IRQ_CLEAR SBI call and clear IRQ on SSE event completion
>  - Change SBI_ERR_X to SBI_EXX defines
>  - Add guards for invalid __riscv_xlen values
>  - Update parameters passing (a6, a7)
>
> v1: http://lists.infradead.org/pipermail/opensbi/2023-November/006015.html
>
> Changes from v1:
>  - Implemented SSE Spec v2
>  - Change event state checking (Xiang W)
>
> Cl?ment L?ger (3):
>   lib: sbi: Add support for Supervisor Software Events extension
>   lib: sbi: Implement SBI SSE extension
>   lib: sbi: Add SSE support for PMU events

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi/sbi_ecall_interface.h |   79 +-
>  include/sbi/sbi_error.h           |    2 +
>  include/sbi/sbi_pmu.h             |    3 +
>  include/sbi/sbi_sse.h             |   94 +++
>  lib/sbi/Kconfig                   |    4 +
>  lib/sbi/objects.mk                |    4 +
>  lib/sbi/sbi_ecall_sse.c           |   57 ++
>  lib/sbi/sbi_init.c                |   13 +
>  lib/sbi/sbi_pmu.c                 |   51 ++
>  lib/sbi/sbi_sse.c                 | 1131 +++++++++++++++++++++++++++++
>  lib/sbi/sbi_trap.c                |   11 +
>  11 files changed, 1448 insertions(+), 1 deletion(-)
>  create mode 100644 include/sbi/sbi_sse.h
>  create mode 100644 lib/sbi/sbi_ecall_sse.c
>  create mode 100644 lib/sbi/sbi_sse.c
>
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

