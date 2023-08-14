From: Xiang W <wxjstz@126.com>
Date: Mon, 14 Aug 2023 19:36:16 +0800
Subject: [PATCH v2 0/2] Some changes about tlb fifo
Message-ID: <20230814113618.153524-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On some platforms with a lot of harts, a tlb fifo that is too small can cause
some harts to wait. Here are some patches to modify the tlb fifo size.

Xiang W (2):
  platform: Allow platforms to specify the size of tlb fifo
  lib: sbi: alloc tlb fifo by sbi_malloc

 include/sbi/sbi_platform.h | 29 +++++++++++++++++++++++++++++
 include/sbi/sbi_tlb.h      |  2 --
 lib/sbi/sbi_tlb.c          | 17 ++++++++---------
 3 files changed, 37 insertions(+), 11 deletions(-)

-- 
2.40.1


