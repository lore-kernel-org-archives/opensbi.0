From: Vivian Wang <dramforever@live.com>
Date: Fri,  2 Sep 2022 23:47:18 +0800
Subject: [PATCH 0/2] lib: sbi_misaligned_ldst: Set GVA if not emulating
Message-ID: <OSZP286MB1435E0C79F99B144BC99F8F2C67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix of a previous patch 1c4ce74f5128 ("lib: sbi: Set gva when creating
sbi_trap_info"), correctly set hstatus.GVA for misaligned loads/stores
that cannot be emulated at all.

See: https://lists.infradead.org/pipermail/opensbi/2022-August/003274.html

Vivian Wang (2):
  lib: sbi_trap: Add helper to get GVA in sbi_trap_regs
  lib: sbi_misaligned_ldst: Set GVA if not emulating

 include/sbi/sbi_trap.h        | 18 ++++++++++++++++++
 lib/sbi/sbi_misaligned_ldst.c |  4 ++--
 lib/sbi/sbi_trap.c            | 14 +-------------
 3 files changed, 21 insertions(+), 15 deletions(-)

-- 
2.37.1


