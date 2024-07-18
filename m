From: zhangdongdong@eswincomputing.com <zhangdongdong@eswincomputing.com>
Date: Thu, 18 Jul 2024 13:43:56 +0800
Subject: [PATCH v2 0/1] lib:sbi: Enhance CSR Handling in system_opcode_insn
Message-ID: <20240718054357.18756-1-zhangdongdong@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

Changes in v2:
    - Accepted Vivian's suggestion regarding the funct3 check.
      The code has been simplified to: if (funct3 == 0 || funct3 == 4) 
      for better clarity and conciseness.

Dongdong Zhang (1):
  lib:sbi: Enhance CSR Handling in system_opcode_insn

 include/sbi/riscv_encoding.h | 19 +++++++++++++++++-
 include/sbi/riscv_fp.h       |  1 -
 lib/sbi/sbi_illegal_insn.c   | 37 +++++++++++++++++++++++-------------
 3 files changed, 42 insertions(+), 15 deletions(-)

-- 
2.17.1


