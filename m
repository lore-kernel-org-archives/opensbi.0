From: Xiang W <wxjstz@126.com>
Date: Wed, 15 Nov 2023 22:59:20 +0800
Subject: [PATCH v2 0/2] lib: sbi: Improved atomic bit operations
Message-ID: <20231115145929.488427-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The original atomic bit operation returns the word before modification,
but under RV64, int is 32 bits and cannot accommodate one machine word.
Corrected to return the value of the bit. And correct the comments of
the function.

Changed from v1:
- Split patch
- fix comments

Xiang W (2):
  lib: sbi: Fix __atomic_op_bit_ord and comments
  lib: sbi: Replace __atomic_op_bit_ord with __atomic intrinsics

 include/sbi/riscv_atomic.h |  8 ++++----
 lib/sbi/riscv_atomic.c     | 40 ++++++++++++--------------------------
 2 files changed, 16 insertions(+), 32 deletions(-)

-- 
2.42.0


