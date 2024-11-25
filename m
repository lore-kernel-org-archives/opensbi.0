From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 25 Nov 2024 11:52:58 +0100
Subject: [PATCH 0/2] lib: sbi: fixes a few SSE errors
Message-ID: <20241125105303.1113607-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While reviewing kvm-unit-tests, Andrew Jones found a few implementation
errors. This small series fixes them.

Cl?ment L?ger (2):
  lib: sbi: fix GLOBAL_PLAT_DEFINE
  lib: sbi: sse: Fix a6 and a7 register content upon injection

 include/sbi/sbi_ecall_interface.h | 4 ++--
 lib/sbi/sbi_sse.c                 | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.45.2


