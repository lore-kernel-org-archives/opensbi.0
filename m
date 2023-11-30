From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 30 Nov 2023 10:13:17 +0100
Subject: [RFC PATCH 0/2] Add support for Supervisor Software Events extension
Message-ID: <20231130091319.1223849-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI Supervisor Software Events (SSE) extensions provides a mechanism
to inject software events from an SBI implementation to supervisor
software such that it preempts all other supervisor level traps and
interrupts [1].

Various events are defined and can be send asynchronously to supervisor
software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
as platform specific events. Events can be either local (per-hart) or
global. Events can be nested on top of each other based on priority and
can interrupt the supervisor mode at any time.

This PR adds support for this extension. First commit modifies interrupts
handling to pass the sbi traps regs through interrupt handlers in order to inject
SSE events from this context. Second one add the SSE support itself.

A RFC for Linux which uses this extension is available at [2].

Link: https://lists.riscv.org/g/tech-prs/message/515 [1]
Link: https://lore.kernel.org/linux-riscv/20231026143122.279437-1-cleger at rivosinc.com/ [2]

Cl?ment L?ger (2):
  lib: sbi: provides regs to sbi_ipi_process()
  lib: sbi: add support for Supervisor Software Events extension

 include/sbi/sbi_ecall_interface.h |  36 +-
 include/sbi/sbi_error.h           |   4 +
 include/sbi/sbi_ipi.h             |   6 +-
 include/sbi/sbi_sse.h             | 222 +++++++
 lib/sbi/Kconfig                   |   4 +
 lib/sbi/objects.mk                |   4 +
 lib/sbi/sbi_ecall.c               |   7 +-
 lib/sbi/sbi_ecall_sse.c           |  61 ++
 lib/sbi/sbi_init.c                |  13 +
 lib/sbi/sbi_ipi.c                 |  12 +-
 lib/sbi/sbi_sse.c                 | 963 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_tlb.c                 |   2 +-
 lib/sbi/sbi_trap.c                |   4 +-
 lib/utils/irqchip/imsic.c         |   2 +-
 14 files changed, 1327 insertions(+), 13 deletions(-)
 create mode 100644 include/sbi/sbi_sse.h
 create mode 100644 lib/sbi/sbi_ecall_sse.c
 create mode 100644 lib/sbi/sbi_sse.c

-- 
2.42.0


