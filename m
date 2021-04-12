From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 12 Apr 2021 17:46:10 +0530
Subject: [PATCH v2 0/7] Protect M-mode only MMIO devices
Message-ID: <20210412121617.933493-1-anup.patel@wdc.com>
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

These patches can be found in domain_root_region_v2 branch at:
https://github.com/avpatel/opensbi

Changes since v2:
 - Improved sbi_domain_root_add_memregion() API to merge consecutive
   memregions in PATCH3
 - Use updated sbi_domain_root_add_memregion() API in PATCH4 for CLINT

Anup Patel (7):
  lib: sbi: Domains can be registered only before finalizing domains
  lib: sbi: Add sbi_domain_memregion_init() API
  lib: sbi: Add sbi_domain_root_add_memregion() API
  lib: utils/sys: Add CLINT memregion in the root domain
  lib: sbi: Make the root domain instance global variable
  lib: utils: Copy over restricted root domain memregions to FDT domains
  lib: sbi: Make sbi_domain_memregion_initfw() a local function

 include/sbi/sbi_domain.h   |  26 ++++++-
 lib/sbi/sbi_domain.c       | 139 +++++++++++++++++++++++++++++++------
 lib/utils/fdt/fdt_domain.c |  26 +++++--
 lib/utils/sys/clint.c      |  29 +++++++-
 4 files changed, 190 insertions(+), 30 deletions(-)

-- 
2.25.1


