From: Xiang W <wxjstz@126.com>
Date: Mon,  4 Mar 2024 20:15:47 +0800
Subject: [PATCH v6 0/5] Improvements to fw_base.S
Message-ID: <20240304121557.502655-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v6 changes:
- drop patch1 firmware: remove copy-base relocation
- drop patch7 firmware: Improve fw_boot_hart
- drop patch8 firmware: Use C if possible
- rebase code

Xiang W (5):
  firmware: fw_base.S: Simplify address get
  firmware: fw_base: Simplified setup trap handler
  firmware: fw_dynamic.S: Remove _bad_dynamic_info
  firmware: fw_base.S: Remove _relocate_lottery
  firmware: fw_base.S: fix _reset_regs

 firmware/fw_base.S    | 85 ++++++++++++-------------------------------
 firmware/fw_dynamic.S | 10 +----
 2 files changed, 26 insertions(+), 69 deletions(-)

-- 
2.43.0


