From: Xiang W <wxjstz@126.com>
Date: Tue, 25 Apr 2023 16:56:22 +0800
Subject: [PATCH 0/2] Miscellaneous
Message-ID: <20230425085625.465921-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Xiang W (2):
  lib: sbi: Remove unnecessary semicolon
  lib: sbi: Simplify sbi_ipi_process remove goto

 include/sbi/sbi_list.h         |  2 +-
 lib/sbi/riscv_asm.c            |  4 ++--
 lib/sbi/sbi_domain.c           |  4 ++--
 lib/sbi/sbi_ecall_legacy.c     |  2 +-
 lib/sbi/sbi_ecall_pmu.c        |  2 +-
 lib/sbi/sbi_ecall_rfence.c     |  2 +-
 lib/sbi/sbi_emulate_csr.c      |  4 ++--
 lib/sbi/sbi_hsm.c              |  2 +-
 lib/sbi/sbi_illegal_insn.c     |  2 +-
 lib/sbi/sbi_init.c             |  2 +-
 lib/sbi/sbi_ipi.c              | 15 ++++++---------
 lib/sbi/sbi_trap.c             |  4 ++--
 lib/sbi/sbi_unpriv.c           |  2 +-
 lib/utils/fdt/fdt_helper.c     |  2 +-
 lib/utils/libfdt/fdt_overlay.c |  2 +-
 15 files changed, 24 insertions(+), 27 deletions(-)

-- 
2.39.2


