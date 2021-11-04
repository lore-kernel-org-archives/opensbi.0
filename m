From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 17:24:43 +0800
Subject: [PATCH v3 00/11] Sscof extension support
In-Reply-To: <20211102150959.492991-1-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
Message-ID: <CAEUhbmVPf_SWNdW_2cU33s4Jnsjw+HHbkHOhJORtQ1oXEwA7oA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 2, 2021 at 11:11 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> The Sscofpmf extension [1] ('Ss' for Privileged arch and Supervisor-level
> extensions, and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
> allows the perf like tool to handle overflow interrupts and filtering support.
>
> This series implements all the bits required to support "Sscof" extension and
> few other fixes. This series can be found at github[4] as well.
> It has been tested with Linux kernel patches[3] for different hardware/firmware
> events on Qemu.
>
> This patch requires QEMU support series[2] to work. As the Qemu did not
> support mhpmevent/mhpmcounter before this series, these changes are not backward
> compatible to avoid code churn. Anybody who wants to use perf must include
> Qemu, OpenSBI, Linux kernel patches.
>
> Tested on both Qemu and HiFive unmatched.
>
> Changes from v2->v3:
> 1. Rename the DT prefix to riscv instead of PMU.
>
> Changes from v1->v2:
> 1. Addressed all the comments on v1.
> 2. Relaxed the mcountinhibit restriction for PMU extension enablement.
> 3. Delete the interrupt node in DT if sscof extension is not present.
>
> [1] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit
> https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc

This link looks unnecessary.

> [2] https://github.com/atishp04/qemu/tree/riscv_pmu_v3
> [3] https://github.com/atishp04/linux/tree/riscv_pmu_v4

This link is 404.

> [4] https://github.com/atishp04/opensbi/tree/pmu_sscofpmf_v3
>
> Atish Patra (11):
> riscv: Add new CSRs introduced by Sscofpmf extension
> lib: sbi: Use csr_read/write_num for mhpmevent[h] csrs as well
> lib: sbi: Detect SSCOF extension at run time
> lib: sbi: Delegate PMU counter overflow interrupt to S mode
> lib: sbi: Support sscof extension in OpenSBI
> lib: sbi: Always enable access for all counters
> lib: sbi: Allow programmable counters to monitor cycle/instret events
> lib: sbi: Reset the mhpmevent value upon counter reset
> lib: sbi: Counter info width should be zero indexed
> lib: sbi: Enable PMU extension for platforms without mcountinhibit
> lib: utils: Rename the prefix in PMU DT properties
>
> docs/pmu_support.md          |  12 +-
> include/sbi/riscv_encoding.h |  60 ++++++++++
> include/sbi/sbi_hart.h       |   4 +-
> include/sbi/sbi_pmu.h        |   1 +
> lib/sbi/riscv_asm.c          |  13 ++
> lib/sbi/sbi_ecall_pmu.c      |  10 +-
> lib/sbi/sbi_hart.c           |  36 +++---
> lib/sbi/sbi_pmu.c            | 225 ++++++++++++++++++++++++++---------
> lib/utils/fdt/fdt_pmu.c      |  16 ++-
> 9 files changed, 285 insertions(+), 92 deletions(-)
>

Regards,
Bin

