From: Xiang W <wxjstz@126.com>
Date: Thu, 17 Oct 2024 02:04:14 +0800
Subject: [RFC PATCH 0/2] Improve pmp support
Message-ID: <8822e93d5747663d1928c4240e480796a45a36e7.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sv32 supports 2^34 physical memory under RV32. Previously, pmp only supported
 2^Xlen physical memory, and the physical memory was limited to 4G under rv32.
 This patch hopes to remove this limitation.

Xiang W (2):
  lib: sbi: Improve pmp_get/pmp_set
  lib: sbi: Using word addresses in memregion

 include/sbi/sbi_domain.h                 | 45 ++++++++-----
 lib/sbi/riscv_asm.c                      | 42 ++++++------
 lib/sbi/sbi_dbtr.c                       | 15 +----
 lib/sbi/sbi_domain.c                     | 85 ++++++++++++++----------
 lib/sbi/sbi_ecall_dbcn.c                 | 18 +----
 lib/sbi/sbi_hart.c                       |  8 +--
 lib/sbi/sbi_hsm.c                        |  4 +-
 lib/sbi/sbi_sse.c                        | 22 ++----
 lib/sbi/sbi_system.c                     |  2 +-
 lib/utils/fdt/fdt_domain.c               |  4 +-
 lib/utils/fdt/fdt_fixup.c                |  2 +-
 lib/utils/ipi/aclint_mswi.c              |  3 +-
 lib/utils/ipi/andes_plicsw.c             |  4 +-
 lib/utils/irqchip/aplic.c                |  2 +-
 lib/utils/irqchip/imsic.c                |  4 +-
 lib/utils/irqchip/plic.c                 |  5 +-
 lib/utils/regmap/fdt_regmap_syscon.c     |  2 +-
 lib/utils/serial/cadence-uart.c          |  3 +-
 lib/utils/serial/fdt_serial_htif.c       |  3 +-
 lib/utils/serial/uart8250.c              |  3 +-
 lib/utils/timer/aclint_mtimer.c          | 50 ++++++++------
 lib/utils/timer/andes_plmt.c             |  5 +-
 platform/generic/renesas/rzfive/rzfive.c |  5 +-
 platform/generic/sophgo/sg2042.c         |  6 +-
 24 files changed, 173 insertions(+), 169 deletions(-)

-- 
2.45.2


