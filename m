From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 17 Mar 2025 11:54:18 +0100
Subject: [PATCH 0/6] lib: sbi: sse: spec update and fixes
Message-ID: <20250317105426.631243-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI specification added a few new events as well as specifying
sse_write_attrs() invalid attributes errors. Also handle new fields
to be saved (SPELP, SDT) upon injection.

Cl?ment L?ger (6):
  lib: sbi: sse: Update SSE event ids
  lib: sbi: sse: Fix format string for event invalid state
  lib: sbi: sse: Return SBI_EDENIED for read only parameters.
  lib: sbi: sse: Rename STATUS* interrupted flags to SSTATUS*
  lib: sbi: sse: Add support for SSTATUS.SPELP
  lib: sbi: sse: Add support for SSTATUS.SDT

 include/sbi/riscv_encoding.h      |  3 +-
 include/sbi/sbi_ecall_interface.h | 50 ++++++++++++++++++++++++-------
 lib/sbi/sbi_pmu.c                 |  4 +--
 lib/sbi/sbi_sse.c                 | 50 +++++++++++++++++++++----------
 4 files changed, 78 insertions(+), 29 deletions(-)

-- 
2.47.2


