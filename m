From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 5 Dec 2022 10:03:56 +0800
Subject: [PATCH v2 0/4] Enable generic platform support for AE350
Message-ID: <20221205020400.28712-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fdt drivers used by AE350 are provided, we can use generic
platform sharing with other vendors and remove the duplicate code.
We also update the documentation of AE350 accordingly.

Yu Chien Peter Lin (4):
  platform: generic/andes: Enable generic platform support for AE350
  docs: platform: Update AE350 and generic platform documentation
  docs: andes-ae350.md: fix watchdog nodename in dts example
  scripts/create-binary-archive.sh: remove andes/ae350 build directory

 docs/platform/andes-ae350.md           |   7 +-
 docs/platform/generic.md               |   2 +
 platform/andes/ae350/Kconfig           |  34 -----
 platform/andes/ae350/cache.c           |  89 -------------
 platform/andes/ae350/cache.h           |  17 ---
 platform/andes/ae350/configs/defconfig |   0
 platform/andes/ae350/objects.mk        |  40 ------
 platform/andes/ae350/platform.c        | 169 -------------------------
 platform/andes/ae350/platform.h        | 109 ----------------
 platform/generic/Kconfig               |   4 +
 platform/generic/andes/ae350.c         |  21 +++
 platform/generic/andes/objects.mk      |   6 +
 platform/generic/configs/defconfig     |   4 +
 scripts/create-binary-archive.sh       |   1 -
 14 files changed, 41 insertions(+), 462 deletions(-)
 delete mode 100644 platform/andes/ae350/Kconfig
 delete mode 100644 platform/andes/ae350/cache.c
 delete mode 100644 platform/andes/ae350/cache.h
 delete mode 100644 platform/andes/ae350/configs/defconfig
 delete mode 100644 platform/andes/ae350/objects.mk
 delete mode 100644 platform/andes/ae350/platform.c
 delete mode 100644 platform/andes/ae350/platform.h
 create mode 100644 platform/generic/andes/ae350.c
 create mode 100644 platform/generic/andes/objects.mk

-- 
2.34.1


