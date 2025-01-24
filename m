From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 24 Jan 2025 17:51:55 +0100
Subject: [PATCH v2 0/4] lib: sbi: fwft: Fix return error values according to the spec
Message-ID: <20250124165202.465445-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fwft spec mandates that an invalid feature ID return
SBI_ERR_INVALID_PARAM and that setting a locked value should return
SBI_ERR_DENIED_LOCKED. Add support for both cases.

---
v2:
 - Use BIT_ULL instead of BIT to avoid shift overflow.
 - Include another patch to optimize flags clearing.

Cl?ment L?ger (4):
  include: sbi: Add SBI_ERR_DENIED_LOCKED
  lib: sbi: fwft: Return SBI_ERR_DENIED_LOCKED when setting a locked
    feature
  lib: sbi: fwft: Fix error return value for feature > 32 bits
  lib: sbi: Clear lock only for local events

 include/sbi/sbi_ecall_interface.h |  3 ++-
 include/sbi/sbi_error.h           |  1 +
 include/sbi/sbi_fwft.h            |  4 ++--
 lib/sbi/sbi_fwft.c                | 38 +++++++++++++++++++------------
 4 files changed, 29 insertions(+), 17 deletions(-)

-- 
2.47.1


