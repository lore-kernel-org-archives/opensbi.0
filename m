From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  9 Mar 2023 11:21:04 +0530
Subject: [PATCH v3 0/8] SBI PMU firmware counters and events improvement
Message-ID: <20230309055112.1516581-1-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset implements the improvements described in the following
proposal from Anup Patel: 

https://lists.riscv.org/g/tech-prs/message/102

Changes in v3:
- Break patch 4 from v2 into multiple smaller patches
- Add reviewed-by tags

Changes in v2:
- Update Risc V platform specific firmware event handling as per
  the SBI spec update: https://lists.riscv.org/g/tech-prs/message/211

Mayuresh Chitale (8):
  lib: sbi_pmu: add callback for counter width
  lib: sbi_pmu: Implement sbi_pmu_counter_fw_read_hi
  lib: sbi_pmu: Reserve space for implementation specific firmware
    events
  lib: sbi_pmu: Rename fw_counter_value
  lib: sbi_pmu: Update sbi_pmu dev ops
  lib: sbi_pmu: Use dedicated event code for platform firmware events
  lib: sbi_pmu: Introduce fw_counter_write_value API
  lib: sbi_pmu: Add hartid parameter PMU device ops

 include/sbi/sbi_ecall_interface.h |  12 +++
 include/sbi/sbi_pmu.h             |  31 ++++---
 lib/sbi/sbi_ecall_pmu.c           |   8 ++
 lib/sbi/sbi_pmu.c                 | 141 +++++++++++++++++++++---------
 4 files changed, 141 insertions(+), 51 deletions(-)

-- 
2.34.1


