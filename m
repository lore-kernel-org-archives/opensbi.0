From: Atish Patra <atishp@rivosinc.com>
Date: Fri,  7 Jan 2022 10:54:06 -0800
Subject: [PATCH v1 0/3] Miscellaneous PMU fixes
Message-ID: <20220107185409.1172221-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series contain several small fixes in PMU related code.
The first patches is a sanity check for counter mappings in DT while
rest of the patches updates mhpmevent correctly during init and counter
config matching.

Atish Patra (3):
lib: sbi: Map only the counters enabled in hardware
lib: sbi: Disable interrupt during config matching
lib: sbi: Disable interrupt and inhibit counting in M-mode during init

include/sbi/riscv_encoding.h |  3 ++-
lib/sbi/sbi_hart.c           | 18 ++++++++++++++++++
lib/sbi/sbi_pmu.c            | 16 ++++++++++++----
3 files changed, 32 insertions(+), 5 deletions(-)

--
2.30.2


