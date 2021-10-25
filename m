From: Atish Patra <atish.patra@wdc.com>
Date: Mon, 25 Oct 2021 12:44:45 -0700
Subject: [PATCH v2 00/10] Sscof extension support
Message-ID: <20211025194455.232828-1-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Sscofpmf extension [1] ('Ss' for Privileged arch and Supervisor-level
extensions, and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
allows the perf like tool to handle overflow interrupts and filtering support.

This series implements all the bits required to support "Sscof" extension and
few other fixes. This series can be found at github[4] as well. 
It has been tested with Linux kernel patches[3] for different hardware/firmware
events on Qemu.

This patch requires QEMU support series[2] to work. As the Qemu did not
support mhpmevent/mhpmcounter before this series, these changes are not backward
compatible to avoid code churn. Anybody who wants to use perf must include
Qemu, OpenSBI, Linux kernel patches.

Tested on both Qemu and HiFive unmatched.

Changes from v1->v2:
1. Addressed all the comments on v1.
2. Relaxed the mcountinhibit restriction for PMU extension enablement.
3. Delete the interrupt node in DT if sscof extension is not present.

[1] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit 
https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] https://github.com/atishp04/qemu/tree/riscv_pmu_v3
[3] https://github.com/atishp04/linux/tree/riscv_pmu_v4
[4] https://github.com/atishp04/opensbi/tree/pmu_sscofpmf_v2

Atish Patra (10):
riscv: Add new CSRs introduced by Sscofpmf extension
lib: sbi: Use csr_read/write_num for mhpmevent[h] csrs as well
lib: sbi: Detect SSCOF extension at run time
lib: sbi: Delegate PMU counter overflow interrupt to S mode
lib: sbi: Support sscof extension in OpenSBI
lib: sbi: Always enable access for all counters
lib: sbi: Allow programmable counters to monitor cycle/instret events
lib: sbi: Reset the mhpmevent value upon counter reset
lib: sbi: Counter info width should be zero indexed
lib: sbi: Enable PMU extension for platforms without mcountinhibit

include/sbi/riscv_encoding.h |  60 ++++++++++
include/sbi/sbi_hart.h       |   4 +-
include/sbi/sbi_pmu.h        |   1 +
lib/sbi/riscv_asm.c          |  13 ++
lib/sbi/sbi_ecall_pmu.c      |  10 +-
lib/sbi/sbi_hart.c           |  36 +++---
lib/sbi/sbi_pmu.c            | 225 ++++++++++++++++++++++++++---------
lib/utils/fdt/fdt_pmu.c      |   4 +
8 files changed, 273 insertions(+), 80 deletions(-)

--
2.31.1


