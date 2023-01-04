From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 4 Jan 2023 14:29:21 +0800
Subject: [PATCH 0/6] Implement hart hotplug using HSM extension for
Message-ID: <20230104062927.15628-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The folloing patches include implementing deep sleep for the offline
hart and some fixes, base on OpenSBI v1.2 and test with the CPU listed
below:

RV64:
* AX45MP quad-core
* AX45MP octa-core
* AX25MP quad-core

RV32:
* A45MP quad-core
* A25MP quad-core

Yu Chien Peter Lin (6):
  docs: generic.md: fix typo of andes-ae350
  lib: sbi_hsm: handle failure when hart_stop returns SBI_ENOTSUPP
  include: types: add always inline compiler attribute
  platform: andes/ae350: Implement hart hotplug using HSM extension
  lib: reset/fdt_reset_atcwdt200: use defined macros in atcsmu.h
  lib: sbi_hsm: Introduce hart_secondary_boot() callback

 docs/platform/generic.md                 |   2 +-
 include/sbi/sbi_hsm.h                    |  15 ++-
 include/sbi/sbi_types.h                  |   1 +
 lib/sbi/sbi_hsm.c                        |  29 ++---
 lib/utils/reset/fdt_reset_atcwdt200.c    |  12 +-
 platform/generic/andes/ae350.c           | 138 +++++++++++++++++++++++
 platform/generic/andes/objects.mk        |   2 +-
 platform/generic/andes/sleep.S           |  61 ++++++++++
 platform/generic/include/andes/andes45.h |  10 ++
 platform/generic/include/andes/atcsmu.h  |  44 ++++++++
 10 files changed, 289 insertions(+), 25 deletions(-)
 create mode 100644 platform/generic/andes/sleep.S
 create mode 100644 platform/generic/include/andes/andes45.h
 create mode 100644 platform/generic/include/andes/atcsmu.h

-- 
2.34.1


