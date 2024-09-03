From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon,  2 Sep 2024 21:06:48 -0700
Subject: [PATCH 0/2] Manage timer driver lifecycle from SBI core
Message-ID: <20240903040814.622145-1-samuel.holland@sifive.com>
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

This series converts the timer drivers. I am sending the IPI and irqchip
conversions separately since they are independent.


Samuel Holland (2):
  lib: sbi_timer: Call driver warm_init from SBI core
  platform: Drop timer warm init and exit hooks

 include/sbi/sbi_platform.h              | 25 ++++----------------
 include/sbi/sbi_timer.h                 |  3 +++
 include/sbi_utils/timer/aclint_mtimer.h |  2 --
 include/sbi_utils/timer/andes_plmt.h    |  1 -
 include/sbi_utils/timer/fdt_timer.h     |  9 ++-----
 lib/sbi/sbi_timer.c                     | 15 +++++++++---
 lib/utils/timer/aclint_mtimer.c         |  3 ++-
 lib/utils/timer/andes_plmt.c            | 23 +++++++++---------
 lib/utils/timer/fdt_timer.c             | 31 +------------------------
 lib/utils/timer/fdt_timer_mtimer.c      |  2 --
 lib/utils/timer/fdt_timer_plmt.c        |  2 --
 platform/fpga/ariane/platform.c         | 14 +++--------
 platform/fpga/openpiton/platform.c      | 14 +++--------
 platform/generic/platform.c             |  1 -
 platform/kendryte/k210/platform.c       | 12 ++--------
 platform/nuclei/ux600/platform.c        | 12 ++--------
 platform/template/platform.c            | 14 +++--------
 17 files changed, 50 insertions(+), 133 deletions(-)

-- 
2.45.1


