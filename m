From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Aug 2022 10:21:37 +0530
Subject: [PATCH 0/7] OpenSBI PMU improvements
Message-ID: <20220825045144.752619-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series aims to improve SBI PMU implementation in following ways:
1) Optimize memory usage by reducing global data to track per-HART firmware
   counters (almost 80KB saved)
2) Allow platform to implement custom firmware counters and quirks related
   to hardware counters (This will be useful for T-Head)
3) Few other fixes for better SBI spec compliance

These patches can also be found in sbi_pmu_imp_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (7):
  lib: sbi_pmu: Remove "event_idx" member from struct sbi_pmu_fw_event
  lib: sbi_pmu: Replace sbi_pmu_ctr_read() with sbi_pmu_ctr_fw_read()
  lib: sbi_pmu: Firmware counters are always 64 bits wide
  lib: sbi_pmu: Simplify FW counters to reduce memory usage
  lib: sbi_pmu: Add custom PMU device operations
  lib: sbi: Print platform PMU device at boot-time
  include: sbi: Reduce includes in sbi_pmu.h

 include/sbi/sbi_pmu.h   |  67 ++++++++++--
 lib/sbi/sbi_ecall_pmu.c |   3 +-
 lib/sbi/sbi_init.c      |   4 +
 lib/sbi/sbi_pmu.c       | 218 +++++++++++++++++++++++-----------------
 lib/sbi/sbi_trap.c      |   1 +
 5 files changed, 190 insertions(+), 103 deletions(-)

-- 
2.34.1


