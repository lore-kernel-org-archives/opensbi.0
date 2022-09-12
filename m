From: Kautuk Consul <kconsul@ventanamicro.com>
Date: Mon, 12 Sep 2022 16:22:52 +0530
Subject: [PATCH v3 0/1] Add semihosting support in opensbi
Message-ID: <20220912105253.2342504-1-kconsul@ventanamicro.com>
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

CHANGES since v2: 
-	return -1 from semihosting_getc in case of read character
	failure from semihosting console.
-	rename infd to semihosting_infd.

Kautuk Consul (1):
  lib: utils/serial: add semihosting support

 include/sbi_utils/serial/semihosting.h |  47 +++++++
 lib/utils/serial/Kconfig               |   4 +
 lib/utils/serial/objects.mk            |   1 +
 lib/utils/serial/semihosting.c         | 177 +++++++++++++++++++++++++
 platform/generic/configs/defconfig     |   1 +
 platform/generic/platform.c            |  11 +-
 6 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi_utils/serial/semihosting.h
 create mode 100644 lib/utils/serial/semihosting.c

-- 
2.34.1


