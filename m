From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 18 Jan 2023 10:18:53 +0800
Subject: [PATCH v2 0/6] Implement hart hotplug using HSM extension for AE350
Message-ID: <20230118021859.27010-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The following patches include implementing hotplug with ATCSMU deep sleep mode
using HSM extension, introduce ATCSMU system device and some fixes, base on
OpenSBI v1.2 and test on AE350 platform with the CPU listed below:

RV64:
* AX45MP quad-core
* AX45MP octa-core
* AX25MP quad-core

RV32:
* A45MP quad-core
* A25MP quad-core

Changes v1 -> v2:
* Drop patch for adding secondary_boot callback
* Add a PATCH4 to move ATCSMU related code to lib/utils/sys
* Include RB tags

Yu Chien Peter Lin (6):
  docs: generic.md: fix typo of andes-ae350
  lib: sbi_hsm: handle failure when hart_stop returns SBI_ENOTSUPP
  include: types: add always inline compiler attribute
  lib: utils: atcsmu: Add Andes System Management Unit support
  platform: andes/ae350: Implement hart hotplug using HSM extension
  lib: reset/fdt_reset_atcwdt200: Use defined macros and function in
    atcsmu.h

 docs/platform/generic.md                 |  2 +-
 include/sbi/sbi_hsm.h                    |  8 ++-
 include/sbi/sbi_types.h                  |  1 +
 include/sbi_utils/sys/atcsmu.h           | 63 ++++++++++++++++++
 lib/sbi/sbi_hsm.c                        |  7 +-
 lib/utils/reset/fdt_reset_atcwdt200.c    | 13 +---
 lib/utils/sys/Kconfig                    |  4 ++
 lib/utils/sys/atcsmu.c                   | 60 +++++++++++++++++
 lib/utils/sys/objects.mk                 |  1 +
 platform/generic/Kconfig                 |  1 +
 platform/generic/andes/ae350.c           | 84 ++++++++++++++++++++++++
 platform/generic/andes/objects.mk        |  2 +-
 platform/generic/andes/sleep.S           | 70 ++++++++++++++++++++
 platform/generic/include/andes/andes45.h | 10 +++
 14 files changed, 308 insertions(+), 18 deletions(-)
 create mode 100644 include/sbi_utils/sys/atcsmu.h
 create mode 100644 lib/utils/sys/atcsmu.c
 create mode 100644 platform/generic/andes/sleep.S
 create mode 100644 platform/generic/include/andes/andes45.h

-- 
2.34.1


