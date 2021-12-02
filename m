From: Anup Patel <anup.patel@wdc.com>
Date: Thu,  2 Dec 2021 11:34:56 +0530
Subject: [PATCH 0/2] Misc compile error/warning fixes
Message-ID: <20211202060458.616563-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does few compile error/warning fixes which I discovered
trying CLANG with OpenSBI.

These patches can also be found in clang_fixes_v1 branch at:
https://github.com/riscv-software-src/opensbi.git

Anup Patel (2):
  Makefile: Fix -mno-save-restore compile warning with CLANG
  lib: sbi: Fix compile errors using -Os option

 Makefile            | 12 ++++++++----
 lib/sbi/riscv_asm.c |  3 ++-
 lib/sbi/sbi_ecall.c |  5 ++++-
 lib/sbi/sbi_hart.c  | 12 +++++++++---
 4 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.25.1


