From: Clément Léger <cleger@rivosinc.com>
Date: Tue,  9 Jan 2024 11:44:52 +0100
Subject: [RFC PATCH v2 0/4] Add support for Supervisor Software Events extension
Message-ID: <20240109104500.2080121-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI Supervisor Software Events (SSE) extensions provides a mechanism
to inject software events from an SBI implementation to supervisor
software such that it preempts all other supervisor level traps and
interrupts [1]. This RFC implements the V2 version of the spec.

Various events are defined and can be send asynchronously to supervisor
software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
as platform specific events. Events can be either local (per-hart) or
global. Events can be nested on top of each other based on priority and
can interrupt the supervisor mode at any time.

This PR adds support for this extension. First commit modifies interrupts
handling to pass the sbi traps regs through interrupt handlers in order to inject
SSE events from this context. Second one add the SSE support itself and
the final two commits add SSE support for PMU interrupts.

Link: https://lists.riscv.org/g/tech-prs/message/744 [1]

---

Changes from v1:
 - Implemented SSE Spec v2
 - Change event state checking (Xiang W)

v1: http://lists.infradead.org/pipermail/opensbi/2023-November/006015.html

Cl?ment L?ger (4):
  lib: sbi: provides regs to sbi_ipi_process()
  lib: sbi: add support for Supervisor Software Events extension
  lib: sbi: trigger SSE PMU event on PMU overflow IRQ
  lib: sbi: add SBI_EXT_PMU_IRQ_CLEAR

 include/sbi/sbi_ecall_interface.h |   49 +-
 include/sbi/sbi_error.h           |    4 +-
 include/sbi/sbi_ipi.h             |    6 +-
 include/sbi/sbi_pmu.h             |    5 +
 include/sbi/sbi_sse.h             |   93 +++
 lib/sbi/Kconfig                   |    4 +
 lib/sbi/objects.mk                |    4 +
 lib/sbi/sbi_ecall_pmu.c           |    3 +
 lib/sbi/sbi_ecall_sse.c           |   58 ++
 lib/sbi/sbi_init.c                |   13 +
 lib/sbi/sbi_ipi.c                 |   14 +-
 lib/sbi/sbi_pmu.c                 |   49 ++
 lib/sbi/sbi_sse.c                 | 1078 +++++++++++++++++++++++++++++
 lib/sbi/sbi_tlb.c                 |    2 +-
 lib/sbi/sbi_trap.c                |   10 +-
 lib/utils/irqchip/imsic.c         |    2 +-
 16 files changed, 1380 insertions(+), 14 deletions(-)
 create mode 100644 include/sbi/sbi_sse.h
 create mode 100644 lib/sbi/sbi_ecall_sse.c
 create mode 100644 lib/sbi/sbi_sse.c

-- 
2.43.0


