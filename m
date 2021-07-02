From: Atish Patra <atish.patra@wdc.com>
Date: Fri,  2 Jul 2021 11:01:04 -0700
Subject: [PATCH v4 00/15] SBI PMU extension support
Message-ID: <20210702180119.912898-1-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest version of the SBI specification includes a Performance Monitoring
Unit(PMU) extension[1] which allows the supervisor to start/stop/configure
various PMU events. This series implements the SBI PMU extension in OpenSBI.

It doesn't implement the bits required to support "Sscof" extension yet. That
will be added later along with qemu support. This series can be found at github[4]
as well. It has been tested with Linux kernel patches[3] for different
hardware/firmware events on Qemu.

This patch requires basic QEMU support series[2] to work. As the Qemu did not
support mhpmevent/mhpmcounter before this series, these changes are not backward
compatible to avoid code churn. Anybody who wants to use perf must include
Qemu, OpenSBI, Linux kernel patches.

[1] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] https://github.com/atishp04/qemu/tree/riscv_pmu_v1
[3] https://github.com/atishp04/linux/tree/riscv_pmu_v3 
[4] https://github.com/atishp04/opensbi/tree/riscv_pmu_v4 

Changes from v3->v4:
1. Fixed the return code from sbi_pmu_init.
2. Changed the few pmu structures to have uint32_t instead of unsigned long to
   save bss.
3. Dropped the redundant header includes from patch 12.

Changes from v2->v3:
1. Fixed several small fixes in sbi_pmu.c
2. Added additional sanity check for TM bit.
3. Minor fixes in firmware counter patch.
4. Return failure during probe for PMU extension if mcountinhibit is not available
5. Enable the cycle and instruction counter by default.

Changes from v1->v2:
1. Addressed all the comments from v1.
2. Improved the series by following latest SBI PMU extension[1]

Atish Patra (5):
utils: fdt: Add fdt helper functions to parse PMU DT nodes
lib: sbi: Implement SBI PMU extension
lib: sbi: Implement firmware counters
lib:sbi:tlb: Improve function naming
platform: generic: Add PMU support

Atish Patra (15):
docs: Add device tree bindings for SBI PMU extension
lib: sbi: Detect mcountinihibit support at runtime
lib: sbi: Remove stray '' character
lib: sbi: Detect number of bits implemented in mhpmcounter
lib: sbi: Disable m/scounteren & enable mcountinhibit
include: Add a list empty check function
lib: sbi: Remove redundant boot time print statement
lib: sbi: Use csr_read/write_num to read/update PMU counters
lib: sbi: Add PMU specific platform hooks
lib: sbi: Add PMU support
utils: fdt: Add fdt helper functions to parse PMU DT nodes
lib: sbi: Implement SBI PMU extension
lib: sbi: Implement firmware counters
lib:sbi:tlb: Improve function naming
platform: generic: Add PMU support

docs/pmu_support.md               |  79 ++++
include/sbi/sbi_ecall.h           |   1 +
include/sbi/sbi_ecall_interface.h | 138 ++++++-
include/sbi/sbi_error.h           |   2 +
include/sbi/sbi_hart.h            |   5 +-
include/sbi/sbi_list.h            |  11 +
include/sbi/sbi_platform.h        |  39 ++
include/sbi/sbi_pmu.h             |  73 ++++
include/sbi_utils/fdt/fdt_pmu.h   |  46 +++
lib/sbi/objects.mk                |   2 +
lib/sbi/riscv_asm.c               |  35 ++
lib/sbi/sbi_ecall.c               |   3 +
lib/sbi/sbi_ecall_pmu.c           |  93 +++++
lib/sbi/sbi_hart.c                |  86 ++++-
lib/sbi/sbi_illegal_insn.c        |   2 +
lib/sbi/sbi_init.c                |  13 +-
lib/sbi/sbi_ipi.c                 |   6 +
lib/sbi/sbi_misaligned_ldst.c     |   5 +
lib/sbi/sbi_pmu.c                 | 620 ++++++++++++++++++++++++++++++
lib/sbi/sbi_timer.c               |   2 +
lib/sbi/sbi_tlb.c                 |  79 +++-
lib/sbi/sbi_trap.c                |   7 +
lib/utils/fdt/fdt_fixup.c         |   2 +
lib/utils/fdt/fdt_pmu.c           | 111 ++++++
lib/utils/fdt/objects.mk          |   1 +
platform/generic/platform.c       |  30 ++
26 files changed, 1461 insertions(+), 30 deletions(-)
create mode 100644 docs/pmu_support.md
create mode 100644 include/sbi/sbi_pmu.h
create mode 100644 include/sbi_utils/fdt/fdt_pmu.h
create mode 100644 lib/sbi/sbi_ecall_pmu.c
create mode 100644 lib/sbi/sbi_pmu.c
create mode 100644 lib/utils/fdt/fdt_pmu.c

--
2.31.1


