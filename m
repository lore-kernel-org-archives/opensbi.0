From: Xiang W <wxjstz@126.com>
Date: Thu,  2 Feb 2023 16:51:32 +0800
Subject: [PATCH v4 0/4] Miscellaneous about sbi_tlb and sbi_ipi
Message-ID: <20230202085136.224745-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Removed the mutual waiting between process and sync in sbi_tlb
Update ipi first then wait together

V4 Changes:
PATCH1: Fixed not adding one to tlb_sync when SBI_FIFO_UNCHANGED
PATCH4: Add comments

V3 Changes:
PATCH2: Remove missing sync in update
add PATCH4: Optimize sbi_tlb queue waiting

V2 Changes:
PATCH2: Fix m changes after update IPIs

Xiang W (4):
  lib: sbi: Optimize sbi_tlb
  lib: sbi: Optimize sbi_ipi
  lib: sbi: rename function of sbi_ipi
  lib: sbi: Optimize sbi_tlb queue waiting

 include/sbi/sbi_ipi.h |  3 +++
 lib/sbi/sbi_ipi.c     | 43 ++++++++++++++++++++++++++++++-------
 lib/sbi/sbi_tlb.c     | 49 +++++++++++++++++++------------------------
 3 files changed, 61 insertions(+), 34 deletions(-)

-- 
2.39.0


