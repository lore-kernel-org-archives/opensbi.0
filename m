From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 17 Feb 2023 20:14:08 +0530
Subject: [PATCH v2 0/5] SBI PMU firmware counters and events improvement
Message-ID: <20230217144413.3720307-1-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset implements the improvements described in the following
proposal from Anup Patel: 

https://lists.riscv.org/g/tech-prs/message/102

Changes in v2:
- Update Risc V platform specific firmware event handling as per
  the SBI spec update: https://lists.riscv.org/g/tech-prs/message/211

Mayuresh Chitale (5):
  lib: sbi_pmu: add callback for counter width
  lib: sbi_pmu: Implement sbi_pmu_counter_fw_read_hi
  lib: sbi_pmu: Reserve space for implementation specific firmware
    events
  lib: sbi_pmu: Update custom PMU device ops
  lib: sbi_pmu: Add hartid parameter PMU device ops

 include/sbi/sbi_ecall_interface.h |  12 +++
 include/sbi/sbi_pmu.h             |  33 +++++---
 lib/sbi/sbi_ecall_pmu.c           |   8 ++
 lib/sbi/sbi_pmu.c                 | 120 +++++++++++++++++++-----------
 4 files changed, 121 insertions(+), 52 deletions(-)

-- 
2.34.1


