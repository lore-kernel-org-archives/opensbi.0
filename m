From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 25 Mar 2025 11:26:07 +0100
Subject: [PATCH v2 0/7] lib: sbi: sse: spec update and fixes
Message-ID: <20250325102615.1587953-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI specification added a few new events as well as specifying
sse_write_attrs() invalid attributes errors. Also handle new fields
to be saved (SPELP, SDT) upon injection.

v2:
 - Remove superfluous parenthesis around MSTATUS values
 - Fix typo in commit
 - Modify commit that added a newline to actually remove the printf
 - Add a comment regarding SBI_EDENIED being return

Cl?ment L?ger (7):
  lib: sbi: sse: Update SSE event ids
  lib: sbi: sse: Remove printf from ssbi_sse_exit()
  lib: sbi: sse: Return SBI_EDENIED for read only parameters.
  lib: sbi: sse: Rename STATUS* interrupted flags to SSTATUS*
  lib: sbi: sse: Remove superfluous parenthesis around MSTATUS_* values
  lib: sbi: sse: Add support for SSTATUS.SPELP
  lib: sbi: sse: Add support for SSTATUS.SDT

 include/sbi/riscv_encoding.h      |  3 +-
 include/sbi/sbi_ecall_interface.h | 50 ++++++++++++++++++++------
 lib/sbi/sbi_pmu.c                 |  4 +--
 lib/sbi/sbi_sse.c                 | 60 +++++++++++++++++++++----------
 4 files changed, 85 insertions(+), 32 deletions(-)

-- 
2.47.2


