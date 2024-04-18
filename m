From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 18 Apr 2024 15:54:16 +0200
Subject: [RFC PATCH 0/4] lib: sbi: Add support for Smdbltrp and Ssdbltrp extensions
Message-ID: <20240418135421.1452709-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A double trap typically arises during a sensitive phase in trap handling
operations ? when an exception or interrupt occurs while the trap
handler (the component responsible for managing these events) is in a
non-reentrant state. This non-reentrancy usually occurs in the early
phase of trap handling, wherein the trap handler has not yet preserved
the necessary state to handle and resume from the trap. The occurrence
of such event is unlikely but can happen when dealing with hardware
errors.

This series adds support for Ssdbltrp as well as Smdbltrp [1]. This
series is based on top of the firmware feature implementation (SBI FWFT
extension).

Ssdbltrp can be tested using qemu[1], opensbi[2], linux[3] and
kvm-unit-tests[5]. Assuming you have a riscv environment available and
configured (CROSS_COMPILE), it can be built for riscv64 using the
following instructions:

Qemu:
  $ git clone https://github.com/rivosinc/qemu.git
  $ cd qemu
  $ git switch dev/cleger/dbltrp_rfc_v1
  $ mkdir build && cd build
  $ ../configure --target-list=riscv64-softmmu
  $ make

OpenSBI:
  $ git clone https://github.com/rivosinc/opensbi.git
  $ cd opensbi
  $ git switch dev/cleger/dbltrp_rfc_v1
  $ make O=build PLATFORM_RISCV_XLEN=64 PLATFORM=generic

Linux:
  $ git clone https://github.com/rivosinc/linux.git
  $ cd linux
  $ git switch dev/cleger/dbltrp_rfc_v1
  $ export ARCH=riscv
  $ make O=build defconfig
  $ ./script/config --file build/.config --enable RISCV_DBLTRP
  $ make O=build

kvm-unit-tests:
  $ git clone https://github.com/clementleger/kvm-unit-tests.git
  $ cd kvm-unit-tests
  $ git switch dev/cleger/dbltrp_rfc_v1
  $ ./configure --arch=riscv64 --cross-prefix=$CROSS_COMPILE
  $ make

You will also need kvmtool in your rootfs. One can build a buildroot
rootfs using the buildroot provided at [6] (which contains an update
of kvmtool with riscv support).

Run with kvm-unit-tests test as kernel:
  $ qemu-system-riscv64 \
    -M virt \
    -cpu rv64,x-ssdbltrp=true,x-smdbltrp=true \
    -nographic \
    -serial mon:stdio \
    -bios opensbi/build/platform/generic/firmware/fw_jump.bin \
    -kernel kvm-unit-tests-dbltrp/riscv/sbi_dbltrp.flat
  ...
  [OpenSBI boot partially elided]
  Boot HART ISA Extensions  : sscofpmf,sstc,zicntr,zihpm,zicboz,zicbom,sdtrig,svadu,ssdbltrp
  ...
  ##########################################################################
  #    kvm-unit-tests
  ##########################################################################

  PASS: sbi: fwft: FWFT extension probing no error
  PASS: sbi: fwft: FWFT extension is present
  PASS: sbi: fwft: dbltrp: Get double trap enable feature value
  PASS: sbi: fwft: dbltrp: Set double trap enable feature value == 0
  PASS: sbi: fwft: dbltrp: Get double trap enable feature value == 0
  PASS: sbi: fwft: dbltrp: Double trap disabled, trap first time ok
  PASS: sbi: fwft: dbltrp: Set double trap enable feature value == 1
  PASS: sbi: fwft: dbltrp: Get double trap enable feature value == 1
  PASS: sbi: fwft: dbltrp: Trapped twice allowed ok
  INFO: sbi: fwft: dbltrp: Should generate a double trap and crash !

  sbi_trap_error: hart0: trap0: double trap handler failed (error -10)

  sbi_trap_error: hart0: trap0: mcause=0x0000000000000010 mtval=0x0000000000000000
  sbi_trap_error: hart0: trap0: mtval2=0x0000000000000003 mtinst=0x0000000000000000
  sbi_trap_error: hart0: trap0: mepc=0x00000000802000d8 mstatus=0x8000000a01006900
  sbi_trap_error: hart0: trap0: ra=0x00000000802001fc sp=0x0000000080213e70
  sbi_trap_error: hart0: trap0: gp=0x0000000000000000 tp=0x0000000080088000
  sbi_trap_error: hart0: trap0: s0=0x0000000080213e80 s1=0x0000000000000001
  sbi_trap_error: hart0: trap0: a0=0x0000000080213e80 a1=0x0000000080208193
  sbi_trap_error: hart0: trap0: a2=0x000000008020dc20 a3=0x000000000000000f
  sbi_trap_error: hart0: trap0: a4=0x0000000080210cd8 a5=0x00000000802110d0
  sbi_trap_error: hart0: trap0: a6=0x00000000802136e4 a7=0x0000000046574654
  sbi_trap_error: hart0: trap0: s2=0x0000000080210cd9 s3=0x0000000000000000
  sbi_trap_error: hart0: trap0: s4=0x0000000000000000 s5=0x0000000000000000
  sbi_trap_error: hart0: trap0: s6=0x0000000000000000 s7=0x0000000000000001
  sbi_trap_error: hart0: trap0: s8=0x0000000000002000 s9=0x0000000080083700
  sbi_trap_error: hart0: trap0: s10=0x0000000000000000 s11=0x0000000000000000
  sbi_trap_error: hart0: trap0: t0=0x0000000000000000 t1=0x0000000080213ed8
  sbi_trap_error: hart0: trap0: t2=0x0000000000001000 t3=0x0000000080213ee0
  sbi_trap_error: hart0: trap0: t4=0x0000000000000000 t5=0x000000008020f8d0
  sbi_trap_error: hart0: trap0: t6=0x0000000000000000

Run with linux and kvm-unit-tests test in kvm (testing VS-mode):
  $ qemu-system-riscv64 \
    -M virt \
    -cpu rv64,x-ssdbltrp=true,x-smdbltrp=true \
    -nographic \
    -serial mon:stdio \
    -bios opensbi/build/platform/generic/firmware/fw_jump.bin \
    -kernel linux/build/arch/riscv/boot/Image
  ...
  [Linux boot partially elided]
  [    0.735079] riscv-dbltrp: Double trap handling registered
  ...

  $ lkvm run -k sbi_dbltrp.flat -m 128 -c 2
  ##########################################################################
  #    kvm-unit-tests
  ##########################################################################

  PASS: sbi: fwft: FWFT extension probing no error
  PASS: sbi: fwft: FWFT extension is present
  PASS: sbi: fwft: dbltrp: Get double trap enable feature value
  PASS: sbi: fwft: dbltrp: Set double trap enable feature value == 0
  PASS: sbi: fwft: dbltrp: Get double trap enable feature value == 0
  PASS: sbi: fwft: dbltrp: Double trap disabled, trap first time ok
  PASS: sbi: fwft: dbltrp: Set double trap enable feature value == 1
  PASS: sbi: fwft: dbltrp: Get double trap enable feature value == 1
  PASS: sbi: fwft: dbltrp: Trapped twice allowed ok
  INFO: sbi: fwft: dbltrp: Should generate a double trap and crash !
  [   51.939077] Guest double trap
  [   51.939323] kvm [93]: VCPU exit error -95
  [   51.939683] kvm [93]: SEPC=0x802000d8 SSTATUS=0x200004520 HSTATUS=0x200200180
  [   51.939947] kvm [93]: SCAUSE=0x10 STVAL=0x0 HTVAL=0x3 HTINST=0x0
  KVM_RUN failed: Operation not supported
  $

Link: https://github.com/riscv/riscv-double-trap/releases/download/v0.56/riscv-double-trap.pdf [1]
Link: https://github.com/rivosinc/qemu/tree/dev/cleger/dbltrp_rfc_v1 [2]
Link: https://github.com/rivosinc/opensbi/tree/dev/cleger/dbltrp_rfc_v1 [3]
Link: https://github.com/rivosinc/linux/tree/dev/cleger/dbltrp_rfc_v1 [4]
Link: https://github.com/clementleger/kvm-unit-tests/tree/dev/cleger/dbltrp_rfc_v1 [5]
Link: https://github.com/clementleger/buildroot/tree/dev/cleger/kvmtool [6]
---

Cl?ment L?ger (4):
  lib: sbi: factorize previous virtualization mode read from regs
  lib: riscv: add Ssdbltrp support
  lib: sbi: implement SBI_FWFT_DOUBLE_TRAP_ENABLE
  lib: sbi: add support for the Smdbltrp extension

 firmware/fw_base.S                | 29 +++++++++++++++--
 include/sbi/riscv_encoding.h      |  5 +++
 include/sbi/sbi_ecall_interface.h |  1 +
 include/sbi/sbi_hart.h            |  3 +-
 include/sbi/sbi_trap.h            |  9 ++++++
 include/sbi/sbi_trap_ldst.h       |  2 ++
 lib/sbi/objects.mk                |  1 +
 lib/sbi/sbi_double_trap.c         | 26 +++++++++++++++
 lib/sbi/sbi_emulate_csr.c         | 12 ++-----
 lib/sbi/sbi_fwft.c                | 53 ++++++++++++++++++++++++++++++-
 lib/sbi/sbi_hart.c                |  4 +++
 lib/sbi/sbi_sse.c                 |  1 +
 lib/sbi/sbi_trap.c                | 10 +++---
 13 files changed, 136 insertions(+), 20 deletions(-)
 create mode 100644 lib/sbi/sbi_double_trap.c

-- 
2.43.0


