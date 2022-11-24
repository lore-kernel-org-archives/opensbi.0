From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 24 Nov 2022 18:59:00 +0530
Subject: [PATCH v3 0/6] OpenSBI debug console support
Message-ID: <20221124132906.257732-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest draft-v4 proposal of SBI debug console can be found here:
https://lists.riscv.org/g/tech-unixplatformspec/message/1815

This series implements SBI debug console support in OpenSBI
as-per above draft proposal.

These patches can also be found in riscv_sbi_dbcn_v3 branch
at: https://github.com/avpatel/opensbi.git

Changes since v2:
 - Reworked sbi_domain_check_addr_range() in PATCH3 to make it work
   for overlapping regions.

Changes since v1:
 - New PATCH3 to implement sbi_domain_check_addr_range() function
 - Added checks in PATCH4 for location and size of string to print
 - New PATCH5 to add console_puts() callback in the console device
 - New PATCH6 to implement console_puts() for semihosting
 
Anup Patel (6):
  include: Add defines for SBI debug console extension
  lib: sbi: Add sbi_nputs() function
  lib: sbi: Add sbi_domain_check_addr_range() function
  lib: sbi: Implement SBI debug console extension
  lib: sbi: Add console_puts() callback in the console device
  lib: utils/serial: Implement console_puts() for semihosting

 include/sbi/sbi_console.h         |  5 +++
 include/sbi/sbi_domain.h          | 15 +++++++
 include/sbi/sbi_ecall_interface.h |  4 ++
 lib/sbi/Kconfig                   |  4 ++
 lib/sbi/objects.mk                |  3 ++
 lib/sbi/sbi_console.c             | 25 +++++++++--
 lib/sbi/sbi_domain.c              | 69 +++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall_dbcn.c          | 62 +++++++++++++++++++++++++++
 lib/utils/serial/semihosting.c    | 33 +++++++++++++++
 9 files changed, 217 insertions(+), 3 deletions(-)
 create mode 100644 lib/sbi/sbi_ecall_dbcn.c

-- 
2.34.1

