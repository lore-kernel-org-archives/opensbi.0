From: Anup Patel <apatel@ventanamicro.com>
Date: Wed,  4 Jan 2023 20:19:59 +0530
Subject: [PATCH v4 0/7] OpenSBI debug console support
Message-ID: <20230104145006.947830-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest proposal of SBI debug console extension can be found at:
https://lists.riscv.org/g/tech-prs/message/74

This series implements SBI debug console support in OpenSBI
as-per above draft proposal.

To test these patches corresponding Linux patches can be found in
riscv_sbi_dbcn_v1 branch at: https://github.com/avpatel/linux.git

These patches can also be found in riscv_sbi_dbcn_v4 branch at:
https://github.com/avpatel/opensbi.git

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
 
Anup Patel (7):
  include: Add defines for SBI debug console extension
  lib: sbi: Add sbi_nputs() function
  lib: sbi: Add sbi_ngets() function
  lib: sbi: Add sbi_domain_check_addr_range() function
  lib: sbi: Implement SBI debug console extension
  lib: sbi: Add console_puts() callback in the console device
  lib: utils/serial: Implement console_puts() for semihosting

 include/sbi/sbi_console.h         |  7 ++++
 include/sbi/sbi_domain.h          | 15 +++++++
 include/sbi/sbi_ecall_interface.h |  5 +++
 lib/sbi/Kconfig                   |  4 ++
 lib/sbi/objects.mk                |  3 ++
 lib/sbi/sbi_console.c             | 40 ++++++++++++++++--
 lib/sbi/sbi_domain.c              | 69 +++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall_dbcn.c          | 69 +++++++++++++++++++++++++++++++
 lib/utils/serial/semihosting.c    | 33 +++++++++++++++
 9 files changed, 242 insertions(+), 3 deletions(-)
 create mode 100644 lib/sbi/sbi_ecall_dbcn.c

-- 
2.34.1


