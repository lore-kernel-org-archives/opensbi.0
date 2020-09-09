From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  9 Sep 2020 20:20:23 +0530
Subject: [PATCH 0/5] Hold E-core in HSM STOPPED State
Message-ID: <20200909145028.446794-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series improves handling of E-core (i.e non-MMU HART) in OpenSBI by
holding it in HSM STOPPED state instead of sbi_hart_hang(). This provides
a foundation for upcoming OpenSBI domains feature because now all HARTs
(irrespective they have MMU or not) are in some HSM state.

These patches are also available in ecore_imp_v1 branch at
https://github.com/avpatel/opensbi.git

Anup Patel (5):
  lib: sbi: Allow specifying start mode to sbi_hsm_hart_start() API
  lib: sbi: Allow specifying mode in sbi_hart_pmp_check_addr() API
  lib: utils: Improve fdt_cpu_fixup() implementation
  lib: sbi: Ensure coldboot HART supports next privilege mode
  platform: generic: Don't mark non-MMU HARTs as invalid

 include/sbi/riscv_asm.h     |  2 +-
 include/sbi/sbi_hart.h      |  3 ++-
 include/sbi/sbi_hsm.h       |  2 +-
 lib/sbi/riscv_asm.c         | 18 ++++++++----------
 lib/sbi/sbi_ecall_hsm.c     |  6 +++++-
 lib/sbi/sbi_hart.c          | 28 +++++++++++++++++++++-------
 lib/sbi/sbi_hsm.c           |  8 ++++++--
 lib/sbi/sbi_init.c          | 29 ++++++++++++++++++++++++++++-
 lib/utils/fdt/fdt_fixup.c   | 13 +++++++++++--
 platform/generic/platform.c |  6 +-----
 10 files changed, 84 insertions(+), 31 deletions(-)

-- 
2.25.1


