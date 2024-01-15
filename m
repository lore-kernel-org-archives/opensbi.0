From: Xiang W <wxjstz@126.com>
Date: Mon, 15 Jan 2024 23:19:16 +0800
Subject: [PATCH v2 0/4] Improvements to fw_base.S
Message-ID: <20240115151930.392299-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v2 changes
- Put the previous two patches into a patch group
- PATCH3/PATCH4 added

Xiang W (4):
  firmware: fw_base.S: Improve loading u32
  firmware: fw_base.S: remove _runtime_offset
  firmware: fw_base.S: Simplify address get in _relocate
  firmware: fw_base.S: Simplify relocate

 firmware/fw_base.S | 66 +++++++++++++---------------------------------
 1 file changed, 18 insertions(+), 48 deletions(-)

-- 
2.43.0


