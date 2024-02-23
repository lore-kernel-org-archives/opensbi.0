From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 23 Feb 2024 16:17:20 +0800
Subject: [PATCH v2 0/4] Add relocatable address support for jump and payload firmware
Message-ID: <IA1PR20MB495379ECC11096AEEBC4C691BB552@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If FW_PIC=y is defined, the jump and payload firmware and will
be broken if FW_TEXT_START is wrong. This is not the desired behavior.

Add some new variable to support relocatable address.

build command:
make BUILD_INFO=y DEBUG=1 FW_PIC=y PLATFORM=generic FW_TEXT_START=0x0

test command:
qemu-system-riscv64 -smp cpus=4 -M virt -m 256M \
  -bios build/platform/generic/firmware/fw_payload.bin

Changed from v1:
1. allow to use <X>_OFFSET when FW_PIC=n
2. fix wrong fw_next_address when using offset address.

Inochi Amaoto (4):
  firmware: Add relocatable FW_JUMP_ADDR and FW_JUMP_FDT_ADDR
  firmware: Add relocatable FW_PAYLOAD_FDT_ADDR
  platform: Apply relocatable address
  doc/firmware: add new configuration options for jump and payload
    firmware

 docs/firmware/fw_jump.md     | 17 ++++++++++++++---
 docs/firmware/fw_payload.md  |  6 ++++++
 firmware/fw_jump.S           | 18 ++++++++++++++----
 firmware/fw_payload.S        |  4 ++++
 firmware/objects.mk          |  9 +++++++++
 platform/generic/objects.mk  |  8 ++++----
 platform/template/objects.mk | 17 +++++++++++++++++
 7 files changed, 68 insertions(+), 11 deletions(-)

--
2.43.2


