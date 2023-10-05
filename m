From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu,  5 Oct 2023 14:57:44 +0800
Subject: [PATCH v2 0/4] platform: generic: add T-HEAD th1520 soc support
Message-ID: <IA1PR20MB4953287B7688E0F5058984BDBBCAA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As the tlb workaround is fixed, now it is a time to add T-HEAD th1520 soc
PMU support.

We also move the tlb flush errata to a separate file, so the furthur
platform can reused it. e.g. the Sophgo sg2042.

Changed from v1:
1. rebase for the master

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
 platform/generic/include/thead/c9xx_errata.h  | 14 ++++
 platform/generic/include/thead/c9xx_pmu.h     |  7 ++
 platform/generic/thead/Kconfig                |  9 +++
 platform/generic/thead/objects.mk             |  6 +-
 platform/generic/thead/thead-generic.c        | 41 ++++++-----
 .../thead/thead_c9xx_errata_tlb_flush.c       | 17 +++++
 platform/generic/thead/thead_c9xx_pmu.c       | 69 +++++++++++++++++++
 ...andler.S => thead_c9xx_tlb_trap_handler.S} |  0
 11 files changed, 152 insertions(+), 72 deletions(-)
 rename platform/generic/include/{thead_c9xx.h => thead/c9xx_encoding.h} (98%)
 create mode 100644 platform/generic/include/thead/c9xx_errata.h
 create mode 100644 platform/generic/include/thead/c9xx_pmu.h
 create mode 100644 platform/generic/thead/Kconfig
 create mode 100644 platform/generic/thead/thead_c9xx_errata_tlb_flush.c
 create mode 100644 platform/generic/thead/thead_c9xx_pmu.c
 rename platform/generic/thead/{thead-trap-handler.S => thead_c9xx_tlb_trap_handler.S} (100%)

--
2.42.0


