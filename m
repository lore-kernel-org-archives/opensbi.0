From: Anup Patel <anup.patel@wdc.com>
Date: Sat, 10 Apr 2021 12:48:01 +0530
Subject: [PATCH 0/7] Protect M-mode only MMIO devices
Message-ID: <20210410071808.759856-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should protect the M-mode only MMIO devices (such as CLINT) using
the OpenSBI domain support. This can be easily achieved by having APIs
to allow platform support (and drivers) to add memregions for the root
domain.

This series extends OpenSBI domain support to protect M-mode only
devices.

These patches can be found in domain_root_region_v1 branch at:
https://github.com/avpatel/opensbi

Anup Patel (7):
  lib: sbi: Domains can be registered only before finalizing domains
  lib: sbi: Add sbi_domain_memregion_init() API
  lib: sbi: Add sbi_domain_root_add_memregion() API
  lib: utils/sys: Add CLINT memregion in the root domain
  lib: sbi: Make the root domain instance global variable
  lib: utils: Copy over restricted root domain memregions to FDT domains
  lib: sbi: Make sbi_domain_memregion_initfw() a local function

 include/sbi/sbi_domain.h   |  29 ++++++++-
 lib/sbi/sbi_domain.c       | 118 ++++++++++++++++++++++++++++++-------
 lib/utils/fdt/fdt_domain.c |  26 ++++++--
 lib/utils/sys/clint.c      |  17 +++++-
 4 files changed, 160 insertions(+), 30 deletions(-)

-- 
2.25.1


