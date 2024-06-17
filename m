From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 17 Jun 2024 17:41:00 +0200
Subject: [PATCH v2 0/4] Add SBI FWFT extension support
Message-ID: <20240617154110.4007865-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for SBI FWFT extension. FWFT extension is not
yet ratified but will be present in SBI V3.0 [1]. Current support can be
tested using kvm-unit-tests [2] using the following command:

$ qemu-system-riscv64 -s -M virt -cpu rv64 -nographic -serial mon:stdio?\
	-bios <opensbi_fwft>/build/platform/generic/firmware/fw_jump.bin
	-kernel <kvm-unit-tests>/riscv/sbi_fwft.flat

This series is based on Yong-Xuan Wang series [3].

Link: https://lists.riscv.org/g/tech-prs/message/924 [1]
Link: https://github.com/clementleger/kvm-unit-tests/tree/dev/cleger/fwft [2]
Link: http://lists.infradead.org/pipermail/opensbi/2024-June/006966.html [3]

---
V2:
 - Rebased on top of Yong-Xuan Wang svadu/svade series
 - Updated wrt latest FWFT spec (removed software check exception deleg)

Cl?ment L?ger (4):
  lib: sbi: add support for firmware features extension
  lib: sbi: fwft: add support for SBI_FWFT_MISALIGNED_EXC_DELEG
  lib: sbi: fwft: add support for SBI_FWFT_PTE_AD_HW_UPDATING
  lib: sbi: implement SBI FWFT extension

 include/sbi/sbi_ecall_interface.h |  27 ++++
 include/sbi/sbi_fwft.h            |  23 +++
 lib/sbi/Kconfig                   |   4 +
 lib/sbi/objects.mk                |   4 +
 lib/sbi/sbi_ecall_fwft.c          |  49 ++++++
 lib/sbi/sbi_fwft.c                | 261 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_hsm.c                 |  15 ++
 lib/sbi/sbi_init.c                |  11 ++
 8 files changed, 394 insertions(+)
 create mode 100644 include/sbi/sbi_fwft.h
 create mode 100644 lib/sbi/sbi_ecall_fwft.c
 create mode 100644 lib/sbi/sbi_fwft.c

-- 
2.45.2


