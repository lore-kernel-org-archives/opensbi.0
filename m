From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 23 May 2023 14:36:00 +0800
Subject: [PATCH 0/3] platform: generic: add T-HEAD th1520 soc support
Message-ID: <IA1PR20MB4953CE93694010974A762343BB409@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The th1520 is a new 4-core c910 soc from T-HEAD. This soc is already
supported by the mainline sbi with no pmu support. So this patch adds
pmu support for the T-HEAD th1520.

Inochi Amaoto (3):
  platform: generic: thead: move to thead c9xx header to vendor specific
    postion
  platform: generic: thead: separate implement of thead c9xx pmu
  platform: generic: thead: add pmu detection for th1520

 platform/generic/Kconfig                      |  8 +++
 platform/generic/allwinner/sun20i-d1.c        | 46 +---------------
 platform/generic/configs/defconfig            |  1 +
 .../{thead_c9xx.h => thead/c9xx_encoding.h}   |  4 +-
 platform/generic/include/thead/c9xx_pmu.h     | 16 ++++++
 platform/generic/thead/Kconfig                |  5 ++
 platform/generic/thead/c9xx_pmu.c             | 54 +++++++++++++++++++
 platform/generic/thead/objects.mk             |  8 +++
 platform/generic/thead/th1520.c               | 34 ++++++++++++
 9 files changed, 130 insertions(+), 46 deletions(-)
 rename platform/generic/include/{thead_c9xx.h => thead/c9xx_encoding.h} (98%)
 create mode 100644 platform/generic/include/thead/c9xx_pmu.h
 create mode 100644 platform/generic/thead/Kconfig
 create mode 100644 platform/generic/thead/c9xx_pmu.c
 create mode 100644 platform/generic/thead/objects.mk
 create mode 100644 platform/generic/thead/th1520.c

-- 
2.40.1


