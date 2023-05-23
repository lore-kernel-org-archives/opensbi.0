From: guoren@kernel.org <guoren@kernel.org>
Date: Tue, 23 May 2023 05:46:47 -0400
Subject: [RFC PATCH 0/2] lib: reset: thead: Correct dts naming convention
Message-ID: <20230523094649.4100554-1-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

Correct the naming convention to fit Linux kernel upstream rule.

Link: https://lore.kernel.org/linux-riscv/CAJF2gTRG5edPnVmhMtv67OANpOynL0br0wcrQCave88_KkyZcg at mail.gmail.com/

Guo Ren (2):
  lib: reset: thead: Remove unnecessary fence operations
  lib: reset: thead: Correct the naming convention of dts

 docs/platform/thead-c9xx.md           | 21 ++++------
 lib/utils/reset/fdt_reset_thead.c     | 58 +++++++++++++--------------
 lib/utils/reset/fdt_reset_thead_asm.S |  2 -
 3 files changed, 35 insertions(+), 46 deletions(-)

-- 
2.36.1


