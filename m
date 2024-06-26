From: Xiang W <wxjstz@126.com>
Date: Thu, 27 Jun 2024 01:48:11 +0800
Subject: [PATCH 0/3] Add support for tor type pmp
Message-ID: <20240626174816.2837278-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Using tor type pmp can save pmp configuration registers in the following
scenarios

sbi_domain_root_add_memrange(addr, 4M, PAGE_SIZE...
sbi_domain_root_add_memrange(addr + 4M, 512K, PAGE_SIZE...
sbi_domain_root_add_memrange(addr + 4M + 512K, 32K, PAGE_SIZE...

The previous configuration requires 3 sets of pmp configuration registers.
After applying the patch, only 2 sets of pmp configuration registers are
needed.

Xiang W (3):
  lib: sbi: Add tor type PMP support
  lib: sbi: Introduce size to sbi_domain_memregion
  lib: sbi: Improve memory region merging

 include/sbi/riscv_asm.h  |   6 +-
 include/sbi/sbi_domain.h |  37 +++++
 lib/sbi/riscv_asm.c      | 190 +++++++++++++---------
 lib/sbi/sbi_domain.c     | 336 +++++++++++++++++++++++++--------------
 lib/sbi/sbi_hart.c       |  30 ++--
 5 files changed, 382 insertions(+), 217 deletions(-)

-- 
2.43.0


