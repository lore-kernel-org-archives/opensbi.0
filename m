From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 28 Feb 2022 00:29:11 -0800
Subject: [PATCH v1 0/2] Sstc extension support
Message-ID: <20220228082913.3665360-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for Sstc extension which was ratified recently.
The PATCH 1 adds menvcfg CSR while the PATCH 2 actually adds the Sstc
specific details. 

Atish Patra (2):
lib/sbi: Implement menvcfg CSR
lib: sbi: Implement Sstc extension

include/sbi/riscv_encoding.h | 15 +++++++++++++++
include/sbi/sbi_hart.h       |  6 +++++-
lib/sbi/sbi_hart.c           | 33 +++++++++++++++++++++++++++++++++
lib/sbi/sbi_timer.c          | 25 ++++++++++++++++++++++---
4 files changed, 75 insertions(+), 4 deletions(-)

--
2.30.2


