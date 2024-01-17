From: Xiang W <wxjstz@126.com>
Date: Wed, 17 Jan 2024 18:41:57 +0800
Subject: [PATCH v3 00/10] Improvements to fw_base.S
Message-ID: <20240117104212.1055737-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v3 changes
- PATCH5-PATH10 added

v2 changes
- Put the previous two patches into a patch group
- PATCH3/PATCH4 added

Xiang W (10):
  firmware: fw_base.S: Improve loading u32
  firmware: fw_base.S: remove _runtime_offset
  firmware: fw_base.S: Simplify address get in _relocate
  firmware: fw_base.S: Simplify relocate
  firmware: fw_base.S: Move _link_start to .rodata section
  firmware: fw_base: Simplified setup trap handler
  firmware: fw_dynamic.S: Remove _bad_dynamic_info
  firmware: fw_base.S: Remove _relocate_lottery
  firmware: Use C if possible
  firmware: fw_base.S: Fix arguments passing

 firmware/fw_base.S     | 340 ++++++-----------------------------------
 firmware/fw_dynamic.S  |  10 +-
 include/sbi/sbi_init.h |   3 +
 lib/sbi/sbi_init.c     | 111 +++++++++++++-
 4 files changed, 163 insertions(+), 301 deletions(-)

-- 
2.43.0


