From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat,  7 Oct 2023 10:55:37 +0800
Subject: [PATCH 0/3] platform: generic Add Sophgo sg2042 support
Message-ID: <IA1PR20MB49531BBE4BAA82B82316FFC1BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As the dts of sg2042 in the mainline kernel is considered as stable, it is
time to port sg2042 soc.

This patch depends other two series:
1. platform: generic: add T-HEAD th1520 soc support
2. lib: sbi: Add sub-regions check for sanitizing domain

Link: https://lore.kernel.org/linux-riscv/cover.1696433229.git.unicorn_wang at outlook.com/

Inochi Amaoto (3):
  lib: utils/timer: mtimer: add separate T-Head C9xx CLINT mtimer
    compatible
  lib: utils/ipi: mswi: add separate T-Head C9xx CLINT mswi compatible
  platform: generic: Add Sophgo sg2042 soc support

 lib/utils/ipi/fdt_ipi_mswi.c       |  1 +
 lib/utils/timer/fdt_timer_mtimer.c |  2 +
 platform/generic/Kconfig           |  6 +++
 platform/generic/configs/defconfig |  1 +
 platform/generic/sophgo/objects.mk |  9 ++++
 platform/generic/sophgo/sg2042.c   | 71 ++++++++++++++++++++++++++++++
 6 files changed, 90 insertions(+)
 create mode 100644 platform/generic/sophgo/objects.mk
 create mode 100644 platform/generic/sophgo/sg2042.c

--
2.42.0


