From: Atish Patra <atishp@rivosinc.com>
Date: Thu,  7 Dec 2023 14:23:48 -0800
Subject: [v2 0/2] SBI PMU improvements
Message-ID: <20231207222351.1874852-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here are two small patches for SBI PMU.

The 1st patch adds SBI PMU snapshot definitions and some boilerplate code while
the 2nd patches fixes an issue with discontigious counters.

Changes from v1->v2:
1. Removed additional check for counter1.
2. Return error in counter start/stop functions if snapshot flag is set. 

The patches can also be found at 
https://github.com/atishp04/opensbi/tree/pmu_fixes_v2

Atish Patra (2):
lib: sbi_pmu: Add PMU snapshot definitions
lib: sbi_pmu: Fix the counter info function

include/sbi/sbi_ecall_interface.h |  6 +++++-
include/sbi/sbi_error.h           |  1 +
include/sbi/sbi_pmu.h             |  1 +
lib/sbi/sbi_ecall_pmu.c           |  2 ++
lib/sbi/sbi_pmu.c                 | 14 ++++++++++++--
5 files changed, 21 insertions(+), 3 deletions(-)

--
2.34.1


