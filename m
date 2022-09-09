From: Kautuk Consul <kconsul@ventanamicro.com>
Date: Fri,  9 Sep 2022 11:43:02 +0530
Subject: [PATCH v2 0/1] Add semihosting support in opensbi
Message-ID: <20220909061303.3378980-1-kconsul@ventanamicro.com>
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

CHANGES since v1: 
-	drop patch1
-	use .align in inline assembly

Kautuk Consul (1):
  lib: utils/serial: add semihosting support

 include/sbi_utils/serial/semihosting.h |  47 +++++++
 lib/utils/serial/Kconfig               |   4 +
 lib/utils/serial/objects.mk            |   1 +
 lib/utils/serial/semihosting.c         | 175 +++++++++++++++++++++++++
 platform/generic/configs/defconfig     |   1 +
 platform/generic/platform.c            |  11 +-
 6 files changed, 238 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi_utils/serial/semihosting.h
 create mode 100644 lib/utils/serial/semihosting.c

-- 
2.34.1


