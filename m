From: Atish Patra <atish.patra@wdc.com>
Date: Thu,  9 Sep 2021 13:40:22 -0700
Subject: [RFC PATCH 0/9] Sscof extension support
Message-ID: <20210909204031.1239254-1-atish.patra@wdc.com>
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

[1] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit 
https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] https://github.com/atishp04/qemu/tree/riscv_pmu_v2
[3] https://github.com/atishp04/linux/tree/riscv_pmu_v3 
[4] https://github.com/atishp04/opensbi/tree/pmu_sscofpmf

Atish Patra (9):
riscv: Add new CSRs introduced by Sscofpmf extension
lib: sbi: Use csr_read/write_num for mhpmeventh csrs as well
lib:sbi: Detect SSCOF extension at run time
lib: sbi: Delegate PMU counter overflow interrupt to S mode
lib:sbi: Support sscof extension in OpenSBI
lib: sbi: Always enable access for all counters
lib: sbi: Allow programmable counters to monitor cycle/instret events
lib:sbi: Reset the mhpmevent value upon counter reset
lib: sbi: Counter info width should be zero indexed

include/sbi/riscv_encoding.h |  55 +++++++++++
include/sbi/sbi_hart.h       |   4 +-
lib/sbi/riscv_asm.c          |  13 +++
lib/sbi/sbi_hart.c           |  32 ++++---
lib/sbi/sbi_pmu.c            | 177 ++++++++++++++++++++++++++---------
5 files changed, 225 insertions(+), 56 deletions(-)

--
2.31.1


