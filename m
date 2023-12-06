From: Atish Patra <atishp@rivosinc.com>
Date: Tue,  5 Dec 2023 17:08:42 -0800
Subject: [v1 0/2] SBI PMU improvements
Message-ID: <20231206010844.1739845-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here are two small patches for SBI PMU.

The 1st patch adds SBI PMU snapshot definitions and some boilerplate code while
the 2nd patches fixes an issue with discontigious counters.

The patches can also be found at 
https://github.com/atishp04/opensbi/tree/pmu_fixes

Atish Patra (2):
lib: sbi_pmu: Add PMU snapshot definitions
lib: sbi_pmu: Fix the counter info function

include/sbi/sbi_ecall_interface.h | 3 +++
lib/sbi/sbi_ecall_pmu.c           | 2 ++
lib/sbi/sbi_pmu.c                 | 3 +++
3 files changed, 8 insertions(+)

--
2.34.1


