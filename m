From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 31 Jul 2022 10:26:52 +0530
Subject: [PATCH v4 14/15] platform: Remove redundant config.mk from all platforms
In-Reply-To: <20220731045653.165058-1-apatel@ventanamicro.com>
References: <20220731045653.165058-1-apatel@ventanamicro.com>
Message-ID: <20220731045653.165058-15-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The options defined in config.mk can be specified in objects.mk of each
platform so let us remove config.mk from all platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Makefile                           |  4 +-
 platform/andes/ae350/config.mk     | 36 --------------
 platform/andes/ae350/objects.mk    | 29 +++++++++++
 platform/fpga/ariane/config.mk     | 36 --------------
 platform/fpga/ariane/objects.mk    | 35 ++++++++++++++
 platform/fpga/openpiton/config.mk  | 35 --------------
 platform/fpga/openpiton/objects.mk | 35 ++++++++++++++
 platform/generic/config.mk         | 40 ----------------
 platform/generic/objects.mk        | 33 +++++++++++++
 platform/kendryte/k210/config.mk   | 19 --------
 platform/kendryte/k210/objects.mk  | 12 +++++
 platform/nuclei/ux600/config.mk    | 30 ------------
 platform/nuclei/ux600/objects.mk   | 22 +++++++++
 platform/template/config.mk        | 77 ------------------------------
 platform/template/objects.mk       | 72 ++++++++++++++++++++++++++++
 platform/template/platform.c       |  2 +-
 16 files changed, 240 insertions(+), 277 deletions(-)
 delete mode 100644 platform/andes/ae350/config.mk
 delete mode 100644 platform/fpga/ariane/config.mk
 delete mode 100644 platform/fpga/openpiton/config.mk
 delete mode 100644 platform/generic/config.mk
 delete mode 100644 platform/kendryte/k210/config.mk
 delete mode 100644 platform/nuclei/ux600/config.mk
 delete mode 100644 platform/template/config.mk

diff --git a/Makefile b/Makefile
index 820a137..e6406a8 100644
--- a/Makefile
+++ b/Makefile
@@ -204,7 +204,7 @@ firmware-object-mks=$(shell if [ -d $(firmware_dir) ]; then find $(firmware_dir)
 .PHONY: all
 all:
 
-# Include platform specific .config and config.mk
+# Include platform specific .config
 ifdef PLATFORM
 .PHONY: menuconfig
 menuconfig: $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
@@ -228,8 +228,6 @@ $(KCONFIG_AUTOCMD): $(KCONFIG_CONFIG)
 
 include $(KCONFIG_CONFIG)
 include $(KCONFIG_AUTOCMD)
-
-include $(platform_src_dir)/config.mk
 endif
 
 # Include all object.mk files
diff --git a/platform/andes/ae350/config.mk b/platform/andes/ae350/config.mk
deleted file mode 100644
index f555ef5..0000000
--- a/platform/andes/ae350/config.mk
+++ /dev/null
@@ -1,36 +0,0 @@
-#
-# SPDX-License-Identifier: BSD-2-Clause
-#
-# Copyright (c) 2019 Andes Technology Corporation
-#
-# Authors:
-#   Zong Li <zong@andestech.com>
-#   Nylon Chen <nylon7@andestech.com>
-
-# Compiler flags
-platform-cppflags-y =
-platform-cflags-y =
-platform-asflags-y =
-platform-ldflags-y =
-
-# Blobs to build
-FW_TEXT_START=0x00000000
-
-FW_DYNAMIC=y
-
-FW_JUMP=y
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
-  FW_JUMP_ADDR=0x400000
-else
-  FW_JUMP_ADDR=0x200000
-endif
-FW_JUMP_FDT_ADDR=0x2000000
-
-FW_PAYLOAD=y
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
-  FW_PAYLOAD_OFFSET=0x400000
-else
-  FW_PAYLOAD_OFFSET=0x200000
-endif
-
-FW_PAYLOAD_FDT_ADDR=0x2000000
diff --git a/platform/andes/ae350/objects.mk b/platform/andes/ae350/objects.mk
index 5369677..80f0737 100644
--- a/platform/andes/ae350/objects.mk
+++ b/platform/andes/ae350/objects.mk
@@ -8,4 +8,33 @@
 #   Nylon Chen <nylon7@andestech.com>
 #
 
+# Compiler flags
+platform-cppflags-y =
+platform-cflags-y =
+platform-asflags-y =
+platform-ldflags-y =
+
+# Objects to build
 platform-objs-y += cache.o platform.o plicsw.o plmt.o
+
+# Blobs to build
+FW_TEXT_START=0x00000000
+
+FW_DYNAMIC=y
+
+FW_JUMP=y
+ifeq ($(PLATFORM_RISCV_XLEN), 32)
+  FW_JUMP_ADDR=0x400000
+else
+  FW_JUMP_ADDR=0x200000
+endif
+FW_JUMP_FDT_ADDR=0x2000000
+
+FW_PAYLOAD=y
+ifeq ($(PLATFORM_RISCV_XLEN), 32)
+  FW_PAYLOAD_OFFSET=0x400000
+else
+  FW_PAYLOAD_OFFSET=0x200000
+endif
+
+FW_PAYLOAD_FDT_ADDR=0x2000000
diff --git a/platform/fpga/ariane/config.mk b/platform/fpga/ariane/config.mk
deleted file mode 100644
index 3556461..0000000
--- a/platform/fpga/ariane/config.mk
+++ /dev/null
@@ -1,36 +0,0 @@
-#
-# SPDX-License-Identifier: BSD-2-Clause
-#
-# Copyright (C) 2019 FORTH-ICS/CARV
-#		Panagiotis Peristerakis <perister@ics.forth.gr>
-#
-
-#for more infos, check out /platform/template/config.mk
-
-PLATFORM_RISCV_XLEN = 64
-
-# Blobs to build
-FW_TEXT_START=0x80000000
-FW_JUMP=n
-
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
- # This needs to be 4MB aligned for 32-bit support
- FW_JUMP_ADDR=0x80400000
- else
- # This needs to be 2MB aligned for 64-bit support
- FW_JUMP_ADDR=0x80200000
- endif
-FW_JUMP_FDT_ADDR=0x82200000
-
-# Firmware with payload configuration.
-FW_PAYLOAD=y
-
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
-# This needs to be 4MB aligned for 32-bit support
-  FW_PAYLOAD_OFFSET=0x400000
-else
-# This needs to be 2MB aligned for 64-bit support
-  FW_PAYLOAD_OFFSET=0x200000
-endif
-FW_PAYLOAD_FDT_ADDR=0x82200000
-FW_PAYLOAD_ALIGN=0x1000
diff --git a/platform/fpga/ariane/objects.mk b/platform/fpga/ariane/objects.mk
index 814e6da..83581ac 100644
--- a/platform/fpga/ariane/objects.mk
+++ b/platform/fpga/ariane/objects.mk
@@ -5,4 +5,39 @@
 #		Panagiotis Peristerakis <perister@ics.forth.gr>
 #
 
+# Compiler flags
+platform-cppflags-y =
+platform-cflags-y =
+platform-asflags-y =
+platform-ldflags-y =
+
+# Object to build
 platform-objs-y += platform.o
+
+PLATFORM_RISCV_XLEN = 64
+
+# Blobs to build
+FW_TEXT_START=0x80000000
+FW_JUMP=n
+
+ifeq ($(PLATFORM_RISCV_XLEN), 32)
+ # This needs to be 4MB aligned for 32-bit support
+ FW_JUMP_ADDR=0x80400000
+ else
+ # This needs to be 2MB aligned for 64-bit support
+ FW_JUMP_ADDR=0x80200000
+ endif
+FW_JUMP_FDT_ADDR=0x82200000
+
+# Firmware with payload configuration.
+FW_PAYLOAD=y
+
+ifeq ($(PLATFORM_RISCV_XLEN), 32)
+# This needs to be 4MB aligned for 32-bit support
+  FW_PAYLOAD_OFFSET=0x400000
+else
+# This needs to be 2MB aligned for 64-bit support
+  FW_PAYLOAD_OFFSET=0x200000
+endif
+FW_PAYLOAD_FDT_ADDR=0x82200000
+FW_PAYLOAD_ALIGN=0x1000
diff --git a/platform/fpga/openpiton/config.mk b/platform/fpga/openpiton/config.mk
deleted file mode 100644
index a969b25..0000000
--- a/platform/fpga/openpiton/config.mk
+++ /dev/null
@@ -1,35 +0,0 @@
-#
-# SPDX-License-Identifier: BSD-2-Clause
-#
-# Copyright (c) 2020 Western Digital Corporation or its affiliates.
-#
-
-#for more infos, check out /platform/template/config.mk
-
-PLATFORM_RISCV_XLEN = 64
-
-# Blobs to build
-FW_TEXT_START=0x80000000
-FW_JUMP=n
-
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
- # This needs to be 4MB aligned for 32-bit support
- FW_JUMP_ADDR=0x80400000
- else
- # This needs to be 2MB aligned for 64-bit support
- FW_JUMP_ADDR=0x80200000
- endif
-FW_JUMP_FDT_ADDR=0x82200000
-
-# Firmware with payload configuration.
-FW_PAYLOAD=y
-
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
-# This needs to be 4MB aligned for 32-bit support
-  FW_PAYLOAD_OFFSET=0x400000
-else
-# This needs to be 2MB aligned for 64-bit support
-  FW_PAYLOAD_OFFSET=0x200000
-endif
-FW_PAYLOAD_FDT_ADDR=0x82200000
-FW_PAYLOAD_ALIGN=0x1000
diff --git a/platform/fpga/openpiton/objects.mk b/platform/fpga/openpiton/objects.mk
index 30a3c4f..c8c345a 100644
--- a/platform/fpga/openpiton/objects.mk
+++ b/platform/fpga/openpiton/objects.mk
@@ -4,4 +4,39 @@
 # Copyright (c) 2020 Western Digital Corporation or its affiliates.
 #
 
+# Compiler flags
+platform-cppflags-y =
+platform-cflags-y =
+platform-asflags-y =
+platform-ldflags-y =
+
+# Objects to build
 platform-objs-y += platform.o
+
+PLATFORM_RISCV_XLEN = 64
+
+# Blobs to build
+FW_TEXT_START=0x80000000
+FW_JUMP=n
+
+ifeq ($(PLATFORM_RISCV_XLEN), 32)
+ # This needs to be 4MB aligned for 32-bit support
+ FW_JUMP_ADDR=0x80400000
+ else
+ # This needs to be 2MB aligned for 64-bit support
+ FW_JUMP_ADDR=0x80200000
+ endif
+FW_JUMP_FDT_ADDR=0x82200000
+
+# Firmware with payload configuration.
+FW_PAYLOAD=y
+
+ifeq ($(PLATFORM_RISCV_XLEN), 32)
+# This needs to be 4MB aligned for 32-bit support
+  FW_PAYLOAD_OFFSET=0x400000
+else
+# This needs to be 2MB aligned for 64-bit support
+  FW_PAYLOAD_OFFSET=0x200000
+endif
+FW_PAYLOAD_FDT_ADDR=0x82200000
+FW_PAYLOAD_ALIGN=0x1000
diff --git a/platform/generic/config.mk b/platform/generic/config.mk
deleted file mode 100644
index 8151974..0000000
--- a/platform/generic/config.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-#
-# SPDX-License-Identifier: BSD-2-Clause
-#
-# Copyright (c) 2020 Western Digital Corporation or its affiliates.
-#
-# Authors:
-#   Anup Patel <anup.patel@wdc.com>
-#
-
-# Compiler flags
-platform-cppflags-y =
-platform-cflags-y =
-platform-asflags-y =
-platform-ldflags-y =
-
-# Command for platform specific "make run"
-platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
-  -nographic -bios $(build_dir)/platform/generic/firmware/fw_payload.elf
-
-# Blobs to build
-FW_TEXT_START=0x80000000
-FW_DYNAMIC=y
-FW_JUMP=y
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
-  # This needs to be 4MB aligned for 32-bit system
-  FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x400000)))
-else
-  # This needs to be 2MB aligned for 64-bit system
-  FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x200000)))
-endif
-FW_JUMP_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x2200000)))
-FW_PAYLOAD=y
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
-  # This needs to be 4MB aligned for 32-bit system
-  FW_PAYLOAD_OFFSET=0x400000
-else
-  # This needs to be 2MB aligned for 64-bit system
-  FW_PAYLOAD_OFFSET=0x200000
-endif
-FW_PAYLOAD_FDT_ADDR=$(FW_JUMP_FDT_ADDR)
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index 4907754..136853e 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -7,5 +7,38 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
+# Compiler flags
+platform-cppflags-y =
+platform-cflags-y =
+platform-asflags-y =
+platform-ldflags-y =
+
+# Command for platform specific "make run"
+platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
+  -nographic -bios $(build_dir)/platform/generic/firmware/fw_payload.elf
+
+# Objects to build
 platform-objs-y += platform.o
 platform-objs-y += platform_override_modules.o
+
+# Blobs to build
+FW_TEXT_START=0x80000000
+FW_DYNAMIC=y
+FW_JUMP=y
+ifeq ($(PLATFORM_RISCV_XLEN), 32)
+  # This needs to be 4MB aligned for 32-bit system
+  FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x400000)))
+else
+  # This needs to be 2MB aligned for 64-bit system
+  FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x200000)))
+endif
+FW_JUMP_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x2200000)))
+FW_PAYLOAD=y
+ifeq ($(PLATFORM_RISCV_XLEN), 32)
+  # This needs to be 4MB aligned for 32-bit system
+  FW_PAYLOAD_OFFSET=0x400000
+else
+  # This needs to be 2MB aligned for 64-bit system
+  FW_PAYLOAD_OFFSET=0x200000
+endif
+FW_PAYLOAD_FDT_ADDR=$(FW_JUMP_FDT_ADDR)
diff --git a/platform/kendryte/k210/config.mk b/platform/kendryte/k210/config.mk
deleted file mode 100644
index 8a9b814..0000000
--- a/platform/kendryte/k210/config.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-#
-# SPDX-License-Identifier: BSD-2-Clause
-#
-# Copyright (c) 2019 Western Digital Corporation or its affiliates.
-#
-# Authors:
-#   Damien Le Moal <damien.lemoal@wdc.com>
-#
-
-# Compiler flags
-platform-cppflags-y =
-platform-cflags-y =
-platform-asflags-y =
-platform-ldflags-y =
-
-# Blobs to build
-FW_TEXT_START=0x80000000
-FW_PAYLOAD=y
-FW_PAYLOAD_ALIGN=0x1000
diff --git a/platform/kendryte/k210/objects.mk b/platform/kendryte/k210/objects.mk
index b74da74..1bfb898 100644
--- a/platform/kendryte/k210/objects.mk
+++ b/platform/kendryte/k210/objects.mk
@@ -7,8 +7,20 @@
 #   Damien Le Moal <damien.lemoal@wdc.com>
 #
 
+# Compiler flags
+platform-cppflags-y =
+platform-cflags-y =
+platform-asflags-y =
+platform-ldflags-y =
+
+# Objects to build
 platform-objs-y += platform.o
 
 platform-objs-y += k210.o
 platform-varprefix-k210.o = dt_k210
 platform-padding-k210.o = 2048
+
+# Blobs to build
+FW_TEXT_START=0x80000000
+FW_PAYLOAD=y
+FW_PAYLOAD_ALIGN=0x1000
diff --git a/platform/nuclei/ux600/config.mk b/platform/nuclei/ux600/config.mk
deleted file mode 100644
index dddcc4e..0000000
--- a/platform/nuclei/ux600/config.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-#
-# SPDX-License-Identifier: BSD-2-Clause
-#
-# Copyright (c) 2020 Nuclei Corporation or its affiliates.
-#
-# Authors:
-#   lujun <lujun@nucleisys.com>
-#   hqfang <578567190@qq.com>
-#
-
-# Compiler flags
-platform-cppflags-y =
-platform-cflags-y =
-platform-asflags-y =
-platform-ldflags-y =
-
-# Command for platform specific "make run"
-platform-runcmd = xl_spike \
-  $(build_dir)/platform/nuclei/ux600/firmware/fw_payload.elf
-
-# Blobs to build
-FW_TEXT_START=0xA0000000
-FW_DYNAMIC=y
-FW_JUMP=y
-
-FW_JUMP_ADDR=0xA0200000
-FW_JUMP_FDT_ADDR=0xA8000000
-FW_PAYLOAD=y
-FW_PAYLOAD_OFFSET=0x200000
-FW_PAYLOAD_FDT_ADDR=0xA8000000
diff --git a/platform/nuclei/ux600/objects.mk b/platform/nuclei/ux600/objects.mk
index 8c36c90..7c429e0 100644
--- a/platform/nuclei/ux600/objects.mk
+++ b/platform/nuclei/ux600/objects.mk
@@ -8,4 +8,26 @@
 #   hqfang <578567190@qq.com>
 #
 
+# Compiler flags
+platform-cppflags-y =
+platform-cflags-y =
+platform-asflags-y =
+platform-ldflags-y =
+
+# Command for platform specific "make run"
+platform-runcmd = xl_spike \
+  $(build_dir)/platform/nuclei/ux600/firmware/fw_payload.elf
+
+# Objects to build
 platform-objs-y += platform.o
+
+# Blobs to build
+FW_TEXT_START=0xA0000000
+FW_DYNAMIC=y
+FW_JUMP=y
+
+FW_JUMP_ADDR=0xA0200000
+FW_JUMP_FDT_ADDR=0xA8000000
+FW_PAYLOAD=y
+FW_PAYLOAD_OFFSET=0x200000
+FW_PAYLOAD_FDT_ADDR=0xA8000000
diff --git a/platform/template/config.mk b/platform/template/config.mk
deleted file mode 100644
index f817342..0000000
--- a/platform/template/config.mk
+++ /dev/null
@@ -1,77 +0,0 @@
-#
-# SPDX-License-Identifier: BSD-2-Clause
-#
-# Copyright (c) 2019 Western Digital Corporation or its affiliates.
-#
-
-# Compiler pre-processor flags
-platform-cppflags-y =
-
-# C Compiler and assembler flags.
-platform-cflags-y =
-platform-asflags-y =
-
-# Linker flags: additional libraries and object files that the platform
-# code needs can be added here
-platform-ldflags-y =
-
-#
-# Command for platform specific "make run"
-# Useful for development and debugging on plaftform simulator (such as QEMU)
-#
-# platform-runcmd = your_platform_run.sh
-
-#
-# Platform RISC-V XLEN, ABI, ISA and Code Model configuration.
-# These are optional parameters but platforms can optionaly provide it.
-# Some of these are guessed based on GCC compiler capabilities
-#
-# PLATFORM_RISCV_XLEN = 64
-# PLATFORM_RISCV_ABI = lp64
-# PLATFORM_RISCV_ISA = rv64imafdc
-# PLATFORM_RISCV_CODE_MODEL = medany
-
-# Firmware load address configuration. This is mandatory.
-FW_TEXT_START=0x80000000
-
-# Optional parameter for path to external FDT
-# FW_FDT_PATH="path to platform flattened device tree file"
-
-#
-# Dynamic firmware configuration.
-# Optional parameters are commented out. Uncomment and define these parameters
-# as needed.
-#
-FW_DYNAMIC=<y|n>
-
-#
-# Jump firmware configuration.
-# Optional parameters are commented out. Uncomment and define these parameters
-# as needed.
-#
-FW_JUMP=<y|n>
-# This needs to be 4MB aligned for 32-bit support
-# This needs to be 2MB aligned for 64-bit support
-# ifeq ($(PLATFORM_RISCV_XLEN), 32)
-# FW_JUMP_ADDR=0x80400000
-# else
-# FW_JUMP_ADDR=0x80200000
-# endif
-# FW_JUMP_FDT_ADDR=0x82200000
-
-#
-# Firmware with payload configuration.
-# Optional parameters are commented out. Uncomment and define these parameters
-# as needed.
-#
-FW_PAYLOAD=<y|n>
-# This needs to be 4MB aligned for 32-bit support
-# This needs to be 2MB aligned for 64-bit support
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
-FW_PAYLOAD_OFFSET=0x400000
-else
-FW_PAYLOAD_OFFSET=0x200000
-endif
-# FW_PAYLOAD_ALIGN=0x1000
-# FW_PAYLOAD_PATH="path to next boot stage binary image file"
-# FW_PAYLOAD_FDT_ADDR=0x82200000
diff --git a/platform/template/objects.mk b/platform/template/objects.mk
index caaec2b..0025928 100644
--- a/platform/template/objects.mk
+++ b/platform/template/objects.mk
@@ -4,6 +4,33 @@
 # Copyright (c) 2019 Western Digital Corporation or its affiliates.
 #
 
+# Compiler pre-processor flags
+platform-cppflags-y =
+
+# C Compiler and assembler flags.
+platform-cflags-y =
+platform-asflags-y =
+
+# Linker flags: additional libraries and object files that the platform
+# code needs can be added here
+platform-ldflags-y =
+
+#
+# Command for platform specific "make run"
+# Useful for development and debugging on plaftform simulator (such as QEMU)
+#
+# platform-runcmd = your_platform_run.sh
+
+#
+# Platform RISC-V XLEN, ABI, ISA and Code Model configuration.
+# These are optional parameters but platforms can optionaly provide it.
+# Some of these are guessed based on GCC compiler capabilities
+#
+# PLATFORM_RISCV_XLEN = 64
+# PLATFORM_RISCV_ABI = lp64
+# PLATFORM_RISCV_ISA = rv64imafdc
+# PLATFORM_RISCV_CODE_MODEL = medany
+
 # Space separated list of object file names to be compiled for the platform
 platform-objs-y += platform.o
 
@@ -13,3 +40,48 @@ platform-objs-y += platform.o
 # source file be in the form <dt file name>.dts
 #
 # platform-objs-y += <dt file name>.o
+
+# Firmware load address configuration. This is mandatory.
+FW_TEXT_START=0x80000000
+
+# Optional parameter for path to external FDT
+# FW_FDT_PATH="path to platform flattened device tree file"
+
+#
+# Dynamic firmware configuration.
+# Optional parameters are commented out. Uncomment and define these parameters
+# as needed.
+#
+FW_DYNAMIC=<y|n>
+
+#
+# Jump firmware configuration.
+# Optional parameters are commented out. Uncomment and define these parameters
+# as needed.
+#
+FW_JUMP=<y|n>
+# This needs to be 4MB aligned for 32-bit support
+# This needs to be 2MB aligned for 64-bit support
+# ifeq ($(PLATFORM_RISCV_XLEN), 32)
+# FW_JUMP_ADDR=0x80400000
+# else
+# FW_JUMP_ADDR=0x80200000
+# endif
+# FW_JUMP_FDT_ADDR=0x82200000
+
+#
+# Firmware with payload configuration.
+# Optional parameters are commented out. Uncomment and define these parameters
+# as needed.
+#
+FW_PAYLOAD=<y|n>
+# This needs to be 4MB aligned for 32-bit support
+# This needs to be 2MB aligned for 64-bit support
+ifeq ($(PLATFORM_RISCV_XLEN), 32)
+FW_PAYLOAD_OFFSET=0x400000
+else
+FW_PAYLOAD_OFFSET=0x200000
+endif
+# FW_PAYLOAD_ALIGN=0x1000
+# FW_PAYLOAD_PATH="path to next boot stage binary image file"
+# FW_PAYLOAD_FDT_ADDR=0x82200000
diff --git a/platform/template/platform.c b/platform/template/platform.c
index 5524847..f3802da 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -11,7 +11,7 @@
 
 /*
  * Include these files as needed.
- * See config.mk PLATFORM_xxx configuration parameters.
+ * See objects.mk PLATFORM_xxx configuration parameters.
  */
 #include <sbi_utils/ipi/aclint_mswi.h>
 #include <sbi_utils/irqchip/plic.h>
-- 
2.34.1


