From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 10 Dec 2024 18:05:48 +0100
Subject: [PATCH v2 0/4] lib: sbi: sse: rework event availability
Message-ID: <20241210170553.1034872-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While reworking the Linux SSE support, it appears that the PMU event
should not be available if the SSCOFPMF extension is not available since
there would be no IRQ. A request to modify the specification has been
send in order to add the possbility to return SBI_ENOTSUPP (see [1]).
This small series modifies the SSE core to detect event support at boot
time using a new callback and return SBI_ENOTSUPP if needed.

Link: https://lists.riscv.org/g/tech-prs/message/1123 [1]

---

Changes in v2:
 - Add an sse_event_info struct that stores 'cb_ops' as well as 'supported'
 - Move SSE initialization after all other "drivers" init.
 - Split changes in multiple commits
 - Added an is_supported callback to check for event availability

Cl?ment L?ger (4):
  lib: sbi: sse: return an error value from sse_event_get()
  lib: sbi: sse: rework event availability
  lib: sbi: sse: add a is_supported_cb() callback
  lib: sbi: pmu: add an sse .is_supported_cb callback implementation

 include/sbi/sbi_sse.h |   5 ++
 lib/sbi/sbi_init.c    |  20 +++---
 lib/sbi/sbi_pmu.c     |  13 +++-
 lib/sbi/sbi_sse.c     | 162 +++++++++++++++++++++++++++---------------
 4 files changed, 131 insertions(+), 69 deletions(-)

-- 
2.45.2


