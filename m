From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 19 Dec 2023 16:58:49 +0530
Subject: [PATCH v1 0/7] Introduce support for SBI Debug Trigger Extension
Message-ID: <20231219112856.3865827-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V Debug specification includes Sdtrig ISA extension
which describes Trigger Module. Triggers can cause
a breakpoint exception or trace action without execution
of a special instruction. They can be used to implement
hardware breakpoints and watchpointsf for native debugging.

The SBI Debut Trigger extension v6 can be found at:
https://lists.riscv.org/g/tech-debug/topic/99825362#1302

This patch is an initial implementation of SBI Debug
Trigger Extension(v6) in OpenSBI. It based on similar patchset
from Sergey Matyukevich.
(http://lists.infradead.org/pipermail/opensbi/2022-October/003531.html)

The following features are supported:
* mcontrol, mcontrol6 triggers
* Breakpoint and trace actions

Linux Kernel Branch (Breakpoint driver support):
https://github.com/hschauhan/riscv-linux/tree/sdtrig-v6

NOTE: Chained triggers are not supported

Himanshu Chauhan (7):
  include: sbi: Introduce common endianess conversion macro
  include: sbi: Add TINFO debug trigger CSR
  include: sbi: Introduce debug trigger register encodings
  lib: sbi: Introduce the SBI debug triggers extension support
  include: sbi: Introduce ecall mactros for SBI debug trigger extension
  lib: sbi: Introduce ecall handler for SBI debug trigger extension
  lib: sbi: Print number of debug triggers found

 include/sbi/riscv_dbtr.h          | 249 ++++++++++
 include/sbi/riscv_encoding.h      |   1 +
 include/sbi/sbi_byteorder.h       |  10 +
 include/sbi/sbi_dbtr.h            | 127 +++++
 include/sbi/sbi_ecall_interface.h |  11 +
 lib/sbi/Kconfig                   |   4 +
 lib/sbi/objects.mk                |   4 +
 lib/sbi/sbi_dbtr.c                | 742 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall_dbtr.c          |  74 +++
 lib/sbi/sbi_init.c                |  11 +
 10 files changed, 1233 insertions(+)
 create mode 100644 include/sbi/riscv_dbtr.h
 create mode 100644 include/sbi/sbi_dbtr.h
 create mode 100644 lib/sbi/sbi_dbtr.c
 create mode 100644 lib/sbi/sbi_ecall_dbtr.c

-- 
2.34.1


