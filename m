From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 12 Jul 2023 10:04:26 +0530
Subject: [PATCH v3 00/10] Add support for Smepmp
In-Reply-To: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
References: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
Message-ID: <20230712043436.100548-1-hchauhan@ventanamicro.com>
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

changes in v3:
* Split "Add smepmp support" patch into subpatches
	- Root domain permission change is different patch
	- Ordering change in PMP configuration is a different patch.

changes in v2:
* Split into futher patches
	- FDT ISA string parsing is now separate patch
	- Map/Unmap functions for shared memory are in different patch
* Addressed other general comments.


Himanshu Chauhan (10):
  include: sbi: Add macro definitions for mseccfg CSR
  lib: sbi: Add functions to manipulate PMP entries
  include: sbi: Add Smepmp specific access flags for PMP entries
  lib: sbi: Add smepmp in hart extensions
  lib: utils: Add detection of Smepmp from ISA string in FDT
  lib: sbi: Grant SU R/W/X permissions to whole memory
  lib: sbi: Add support for Smepmp
  lib: sbi: Change the order of PMP initialization
  lib: sbi: Add functions to map/unmap shared memory
  lib: sbi: Map/Unmap debug console shared memory buffers

 include/sbi/riscv_asm.h            |   6 +
 include/sbi/riscv_encoding.h       |  12 ++
 include/sbi/sbi_domain.h           |  84 +++++++++++++-
 include/sbi/sbi_hart.h             |  19 ++++
 include/sbi_utils/fdt/fdt_helper.h |   3 +
 lib/sbi/riscv_asm.c                |  42 +++++++
 lib/sbi/sbi_domain.c               |  14 ++-
 lib/sbi/sbi_ecall_dbcn.c           |   3 +
 lib/sbi/sbi_hart.c                 | 177 +++++++++++++++++++++++++----
 lib/sbi/sbi_init.c                 |  26 +++--
 lib/utils/fdt/fdt_helper.c         | 111 ++++++++++++++++++
 platform/generic/platform.c        |   9 ++
 12 files changed, 468 insertions(+), 38 deletions(-)

-- 
2.34.1


