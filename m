From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  4 Jan 2022 15:39:39 +0530
Subject: [PATCH 00/13] OpenSBI RISC-V AIA Support
Message-ID: <20220104100952.127448-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The advanced interrupt architecture (AIA) extends the per-HART local
interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
and Advanced PLIC (wired interrupt controller).

The latest AIA draft specification can be found here:
https://github.com/riscv/riscv-aia/releases/download/0.2-draft.28/riscv-interrupts-028.pdf

To test series, we require:
1) QEMU from riscv_aia_v6 branch of https://github.com/avpatel/qemu.git
2) Linux from riscv_aia_v1 branch of https://github.com/avpatel/linux.git

This series can be found riscv_aia_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (13):
  include: sbi: Add AIA related CSR defines
  lib: sbi: Detect AIA CSRs at boot-time
  lib: sbi: Use AIA CSRs for local interrupts when available
  lib: sbi: Add sbi_trap_set_external_irqfn() API
  lib: utils/irqchip: Allow multiple FDT irqchip drivers
  include: sbi: Introduce nascent_init() platform callback
  lib: sbi: Enable mie.MEIE bit for IPIs based on external interrupts.
  lib: utils/irqchip: Add IMSIC library
  lib: utils/irqchip: Add FDT based driver for IMSIC
  lib: utils: Disable appropriate IMSIC DT nodes in fdt_fixups()
  lib: utils/irqchip: Add APLIC initialization library
  lib: utils/irqchip: Add FDT based driver for APLIC
  lib: utils: Disable appropriate APLIC DT nodes in fdt_fixups()

 include/sbi/riscv_encoding.h          |  76 +++++++
 include/sbi/sbi_hart.h                |   4 +-
 include/sbi/sbi_platform.h            |  17 ++
 include/sbi/sbi_trap.h                |   2 +
 include/sbi_utils/fdt/fdt_fixup.h     |  29 ++-
 include/sbi_utils/fdt/fdt_helper.h    |  10 +
 include/sbi_utils/irqchip/aplic.h     |  47 +++++
 include/sbi_utils/irqchip/imsic.h     |  50 +++++
 lib/sbi/sbi_hart.c                    |  23 +++
 lib/sbi/sbi_hsm.c                     |   4 +-
 lib/sbi/sbi_init.c                    |  17 +-
 lib/sbi/sbi_trap.c                    |  86 +++++++-
 lib/utils/fdt/fdt_fixup.c             |  43 +++-
 lib/utils/fdt/fdt_helper.c            | 262 +++++++++++++++++++++++
 lib/utils/irqchip/aplic.c             | 279 +++++++++++++++++++++++++
 lib/utils/irqchip/fdt_irqchip.c       |  41 +++-
 lib/utils/irqchip/fdt_irqchip_aplic.c |  56 +++++
 lib/utils/irqchip/fdt_irqchip_imsic.c | 106 ++++++++++
 lib/utils/irqchip/imsic.c             | 287 ++++++++++++++++++++++++++
 lib/utils/irqchip/objects.mk          |   4 +
 platform/generic/platform.c           |  12 ++
 21 files changed, 1427 insertions(+), 28 deletions(-)
 create mode 100644 include/sbi_utils/irqchip/aplic.h
 create mode 100644 include/sbi_utils/irqchip/imsic.h
 create mode 100644 lib/utils/irqchip/aplic.c
 create mode 100644 lib/utils/irqchip/fdt_irqchip_aplic.c
 create mode 100644 lib/utils/irqchip/fdt_irqchip_imsic.c
 create mode 100644 lib/utils/irqchip/imsic.c

-- 
2.25.1


