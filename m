From: Yangyu Chen <cyy@cyyself.name>
Date: Fri,  8 Dec 2023 06:02:01 +0800
Subject: [PATCH 0/7] lib: sbi: Probe PMP locked entries and adjust first usable PMP index
Message-ID: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some platform which has different domains for different CPU cores may
disable some device by PMP in the bootloader. For example, Canaan
Kendryte K230 provides SDK which locks some PMP entries in M-Mode
U-Boot[1]. As a result, the mainline OpenSBI running on this bootloader
will probe the PMP Count = 1 instead of 64 and PMP Granularity = 4
instead of 4096, which will cause the OpenSBI to have not enough PMPs to
set such regions and the only probed PMP entry is locked. Thus, we will
have no PMP to allow S-Mode main memory access, causing the S-Mode
software traps due to Instruction Access Fault over and over again and
never executed.

This patch set probes the PMP locked entries and adjusts the first
usable PMP index to the maximum index of PMP locked entries + 1. Thus,
the OpenSBI will skip the PMP entries which are locked before OpenSBI
starts.

[1] https://github.com/kendryte/k230_sdk/blob/72be167ad4b3a7e91f7cc6abbe576d347b885af4/src/little/uboot/arch/riscv/cpu/k230/cpu.c#L82

Yangyu Chen (7):
  lib: sbi: Probe pmp_count in read-only
  lib: sbi: detect the number of PMP entries first
  lib: sbi: Probe reserved PMP regions before OpenSBI start
  lib: sbi: probe PMP allowed addr from first usable PMP
  lib: sbi: adjust first usable PMP index to sbi_hart_pmp_reserved
  lib: sbi: Not use smepmp if has pmp reserved and MSECCFG.MML=1
  lib: sbi: show the number of PMP Reserved

 include/sbi/sbi_hart.h |  4 +-
 lib/sbi/sbi_hart.c     | 87 +++++++++++++++++++++++++++++++-----------
 lib/sbi/sbi_init.c     |  2 +
 3 files changed, 69 insertions(+), 24 deletions(-)

-- 
2.43.0


