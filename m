From: Xiang W <wxjstz@126.com>
Date: Mon, 22 May 2023 13:10:25 +0800
Subject: [PATCH v2 0/4] Miscellaneous
Message-ID: <20230522051029.1061225-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v2 changes:
PATCH1: Move error check in sbi_console_init
PATCH3: return error when drv->cold_init == NULL.
	Device does not exist returns 0.
PATCH4: return error when drv->cold_init == NULL.
	Device does not exist returns 0.

Xiang W (4):
  lib: sbi: Fix return of sbi_console_init
  lib: utils: Improve fdt_serial_init
  lib: utils: Improve fdt_ipi
  lib: utils: Improve fdt_timer

 lib/sbi/sbi_console.c         |  8 +++++-
 lib/utils/ipi/fdt_ipi.c       | 36 +++++++++++---------------
 lib/utils/serial/fdt_serial.c | 48 +++++++++++++----------------------
 lib/utils/timer/fdt_timer.c   | 36 +++++++++++---------------
 4 files changed, 54 insertions(+), 74 deletions(-)

-- 
2.39.2


