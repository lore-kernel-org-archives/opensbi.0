From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Feb 2024 16:06:07 -0800
Subject: [PATCH v1 0/1] Add Indirect CSR and Counter delegation ISA extension support 
Message-ID: <20240217000608.3635372-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds indirect CSR S[m|s]csrind extension[1] and counter delegation
extensions[2] support. M-mode don't have to do a lot except setting the correct
bits in mstateen/menvcfg/mcountern.

The Qemu patches can be found here:
https://github.com/atishp04/qemu/tree/counter_delegation_rfc

The opensbi patch can be found here:
https://github.com/atishp04/opensbi/tree/counter_delegation_v1

The Linux kernel patches can be found here:
https://github.com/atishp04/linux/tree/counter_delegation_rfc


[1] https://github.com/riscv/riscv-indirect-csr-access
[2] https://github.com/riscv/riscv-smcdeleg-ssccfg

Atish Patra (1):
lib: sbi: Add support for smcsrind and smcdeleg

include/sbi/riscv_encoding.h | 25 ++++++++++++++++++++++---
include/sbi/sbi_hart.h       |  8 ++++++++
lib/sbi/sbi_hart.c           | 16 ++++++++++++----
3 files changed, 42 insertions(+), 7 deletions(-)

--
2.34.1


