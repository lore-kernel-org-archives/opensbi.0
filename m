From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  4 Sep 2020 17:43:38 +0530
Subject: [PATCH 0/3] Few ECALL improvements
Message-ID: <20200904121341.156416-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does few ECALL trap related improvements.

These patches are also available in ecall_imp_v1 branch at
https://github.com/avpatel/opensbi.git

Anup Patel (3):
  lib: sbi: Don't handle VS-mode ecall in sbi_trap_handler()
  include: Rename ECALL defines to match latest RISC-V spec
  lib: sbi_trap: Allow M-mode to M-mode ECALLs

 include/sbi/riscv_encoding.h | 4 ++--
 lib/sbi/sbi_hart.c           | 2 +-
 lib/sbi/sbi_trap.c           | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1


