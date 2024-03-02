From: Xiang W <wxjstz@126.com>
Date: Sat,  2 Mar 2024 15:42:19 +0800
Subject: [PATCH v5 0/8] Improvements to fw_base.S
Message-ID: <20240302074235.12643-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v5 changes:
- PATCH5: Replace amoadd with amoswap to avoid incorrect values in _boot_status

v4 changes:
- add patch2/patch6/patch7
- add patch1 according to anup suggestion
- update patch5 according to anup suggestion
- move fw_coldboot_init out of libsbi.a

Xiang W (8):
  firmware: remove copy-base relocation
  firmware: fw_base.S: Simplify address get
  firmware: fw_base: Simplified setup trap handler
  firmware: fw_dynamic.S: Remove _bad_dynamic_info
  firmware: fw_base.S: Remove _relocate_lottery
  firmware: fw_base.S: fix _reset_regs
  firmware: Improve fw_boot_hart
  firmware: Use C if possible

 Makefile                |  18 +-
 README.md               |   5 -
 docs/firmware/fw.md     |   6 -
 firmware/fw.c           | 101 +++++++++++
 firmware/fw_base.S      | 371 ++--------------------------------------
 firmware/fw_dynamic.S   |  55 +++---
 firmware/fw_jump.S      |  31 ++--
 firmware/fw_payload.S   |  31 ++--
 firmware/objects.mk     |  13 +-
 include/sbi/sbi_types.h |   1 +
 10 files changed, 183 insertions(+), 449 deletions(-)
 create mode 100644 firmware/fw.c

-- 
2.43.0


