From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 30 Dec 2020 09:03:01 +0530
Subject: [PATCH 0/3] Improvements for Keystone Enclave
Message-ID: <20201230033304.295706-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does few improvments for easy integration of OpenSBI into
the Keystone Enclave project as secure monitor

These patches can be found in enclave_imp_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (3):
  lib: sbi: Replace args with trap registers in ecall handler
  lib: sbi: Introduce sbi_trap_exit() API
  lib: sbi: Allow custom local TLB flush function

 firmware/fw_base.S              | 43 +++++++++++++++++++
 include/sbi/sbi_ecall.h         |  3 +-
 include/sbi/sbi_platform.h      |  9 ++--
 include/sbi/sbi_scratch.h       | 10 +++--
 include/sbi/sbi_tlb.h           | 24 +++++------
 include/sbi/sbi_trap.h          |  2 +
 lib/sbi/sbi_ecall.c             | 10 +----
 lib/sbi/sbi_ecall_base.c        |  6 ++-
 lib/sbi/sbi_ecall_hsm.c         |  8 ++--
 lib/sbi/sbi_ecall_legacy.c      | 30 ++++++++------
 lib/sbi/sbi_ecall_replace.c     | 73 ++++++++++++++++++---------------
 lib/sbi/sbi_ecall_vendor.c      |  6 ++-
 lib/sbi/sbi_tlb.c               | 59 ++++++++------------------
 lib/sbi/sbi_trap.c              | 20 +++++++++
 platform/andes/ae350/platform.c | 19 +++++----
 15 files changed, 189 insertions(+), 133 deletions(-)

-- 
2.25.1


