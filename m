From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Dec 2024 09:46:45 +0530
Subject: [PATCH 0/2] OpenSBI LLVM related fixes
Message-ID: <20241210041647.397206-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does few LLVM related fixes encountered using
"Ubuntu clang version 18.1.3 (1ubuntu1)".

These patches can also be found in the riscv_llvm_compile_fixes_v1
branch at: https://github.com/avpatel/opensbi.git

Anup Patel (2):
  lib: utils/fdt_cppc_rpmi: Fix compile error with LLVM
  Makefile: Don't enable V-extension using -march option

 Makefile                       | 8 ++++----
 lib/sbi/sbi_trap_v_ldst.c      | 5 +++--
 lib/utils/cppc/fdt_cppc_rpmi.c | 7 +++++--
 3 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.43.0


