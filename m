From: Clément Léger <cleger@rivosinc.com>
Date: Tue,  9 Apr 2024 12:02:01 +0200
Subject: [PATCH 0/7] lib: sbi: sse: fixes after review
Message-ID: <20240409100216.263256-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This small series addresses a few comments from Samuel that were made
after the series was merged.

Cl?ment L?ger (7):
  lib: sbi: sse: fix typos, comments and spacing errors
  lib: sbi: sse: rename sse_hart_unlock() to sse_enabled_event_unlock()
  lib: sbi: sse: simplify 32bits overflow check
  lib: sbi: sse: remove superfluous sbi_list_empty() check
  lib: sbi: sse: call enable callback before sending IPI
  lib: sbi: sse: use PRV_S instead of hardcoded value for mode
  lib: sbi: sse: check handler entry to belong to supervisor mode

 include/sbi/sbi_ecall_interface.h | 24 +++++++-------
 lib/sbi/sbi_sse.c                 | 53 ++++++++++++++++---------------
 2 files changed, 40 insertions(+), 37 deletions(-)

-- 
2.43.0


