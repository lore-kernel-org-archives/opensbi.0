From: Anup Patel <apatel@ventanamicro.com>
Date: Fri,  5 Jul 2024 12:44:58 +0530
Subject: [PATCH 0/6] Early console buffer for OpenSBI
Message-ID: <20240705071504.50988-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series tries to improve OpenSBI debugging by:
1) Registering console device via platform early_init()
2) Introducing early console buffer

These patches can also be found in the console_early_probe_v1
branch at: https://github.com/avpatel/opensbi.git

Anup Patel (6):
  platform: Setup serial console device in early_init()
  lib: sbi: Remove sbi_console_init() and console_init() platform
    callback
  lib: sbi: Optimize fifo enqueue/dequeue for basic data types
  lib: sbi: Allow forceful queueing of data in sbi_fifo_enqueue()
  include: sbi: Add macros to create FIFO as local or global variable
  lib: sbi: Introduce an early console buffer for caching early prints

 include/sbi/sbi_console.h          |  2 -
 include/sbi/sbi_fifo.h             | 14 +++++-
 include/sbi/sbi_platform.h         | 17 -------
 lib/sbi/Kconfig                    |  6 ++-
 lib/sbi/sbi_console.c              | 36 ++++++++++-----
 lib/sbi/sbi_fifo.c                 | 72 +++++++++++++++++++++++++-----
 lib/sbi/sbi_init.c                 |  4 --
 lib/sbi/sbi_sse.c                  |  2 +-
 lib/sbi/sbi_tlb.c                  |  3 +-
 platform/fpga/ariane/platform.c    | 26 ++++-------
 platform/fpga/openpiton/platform.c | 20 ++-------
 platform/generic/platform.c        | 21 ++++-----
 platform/kendryte/k210/platform.c  | 18 +++-----
 platform/nuclei/ux600/platform.c   | 18 +++-----
 platform/template/platform.c       | 18 +++-----
 15 files changed, 151 insertions(+), 126 deletions(-)

-- 
2.34.1


