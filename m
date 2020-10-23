From: Atish Patra <atish.patra@wdc.com>
Date: Fri, 23 Oct 2020 15:47:10 -0700
Subject: [PATCH v3 0/2] Improve PMP feature detection
Message-ID: <20201023224712.3837103-1-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series improves the PMP detection by detecting the minimum granularity
and address size supported by the platform. It prevents any pmp region writes
that are not supported by platform leading to more robust and secure
implementation.

Tested generic platform for following boards:
1. Qemu virt (RV32 & RV64)
2. HiFive Unleashed
3. OmniXtend

Changes from v2->v3:
1. Declared the fdt_translate function as static.
2. Changed the pmp functions names to make it more meaningful.
3. Improved the address upper bound checking logic.

Changes from v1->v2:
1. Implement pmp address size computation.
2. Improve pmp granularity detection mechanism. 

Atish Patra (2):
lib: sbi: Detect PMP granularity and number of address bits
lib: sbi: Improve boot time print with additional PMP information

include/sbi/sbi_hart.h |  2 ++
lib/sbi/sbi_hart.c     | 66 ++++++++++++++++++++++++++++++++++++++----
lib/sbi/sbi_init.c     | 15 ++++++----
3 files changed, 72 insertions(+), 11 deletions(-)

--
2.25.1


