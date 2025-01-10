From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 10 Jan 2025 14:15:49 +0100
Subject: [PATCH v6 0/7] lib: sbi: sse: rework event availability
Message-ID: <20250110131557.3261411-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While reworking the Linux SSE support, it appears that the PMU event
should not be available if the SSCOFPMF extension is not available since
there would be no IRQ. A request to modify the specification has been
send in order to add the possibility to return SBI_ENOTSUPP (see [1]).
This small series modifies the SSE core to allow adding new events at
boot time using sbi_sse_add_event(). Aditionally, it now returns
SBI_ERR_NOT_SUPPORTED if the requested event can not be handled by any
driver.

Link: https://lists.riscv.org/g/tech-prs/message/1123 [1]

---
Changes in V6
 - Add double trap event if dbltrp extension is available

Changes in V5
 - Remove a blank line before sse_event_info
 - Move PMU call to sbi_sse_add_event() in cold_boot path.
 - Move simply-linked list implementation to a separate header.

Changes in V4:
 - Used unsigned long for pmu_rq_bit_mask()
 - Moved pmu irq check in default case rather than hot path
 - Changed the supported event array to be a list, allowing for drivers
   to register additional handled events.
 - Check for supported events at init time.
 - Remove the need for is_supported callback

Changes in V3:
 - Rework is_supported_cb() to allow per-hart local event availability
 - Remove now useless cached_version of is_supported.
 - Fix eret check + potential empty eret in case event_is_supported()
   returns SBI_SUCCESS.
 - Split commit to set all non software events as non injectable at the
   end of the series.
 - Fix usage of sbi_pmu_irq_bit() in sbi_pmu.c

Changes in v2:
 - Add an sse_event_info struct that stores 'cb_ops' as well as 'supported'
 - Move SSE initialization after all other "drivers" init.
 - Split changes in multiple commits
 - Added an is_supported callback to check for event availability

Cl?ment L?ger (7):
  lib: sbi: pmu: fix usage of sbi_pmu_irq_bit()
  lib: sbi: move sbi_double_trap_handler() to a dedicated header
  lib: sbi: sse: return an error value from sse_event_get()
  include: lib: add a simple simply linked list implementation
  lib: sbi: sse: allow adding new events
  lib: sbi: sse: return SBI_ENOTSUPP for unsupported events
  lib: sbi: pmu: add the PMU SSE event only if overflow IRQ is supported

 include/sbi/sbi_double_trap.h                 |  20 ++
 include/sbi/sbi_pmu.h                         |   3 +
 include/sbi/sbi_slist.h                       |  33 +++
 include/sbi/sbi_sse.h                         |   8 +-
 include/sbi/sbi_trap_ldst.h                   |   2 -
 lib/sbi/sbi_double_trap.c                     |   7 +
 lib/sbi/sbi_hart.c                            |   2 +-
 lib/sbi/sbi_init.c                            |  27 ++-
 lib/sbi/sbi_pmu.c                             |  47 ++--
 lib/sbi/sbi_sse.c                             | 209 ++++++++++++------
 lib/sbi/sbi_trap.c                            |  16 +-
 .../generic/include/thead/c9xx_encoding.h     |   1 -
 platform/generic/thead/thead_c9xx_pmu.c       |   2 +-
 13 files changed, 264 insertions(+), 113 deletions(-)
 create mode 100644 include/sbi/sbi_double_trap.h
 create mode 100644 include/sbi/sbi_slist.h

-- 
2.47.1


