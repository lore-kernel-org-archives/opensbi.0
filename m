From: Bo Gan <ganboing@gmail.com>
Date: Sat,  2 Mar 2024 03:25:19 -0800
Subject: [PATCH v3 0/6] Allow platform to handle load/store faults
Message-ID: <1709378725-56656-1-git-send-email-ganboing@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sometimes a platform wants to trap-n-emulate special devices or filter
access to physical devices. This patch makes sbi_trap_handler to call
platform_ops.emulate_load/store and ask platform to fixup the fault.

v3 changes:
-  Addressed comments from Anup by breaking down the patchset and
   new sbi_platform_emulate_load/store helper functions.
-  Reworked the return value of sbi_trap_ld/st_emulator to support
   (>0) successful emulation (==0) trap_redirect (<0) real failure.

v2 changes:
-  Added const qualifier to *orig_trap on load/store fault handlers.
   That addressed Xiang W's comment.
-  Applied clang-format to changed lines.

Bo Gan (6):
  lib: sbi: rename sbi_misaligned_ldst.c to sbi_trap_ldst.c
  include: sbi: rename sbi_misaligned_ldst.h to sbi_trap_ldst.h
  lib: sbi: change prototype of sbi_trap_redirect
  lib: sbi: abstract out insn decoding to unify mem fault handlers
  include: sbi: add emulate_load/store handler to platform ops
  lib: sbi: call platform load/store emulators

 include/sbi/sbi_misaligned_ldst.h                  |  23 ---
 include/sbi/sbi_platform.h                         |  11 ++
 include/sbi/sbi_trap.h                             |   2 +-
 include/sbi/sbi_trap_ldst.h                        |  55 ++++++
 lib/sbi/objects.mk                                 |   2 +-
 lib/sbi/sbi_trap.c                                 |  38 +++--
 lib/sbi/{sbi_misaligned_ldst.c => sbi_trap_ldst.c} | 189 ++++++++++++++-------
 7 files changed, 218 insertions(+), 102 deletions(-)
 delete mode 100644 include/sbi/sbi_misaligned_ldst.h
 create mode 100644 include/sbi/sbi_trap_ldst.h
 rename lib/sbi/{sbi_misaligned_ldst.c => sbi_trap_ldst.c} (60%)

-- 
2.7.4


