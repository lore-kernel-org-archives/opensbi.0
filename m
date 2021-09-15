From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 15 Sep 2021 14:51:23 +0530
Subject: [PATCH 0/5] Timer based delay loop
Message-ID: <20210915092128.1029868-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds timer based delay loop so that drivers and platform
support can have precise delays in their implementations.

These patches can be found in mtimer_freq_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (5):
  lib: utils/fdt: Add fdt_parse_timebase_frequency() function
  lib: sbi: Add timer frequency to struct sbi_timer_device
  lib: sbi: Print timer frequency at boot time
  lib: sbi: Add generic timer delay loop function
  lib: utils/reset: use sbi_timer_mdelay() in gpio reset driver

 include/sbi/sbi_timer.h                 | 19 +++++++++++++++
 include/sbi_utils/fdt/fdt_helper.h      |  2 ++
 include/sbi_utils/timer/aclint_mtimer.h |  1 +
 lib/sbi/sbi_init.c                      |  5 ++--
 lib/sbi/sbi_timer.c                     | 31 +++++++++++++++++++++++++
 lib/utils/fdt/fdt_helper.c              | 21 +++++++++++++++++
 lib/utils/reset/fdt_reset_gpio.c        | 13 +++--------
 lib/utils/timer/aclint_mtimer.c         |  3 +++
 lib/utils/timer/fdt_timer_mtimer.c      |  4 ++++
 platform/fpga/ariane/platform.c         |  2 ++
 platform/fpga/openpiton/platform.c      |  7 ++++++
 platform/kendryte/k210/platform.c       |  1 +
 platform/kendryte/k210/platform.h       |  2 +-
 platform/nuclei/ux600/platform.c        |  1 +
 platform/template/platform.c            |  2 ++
 15 files changed, 101 insertions(+), 13 deletions(-)

-- 
2.25.1


