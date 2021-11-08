From: Atish Patra <atish.patra@wdc.com>
Date: Mon,  8 Nov 2021 10:52:55 -0800
Subject: [PATCH v5 00/12] Sscof extension support
Message-ID: <20211108185307.389145-1-atish.patra@wdc.com>
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

Changes from v4->v5:
1. Preserved the Reviewed-by tag.
2. Fix a typo in patch 10 around variable declaration.
3. Created a separate patch for a bug fix.

Changes from v3->v4:
1. Replace all instances of sscof to Sscofpmf.
2. Addressed all the nit comments from Anup & Bin.

Changes from v2->v3:
1. Rename the DT prefix to riscv instead of PMU.

Changes from v1->v2:
1. Addressed all the comments on v1.
2. Relaxed the mcountinhibit restriction for PMU extension enablement.
3. Delete the interrupt node in DT if sscof extension is not present.

[1] https://drive.google.com/file/d/1KcjgbLM5L1ZKY8934aJl8aQwGlMz6Cbo/view 
[2] https://github.com/atishp04/qemu/tree/riscv_pmu_v3
[3] https://github.com/atishp04/linux/tree/sbi_pmu_v4
[4] https://github.com/atishp04/opensbi/tree/pmu_sscofpmf_v5

Atish Patra (12):
riscv: Add new CSRs introduced by Sscofpmf[1] extension
lib: sbi: Update csr_read/write_num for PMU
lib: sbi: Detect Sscofpmf extension at run time
lib: sbi: Delegate PMU counter overflow interrupt to S mode
lib: sbi: Support sscofpmf extension in OpenSBI
lib: sbi: Always enable access for all counters
lib: sbi: Allow programmable counters to monitor cycle/instret events
lib: sbi: Reset the mhpmevent value upon counter reset
lib: sbi: Counter info width should be zero indexed
lib: sbi: Enable PMU extension for platforms without mcountinhibit
lib: utils: Rename the prefix in PMU DT properties
lib: sbi: Fix initial value mask while updating the counters

docs/pmu_support.md          |  12 +-
include/sbi/riscv_encoding.h |  61 ++++++++++
include/sbi/sbi_hart.h       |   4 +-
include/sbi/sbi_pmu.h        |   1 +
lib/sbi/riscv_asm.c          |  13 ++
lib/sbi/sbi_ecall_pmu.c      |  10 +-
lib/sbi/sbi_hart.c           |  36 +++---
lib/sbi/sbi_pmu.c            | 229 ++++++++++++++++++++++++++---------
lib/utils/fdt/fdt_pmu.c      |  16 ++-
9 files changed, 290 insertions(+), 92 deletions(-)

--
2.31.1


