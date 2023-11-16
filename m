From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 12:31:03 +0530
Subject: [PATCH v2 00/11] Add Andes PMU extension support
In-Reply-To: <20231019113713.3508153-1-peterlin@andestech.com>
References: <20231019113713.3508153-1-peterlin@andestech.com>
Message-ID: <CAAhSdy3TRicu-kE=JUesndHwGXmHfCBvAMBcH=Sv8bdqXtOV5g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 19, 2023 at 5:10?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> This patch series enables perf tool to utilize Andes PMU
> extension via PMU SBI calls, provides PMU device callbacks
> to achieve event sampling and mode filtering.
>
> This version also introduces a platform override fdt_add_pmu_mappings()
> to create event mappings before PMU setup if a valid PMU node
> is missing.
>
> The last patch provides a PMU node example used on AX45MP cores.
>
> The OpenSBI and Linux patches can be found on Andes Technology GitHub
> - https://github.com/andestech/opensbi/commits/andes-pmu-support-v2
> - https://github.com/andestech/linux/commits/andes-pmu-support-v2
>
> Yu Chien Peter Lin (11):
>   sbi: sbi_pmu: Improve sbi_pmu_init() error handling
>   sbi: sbi_pmu: Add hw_counter_filter_mode() to pmu device
>   platform: include: andes45: Add PMU related CSR defines
>   platform: andes: Add Andes custom PMU support
>   platform: andes: Enable Andes PMU for AE350
>   platform: rzfive: Enable Andes PMU for RZ/Five
>   lib: utils: fdt_fixup: Add fdt_add_pmu_mappings() helper function
>   lib: utils: fdt_fixup: Allow preserving PMU properties
>   platform: andes: Factor out is_andes() helper
>   platform: andes: Implement andes_fdt_add_pmu_mappings platform
>     override
>   docs: pmu: Add Andes PMU node example

It would be great to have v3 sooner because next month we
have OpenSBI v1.4 release.

Regards,
Anup

>
>  docs/pmu_support.md                          |  82 ++++
>  include/sbi/sbi_ecall_interface.h            |   5 +
>  include/sbi/sbi_pmu.h                        |   6 +
>  include/sbi/sbi_scratch.h                    |   2 +
>  include/sbi_utils/fdt/fdt_fixup.h            |  48 +++
>  lib/sbi/sbi_pmu.c                            |  10 +-
>  lib/utils/fdt/fdt_fixup.c                    | 101 ++++-
>  lib/utils/fdt/fdt_pmu.c                      |   2 +-
>  platform/generic/Kconfig                     |   4 +
>  platform/generic/andes/Kconfig               |  11 +
>  platform/generic/andes/ae350.c               |  31 +-
>  platform/generic/andes/andes_hpm.c           | 381 +++++++++++++++++++
>  platform/generic/andes/andes_pmu.c           |  81 ++++
>  platform/generic/andes/objects.mk            |   2 +
>  platform/generic/include/andes/andes45.h     |  32 ++
>  platform/generic/include/andes/andes_hpm.h   |  83 ++++
>  platform/generic/include/andes/andes_pmu.h   |   8 +
>  platform/generic/include/platform_override.h |   1 +
>  platform/generic/platform.c                  |  16 +-
>  platform/generic/renesas/rzfive/rzfive.c     |  18 +-
>  20 files changed, 909 insertions(+), 15 deletions(-)
>  create mode 100644 platform/generic/andes/andes_hpm.c
>  create mode 100644 platform/generic/andes/andes_pmu.c
>  create mode 100644 platform/generic/include/andes/andes_hpm.h
>  create mode 100644 platform/generic/include/andes/andes_pmu.h
>
> --
> 2.34.1
>

