From: Anup Patel <anup.patel@wdc.com>
Date: Thu,  2 Dec 2021 17:59:27 +0530
Subject: [PATCH v3 0/2] Misc compile error/warning fixes
Message-ID: <20211202122929.685756-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does few compile error/warning fixes which I discovered
trying CLANG with OpenSBI.

These patches can also be found in clang_fixes_v3 branch at:
https://github.com/riscv-software-src/opensbi.git

Changes since v2:
 - Make memcpy() and memset() as weak-alias of sbi_memcpy() and
   sbi_memset() respectively in PATCH2

Changes since v1:
 - Use explicit inline macro sbi_trap_info_init() in PATCH2 for
   initializing struct sbi_trap_info.

Anup Patel (2):
  Makefile: Fix -mno-save-restore compile warning with CLANG
  lib: sbi: Fix compile errors using -Os option

 Makefile             | 12 ++++++++----
 lib/sbi/sbi_string.c |  6 ++++++
 2 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.25.1


