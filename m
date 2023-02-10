From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 10 Feb 2023 11:16:44 +0530
Subject: [PATCH v6 0/8] OpenSBI debug console support
Message-ID: <20230210054652.495628-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest proposal of SBI debug console extension can be found at:
https://lists.riscv.org/g/tech-prs/message/96

This series implements SBI debug console support in OpenSBI
as-per above draft proposal.

To test these patches corresponding Linux patches can be found in
riscv_sbi_dbcn_v1 branch at: https://github.com/avpatel/linux.git

These patches can also be found in riscv_sbi_dbcn_v6 branch at:
https://github.com/avpatel/opensbi.git

Changes since v5:
 - Rebased on latest OpenSBI sources
 - Updated Reviewed-by tags
 - Addressed Drew's comments in all patches
 - Updated SBI debug console implementation as-per latest proposal
   where console write() is non-blocking.

Changes since v4:
 - Rebased on latest OpenSBI sources
 - Updated Reviewed-by tags
 - Added new PATCH8 to speed-up sbi_printf() using nputs()

Changes since v3:
 - Rebased on OpenSBI v1.2 release
 - Updated Reviewed-by tags
 - Added new PATCH3 for sbi_ngets() function
 - Updated SBI debug console implementation in PATCH5 as-per latest
   proposal having both console write() and read() functions.

Changes since v2:
 - Reworked sbi_domain_check_addr_range() in PATCH3 to make it work
   for overlapping regions.

Changes since v1:
 - New PATCH3 to implement sbi_domain_check_addr_range() function
 - Added checks in PATCH4 for location and size of string to print
 - New PATCH5 to add console_puts() callback in the console device
 - New PATCH6 to implement console_puts() for semihosting

Anup Patel (8):
  include: Add defines for SBI debug console extension
  lib: sbi: Add sbi_nputs() function
  lib: sbi: Add sbi_ngets() function
  lib: sbi: Add sbi_domain_check_addr_range() function
  lib: sbi: Implement SBI debug console extension
  lib: sbi: Add console_puts() callback in the console device
  lib: utils/serial: Implement console_puts() for semihosting
  lib: sbi: Speed-up sbi_printf() and friends using nputs()

 include/sbi/sbi_console.h         |  7 +++
 include/sbi/sbi_domain.h          | 15 ++++++
 include/sbi/sbi_ecall_interface.h |  6 +++
 lib/sbi/Kconfig                   |  4 ++
 lib/sbi/objects.mk                |  3 ++
 lib/sbi/sbi_console.c             | 88 ++++++++++++++++++++++++++++---
 lib/sbi/sbi_domain.c              | 69 ++++++++++++++++++++++++
 lib/sbi/sbi_ecall_dbcn.c          | 72 +++++++++++++++++++++++++
 lib/utils/serial/semihosting.c    | 37 +++++++++++++
 9 files changed, 294 insertions(+), 7 deletions(-)
 create mode 100644 lib/sbi/sbi_ecall_dbcn.c

-- 
2.34.1


