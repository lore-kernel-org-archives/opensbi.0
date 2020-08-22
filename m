From: Anup Patel <anup.patel@wdc.com>
Date: Sat, 22 Aug 2020 10:43:05 +0530
Subject: [PATCH 0/5] PMP and HPM improvements
Message-ID: <20200822051310.21394-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series:
1. Improves PMP CSR detections as-per latest RISC-V spec
2. Adds MHPM counter detection at boot-time
3. Improves HPM counter read/write emulation as-per latest RISC-V spec

These patches are also available in pmp_hpm_imp_v1 branch at
https://github.com/avpatel/opensbi.git

Anup Patel (5):
  lib: sbi: Remove redundant SBI_HART_HAS_PMP feature
  lib: sbi: Improve PMP CSR detection and progamming
  lib: sbi: Detect and print MHPM counters at boot-time
  include: sbi: Few cosmetic changes in riscv_encoding.h
  lib: sbi: Improve HPM CSR read/write emulation

 include/sbi/riscv_encoding.h |  71 ++++++++++++-
 include/sbi/sbi_hart.h       |   9 +-
 lib/sbi/riscv_asm.c          | 186 +++++++++++++----------------------
 lib/sbi/sbi_emulate_csr.c    | 147 +++++++++++++--------------
 lib/sbi/sbi_hart.c           | 106 ++++++++++++--------
 lib/sbi/sbi_init.c           |   1 +
 lib/utils/fdt/fdt_fixup.c    |   2 +-
 7 files changed, 282 insertions(+), 240 deletions(-)

-- 
2.25.1


