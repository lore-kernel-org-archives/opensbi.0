From: dramforever <dramforever@live.com>
Date: Wed,  3 Aug 2022 13:15:01 +0800
Subject: [RFC PATCH 0/3] Set hstatus.GVA when redirecting traps
Message-ID: <TYYP286MB143914043D5A77C568CDDE57C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The privileged spec says that on a trap to HS-mode, hstatus.GVA should
be set to 1 if stval is written with a guest virtual address, and 0
otherwise. This series implements setting hstatus.GVA in
sbi_trap_redirect().

I'm submitting this as an RFC since this series changes sbi_trap_info to
record mstatus.GVA, and later copy to hstatus.GVA, which might not be
desirable or could be done in a better way.

dramforever (3):
  include: Add mstatus[h].GVA encodings
  lib: sbi_trap: Save mstatus.GVA in trap->gva
  lib: sbi_trap: Set hstatus.GVA when redirecting

 include/sbi/riscv_encoding.h |  4 ++++
 include/sbi/sbi_trap.h       |  6 +++++-
 lib/sbi/sbi_expected_trap.S  | 14 ++++++++++++--
 lib/sbi/sbi_trap.c           | 13 ++++++++-----
 4 files changed, 29 insertions(+), 8 deletions(-)

-- 
2.37.1


