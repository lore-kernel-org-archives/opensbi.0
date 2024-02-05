From: Bo Gan <ganboing@gmail.com>
Date: Mon,  5 Feb 2024 02:49:57 -0800
Subject: [PATCH v2 0/3] Allow platform to handle load/store faults
Message-ID: <1707130200-559404-1-git-send-email-ganboing@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sometimes a platform wants to trap-n-emulate special devices or filter
access to physical devices. This patch makes sbi_trap_handler to call
platform_ops.emulate_load/store and ask platform to fixup the fault.

v2 changes:
-  Added const qualifier to *orig_trap on load/store fault handlers.
   That addressed Xiang W's comment.
-  Applied clang-format to changed lines.

Bo Gan (3):
  lib: sbi: rename sbi_misaligned_ldst.c to sbi_trap_ldst.c
  include: sbi: rename sbi_misaligned_ldst.h to sbi_trap_ldst.h
  lib: sbi: Allow platform to fixup load/store faults

 include/sbi/sbi_misaligned_ldst.h                  |  23 ---
 include/sbi/sbi_platform.h                         |  13 ++
 include/sbi/sbi_trap.h                             |   2 +-
 include/sbi/sbi_trap_ldst.h                        |  43 +++++
 lib/sbi/objects.mk                                 |   2 +-
 lib/sbi/sbi_trap.c                                 |  38 ++--
 lib/sbi/{sbi_misaligned_ldst.c => sbi_trap_ldst.c} | 210 ++++++++++++++-------
 7 files changed, 218 insertions(+), 113 deletions(-)
 delete mode 100644 include/sbi/sbi_misaligned_ldst.h
 create mode 100644 include/sbi/sbi_trap_ldst.h
 rename lib/sbi/{sbi_misaligned_ldst.c => sbi_trap_ldst.c} (61%)

-- 
2.7.4


