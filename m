From: Xiang W <wxjstz@126.com>
Date: Tue, 11 Apr 2023 12:56:17 +0800
Subject: [PATCH v5 0/4] Miscellaneous about sbi_tlb and sbi_ipi
In-Reply-To: <y>
References: <y>
Message-ID: <20230411045621.60331-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

V5 Changes:
PATCH1: use ATOMIC_INIT tlb_sync
PATCH2: drop the rename of sbi_ipi_send
PATCH3: drop the rename of tlb_entry_process.
        commit improved
        Modify the return value type of tlb_process_once to bool
PATCH4: update ipi's loop variable from done to retry_needed
        

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
  sbi: tlb: Simplify to tlb_process_count/tlb_process function
  lib: sbi: Optimize sbi_tlb queue waiting

 include/sbi/sbi_ipi.h |  3 +++
 lib/sbi/sbi_ipi.c     | 40 +++++++++++++++++++++++++++++++++-----
 lib/sbi/sbi_tlb.c     | 45 +++++++++++++++++++------------------------
 3 files changed, 58 insertions(+), 30 deletions(-)

-- 
2.39.2


