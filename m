From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 11:34:34 -0800
Subject: [PATCH 0/5] Implement PMU enhancements in SBI v3.0
Message-ID: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI v3.0 specification[1] added two new improvements to the PMU chaper.

1. Added an additional get_event_info function to query event availability
in bulk instead of individual SBI calls for each event. This improves the
supervisor OS boot time if implemented.

2. Raw event width allowed by the platform is widened to have 56 bits
with RAW event v2 as per new clarification in the priv ISA[2].

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/vv3.0-rc2/riscv-sbi.pdf
[2] https://github.com/riscv/riscv-isa-manual/issues/1578

To: opensbi@lists.infradead.org
Cc: apatel at ventanamicro.com

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (5):
      lib: sbi_pmu: PMU raw event v2 support
      lib: sbi_pmu: Remove redundant check for fw events
      lib: sbi_pmu: Add SBI PMU event info function details.
      lib: sbi_pmu: Implement SBI PMU event info function
      include: sbi: Change spec version to 3.0

 include/sbi/sbi_ecall.h           |  2 +-
 include/sbi/sbi_ecall_interface.h | 11 +++++
 include/sbi/sbi_pmu.h             |  2 +
 lib/sbi/sbi_ecall_pmu.c           |  3 ++
 lib/sbi/sbi_pmu.c                 | 95 ++++++++++++++++++++++++++++++++++-----
 platform/generic/platform.c       |  3 +-
 6 files changed, 104 insertions(+), 12 deletions(-)
---
base-commit: 86d2c1797a44975e628bcf77e30e687fd6738e81
change-id: 20241111-pmu_event_info-ee78dfa947cc
--
Regards,
Atish patra


