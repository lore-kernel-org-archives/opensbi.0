From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 23 Jan 2025 17:05:33 +0100
Subject: [PATCH 0/3] lib: sbi: fwft: Fix return error values according to the spec
Message-ID: <20250123160537.3420975-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fwft spec mandates that an invalid feature ID return
SBI_ERR_INVALID_PARAM and that setting a locked value should return
SBI_ERR_DENIED_LOCKED. Add support for both cases.

Cl?ment L?ger (3):
  include: sbi: Add SBI_ERR_DENIED_LOCKED
  lib: sbi: fwft: Return SBI_ERR_DENIED_LOCKED when setting a locked
    feature
  lib: sbi: fwft: Fix error return value for feature > 32 bits

 include/sbi/sbi_ecall_interface.h |  3 ++-
 include/sbi/sbi_error.h           |  1 +
 include/sbi/sbi_fwft.h            |  4 ++--
 lib/sbi/sbi_fwft.c                | 13 +++++++++----
 4 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.47.1


