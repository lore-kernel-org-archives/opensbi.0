From: Xiang W <wxjstz@126.com>
Date: Tue, 15 Aug 2023 10:31:09 +0800
Subject: [PATCH v3 0/2] Some changes about tlb fifo
Message-ID: <20230815023111.349647-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v3 changes: 
PATCH2: Fix the bug that all harts use same tlb_mem

On some platforms with a lot of harts, a tlb fifo that is too small can cause
some harts to wait. Here are some patches to modify the tlb fifo size.

Xiang W (2):
  platform: Allow platforms to specify the size of tlb fifo
  lib: sbi: alloc tlb fifo by sbi_malloc

 include/sbi/sbi_platform.h | 29 +++++++++++++++++++++++++++++
 include/sbi/sbi_tlb.h      |  2 --
 lib/sbi/sbi_tlb.c          | 21 +++++++--------------
 3 files changed, 36 insertions(+), 16 deletions(-)

-- 
2.40.1


