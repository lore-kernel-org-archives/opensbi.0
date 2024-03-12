From: Xiang W <wxjstz@126.com>
Date: Tue, 12 Mar 2024 16:24:58 +0800
Subject: [PATCH v3 0/2] Some updates about firmware
Message-ID: <20240312082504.499847-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v3 changes:
- Modified ASFLAGS and documentation description based on Jess' suggestion
- Add patch2 remove FW_TEXT_START/FW_JUMP_ADDR/FW_JUMP_FDT_ADDR/FW_PAYLOAD_FDT_ADDR
  based on Samuel's suggestion

Xiang W (2):
  firmware: remove copy-base relocation
  firmware: remove fixed address

 Makefile                           |   8 ++-
 README.md                          |   3 +-
 docs/firmware/fw.md                |   8 ---
 docs/firmware/fw_jump.md           |  39 ++---------
 docs/firmware/fw_payload.md        |  20 ++----
 docs/platform/generic.md           |  11 +---
 firmware/fw_base.S                 | 102 ++---------------------------
 firmware/fw_base.ldS               |   3 +-
 firmware/fw_jump.S                 |  20 ++----
 firmware/fw_payload.S              |   4 +-
 firmware/fw_payload.elf.ldS        |   2 +-
 firmware/objects.mk                |  24 -------
 firmware/payloads/test.elf.ldS     |   2 +-
 platform/fpga/ariane/objects.mk    |   9 ++-
 platform/fpga/openpiton/objects.mk |   9 ++-
 platform/generic/objects.mk        |   3 +-
 platform/kendryte/k210/objects.mk  |   1 -
 platform/nuclei/ux600/objects.mk   |   7 +-
 platform/template/objects.mk       |  19 +-----
 19 files changed, 46 insertions(+), 248 deletions(-)

-- 
2.43.0


