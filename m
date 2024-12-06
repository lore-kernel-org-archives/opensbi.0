From: Clément Léger <cleger@rivosinc.com>
Date: Fri,  6 Dec 2024 21:59:54 +0100
Subject: [PATCH 0/3] lib: sbi: fix PMU SSE event handling
Message-ID: <20241206205958.1055770-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While reworking the Linux SSE support, it appears that the PMU event
should not be available if the SSCOFPMF extension is not available since
there would be no IRQ. The specification isn't really clear on that point
so this is more like a RFC to check that. Ideally, the sse register call
should allow to refuse registering an event if the dependencies are not
satisfied but does not allow this yet.

Cl?ment L?ger (3):
  lib: sbi: sse: Return a value from the register callback
  lib: sbi: sse: Disable injection if callbacks are set
  lib: sbi: pmu: Set a SSE register_cb() for event availability

 include/sbi/sbi_sse.h |  2 +-
 lib/sbi/sbi_pmu.c     | 11 +++++++++++
 lib/sbi/sbi_sse.c     | 19 +++++++++++++++++--
 3 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.45.2


