From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  8 Aug 2022 09:27:25 +0530
Subject: [PATCH v8 02/17] Makefile: Add initial kconfig support for each platform
In-Reply-To: <20220808035740.69335-1-apatel@ventanamicro.com>
References: <20220808035740.69335-1-apatel@ventanamicro.com>
Message-ID: <20220808035740.69335-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We extend the top-level makefile to allow kconfig based configuration
for each platform where each platform has it's own set of configs with
"defconfig" being the default config.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Atish Patra <atishp@rivosinc.com>
---
 Kconfig                                   | 23 ++++++++
 Makefile                                  | 72 +++++++++++++++++++----
 firmware/Kconfig                          |  1 +
 lib/utils/Kconfig                         |  1 +
 platform/andes/ae350/Kconfig              |  5 ++
 platform/andes/ae350/configs/defconfig    |  0
 platform/fpga/ariane/Kconfig              |  5 ++
 platform/fpga/ariane/configs/defconfig    |  0
 platform/fpga/openpiton/Kconfig           |  5 ++
 platform/fpga/openpiton/configs/defconfig |  0
 platform/generic/Kconfig                  |  5 ++
 platform/generic/configs/defconfig        |  0
 platform/kendryte/k210/Kconfig            |  5 ++
 platform/kendryte/k210/configs/defconfig  |  0
 platform/nuclei/ux600/Kconfig             |  5 ++
 platform/nuclei/ux600/configs/defconfig   |  0
 platform/template/Kconfig                 | 12 ++++
 platform/template/configs/defconfig       |  0
 18 files changed, 127 insertions(+), 12 deletions(-)
 create mode 100644 Kconfig
 create mode 100644 firmware/Kconfig
 create mode 100644 lib/utils/Kconfig
 create mode 100644 platform/andes/ae350/Kconfig
 create mode 100644 platform/andes/ae350/configs/defconfig
 create mode 100644 platform/fpga/ariane/Kconfig
 create mode 100644 platform/fpga/ariane/configs/defconfig
 create mode 100644 platform/fpga/openpiton/Kconfig
 create mode 100644 platform/fpga/openpiton/configs/defconfig
 create mode 100644 platform/generic/Kconfig
 create mode 100644 platform/generic/configs/defconfig
 create mode 100644 platform/kendryte/k210/Kconfig
 create mode 100644 platform/kendryte/k210/configs/defconfig
 create mode 100644 platform/nuclei/ux600/Kconfig
 create mode 100644 platform/nuclei/ux600/configs/defconfig
 create mode 100644 platform/template/Kconfig
 create mode 100644 platform/template/configs/defconfig

diff --git a/Kconfig b/Kconfig
new file mode 100644
index 0000000..b3213a9
--- /dev/null
+++ b/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+mainmenu "OpenSBI $(OPENSBI_PLATFORM) Configuration"
+
+config OPENSBI_SRC_DIR
+	string
+	option env="OPENSBI_SRC_DIR"
+
+config OPENSBI_PLATFORM
+	string
+	option env="OPENSBI_PLATFORM"
+
+config OPENSBI_PLATFORM_SRC_DIR
+	string
+	option env="OPENSBI_PLATFORM_SRC_DIR"
+
+menu "Platform Options"
+source "$(OPENSBI_PLATFORM_SRC_DIR)/Kconfig"
+endmenu
+
+source "$(OPENSBI_SRC_DIR)/lib/utils/Kconfig"
+
+source "$(OPENSBI_SRC_DIR)/firmware/Kconfig"
diff --git a/Makefile b/Makefile
index f619ef7..c5a3467 100644
--- a/Makefile
+++ b/Makefile
@@ -52,6 +52,9 @@ ifdef PLATFORM_DIR
 else
  platform_parent_dir=$(src_dir)/platform
 endif
+ifndef PLATFORM_DEFCONFIG
+PLATFORM_DEFCONFIG=defconfig
+endif
 
 # Check if verbosity is ON for build process
 CMD_PREFIX_DEFAULT := @
@@ -70,6 +73,20 @@ export libsbi_dir=$(CURDIR)/lib/sbi
 export libsbiutils_dir=$(CURDIR)/lib/utils
 export firmware_dir=$(CURDIR)/firmware
 
+# Setup variables for kconfig
+ifdef PLATFORM
+export PYTHONDONTWRITEBYTECODE=1
+export KCONFIG_DIR=$(platform_build_dir)/kconfig
+export KCONFIG_AUTOLIST=$(KCONFIG_DIR)/auto.list
+export KCONFIG_AUTOHEADER=$(KCONFIG_DIR)/autoconf.h
+export KCONFIG_AUTOCMD=$(KCONFIG_DIR)/auto.conf.cmd
+export KCONFIG_CONFIG=$(KCONFIG_DIR)/.config
+# Additional exports for include paths in Kconfig files
+export OPENSBI_SRC_DIR=$(src_dir)
+export OPENSBI_PLATFORM=$(PLATFORM)
+export OPENSBI_PLATFORM_SRC_DIR=$(platform_src_dir)
+endif
+
 # Find library version
 OPENSBI_VERSION_MAJOR=`grep "define OPENSBI_VERSION_MAJOR" $(include_dir)/sbi/sbi_version.h | sed 's/.*MAJOR.*\([0-9][0-9]*\)/\1/'`
 OPENSBI_VERSION_MINOR=`grep "define OPENSBI_VERSION_MINOR" $(include_dir)/sbi/sbi_version.h | sed 's/.*MINOR.*\([0-9][0-9]*\)/\1/'`
@@ -183,8 +200,36 @@ libsbi-object-mks=$(shell if [ -d $(libsbi_dir) ]; then find $(libsbi_dir) -inam
 libsbiutils-object-mks=$(shell if [ -d $(libsbiutils_dir) ]; then find $(libsbiutils_dir) -iname "objects.mk" | sort -r; fi)
 firmware-object-mks=$(shell if [ -d $(firmware_dir) ]; then find $(firmware_dir) -iname "objects.mk" | sort -r; fi)
 
-# Include platform specifig config.mk
+# The "make all" rule should always be first rule
+.PHONY: all
+all:
+
+# Include platform specific .config and config.mk
 ifdef PLATFORM
+.PHONY: menuconfig
+menuconfig: $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
+	$(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
+	$(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/menuconfig.py $(src_dir)/Kconfig
+	$(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/genconfig.py --header-path $(KCONFIG_AUTOHEADER) --sync-deps $(KCONFIG_DIR) --file-list $(KCONFIG_AUTOLIST) $(src_dir)/Kconfig
+
+.PHONY: savedefconfig
+savedefconfig: $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
+	$(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
+	$(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/savedefconfig.py --kconfig $(src_dir)/Kconfig --out $(KCONFIG_DIR)/defconfig
+
+$(KCONFIG_CONFIG): $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG) $(platform_src_dir)/Kconfig $(src_dir)/Kconfig
+	$(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
+	$(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/defconfig.py --kconfig $(src_dir)/Kconfig $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG)
+	$(CMD_PREFIX)$(src_dir)/scripts/Kconfiglib/genconfig.py --header-path $(KCONFIG_AUTOHEADER) --sync-deps $(KCONFIG_DIR) --file-list $(KCONFIG_AUTOLIST) $(src_dir)/Kconfig
+
+$(KCONFIG_AUTOCMD): $(KCONFIG_CONFIG)
+	$(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
+	$(CMD_PREFIX)echo -n "$(KCONFIG_CONFIG): " > $(KCONFIG_AUTOCMD)
+	$(CMD_PREFIX)cat $(KCONFIG_AUTOLIST) | tr '\n' ' ' >> $(KCONFIG_AUTOCMD)
+
+include $(KCONFIG_CONFIG)
+include $(KCONFIG_AUTOCMD)
+
 include $(platform_src_dir)/config.mk
 endif
 
@@ -280,6 +325,9 @@ ifeq ($(BUILD_INFO),y)
 GENFLAGS	+=	-DOPENSBI_BUILD_TIME_STAMP="\"$(OPENSBI_BUILD_TIME_STAMP)\""
 GENFLAGS	+=	-DOPENSBI_BUILD_COMPILER_VERSION="\"$(OPENSBI_BUILD_COMPILER_VERSION)\""
 endif
+ifdef PLATFORM
+GENFLAGS	+=	-include $(KCONFIG_AUTOHEADER)
+endif
 GENFLAGS	+=	$(libsbiutils-genflags-y)
 GENFLAGS	+=	$(platform-genflags-y)
 GENFLAGS	+=	$(firmware-genflags-y)
@@ -419,7 +467,7 @@ targets-y += $(platform_build_dir)/lib/libplatsbi.a
 endif
 targets-y += $(firmware-bins-path-y)
 
-# Default rule "make" should always be first rule
+# The default "make all" rule
 .PHONY: all
 all: $(targets-y)
 
@@ -435,7 +483,7 @@ $(build_dir)/lib/libsbiutils.a: $(libsbi-objs-path-y) $(libsbiutils-objs-path-y)
 $(platform_build_dir)/lib/libplatsbi.a: $(libsbi-objs-path-y) $(libsbiutils-objs-path-y) $(platform-objs-path-y)
 	$(call compile_ar,$@,$^)
 
-$(build_dir)/%.dep: $(src_dir)/%.c
+$(build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_CONFIG)
 	$(call compile_cc_dep,$@,$<)
 
 $(build_dir)/%.o: $(src_dir)/%.c
@@ -449,14 +497,14 @@ $(build_dir)/lib/sbi/sbi_init.o: $(libsbi_dir)/sbi_init.c FORCE
 	$(call compile_cc,$@,$<)
 endif
 
-$(build_dir)/%.dep: $(src_dir)/%.S
+$(build_dir)/%.dep: $(src_dir)/%.S $(KCONFIG_CONFIG)
 	$(call compile_as_dep,$@,$<)
 
 $(build_dir)/%.o: $(src_dir)/%.S
 	$(call compile_as,$@,$<)
 
-$(build_dir)/%.dep: $(src_dir)/%.carray
-	$(call compile_gen_dep,$@,.c,$<)
+$(build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_CONFIG)
+	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_CONFIG))
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
 $(build_dir)/%.c: $(src_dir)/%.carray
@@ -471,10 +519,10 @@ $(platform_build_dir)/%.elf: $(platform_build_dir)/%.o $(platform_build_dir)/%.e
 $(platform_build_dir)/%.ld: $(src_dir)/%.ldS
 	$(call compile_cpp,$@,$<)
 
-$(platform_build_dir)/%.dep: $(platform_src_dir)/%.c
+$(platform_build_dir)/%.dep: $(platform_src_dir)/%.c $(KCONFIG_CONFIG)
 	$(call compile_cc_dep,$@,$<)
 
-$(platform_build_dir)/%.o: $(platform_src_dir)/%.c
+$(platform_build_dir)/%.o: $(platform_src_dir)/%.c $(KCONFIG_CONFIG)
 	$(call compile_cc,$@,$<)
 
 $(platform_build_dir)/%.dep: $(platform_src_dir)/%.S
@@ -483,8 +531,8 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.S
 $(platform_build_dir)/%.o: $(platform_src_dir)/%.S
 	$(call compile_as,$@,$<)
 
-$(platform_build_dir)/%.dep: $(platform_src_dir)/%.dts
-	$(call compile_gen_dep,$@,.dtb,$<)
+$(platform_build_dir)/%.dep: $(platform_src_dir)/%.dts $(KCONFIG_CONFIG)
+	$(call compile_gen_dep,$@,.dtb,$< $(KCONFIG_CONFIG))
 	$(call compile_gen_dep,$@,.c,$(@:.dep=.dtb))
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
@@ -494,13 +542,13 @@ $(platform_build_dir)/%.c: $(platform_build_dir)/%.dtb
 $(platform_build_dir)/%.dtb: $(platform_src_dir)/%.dts
 	$(call compile_dts,$@,$<)
 
-$(platform_build_dir)/%.dep: $(src_dir)/%.c
+$(platform_build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_CONFIG)
 	$(call compile_cc_dep,$@,$<)
 
 $(platform_build_dir)/%.o: $(src_dir)/%.c
 	$(call compile_cc,$@,$<)
 
-$(platform_build_dir)/%.dep: $(src_dir)/%.S
+$(platform_build_dir)/%.dep: $(src_dir)/%.S $(KCONFIG_CONFIG)
 	$(call compile_as_dep,$@,$<)
 
 $(platform_build_dir)/%.o: $(src_dir)/%.S
diff --git a/firmware/Kconfig b/firmware/Kconfig
new file mode 100644
index 0000000..d6e0506
--- /dev/null
+++ b/firmware/Kconfig
@@ -0,0 +1 @@
+# SPDX-License-Identifier: BSD-2-Clause
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
new file mode 100644
index 0000000..d6e0506
--- /dev/null
+++ b/lib/utils/Kconfig
@@ -0,0 +1 @@
+# SPDX-License-Identifier: BSD-2-Clause
diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
new file mode 100644
index 0000000..4b73c76
--- /dev/null
+++ b/platform/andes/ae350/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+config PLATFORM_ANDES_AE350
+	bool
+	default y
diff --git a/platform/andes/ae350/configs/defconfig b/platform/andes/ae350/configs/defconfig
new file mode 100644
index 0000000..e69de29
diff --git a/platform/fpga/ariane/Kconfig b/platform/fpga/ariane/Kconfig
new file mode 100644
index 0000000..70d2004
--- /dev/null
+++ b/platform/fpga/ariane/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+config PLATFORM_ARIANE_FPGA
+	bool
+	default y
diff --git a/platform/fpga/ariane/configs/defconfig b/platform/fpga/ariane/configs/defconfig
new file mode 100644
index 0000000..e69de29
diff --git a/platform/fpga/openpiton/Kconfig b/platform/fpga/openpiton/Kconfig
new file mode 100644
index 0000000..81e4b76
--- /dev/null
+++ b/platform/fpga/openpiton/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+config PLATFORM_OPENPITON_FPGA
+	bool
+	default y
diff --git a/platform/fpga/openpiton/configs/defconfig b/platform/fpga/openpiton/configs/defconfig
new file mode 100644
index 0000000..e69de29
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
new file mode 100644
index 0000000..3eab282
--- /dev/null
+++ b/platform/generic/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+config PLATFORM_GENERIC
+	bool
+	default y
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
new file mode 100644
index 0000000..e69de29
diff --git a/platform/kendryte/k210/Kconfig b/platform/kendryte/k210/Kconfig
new file mode 100644
index 0000000..889f16b
--- /dev/null
+++ b/platform/kendryte/k210/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+config PLATFORM_KENDRYTE_K210
+	bool
+	default y
diff --git a/platform/kendryte/k210/configs/defconfig b/platform/kendryte/k210/configs/defconfig
new file mode 100644
index 0000000..e69de29
diff --git a/platform/nuclei/ux600/Kconfig b/platform/nuclei/ux600/Kconfig
new file mode 100644
index 0000000..c368ef4
--- /dev/null
+++ b/platform/nuclei/ux600/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+config PLATFORM_NUCLEI_UX600
+	bool
+	default y
diff --git a/platform/nuclei/ux600/configs/defconfig b/platform/nuclei/ux600/configs/defconfig
new file mode 100644
index 0000000..e69de29
diff --git a/platform/template/Kconfig b/platform/template/Kconfig
new file mode 100644
index 0000000..6fbb567
--- /dev/null
+++ b/platform/template/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+#
+# All mandatory drivers or libraries for this platform should
+# be directly selected by the PLATFORM_xyz kconfig symbol.
+#
+# All optional drivers or libraries for this platform should
+# be enabled via configs/defconfig of this platform.
+#
+config PLATFORM_TEMPLATE
+	bool
+	default y
diff --git a/platform/template/configs/defconfig b/platform/template/configs/defconfig
new file mode 100644
index 0000000..e69de29
-- 
2.34.1


