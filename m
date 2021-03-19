From: Atish Patra <atish.patra@wdc.com>
Date: Fri, 19 Mar 2021 15:12:51 -0700
Subject: [RFC 00/14] SBI PMU extension support
Message-ID: <20210319221305.2138412-1-atish.patra@wdc.com>
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

[1] https://lists.riscv.org/g/tech-unixplatformspec/message/598
[2] https://github.com/atishp04/qemu/tree/riscv_pmu_v1 
[3] https://github.com/atishp04/linux/tree/riscv_pmu_v1 
[4] https://github.com/atishp04/opensbi/tree/riscv_pmu_v1 

Atish Patra (14):
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
platform: generic: Add PMU support

docs/pmu_support.md               |  83 +++++
include/sbi/sbi_ecall.h           |   1 +
include/sbi/sbi_ecall_interface.h | 129 +++++++-
include/sbi/sbi_error.h           |   2 +
include/sbi/sbi_hart.h            |   5 +-
include/sbi/sbi_list.h            |  11 +
include/sbi/sbi_platform.h        |  38 +++
include/sbi/sbi_pmu.h             |  71 ++++
include/sbi/sbi_tlb.h             |   1 +
include/sbi_utils/fdt/fdt_pmu.h   |  46 +++
lib/sbi/objects.mk                |   2 +
lib/sbi/riscv_asm.c               |  35 ++
lib/sbi/sbi_ecall.c               |  10 +
lib/sbi/sbi_ecall_pmu.c           |  73 ++++
lib/sbi/sbi_ecall_replace.c       |   2 +
lib/sbi/sbi_hart.c                |  86 ++++-
lib/sbi/sbi_init.c                |  11 +-
lib/sbi/sbi_ipi.c                 |   7 +
lib/sbi/sbi_pmu.c                 | 534 ++++++++++++++++++++++++++++++
lib/sbi/sbi_tlb.c                 |  36 ++
lib/sbi/sbi_trap.c                |   9 +
lib/utils/fdt/fdt_fixup.c         |   2 +
lib/utils/fdt/fdt_pmu.c           | 110 ++++++
lib/utils/fdt/objects.mk          |   1 +
platform/generic/platform.c       |  32 ++
25 files changed, 1328 insertions(+), 9 deletions(-)
create mode 100644 docs/pmu_support.md
create mode 100644 include/sbi/sbi_pmu.h
create mode 100644 include/sbi_utils/fdt/fdt_pmu.h
create mode 100644 lib/sbi/sbi_ecall_pmu.c
create mode 100644 lib/sbi/sbi_pmu.c
create mode 100644 lib/utils/fdt/fdt_pmu.c

--
2.25.1


