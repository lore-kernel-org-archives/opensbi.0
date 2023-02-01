From: Xiang W <wxjstz@126.com>
Date: Wed,  1 Feb 2023 23:06:38 +0800
Subject: [PATCH 0/4] Miscellaneous about sbi_tlb and sbi_ipi
Message-ID: <20230201150642.161265-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Removed the mutual waiting between process and sync in sbi_tlb
Update ipi first then wait together

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
 lib/sbi/sbi_ipi.c     | 39 ++++++++++++++++++++++++++++++------
 lib/sbi/sbi_tlb.c     | 46 +++++++++++++++++++++----------------------
 3 files changed, 58 insertions(+), 30 deletions(-)

-- 
2.39.0


