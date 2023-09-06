From: Xiang W <wxjstz@126.com>
Date: Wed,  6 Sep 2023 21:10:02 +0800
Subject: [PATCH v5 0/2] Some changes about tlb fifo
Message-ID: <20230906131004.427047-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v5 changes:
PATCH1: Add Anup's SOB 
PATCH2: Fix duplicate memory requests whenever a HART is turned-off and turned-on.

v4 changes:
PATCH1: move tlb_fifo_num_entries form sbi_platform to sbi_platform_operations

v3 changes: 
PATCH2: Fix the bug that all harts use same tlb_mem

On some platforms with a lot of harts, a tlb fifo that is too small can cause
some harts to wait. Here are some patches to modify the tlb fifo size.

Xiang W (2):
  platform: Allow platforms to specify the size of tlb fifo
  lib: sbi: alloc tlb fifo by sbi_malloc

 include/sbi/sbi_platform.h                   | 18 ++++++++++++++++++
 include/sbi/sbi_tlb.h                        |  2 --
 lib/sbi/sbi_tlb.c                            | 15 +++++++++++----
 platform/generic/include/platform_override.h |  1 +
 platform/generic/platform.c                  |  8 ++++++++
 5 files changed, 38 insertions(+), 6 deletions(-)

-- 
2.40.1


