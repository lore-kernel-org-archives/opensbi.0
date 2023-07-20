From: Kaiwen Xue <kaiwenx@rivosinc.com>
Date: Thu, 20 Jul 2023 14:07:01 -0700
Subject: [PATCH 0/1] sbi: Add support for smcntrpmf
Message-ID: <cover.1689633697.git.kaiwenx@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds support for ISA extension smcntrpmf, cycle and instret
privilege mode filtering [1]. It is supposed to work together with the QEMU
support [2].

[1] https://github.com/riscv/riscv-smcntrpmf
[2] https://github.com/rivosinc/qemu/tree/dev/kaiwenx/smcntrpmf_upstream

Kaiwen Xue (1):
  lib: sbi: Add support for smcntrpmf

 include/sbi/riscv_encoding.h |  4 ++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/riscv_asm.c          | 12 +++++++++++
 lib/sbi/sbi_hart.c           | 11 ++++++++++
 lib/sbi/sbi_pmu.c            | 42 ++++++++++++++++++++++++++++++++++--
 5 files changed, 69 insertions(+), 2 deletions(-)

-- 
2.41.0


