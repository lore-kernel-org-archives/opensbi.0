From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 21 Dec 2022 11:55:33 -0800
Subject: [PATCH v2 Zisslpcfi 0/2] Support for zisslpcfi in opensbi
Message-ID: <20221221195535.2136015-1-debug@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Zisslpcfi [1] extension extends risc-v architecture to mitigate against
control-flow integrity attacks (ROP/JOP/COP).

Zisslpcfi uses bits (b23-b29) in (m/s/vs) status CSR for enabling cfi in
lesser privileged mode and record cfi state. One such state is expected
landing pad (ELP). If forward cfi is enabled, indirect call/jmp updates
hart's ELP state (1bit) to true. ELP state is cleared only by a landing
pad instruction else trap is delivered with ELP state recorded in sstatus
CSR.

This two patch series adds following changes to opensbi
    - Adds support in opensbi to detect zisslpcfi
    - trap redirection updates ELP state accordingly

Qemu implementation for Zisslpcfi can be checked out on github [2]
Strawman linux kernel enabling (still very early) can be checked out on github [3]

[1] - https://github.com/riscv/riscv-cfi
[2] - https://github.com/deepak0414/qemu/tree/gh_Zisslpcfi-0.1
[3] - https://github.com/deepak0414/linux-riscv-cfi/tree/Zisslpcfi-0.1_v6.1-rc2

Deepak Gupta (2):
  include: adding support for Zisslpcfi encodings
  lib: sbi: Zisslpcfi detection and elp cfi state reflect back in status

 include/sbi/riscv_encoding.h |  6 ++++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/sbi_hart.c           | 21 +++++++++++++++++++++
 lib/sbi/sbi_trap.c           | 18 ++++++++++++++++++
 4 files changed, 47 insertions(+)

-- 
2.25.1


