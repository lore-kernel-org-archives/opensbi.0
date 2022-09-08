From: Kautuk Consul <kconsul@ventanamicro.com>
Date: Thu,  8 Sep 2022 14:12:37 +0530
Subject: [PATCH 0/2] Add semihosting support in opensbi
Message-ID: <20220908084239.3205866-1-kconsul@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Semihosting is a mechanism that enables code running on
a target to communicate and use the Input/Output
facilities on a host computer that is running a debugger.
This patchset adds support for semihosting in opensbi
for RISCV64 targets.

Kautuk Consul (2):
  include: types: add noinline macro
  lib: utils/serial: add semihosting support

 include/sbi/sbi_types.h                |   1 +
 include/sbi_utils/serial/semihosting.h |  47 +++++++
 lib/utils/serial/Kconfig               |   4 +
 lib/utils/serial/objects.mk            |   1 +
 lib/utils/serial/semihosting.c         | 176 +++++++++++++++++++++++++
 platform/generic/configs/defconfig     |   1 +
 platform/generic/platform.c            |  11 +-
 7 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi_utils/serial/semihosting.h
 create mode 100644 lib/utils/serial/semihosting.c

-- 
2.34.1


