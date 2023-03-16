From: Xiang W <wxjstz@126.com>
Date: Thu, 16 Mar 2023 15:51:22 +0800
Subject: [PATCH v4 0/4] Miscellaneous about sbi_tlb and sbi_ipi
In-Reply-To: <20230202085136.224745-1-wxjstz@126.com>
References: <20230202085136.224745-1-wxjstz@126.com>
Message-ID: <89543c328342c6bed00393536d01bb43cd3ef612.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-02-02???? 16:51 +0800?Xiang W???
> Removed the mutual waiting between process and sync in sbi_tlb
> Update ipi first then wait together
> 
Please review!
Optimization can improve tlb sync efficiency.

sequence diagram before optimization:
===================================================================
send ipi hart       hart 0       hart 1     hart 2   ...
      +               +           +           +
      |               |           |           |
      | update hart 0 |           |           |
      +<------------->+--+        |           |
      |               |  |process |           |
      |               |  |        |           |
      |               +<-+        |           |
      | sync          |           |           |
      +<------------->+           |           |
      | update hart 1             |           |
      +<------------------------->+--+        |
      |                           |  |process |
      |                           |  |        |
      |                           +<-+        |
      | sync                      |           |
      +<------------------------->+           |
      | update hart 2                         |
      +<------------------------------------->+--+
      |                                       |  |process
      |                                       |  |
      |                                       +<-+
      | sync                                  |
      +<------------------------------------->+
      .
      .
      .

sequence diagram after optimization:
===================================================================
send ipi hart       hart 0       hart 1     hart 2   ...
      +               +           +           +
      |               |           |           |
      | update hart 0 |           |           |
      +<------------->+--+        |           |
      | update hart 1 |  |process |           |
      +<--------------|--|------->+--+        |
      | update hart 2 +<-+        |  |process |
      +<--------------|-----------|--|------->+--+
      |               |           +<-+        |  |process
      |               |           |           |  |
      | sync          |           |           +<-+
      +<------------->+           |           |
      | sync                      |           |
      +<------------------------->+           |
      | sync                                  |
      +<------------------------------------->+
      .
      .
      .

Regards,
Xiang W

> V4 Changes:
> PATCH1: Fixed not adding one to tlb_sync when SBI_FIFO_UNCHANGED
> PATCH4: Add comments
> 
> V3 Changes:
> PATCH2: Remove missing sync in update
> add PATCH4: Optimize sbi_tlb queue waiting
> 
> V2 Changes:
> PATCH2: Fix m changes after update IPIs
> 
> Xiang W (4):
> ? lib: sbi: Optimize sbi_tlb
> ? lib: sbi: Optimize sbi_ipi
> ? lib: sbi: rename function of sbi_ipi
> ? lib: sbi: Optimize sbi_tlb queue waiting
> 
> ?include/sbi/sbi_ipi.h |? 3 +++
> ?lib/sbi/sbi_ipi.c???? | 43 ++++++++++++++++++++++++++++++-------
> ?lib/sbi/sbi_tlb.c???? | 49 +++++++++++++++++++------------------------
> ?3 files changed, 61 insertions(+), 34 deletions(-)
> 


