From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Oct 2022 10:42:52 +0530
Subject: [PATCH v4 00/14] Add Andes AE350 fdt driver support
In-Reply-To: <20221014003252.17765-1-peterlin@andestech.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
Message-ID: <CAAhSdy2XvAA_1Qi9-b_d3H5st69ZbJbMdoho2X2fGHnzCY6A7g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 14, 2022 at 6:03 AM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> We move the devices used by AE350 to fdt driver framework, reuse
> existing driver and add timer, ipi and reset drivers.
> The OpenSBI domain support is also enabled. As of now, we can use
> Kconfig to manage these configurations that can support variants of
> Andes platform and SoC like Kendryte K510.
>
> Changes v1 -> v2
>   - Rename Andes-specific devices (PLMT, PLICSW) compatible string
>   - Update ISA string in CPU nodes
> Changes v2 -> v3
>   - Add PATCH1 and PATCH2 to fix typos
>   - Add PATCH3 which factors out a function for adding mtimer and ipi
>     device regions to root domain
>   - Remove unused variable "num_src" and "riscv,ndev" property of ipi
>     device node
> Changes v3 -> v4
>   - Add PATCH3 to fix grammar
>   - Move plmt_{cold,warm}_timer_init() to andes_plmt.c and define
>     fdt_plmt_cold_timer_init() which adds PLMT region and sets
>     timer device
>   - Move plicsw_{cold,warm}_ipi_init() to andes_plicsw.c and define
>     fdt_plicsw_cold_ipi_init() which adds PLICSW region and sets
>     ipi device
>
>
> Yu Chien Peter Lin (14):
>   include: sbi: Fix typo in comment
>   lib: sbi: Fix typo in comment
>   include: sbi: Fix grammar in comment
>   lib: sbi: Add sbi_domain_root_add_memrange() API
>   platform: andes/ae350: Remove enabling cache from an350_final_init
>   platform: andes/ae350: Use kconfig to set platform version and default
>     name
>   platform: andes/ae350: Use fdt serial driver
>   lib: utils/timer: Add Andes fdt timer support
>   lib: utils/reset: Add Andes fdt reset driver support
>   platform: andes/ae350: Use fdt irqchip driver
>   platform: andes/ae350: Add fw_platform_init for platform
>     initialization
>   lib: utils/ipi: Add Andes fdt ipi driver support
>   platform: andes/ae350: Add AE350 domain support
>   docs: andes-ae350.md: Update ae350 documentation for fdt driver
>     support

Applied this series to the riscv/opensbi repo.

Any thoughts on using the generic platform ?

Thanks,
Anup

>
>  docs/platform/andes-ae350.md            | 184 +++++++++++++++++++++++-
>  include/sbi/sbi_domain.h                |  16 ++-
>  include/sbi/sbi_scratch.h               |   2 +-
>  include/sbi_utils/fdt/fdt_helper.h      |   6 +
>  include/sbi_utils/ipi/andes_plicsw.h    |  46 ++++++
>  include/sbi_utils/timer/aclint_mtimer.h |   2 +
>  include/sbi_utils/timer/andes_plmt.h    |  29 ++++
>  lib/sbi/sbi_domain.c                    |  27 ++++
>  lib/sbi/sbi_expected_trap.S             |   2 +-
>  lib/utils/fdt/fdt_helper.c              | 108 ++++++++++++++
>  lib/utils/ipi/Kconfig                   |   9 ++
>  lib/utils/ipi/andes_plicsw.c            | 137 ++++++++++++++++++
>  lib/utils/ipi/fdt_ipi_plicsw.c          |  47 ++++++
>  lib/utils/ipi/objects.mk                |   4 +
>  lib/utils/reset/Kconfig                 |   4 +
>  lib/utils/reset/fdt_reset_atcwdt200.c   | 122 ++++++++++++++++
>  lib/utils/reset/objects.mk              |   3 +
>  lib/utils/timer/Kconfig                 |   9 ++
>  lib/utils/timer/aclint_mtimer.c         |  50 ++-----
>  lib/utils/timer/andes_plmt.c            | 104 ++++++++++++++
>  lib/utils/timer/fdt_timer_plmt.c        |  51 +++++++
>  lib/utils/timer/objects.mk              |   4 +
>  platform/andes/ae350/Kconfig            |  30 +++-
>  platform/andes/ae350/objects.mk         |   2 +-
>  platform/andes/ae350/platform.c         | 165 +++++++++------------
>  platform/andes/ae350/platform.h         |  17 ---
>  platform/andes/ae350/plicsw.c           | 139 ------------------
>  platform/andes/ae350/plicsw.h           |  44 ------
>  platform/andes/ae350/plmt.c             | 107 --------------
>  platform/andes/ae350/plmt.h             |  17 ---
>  30 files changed, 1021 insertions(+), 466 deletions(-)
>  create mode 100644 include/sbi_utils/ipi/andes_plicsw.h
>  create mode 100644 include/sbi_utils/timer/andes_plmt.h
>  create mode 100644 lib/utils/ipi/andes_plicsw.c
>  create mode 100644 lib/utils/ipi/fdt_ipi_plicsw.c
>  create mode 100644 lib/utils/reset/fdt_reset_atcwdt200.c
>  create mode 100644 lib/utils/timer/andes_plmt.c
>  create mode 100644 lib/utils/timer/fdt_timer_plmt.c
>  delete mode 100644 platform/andes/ae350/plicsw.c
>  delete mode 100644 platform/andes/ae350/plicsw.h
>  delete mode 100644 platform/andes/ae350/plmt.c
>  delete mode 100644 platform/andes/ae350/plmt.h
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

