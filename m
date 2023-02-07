From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Tue,  7 Feb 2023 22:23:23 +0530
Subject: [PATCH 0/3] SBI PMU firmware counters and events improvement
Message-ID: <20230207165326.3205728-1-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset implements the improvements described in the following
proposal from Anup Patel: 

https://lists.riscv.org/g/tech-prs/message/102

Mayuresh Chitale (3):
  lib: sbi_pmu: add callback for counter width
  lib: sbi_pmu: Implement sbi_pmu_counter_fw_read_hi
  lib: sbi_pmu: Reserve space for implementation specific firmware
    events

 include/sbi/sbi_ecall_interface.h | 7 ++++++-
 include/sbi/sbi_pmu.h             | 5 +++++
 lib/sbi/sbi_ecall_pmu.c           | 8 ++++++++
 lib/sbi/sbi_pmu.c                 | 6 ++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.34.1


