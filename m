From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Jan 2023 10:29:23 +0530
Subject: [PATCH v4 0/6] Implement hart hotplug using HSM extension for AE350
In-Reply-To: <20230120030512.8778-1-peterlin@andestech.com>
References: <20230120030512.8778-1-peterlin@andestech.com>
Message-ID: <CAAhSdy06MawBz5ps-j8kpcLr2DCTLmv8moKqL_v6pXN8wn+a_Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 20, 2023 at 8:35 AM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> The patchset includes implementing hotplug with ATCSMU deep sleep mode
> using HSM extension, introduces ATCSMU system device and some fixes.
> Base on OpenSBI v1.2 and test on AE350 platform with the CPU listed below:
>
> RV64:
> * AX45MP quad-core
> * AX45MP octa-core
> * AX25MP quad-core
>
> RV32:
> * A45MP quad-core
> * A25MP quad-core
>
> Changes v1 -> v2:
> * Drop patch for adding secondary_boot callback
> * Add a PATCH4 to move ATCSMU related code to lib/utils/sys
> * Include RB tags
> Changes v2 -> v3:
> * Refine PATCH4 (suggested by Anup [1])
>   * Remove redundant headers
>   * Move is_andes25() to ae350.c
>   * Add "struct smu_data *smu" parameter to each smu related functions
> * Refine PATCH6 (suggested by Anup [2])
>   * Make FDT_RESET_ATCWDT200 depends on SYS_ATCSMU
> * PATCH5 & PATCH6: Instantiate struct smu_data in ae350.c and fdt_reset_atcwdt200.c
> Changes v3 -> v4
> * PATCH4: Fix indentation for atcsmu.h
>
> [1] https://lists.infradead.org/pipermail/opensbi/2023-January/004236.html
> [2] https://lists.infradead.org/pipermail/opensbi/2023-January/004237.html
>
> Yu Chien Peter Lin (6):
>   docs: generic.md: fix typo of andes-ae350
>   lib: sbi_hsm: handle failure when hart_stop returns SBI_ENOTSUPP
>   include: types: add always inline compiler attribute
>   lib: utils: atcsmu: Add Andes System Management Unit support
>   platform: andes/ae350: Implement hart hotplug using HSM extension
>   lib: reset/fdt_reset_atcwdt200: Use defined macros and function in
>     atcsmu.h

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  docs/platform/generic.md                 |  2 +-
>  include/sbi/sbi_hsm.h                    |  8 +-
>  include/sbi/sbi_types.h                  |  1 +
>  include/sbi_utils/sys/atcsmu.h           | 59 ++++++++++++++
>  lib/sbi/sbi_hsm.c                        |  7 +-
>  lib/utils/reset/Kconfig                  |  1 +
>  lib/utils/reset/fdt_reset_atcwdt200.c    | 21 ++---
>  lib/utils/sys/Kconfig                    |  4 +
>  lib/utils/sys/atcsmu.c                   | 92 ++++++++++++++++++++++
>  lib/utils/sys/objects.mk                 |  1 +
>  platform/generic/Kconfig                 |  1 +
>  platform/generic/andes/ae350.c           | 99 ++++++++++++++++++++++++
>  platform/generic/andes/objects.mk        |  2 +-
>  platform/generic/andes/sleep.S           | 70 +++++++++++++++++
>  platform/generic/include/andes/andes45.h | 10 +++
>  15 files changed, 357 insertions(+), 21 deletions(-)
>  create mode 100644 include/sbi_utils/sys/atcsmu.h
>  create mode 100644 lib/utils/sys/atcsmu.c
>  create mode 100644 platform/generic/andes/sleep.S
>  create mode 100644 platform/generic/include/andes/andes45.h
>
> --
> 2.34.1
>

