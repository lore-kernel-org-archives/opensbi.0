From: Deepak Gupta <debug@rivosinc.com>
Date: Sun, 11 Dec 2022 19:08:02 -0800
Subject: [PATCH Zisslpcfi 0/2] Support for zisslpcfi in opensbi
Message-ID: <20221212030804.927309-1-debug@rivosinc.com>
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

[1] - https://github.com/riscv/riscv-cfi

Deepak Gupta (2):
  include: adding support for zsslpcfi encodings
  lib: sbi: zsslpcfi detection and elp cfi state reflect back in status

 include/sbi/riscv_encoding.h |  6 ++++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/sbi_hart.c           | 21 +++++++++++++++++++++
 lib/sbi/sbi_trap.c           | 18 ++++++++++++++++++
 4 files changed, 47 insertions(+)

-- 
2.25.1


