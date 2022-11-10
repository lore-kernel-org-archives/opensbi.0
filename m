From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 10 Nov 2022 22:30:13 +0530
Subject: [RFC PATCH 0/3] OpenSBI debug console support
Message-ID: <20221110170016.1477865-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest draft-v4 proposal of SBI debug console can be found here:
https://lists.riscv.org/g/tech-unixplatformspec/message/1815

This series implements SBI debug console support in OpenSBI
as-per above draft proposal.

These patches can also be found in riscv_sbi_dbcn_v1 branch
at: https://github.com/avpatel/opensbi.git

Anup Patel (3):
  include: Add defines for SBI debug console extension
  lib: sbi: Add sbi_nputs() function
  lib: sbi: Implement SBI debug console extension

 include/sbi/sbi_console.h         |  2 ++
 include/sbi/sbi_ecall_interface.h |  4 ++++
 lib/sbi/Kconfig                   |  4 ++++
 lib/sbi/objects.mk                |  1 +
 lib/sbi/sbi_console.c             | 10 ++++++++++
 lib/sbi/sbi_ecall_replace.c       | 30 ++++++++++++++++++++++++++++++
 6 files changed, 51 insertions(+)

-- 
2.34.1


