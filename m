From: Xiang W <wxjstz@126.com>
Date: Tue, 11 Jun 2024 19:19:27 +0800
Subject: [PATCH 0/7] Fix someting about dt match
Message-ID: <20240611111937.1459876-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix the following issues:
1. Check whether the dt node is enabled when the device is initialized.
2. When there are multiple nodes, each node needs to be checked until
   the initialization is completed

Xiang W (7):
  lib: utils/ipi: Skip initialize ipi when dt is not enabled
  lib: utils/timer: Skip initialize timer when dt is not enabled
  lib: utils/irqchip: Skip initialize irqchip when dt is not enabled
  lib: utils/serial: Skip initialize serial when dt is not enabled
  lib: utils/serial: Fix fdt_serial to match more dt nodes
  lib: utils/reset:  Skip initialize reset when dt is not enabled
  lib: utils/reset: Fix fdt_reset to search for more dt nodes

 lib/utils/ipi/fdt_ipi.c         |  3 +++
 lib/utils/irqchip/fdt_irqchip.c |  3 +++
 lib/utils/reset/fdt_reset.c     | 21 ++++++++++++---------
 lib/utils/serial/fdt_serial.c   | 27 +++++++++++++++++----------
 lib/utils/timer/fdt_timer.c     |  3 +++
 5 files changed, 38 insertions(+), 19 deletions(-)

-- 
2.43.0


