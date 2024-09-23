From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 23 Sep 2024 17:26:51 +0530
Subject: [PATCH 0/9] OpenSBI domain data support
Message-ID: <20240923115700.381916-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series extends the OpenSBI domain support to allow per-domain
data from different parts of OpenSBI. Also extend OpenSBI domain
context as the first user of OpenSBI domain data support.

The first 7 patches of this series are miscellaneous improvements
which were pending for quite some time.

These patches can also be found in the sbi_domain_imp_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (9):
  lib: utils/ipi: Use sbi_domain_root_add_memrange() for ACLINT mswi
  lib: utils/irqchip: Use sbi_domain_root_add_memrange() for IMSIC
  lib: utils/irqchip: Use sbi_domain_root_add_memrange() for APLIC
  lib: sbi_domain: Make sbi_domain_root_add_memregion() as local
    function
  lib: utils/fdt: Use sbi_domain_memregion_init() when parsing domains
  include: sbi: Remove cyclic include in sbi_domain_context.h
  lib: sbi: Introduce domain data
  lib: sbi_domain: Use domain data support for per-domain hart context
  docs: Remove hartindex_to_context_table from domain_support.md

 docs/domain_support.md           |   2 -
 include/sbi/sbi_domain.h         |  15 +---
 include/sbi/sbi_domain_context.h |  58 +++----------
 include/sbi/sbi_domain_data.h    |  93 +++++++++++++++++++++
 lib/sbi/objects.mk               |   1 +
 lib/sbi/sbi_domain.c             |  24 +++++-
 lib/sbi/sbi_domain_context.c     | 106 +++++++++++++++++++++---
 lib/sbi/sbi_domain_data.c        | 138 +++++++++++++++++++++++++++++++
 lib/utils/fdt/fdt_domain.c       |  14 ++--
 lib/utils/ipi/aclint_mswi.c      |  20 ++---
 lib/utils/irqchip/aplic.c        |  11 +--
 lib/utils/irqchip/imsic.c        |  14 ++--
 12 files changed, 384 insertions(+), 112 deletions(-)
 create mode 100755 include/sbi/sbi_domain_data.h
 create mode 100755 lib/sbi/sbi_domain_data.c

-- 
2.43.0


