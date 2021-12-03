From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  3 Dec 2021 10:33:32 +0530
Subject: [PATCH v4 0/2] Misc compile error/warning fixes
Message-ID: <20211203050334.729392-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does few compile error/warning fixes which I discovered
trying CLANG with OpenSBI.

These patches can also be found in clang_fixes_v4 branch at:
https://github.com/riscv-software-src/opensbi.git

Changes since v3:
 - Updated commit description of PATCH1 and PATCH2
 - Added a comment in Makefile for PATCH1

Changes since v2:
 - Make memcpy() and memset() as weak-alias of sbi_memcpy() and
   sbi_memset() respectively in PATCH2

Changes since v1:
 - Use explicit inline macro sbi_trap_info_init() in PATCH2 for
   initializing struct sbi_trap_info.

Anup Patel (2):
  Makefile: Fix -msave-restore compile warning with CLANG-10 (or lower)
  lib: sbi: Fix compile errors using -Os option

 Makefile             | 14 ++++++++++----
 lib/sbi/sbi_string.c |  6 ++++++
 2 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.25.1


