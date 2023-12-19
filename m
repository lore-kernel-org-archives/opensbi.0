From: Anup Patel <anup@brainfault.org>
Date: Tue, 19 Dec 2023 19:24:37 +0530
Subject: [PATCH v2 0/6] Assorted improvements
In-Reply-To: <20231212095926.13371-1-apatel@ventanamicro.com>
References: <20231212095926.13371-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy0yKL8egkYkJAyx_SOiGhBA8U+twHk_dmWs7EJM2QWSKA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 12, 2023 at 3:29?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series does various assorted improvements. The patch1 and patch2
> improve heap usage by reducing size of struct sbi_tlb_info. The patch3
> is fixes PLIC driver for use on platforms with Smepmp. The patch4 and
> patch5 improve ecall handlers.
>
> These patches can also be found the misc_imp_v2 branch at
> https://github.com/avpatel/opensbi.git
>
> Changes since v1:
>  - Addressed Samuel's comment on PATCH1
>  - Added new PATCH6 which enforces that previous booting stage does
>    not enter OpenSBI with mseccfg.MML == 1 on platforms with Smepmp
>
> Anup Patel (6):
>   lib: sbi_tlb: Reduce size of struct sbi_tlb_info
>   platform: generic: Fine tune fw_platform_calculate_heap_size()
>   lib: utils/irqchip: Add shared MMIO region for PLIC in root domain
>   lib: sbi: Allow ecall handlers to directly update register state
>   lib: sbi: Remove the SBI_ETRAP error code
>   lib: sbi: Do not enter OpenSBI with mseccfg.MML == 1

Applied this series to the riscv/opensbi repo.

Regards,
Anup

>
>  include/sbi/sbi_ecall.h                      | 12 ++-
>  include/sbi/sbi_error.h                      |  5 +-
>  include/sbi/sbi_platform.h                   | 19 ++---
>  include/sbi/sbi_tlb.h                        | 29 +++----
>  include/sbi_utils/irqchip/plic.h             |  1 +
>  lib/sbi/sbi_ecall.c                          | 13 +---
>  lib/sbi/sbi_ecall_base.c                     | 27 ++++---
>  lib/sbi/sbi_ecall_cppc.c                     | 13 ++--
>  lib/sbi/sbi_ecall_dbcn.c                     |  9 +--
>  lib/sbi/sbi_ecall_hsm.c                      |  7 +-
>  lib/sbi/sbi_ecall_ipi.c                      |  5 +-
>  lib/sbi/sbi_ecall_legacy.c                   | 59 ++++++++------
>  lib/sbi/sbi_ecall_pmu.c                      | 17 ++--
>  lib/sbi/sbi_ecall_rfence.c                   | 21 +++--
>  lib/sbi/sbi_ecall_srst.c                     |  5 +-
>  lib/sbi/sbi_ecall_susp.c                     |  7 +-
>  lib/sbi/sbi_ecall_time.c                     |  5 +-
>  lib/sbi/sbi_ecall_vendor.c                   |  8 +-
>  lib/sbi/sbi_hart.c                           | 10 +++
>  lib/sbi/sbi_tlb.c                            | 81 ++++++++++++--------
>  lib/utils/fdt/fdt_helper.c                   |  1 +
>  lib/utils/irqchip/plic.c                     |  6 +-
>  platform/fpga/ariane/platform.c              |  3 +
>  platform/fpga/openpiton/platform.c           |  3 +
>  platform/generic/andes/andes_sbi.c           |  7 +-
>  platform/generic/include/andes/andes_sbi.h   |  6 +-
>  platform/generic/include/platform_override.h |  6 +-
>  platform/generic/platform.c                  | 11 ++-
>  platform/kendryte/k210/platform.c            |  1 +
>  platform/kendryte/k210/platform.h            |  1 +
>  platform/nuclei/ux600/platform.c             |  3 +
>  platform/template/platform.c                 |  3 +
>  32 files changed, 224 insertions(+), 180 deletions(-)
>
> --
> 2.34.1
>

