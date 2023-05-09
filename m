From: Xiang W <wxjstz@126.com>
Date: Tue,  9 May 2023 22:47:31 +0800
Subject: [PATCH 0/4] Miscellaneous
Message-ID: <20230509144735.72059-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Xiang W (4):
  lib: sbi: Fix the hang condition of console init
  lib: utils: Improve fdt_serial_init
  lib: utils: Improve fdt_ipi
  lib: utils: Improve fdt_timer

 lib/sbi/sbi_init.c            |  2 +-
 lib/utils/ipi/fdt_ipi.c       | 19 ++++----------
 lib/utils/serial/fdt_serial.c | 48 +++++++++++++----------------------
 lib/utils/timer/fdt_timer.c   | 19 ++++----------
 4 files changed, 28 insertions(+), 60 deletions(-)

-- 
2.39.2


