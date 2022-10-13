From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 09:56:43 +0530
Subject: [PATCH v5 0/5] Add support for T-HEAD C9xx PMU extensions
In-Reply-To: <20221004164227.1381825-1-heiko@sntech.de>
References: <20221004164227.1381825-1-heiko@sntech.de>
Message-ID: <CAAhSdy2DvKZOZdmRzxpmT9UmV-ySMwzUNkQtU6dkzSLVs-VChw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 4, 2022 at 10:13 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The T-HEAD C9XX cores implement functionality very similar to SSCOFPMF.
> Instead of implementing a separate interface into SBI as done in v1,
> we can add the C9XX tidbits with quite minimal overhead and leaverage
> the existing SBI pmu interface including giving access to the firmware
> counters.
>
> The current only hickup is the detection override in sbi_hart, where
> I still need to find out why the MHPMCOUNTERs are not writeable
> at _that_ point of the boot, but with this series on top of openSBI 1.1
> and the matching kernel perf patch I get reasonable results for example
> for:
>
> perf stat -e cycles -e instructions -e L1-icache-load-misses -e L1-icache-loads ls
>
>  Performance counter stats for 'ls':
>
>           17119496      cycles
>            2867765      instructions              #    0.17  insn per cycle
>              55929      L1-icache-load-misses     #    1.61% of all L1-icache accesses
>            3467346      L1-icache-loads
>
>        0.030156216 seconds time elapsed
>
>        0.000000000 seconds user
>        0.023496000 seconds sys
>
> changes in v5:
> - use csr_set, csr_clear in allwinner pmu functions
> - expose hart_features struct into header
> - make hart_features param for extension_init callback
>   to allow platforms to override specific settings
>
> changes in v4:
> - use the new sbi_pmu_device structure for holding the
>   overrides and extend it where needed
>
> changes in v3:
> - follow Atish's advice and implement an abstraction
>   to not pollute the core pmu with cpu-specific variants
>
> changes in v2:
> - don't implement a separate interface but instead modify
>   the sbi-pmu to allow the c9xx to use standard pmu interface
>
>
> Heiko Stuebner (5):
>   lib: sbi_pmu: move pmu irq information into pmu itself
>   lib: sbi_hart: move hart_features struct to a public location
>   lib: sbi_platform: expose hart_features to extension_init callback
>   platform: generic: add extensions_init handler and platform-override
>   platform: generic: allwinner: add support for c9xx pmu

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi/sbi_hart.h                       |  11 ++
>  include/sbi/sbi_platform.h                   |   8 +-
>  include/sbi/sbi_pmu.h                        |   8 ++
>  lib/sbi/sbi_hart.c                           |  43 +++----
>  lib/sbi/sbi_pmu.c                            |  12 ++
>  platform/generic/allwinner/sun20i-d1.c       |  60 +++++++++
>  platform/generic/include/platform_override.h |   3 +
>  platform/generic/include/thead_c9xx.h        | 127 +++++++++++++++++++
>  platform/generic/platform.c                  |  10 ++
>  9 files changed, 253 insertions(+), 29 deletions(-)
>  create mode 100644 platform/generic/include/thead_c9xx.h
>
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

