From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  4 Sep 2023 09:33:38 +0530
Subject: [PATCH 0/8] OpenSBI sparse HART id support
Message-ID: <20230904040346.118604-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, we requires HART id to be less than SBI_HARTMASK_MAX_BITS
because we use HART id as bit index in the sbi_hartmask. This is a
very limiting requirement because RISC-V platforms can have sparse
HART ids (with possibly large values).

This series addresses the above described limitation by adding
sparse HART id support in OpenSBI.

These patches can also be found the full_sparse_hartid_v1 branch at
https://github.com/avpatel/opensbi.git

Anup Patel (7):
  lib: sbi: Introduce HART index in sbi_scratch
  lib: sbi: Remove sbi_platform_hart_index/invalid() functions
  lib: sbi: Use sbi_scratch_last_hartindex() in remote TLB managment
  lib: sbi: Prefer hartindex over hartid in IPI framework
  lib: sbi: Remove sbi_scratch_last_hartid() macro
  lib: sbi: Maximize the use of HART index in sbi_domain
  include: sbi: Remove sbi_hartmask_for_each_hart() macro

Xiang W (1):
  lib: sbi: Extend sbi_hartmask to support both hartid and hartindex

 include/sbi/sbi_domain.h       |  6 +--
 include/sbi/sbi_hartmask.h     | 75 ++++++++++++++++++++++++-------
 include/sbi/sbi_ipi.h          | 14 +++---
 include/sbi/sbi_platform.h     | 28 ------------
 include/sbi/sbi_scratch.h      | 49 ++++++++++++++++----
 lib/sbi/sbi_domain.c           | 82 ++++++++++++++++------------------
 lib/sbi/sbi_hsm.c              | 30 ++++++-------
 lib/sbi/sbi_init.c             | 28 +++++++-----
 lib/sbi/sbi_ipi.c              | 28 ++++++------
 lib/sbi/sbi_platform.c         | 17 -------
 lib/sbi/sbi_scratch.c          | 37 +++++++++------
 lib/sbi/sbi_system.c           |  5 ++-
 lib/sbi/sbi_tlb.c              | 14 +++---
 lib/utils/fdt/fdt_domain.c     |  4 +-
 lib/utils/ipi/aclint_mswi.c    | 14 +++---
 lib/utils/ipi/andes_plicsw.c   |  8 +++-
 lib/utils/irqchip/imsic.c      |  4 +-
 platform/generic/andes/ae350.c |  2 +-
 18 files changed, 246 insertions(+), 199 deletions(-)

-- 
2.34.1


