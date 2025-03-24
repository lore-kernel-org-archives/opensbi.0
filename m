From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 24 Mar 2025 08:48:04 -0700
Subject: [PATCH v2 0/5] Cache CPU information from the DT
Message-ID: <20250324154858.4147529-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It turns out that OpenSBI spends a lot of time repeatedly parsing the
FDT to get information about the CPUs and local interrupt controllers.
Caching this information can significantly speed up cold boot. For
example, on the HiFive Premier P550 board (4 cores, PLIC, CLINT),
applying this series decreased boot time by a third, from 6.35 ms to
4.23 ms (with SBI_SCRATCH_NO_BOOT_PRINTS set). The impact would be even
larger on systems with more cores. And this series comes with a net
decrease in code size for the generic platform.

To be conservative, I avoided using cached information inside FDT fixup
functions, as changes to the devicetree may invalidate the offsets
(though the phandles would still be accurate).

Since the cached information is stored in the scratch space, I did not
find a good way to combine the parsing with the generic
fw_platform_init().

Changes in v2:
 - Rename for_each_hartindex() to sbi_for_each_hartindex()
 - Add missing include of fdt_cpu.h in fdt_helper.c

Samuel Holland (5):
  lib utils/fdt: Drop fdt_parse_max_enabled_hart_id()
  lib: utils/fdt: Cache CPU information from the DT
  lib: utils/fdt: Used cached CPU DT information
  lib: utils: Use fdt_cpu_intc_phandle_to_hartindex()
  lib: utils: Use fdt_cpu_get_timebase_frequency()

 include/sbi_utils/fdt/fdt_cpu.h       |  57 +++++++++++
 include/sbi_utils/fdt/fdt_helper.h    |   4 -
 include/sbi_utils/irqchip/imsic.h     |   2 +-
 lib/utils/fdt/fdt_cpu.c               | 110 +++++++++++++++++++++
 lib/utils/fdt/fdt_domain.c            | 117 +++++++---------------
 lib/utils/fdt/fdt_helper.c            | 133 ++++----------------------
 lib/utils/fdt/objects.mk              |   1 +
 lib/utils/irqchip/fdt_irqchip_imsic.c |  19 +---
 lib/utils/irqchip/fdt_irqchip_plic.c  |  21 +---
 lib/utils/irqchip/imsic.c             |   6 +-
 lib/utils/timer/fdt_timer_mtimer.c    |   7 +-
 lib/utils/timer/fdt_timer_plmt.c      |   8 +-
 platform/fpga/openpiton/platform.c    |  11 ++-
 platform/generic/platform.c           |   5 +
 platform/kendryte/k210/platform.c     |  10 ++
 15 files changed, 264 insertions(+), 247 deletions(-)
 create mode 100644 include/sbi_utils/fdt/fdt_cpu.h
 create mode 100644 lib/utils/fdt/fdt_cpu.c

-- 
2.47.2


