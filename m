From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 20 Jun 2023 20:02:06 +0530
Subject: [PATCH 0/6] Add support for Smepmp
Message-ID: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for the Smepmp specification.
The detection of Smepmp support in platform depends on the
ISA string present in the FDT. If "smepmp" is present in ISA
string in FDT, Smepmp is enabled.

When Smepmp is enabled, the M-mode software's free access
to S/U memory region is revoked. Hence, all the shared
memory access between M-mode and S/U-mode must be done
only after mapping the shared memory.

Himanshu Chauhan (6):
  Add macro definitions for mseccfg CSR
  Add functions to manipulate PMP entries
  Add Smepmp specific access flags for PMP entries
  Add detection of Smepmp from ISA string in FDT
  Add support for Smepmp
  Map/Unmap debug console shared memory buffers before and after
    read/write

 include/sbi/riscv_asm.h            |   6 +
 include/sbi/riscv_encoding.h       |  12 ++
 include/sbi/sbi_domain.h           |  51 +++++++-
 include/sbi/sbi_hart.h             |  20 ++++
 include/sbi_utils/fdt/fdt_helper.h |   3 +
 lib/sbi/riscv_asm.c                |  43 +++++++
 lib/sbi/sbi_domain.c               |  14 ++-
 lib/sbi/sbi_ecall_dbcn.c           |   3 +
 lib/sbi/sbi_hart.c                 | 184 ++++++++++++++++++++++++++---
 lib/sbi/sbi_init.c                 |  24 ++--
 lib/utils/fdt/fdt_helper.c         | 111 +++++++++++++++++
 platform/generic/platform.c        |   5 +
 12 files changed, 438 insertions(+), 38 deletions(-)

-- 
2.34.1


