From: Vivian Wang <dramforever@live.com>
Date: Thu,  4 Aug 2022 11:15:50 +0800
Subject: [PATCH 0/5] Set hstatus.GVA for traps going to HS-mode
Message-ID: <TYYP286MB1439C5C64BCF8E9DB7883772C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The privileged spec specifies that on a trap to HS-mode, hstatus.GVA
should be set to 1 if stval is written with a guest virtual address, and
to 0 otherwise.

Implement this by adding a field to sbi_trap_info called gva, which
indicates if tval is a guest virtual address, and set it appropriately.
When redirecting traps to HS-mode, set hstatus.GVA to trap->gva.

Patch 4 is a bugfix. The hypervisor CSRs should be set for all traps to
HS-mode, not just those coming from VS/VU-mode. Since it is closely
related to this series and makes the structure for patch 5 clearer, I
have included it in this series.

Changes since RFC:

- Fixed names used in sign-off lines
- Added more detailed commit messages
- Separated out the hypervisor CSR bugfix into a separate patch

Vivian Wang (5):
  include: Add mstatus[h].GVA encodings
  lib: sbi_trap: Save mstatus[h].GVA in trap->gva
  lib: sbi: Set gva when creating sbi_trap_info
  lib: sbi_trap: Set hypervisor CSRs for HS-mode
  lib: sbi_trap: Set hstatus.GVA when going to HS-mode

 include/sbi/riscv_encoding.h  |  4 ++++
 include/sbi/sbi_trap.h        |  6 +++++-
 lib/sbi/sbi_expected_trap.S   | 17 +++++++++++++++--
 lib/sbi/sbi_illegal_insn.c    |  1 +
 lib/sbi/sbi_misaligned_ldst.c |  2 ++
 lib/sbi/sbi_trap.c            | 21 ++++++++++++++++-----
 6 files changed, 43 insertions(+), 8 deletions(-)

-- 
2.37.1


