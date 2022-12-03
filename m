From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  4 Dec 2022 00:39:27 +0300
Subject: [PATCH RFC v2 0/2] lib: sbi: add support for debug triggers
Message-ID: <20221203213929.206429-1-geomatsi@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is the second revision of the patches implementing SBI Debug
Trigger extension proposal posted at riscv tech-debug list:
https://lists.riscv.org/g/tech-debug/topic/92375492

The major changes include support for mcounter trigger type and
updates according to some of the review comments. 

As a part of endianness fixes, this revision includes a separate
patch for a header with endianness conversion macros. Depending
on the feedback, later on it can be reposted separately.

Regards,
Sergey

Changes v1 -> v2:
- add header with endianness conversion macros
- fix endinanness: keep possible big-endian support in mind
- do not mark shared structures as packed
- add support for type 2 (mcounter) triggers


Sergey Matyukevich (2):
  include: sbi: endianness conversion macros
  lib: sbi: add support for debug triggers

 include/sbi/riscv_dbtr.h          | 179 +++++++++++
 include/sbi/riscv_encoding.h      |   1 +
 include/sbi/riscv_endian.h        |  48 +++
 include/sbi/sbi_dbtr.h            |  80 +++++
 include/sbi/sbi_ecall_interface.h |  10 +
 lib/sbi/Kconfig                   |   4 +
 lib/sbi/objects.mk                |   4 +
 lib/sbi/sbi_dbtr.c                | 481 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall_dbtr.c          |  68 +++++
 lib/sbi/sbi_init.c                |   9 +
 10 files changed, 884 insertions(+)
 create mode 100644 include/sbi/riscv_dbtr.h
 create mode 100644 include/sbi/riscv_endian.h
 create mode 100644 include/sbi/sbi_dbtr.h
 create mode 100644 lib/sbi/sbi_dbtr.c
 create mode 100644 lib/sbi/sbi_ecall_dbtr.c

-- 
2.38.1


