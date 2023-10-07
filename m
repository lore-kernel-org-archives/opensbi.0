From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat,  7 Oct 2023 11:05:51 +0800
Subject: [PATCH v3 0/4] platform: generic: add T-HEAD th1520 soc support
Message-ID: <IA1PR20MB49534E329372B295663B2153BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As the tlb workaround is fixed, now it is a time to add T-HEAD th1520 soc
PMU support.

We also move the tlb flush errata to a separate file, so the furthur
platform can reused it. e.g. the Sophgo sg2042.

Changed from v2:
1. fix for empty line error when patching.
2. add the missing ack.

Changed from v1:
1. rebase for the master.

Inochi Amaoto (4):
  platform: generic: thead: move to thead c9xx header to vendor specific
    postion
  platform: generic: thead: separate implement of T-HEAD c9xx pmu
  platform: generic: thead: separate implement of T-HEAD c9xx errata
  platform: generic: thead: initialize PMU by default in thead generic
    platform

 platform/generic/Kconfig                      |  4 ++
 platform/generic/allwinner/sun20i-d1.c        | 53 +-------------
 .../{thead_c9xx.h => thead/c9xx_encoding.h}   |  4 +-
 platform/generic/include/thead/c9xx_errata.h  | 13 ++++
 platform/generic/include/thead/c9xx_pmu.h     |  7 ++
 platform/generic/thead/Kconfig                |  9 +++
 platform/generic/thead/objects.mk             |  6 +-
 platform/generic/thead/thead-generic.c        | 41 ++++++-----
 .../thead/thead_c9xx_errata_tlb_flush.c       | 17 +++++
 platform/generic/thead/thead_c9xx_pmu.c       | 69 +++++++++++++++++++
 ...andler.S => thead_c9xx_tlb_trap_handler.S} |  0
 11 files changed, 151 insertions(+), 72 deletions(-)
 rename platform/generic/include/{thead_c9xx.h => thead/c9xx_encoding.h} (98%)
 create mode 100644 platform/generic/include/thead/c9xx_errata.h
 create mode 100644 platform/generic/include/thead/c9xx_pmu.h
 create mode 100644 platform/generic/thead/Kconfig
 create mode 100644 platform/generic/thead/thead_c9xx_errata_tlb_flush.c
 create mode 100644 platform/generic/thead/thead_c9xx_pmu.c
 rename platform/generic/thead/{thead-trap-handler.S => thead_c9xx_tlb_trap_handler.S} (100%)

--
2.42.0


