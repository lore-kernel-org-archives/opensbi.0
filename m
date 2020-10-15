From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 15 Oct 2020 13:42:06 +0530
Subject: [PATCH 0/5] Builtin DTB improvements
Message-ID: <20201015081211.1956554-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series is largely inspired from previous patch:
https://patchwork.ozlabs.org/project/opensbi/patch/20201001102836.15622-1-xypron.glpk at gmx.de/

Overall, this series:
1. Adds common FW_FDT_PATH compile-time option which replaces the
   FW_PAYLOAD_FDT_PATH compile-time option
2. Extends d2c.sh for padding zeros to built-in DTB whenever required
3. Adds some room in Kendryte/K210 built-in DTB using #2 above

Anup Patel (4):
  Makefile: Build ELF, BIN and LD script in platform build directory
  firmware: Add common FW_FDT_PATH compile-time option
  firmware: Remove FW_PAYLOAD_FDT_PATH compile-time option
  platform: kendryte/k210: Add some padding for FDT fixups

Heinrich Schuchardt (1):
  Makefile: Allow padding zeros when converting DTB to C source

 Makefile                          | 25 ++++++++++++++-----------
 docs/firmware/fw.md               | 14 +++++++++-----
 docs/firmware/fw_payload.md       |  9 ++-------
 docs/platform/andes-ae350.md      |  4 ++--
 docs/platform/shakti_cclass.md    |  4 ++--
 docs/platform/sifive_fu540.md     |  6 +++---
 firmware/external_deps.mk         |  5 ++++-
 firmware/fw_base.S                | 21 ++++++++++++++-------
 firmware/fw_dynamic.S             | 13 -------------
 firmware/fw_jump.S                | 13 -------------
 firmware/fw_payload.S             | 25 -------------------------
 firmware/objects.mk               | 10 +++++++---
 platform/kendryte/k210/objects.mk |  1 +
 platform/template/config.mk       |  4 +++-
 scripts/d2c.sh                    |  9 ++++++++-
 15 files changed, 69 insertions(+), 94 deletions(-)

-- 
2.25.1


