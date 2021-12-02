From: Anup Patel <anup.patel@wdc.com>
Date: Thu,  2 Dec 2021 14:04:38 +0530
Subject: [PATCH v2 0/2] Misc compile error/warning fixes
Message-ID: <20211202083440.656777-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does few compile error/warning fixes which I discovered
trying CLANG with OpenSBI.

These patches can also be found in clang_fixes_v2 branch at:
https://github.com/riscv-software-src/opensbi.git

Changes since v1:
 - Use explicit inline macro sbi_trap_info_init() in PATCH2 for
   initializing struct sbi_trap_info.

Anup Patel (2):
  Makefile: Fix -mno-save-restore compile warning with CLANG
  lib: sbi: Fix compile errors using -Os option

 Makefile               | 12 ++++++++----
 include/sbi/sbi_trap.h |  9 +++++++++
 lib/sbi/riscv_asm.c    |  3 ++-
 lib/sbi/sbi_ecall.c    |  4 +++-
 lib/sbi/sbi_hart.c     | 12 +++++++++---
 5 files changed, 31 insertions(+), 9 deletions(-)

-- 
2.25.1


