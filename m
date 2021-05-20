From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 20 May 2021 21:29:10 +0530
Subject: [PATCH 0/2] Few misc fixes
Message-ID: <20210520155912.1336836-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds few fixes which were discovered while adding ACLINT
support in OpenSBI.

These patches can be found in misc_fixes_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (2):
  lib: Check region base for merging in sbi_domain_root_add_memregion()
  lib: utils: Try other FDT drivers when we see SBI_ENODEV

 lib/sbi/sbi_domain.c            | 3 ++-
 lib/utils/ipi/fdt_ipi.c         | 3 +++
 lib/utils/irqchip/fdt_irqchip.c | 3 +++
 lib/utils/reset/fdt_reset.c     | 3 +++
 lib/utils/serial/fdt_serial.c   | 5 +++++
 lib/utils/timer/fdt_timer.c     | 3 +++
 6 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.25.1


