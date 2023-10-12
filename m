From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 12 Oct 2023 17:00:24 +0800
Subject: [PATCH 0/3] lib: utils: Add T-HEAD C900 ACLINT
Message-ID: <IA1PR20MB495316CD19B4976D3BF5AA8BBBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add T-HEAD C900 ACLINT driver for sg2042

The timer quirks need the following patch to parse thead mtime:
lib: utils/fdt: Allow zero length mtime when parsing ACLINT

Link: https://lore.kernel.org/linux-riscv/6e48cbe5e60f9ada2fd1fe58e803e127f1a678e5.1696433229.git.unicorn_wang at outlook.com/
Link: https://lore.kernel.org/linux-riscv/1f6b82a1864477a51db33d3f295889ff985b497b.1696433229.git.unicorn_wang at outlook.com/

Changed from sg2042 v2:
1. Allow ACLINT has its own quirks
2. add new quirks for thead,c900-aclint-mtimer

This patch is moved from the patch series of supporting sg2042 as it
became complex.
The original patch: platform: generic: Add Sophgo sg2042 support

Inochi Amaoto (3):
  lib: utils/timer: Allow ACLINT MTIMER driver to setup quirks
  lib: utils/timer: mtimer: add separate T-Head C9xx CLINT mtimer
    compatible
  lib: utils/ipi: mswi: add separate T-Head C9xx CLINT mswi compatible

 lib/utils/ipi/fdt_ipi_mswi.c       |  1 +
 lib/utils/timer/fdt_timer_mtimer.c | 23 ++++++++++++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

--
2.42.0


