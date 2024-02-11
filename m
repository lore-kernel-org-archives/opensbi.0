From: Xiang W <wxjstz@126.com>
Date: Mon, 12 Feb 2024 00:11:24 +0800
Subject: [PATCH v4 0/8] Improvements to fw_base.S
Message-ID: <20240211161138.2538981-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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
 firmware/fw_base.S      | 369 ++--------------------------------------
 firmware/fw_dynamic.S   |  55 +++---
 firmware/fw_jump.S      |  31 ++--
 firmware/fw_payload.S   |  31 ++--
 firmware/objects.mk     |  13 +-
 include/sbi/sbi_types.h |   1 +
 10 files changed, 182 insertions(+), 448 deletions(-)
 create mode 100644 firmware/fw.c

-- 
2.43.0


