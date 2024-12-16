From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 16 Dec 2024 22:21:37 +0100
Subject: [PATCH v4 0/5] lib: sbi: sse: rework event availability
Message-ID: <20241216212144.3379890-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While reworking the Linux SSE support, it appears that the PMU event
should not be available if the SSCOFPMF extension is not available since
there would be no IRQ. A request to modify the specification has been
send in order to add the possibility to return SBI_ENOTSUPP (see [1]).
This small series modifies the SSE core to detect event support at boot
time using a new callback and return SBI_ENOTSUPP if needed.

Link: https://lists.riscv.org/g/tech-prs/message/1123 [1]

---

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

Cl?ment L?ger (5):
  lib: sbi: pmu: fix usage of sbi_pmu_irq_bit()
  lib: sbi: sse: return an error value from sse_event_get()
  lib: sbi: sse: allow adding new events
  lib: sbi: sse: return SBI_ENOTSUPP for unsupported events
  lib: sbi: pmu: add the PMU SSE event only if overflow IRQ is supported

 include/sbi/sbi_pmu.h                         |   3 +
 include/sbi/sbi_sse.h                         |   8 +-
 lib/sbi/sbi_hart.c                            |   2 +-
 lib/sbi/sbi_init.c                            |  24 +-
 lib/sbi/sbi_pmu.c                             |  45 ++--
 lib/sbi/sbi_sse.c                             | 211 ++++++++++++------
 lib/sbi/sbi_trap.c                            |  15 +-
 .../generic/include/thead/c9xx_encoding.h     |   1 -
 platform/generic/thead/thead_c9xx_pmu.c       |   2 +-
 9 files changed, 201 insertions(+), 110 deletions(-)

-- 
2.45.2


