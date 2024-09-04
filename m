From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue,  3 Sep 2024 18:24:09 -0700
Subject: [PATCH 0/3] Manage IPI driver lifecycle from SBI core
Message-ID: <20240904012508.3626840-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For three kinds of devices (IPI, irqchip, and timer) the platform is
responsible for implementing extra warm init and exit lifecycle hooks.
Since the driver lifecycle is the same regardless of platform, I think
it makes sense to call these lifecycle functions from the SBI core, not
the platform. This produces smaller code since we don't need to track
the current driver in multiple places. And since it makes the FDT driver
interface the same for all kinds of devices, it allows us to reuse the
same FDT scan/match/init code across all of them.

This series converts the IPI drivers. This is the most trivial of the
three, since all of the logic in the existing IPI .warm_init hooks is
actually a duplicate of the .ipi_clear hook in struct sbi_ipi_device.

I sent the timer conversion here[1], and the irqchip conversion is
upcoming and is the largest of the three.

[1]: http://lists.infradead.org/pipermail/opensbi/2024-September/007332.html


Samuel Holland (3):
  lib: sbi_ipi: Make .ipi_clear always target the current hart
  lib: sbi_ipi: Move initial IPI clear to sbi_ipi_init()
  platform: Drop IPI warm init and exit hooks

 include/sbi/sbi_ipi.h                |  6 +++---
 include/sbi/sbi_platform.h           | 25 +++++-----------------
 include/sbi_utils/ipi/aclint_mswi.h  |  2 --
 include/sbi_utils/ipi/andes_plicsw.h |  2 --
 include/sbi_utils/ipi/fdt_ipi.h      |  9 ++------
 lib/sbi/sbi_hsm.c                    |  2 +-
 lib/sbi/sbi_init.c                   |  2 +-
 lib/sbi/sbi_ipi.c                    | 24 +++++++++------------
 lib/utils/ipi/aclint_mswi.c          | 19 +++--------------
 lib/utils/ipi/andes_plicsw.c         | 14 ++-----------
 lib/utils/ipi/fdt_ipi.c              | 31 +---------------------------
 lib/utils/ipi/fdt_ipi_mswi.c         |  2 --
 lib/utils/ipi/fdt_ipi_plicsw.c       |  2 --
 platform/fpga/ariane/platform.c      | 14 +++----------
 platform/fpga/openpiton/platform.c   | 14 +++----------
 platform/generic/platform.c          |  1 -
 platform/kendryte/k210/platform.c    | 12 ++---------
 platform/nuclei/ux600/platform.c     | 12 ++---------
 platform/template/platform.c         | 14 +++----------
 19 files changed, 41 insertions(+), 166 deletions(-)

-- 
2.45.1


