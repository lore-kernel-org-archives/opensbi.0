From: Vivian Wang <dramforever@live.com>
Date: Sat, 16 Mar 2024 01:34:48 +0800
Subject: [RFC PATCH 0/2] Add support for Linux kernel image header
Message-ID: <TYYP286MB1439244707DDDB3B2734D67AC6282@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It is very convenient to use M-mode U-Boot during development to load M-mode
software for testing. This series makes it easy to load OpenSBI and an S-mode
operating system while passing it an initramfs, an FDT, and a command line from
U-Boot with the existing "booti" command. Any other bootloader supporting
M-mode Linux should work analogously.

To achieve this, a header compatible with that of Linux is added at the
beginning of fw_payload and fw_jump. Since the header starts with a jump to the
actual start of code, this is not a problem if no such bootloader is used. A
config option is also added so users can opt out of this header.

Patch 1 makes the byteorder macros available in assembly code so that patch 2
can use them.

To test this, you will need:

- QEMU (qemu-system-riscv64), tested with 8.1.3
- M-mode U-Boot with config qemu-riscv64_defconfig (u-boot.bin), tested with
  version 2023.07.02
- Linux for riscv64 (Image)
- An initramfs image for testing (init.cpio)

Some assumptions are made about the memory layout used by QEMU.

Build OpenSBI:

  make PLATFORM=generic FW_PAYLOAD_PATH=Image

Firstly, test that the firmware images still work as before:

  qemu-system-riscv64 -M virt -smp 2 -m 1G -nographic \
    -bios fw_payload.bin

This one should eventually panic at "VFS: Unable to mount root fs on
unknown-block(0,0)" because it does not have an initramfs.

  qemu-system-riscv64 -M virt -smp 2 -m 1G -nographic \
    -bios fw_jump.bin \
    -kernel Image \
    -initrd init.cpio \
    -append "earlycon"

This one should work just fine.

Then, test that the firmwares are now loadable by U-Boot:

  qemu-system-riscv64 -M virt -smp 2 -m 1G -nographic \
    -bios u-boot.bin \
    -device loader,addr=0x90000000,file=fw_payload.bin \
    -device loader,addr=0xa0000000,file=init.cpio

  qemu-system-riscv64 -M virt -smp 2 -m 1G -nographic \
    -bios u-boot.bin \
    -device loader,addr=0x80200000,file=Image \
    -device loader,addr=0x90000000,file=fw_jump.bin \
    -device loader,addr=0xa0000000,file=init.cpio

Run these command in U-Boot, making changes as needed:

  => fdt addr -c
  Control fdt: bf730af0

  => # Change source address to match control fdt
  => fdt move bf730af0 b0000000
  Working FDT set to b0000000

  => setenv bootargs "earlycon"

  => # Change initramfs size to match actual size
  => booti 0x90000000 0xa0000000:0x12d400 0xb0000000

Once in Linux:

  $ cat /proc/cmdline # Check that the kernel command line is correct
  $ cat /proc/cpuinfo # Check that SMP boot works

Vivian Wang (2):
  include: sbi: Support byteorder macros in assembly
  firmware: Add support for Linux kernel image header

 firmware/Kconfig                   | 17 +++++++++
 firmware/fw_base.ldS               |  5 +++
 firmware/fw_header_linux.S         | 34 ++++++++++++++++++
 firmware/fw_jump.S                 |  1 +
 firmware/fw_payload.S              |  1 +
 include/sbi/sbi_byteorder.h        | 55 ++++++++++++++++--------------
 platform/generic/configs/defconfig |  1 +
 7 files changed, 89 insertions(+), 25 deletions(-)
 create mode 100644 firmware/fw_header_linux.S

--
2.42.0


