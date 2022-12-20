From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 20 Dec 2022 16:16:16 +0530
Subject: [PATCH 0/9] Split region permissions into M-mode and SU-mode
Message-ID: <20221220104625.80667-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is first series in the series of forthcoming patches that
would add support for different access permission for different
sections of OpenSBI (RO, RX, RW). Eventually, this would lead
to support of smepmp extension.

This patch series splits the current R/W/X permissions to
M-mode R/W/X and SU-mode R/W/X. The split is in such a way
that current permission semantics are not broken.


Himanshu Chauhan (9):
  include: sbi: Fine grain the permissions for M and SU modes
  lib: sbi: Use finer permission semantics for address validation
  lib: sbi: Add permissions for the firmware start till end
  lib: sbi: Use finer permission sematics to decide on PMP bits
  lib: sbi: Modify the boot time region flag prints
  lib: utils: Use SU-{R/W/X} flags for region permissions during parsing
  lib: utils: Disallow non-root domains from adding M-mode regions
  lib: utils: Add M-mode {R/W} flags to the MMIO regions
  docs: Update domain's region permissions and requirements

 docs/domain_support.md          |  7 +++--
 include/sbi/sbi_domain.h        | 45 ++++++++++++++++++++++++++++----
 lib/sbi/sbi_domain.c            | 46 +++++++++++++++++++++++----------
 lib/sbi/sbi_hart.c              | 16 ++++++++----
 lib/utils/fdt/fdt_domain.c      | 20 +++++++++++---
 lib/utils/ipi/aclint_mswi.c     |  4 ++-
 lib/utils/irqchip/aplic.c       |  4 ++-
 lib/utils/irqchip/imsic.c       |  4 ++-
 lib/utils/timer/aclint_mtimer.c | 16 +++++++++---
 9 files changed, 127 insertions(+), 35 deletions(-)

-- 
2.39.0


