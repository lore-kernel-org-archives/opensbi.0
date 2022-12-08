From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Thu,  8 Dec 2022 02:14:18 +0100
Subject: [PATCH v2 0/3] lib: fix fdt functions
Message-ID: <20221208011421.11624-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix library device-tree library functions.

The problems were indicated by Coverity. Details can be seen at
https://scan.coverity.com/projects/opensbi/view_defects

v2:
	change logical constraints

Heinrich Schuchardt (3):
  lib: fix is_region_valid()
  lib: fix __fdt_parse_region()
  lib: fix irqchip_plic_update_hartid_table

 lib/sbi/sbi_domain.c                 | 9 +++++----
 lib/utils/fdt/fdt_domain.c           | 4 ++--
 lib/utils/irqchip/fdt_irqchip_plic.c | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.37.2


