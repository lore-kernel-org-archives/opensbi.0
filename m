From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri,  8 Dec 2023 13:22:56 -0800
Subject: [PATCH 0/3] sbi_ipi bug fixes and optimizations
Message-ID: <20231208212301.3649930-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series makes a few improvements to the sbi_ipi library. The first
patch fixes some error handling. In my specific case, no IPI device was
registered, which caused Linux to silently not receive any IPIs. The
second patch improves self-IPIs. In addition to fixing a deadlock that
could occur for synchronous events (sbi_tlb is not affected because it
implements a similar self-IPI fast path itself), it also has the effect
that single-hart platforms no longer need an IPI device, since on those
platforms all IPIs are self-IPIs. Patch 3 is a minor optimization.


Samuel Holland (3):
  lib: sbi_ipi: Do not ignore errors from sbi_ipi_send()
  lib: sbi_ipi: Process self-IPIs in sbi_ipi_send()
  lib: sbi_ipi: Drop unnecessary ipi_process check

 include/sbi/sbi_ipi.h |  2 +-
 lib/sbi/sbi_ipi.c     | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.42.0


