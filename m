From: Samuel Holland <samuel@sholland.org>
Date: Sun, 12 Jun 2022 20:03:46 -0500
Subject: [PATCH v3 0/9] HSM implementation for Allwinner D1
Message-ID: <20220613010355.28014-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds a minimal working HSM implementation for the Allwinner
D1 SoC. It works with the Linux sbi_cpuidle driver. Even with canned
values for entry/exit latency, I am seeing 30-45 mW reduction in power
usage at idle.

Since this is the first HSM driver submission, there is no example to
follow. I have updated the series based on the comments to the RFCs.
Still, comments welcome!

Regards,
Samuel

Changes in v3:
 - Fix typo in commit message
 - Move comment about priority range to function declaration
 - Rename irqchip_plic_* functions to fdt_plic_*
 - Add a "bool smode" parameter instead of hard coding the context ID

Changes in v2:
 - Rebase on top of the current master branch
 - Use array_size() from sbi_types.h
 - Use a separate variable for each CSR instead of an array
 - Use the PLIC helpers added in earlier patches
 - Use the saved SIE bits to program the wakeup interrupt mask
 - Set the entry address only once during cold boot
 - Use the generic implementation for retentive suspend
 - Clean up/add comments throughout the HSM implementation

Samuel Holland (9):
  lib: sbi_hsm: Call a device hook during hart resume
  lib: sbi_hsm: Assume a consistent resume address
  lib: irqchip/plic: Constify plic_data pointers
  lib: irqchip/plic: Factor out a context init function
  lib: irqchip/plic: Add context save/restore helpers
  lib: irqchip/plic: Add priority save/restore helpers
  lib: utils/irqchip: Add FDT wrappers for PLIC save/restore functions
  lib: utils/irqchip: Add wrapper for T-HEAD PLIC delegation
  platform: Add HSM implementation for Allwinner D1

 include/sbi/sbi_hsm.h                        |  12 +-
 include/sbi_utils/irqchip/fdt_irqchip_plic.h |  22 ++
 include/sbi_utils/irqchip/plic.h             |  20 +-
 lib/sbi/sbi_hsm.c                            |  54 ++---
 lib/utils/irqchip/fdt_irqchip_plic.c         |  39 ++++
 lib/utils/irqchip/plic.c                     | 124 ++++++++---
 platform/fpga/ariane/platform.c              |  19 +-
 platform/fpga/openpiton/platform.c           |  19 +-
 platform/generic/allwinner/objects.mk        |   6 +
 platform/generic/allwinner/sun20i-d1.c       | 210 +++++++++++++++++++
 10 files changed, 442 insertions(+), 83 deletions(-)
 create mode 100644 include/sbi_utils/irqchip/fdt_irqchip_plic.h
 create mode 100644 platform/generic/allwinner/objects.mk
 create mode 100644 platform/generic/allwinner/sun20i-d1.c

-- 
2.35.1


