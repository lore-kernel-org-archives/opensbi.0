From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  4 Aug 2022 17:34:15 +0530
Subject: [PATCH v6 03/17] Makefile: Compile lib/utils sources separately for each platform
In-Reply-To: <20220804120429.59444-1-apatel@ventanamicro.com>
References: <20220804120429.59444-1-apatel@ventanamicro.com>
Message-ID: <20220804120429.59444-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, if same build directory is used to compile two different
platforms then lib/utils objects are shared for these platforms.

We will be having platform specific configs to enable/disable drivers
in lib/utils and select compile time options for lib/utils sources.
This means lib/utils sources will now be compiled in a platform
specific way.

To tackle above, we update top-level Makefile as follows:
1) Don't create libsbiutils.a anymore because this can't be shared
   between platforms.
2) Compile lib/utils sources separately for each platform.
3) Add comments showing which make rules are for lib/sbi, lib/utils,
   firmware, and platform sources.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
---
 Makefile                         | 48 ++++++++++++++++----------------
 docs/library_usage.md            |  6 +---
 scripts/create-binary-archive.sh |  2 +-
 3 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/Makefile b/Makefile
index 677ea83..678159c 100644
--- a/Makefile
+++ b/Makefile
@@ -243,8 +243,8 @@ include $(firmware-object-mks)
 
 # Setup list of objects
 libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
-libsbiutils-objs-path-y=$(foreach obj,$(libsbiutils-objs-y),$(build_dir)/lib/utils/$(obj))
 ifdef PLATFORM
+libsbiutils-objs-path-y=$(foreach obj,$(libsbiutils-objs-y),$(platform_build_dir)/lib/utils/$(obj))
 platform-objs-path-y=$(foreach obj,$(platform-objs-y),$(platform_build_dir)/$(obj))
 firmware-bins-path-y=$(foreach bin,$(firmware-bins-y),$(platform_build_dir)/firmware/$(bin))
 endif
@@ -461,7 +461,6 @@ compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
 
 targets-y  = $(build_dir)/lib/libsbi.a
-targets-y  += $(build_dir)/lib/libsbiutils.a
 ifdef PLATFORM
 targets-y += $(platform_build_dir)/lib/libplatsbi.a
 endif
@@ -474,12 +473,10 @@ all: $(targets-y)
 # Preserve all intermediate files
 .SECONDARY:
 
+# Rules for lib/sbi sources
 $(build_dir)/lib/libsbi.a: $(libsbi-objs-path-y)
 	$(call compile_ar,$@,$^)
 
-$(build_dir)/lib/libsbiutils.a: $(libsbi-objs-path-y) $(libsbiutils-objs-path-y)
-	$(call compile_ar,$@,$^)
-
 $(platform_build_dir)/lib/libplatsbi.a: $(libsbi-objs-path-y) $(libsbiutils-objs-path-y) $(platform-objs-path-y)
 	$(call compile_ar,$@,$^)
 
@@ -503,22 +500,14 @@ $(build_dir)/%.dep: $(src_dir)/%.S
 $(build_dir)/%.o: $(src_dir)/%.S
 	$(call compile_as,$@,$<)
 
-$(build_dir)/%.dep: $(src_dir)/%.carray
+# Rules for platform sources
+$(platform_build_dir)/%.dep: $(platform_src_dir)/%.carray
 	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_CONFIG))
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
-$(build_dir)/%.c: $(src_dir)/%.carray
+$(platform_build_dir)/%.c: $(platform_src_dir)/%.carray
 	$(call compile_carray,$@,$<)
 
-$(platform_build_dir)/%.bin: $(platform_build_dir)/%.elf
-	$(call compile_objcopy,$@,$<)
-
-$(platform_build_dir)/%.elf: $(platform_build_dir)/%.o $(platform_build_dir)/%.elf.ld $(platform_build_dir)/lib/libplatsbi.a
-	$(call compile_elf,$@,$@.ld,$< $(platform_build_dir)/lib/libplatsbi.a)
-
-$(platform_build_dir)/%.ld: $(src_dir)/%.ldS
-	$(call compile_cpp,$@,$<)
-
 $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c
 	$(call compile_cc_dep,$@,$<)
 
@@ -542,6 +531,23 @@ $(platform_build_dir)/%.c: $(platform_build_dir)/%.dtb
 $(platform_build_dir)/%.dtb: $(platform_src_dir)/%.dts
 	$(call compile_dts,$@,$<)
 
+# Rules for lib/utils and firmware sources
+$(platform_build_dir)/%.bin: $(platform_build_dir)/%.elf
+	$(call compile_objcopy,$@,$<)
+
+$(platform_build_dir)/%.elf: $(platform_build_dir)/%.o $(platform_build_dir)/%.elf.ld $(platform_build_dir)/lib/libplatsbi.a
+	$(call compile_elf,$@,$@.ld,$< $(platform_build_dir)/lib/libplatsbi.a)
+
+$(platform_build_dir)/%.ld: $(src_dir)/%.ldS
+	$(call compile_cpp,$@,$<)
+
+$(platform_build_dir)/%.dep: $(src_dir)/%.carray
+	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_CONFIG))
+	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
+
+$(platform_build_dir)/%.c: $(src_dir)/%.carray
+	$(call compile_carray,$@,$<)
+
 $(platform_build_dir)/%.dep: $(src_dir)/%.c
 	$(call compile_cc_dep,$@,$<)
 
@@ -595,7 +601,6 @@ endif
 endif
 
 install_targets-y  = install_libsbi
-install_targets-y  += install_libsbiutils
 ifdef PLATFORM
 install_targets-y += install_libplatsbi
 install_targets-y += install_firmwares
@@ -610,17 +615,12 @@ install_libsbi: $(build_dir)/lib/libsbi.a
 	$(call inst_header_dir,$(install_root_dir)/$(install_include_path),$(include_dir)/sbi)
 	$(call inst_file,$(install_root_dir)/$(install_lib_path)/libsbi.a,$(build_dir)/lib/libsbi.a)
 
-.PHONY: install_libsbiutils
-install_libsbiutils: $(build_dir)/lib/libsbiutils.a
-	$(call inst_header_dir,$(install_root_dir)/$(install_include_path),$(include_dir)/sbi_utils)
-	$(call inst_file,$(install_root_dir)/$(install_lib_path)/libsbiutils.a,$(build_dir)/lib/libsbiutils.a)
-
 .PHONY: install_libplatsbi
-install_libplatsbi: $(platform_build_dir)/lib/libplatsbi.a $(build_dir)/lib/libsbi.a $(build_dir)/lib/libsbiutils.a
+install_libplatsbi: $(platform_build_dir)/lib/libplatsbi.a $(build_dir)/lib/libsbi.a
 	$(call inst_file,$(install_root_dir)/$(install_lib_path)/opensbi/$(platform_subdir)/lib/libplatsbi.a,$(platform_build_dir)/lib/libplatsbi.a)
 
 .PHONY: install_firmwares
-install_firmwares: $(platform_build_dir)/lib/libplatsbi.a $(build_dir)/lib/libsbi.a $(build_dir)/lib/libsbiutils.a $(firmware-bins-path-y)
+install_firmwares: $(platform_build_dir)/lib/libplatsbi.a $(build_dir)/lib/libsbi.a $(firmware-bins-path-y)
 	$(call inst_file_list,$(install_root_dir),$(build_dir),$(install_firmware_path)/$(platform_subdir)/firmware,$(firmware-elfs-path-y))
 	$(call inst_file_list,$(install_root_dir),$(build_dir),$(install_firmware_path)/$(platform_subdir)/firmware,$(firmware-bins-path-y))
 
diff --git a/docs/library_usage.md b/docs/library_usage.md
index ff99801..d5d2ba9 100644
--- a/docs/library_usage.md
+++ b/docs/library_usage.md
@@ -8,11 +8,7 @@ OpenSBI provides two types of static libraries:
    hooks for the execution of this interface must be provided by the firmware or
    bootloader linking with this library. This library is installed as
    *<install_directory>/lib/libsbi.a*
-2. *libsbiutils.a* - A static library that will contain all common code required
-   by any platform supported in OpenSBI. It will be built by default and included
-   in libplatsbi.a. This library is installed as
-   *<install_directory>/lib/libsbiutils.a*.
-3. *libplatsbi.a* - An example platform-specific static library integrating
+2. *libplatsbi.a* - An example platform-specific static library integrating
    *libsbi.a* with platform-specific hooks. This library is available only for
    the platforms supported by OpenSBI. This library is installed as
    *<install_directory>/platform/<platform_subdir>/lib/libplatsbi.a*
diff --git a/scripts/create-binary-archive.sh b/scripts/create-binary-archive.sh
index 43c5452..261a45a 100755
--- a/scripts/create-binary-archive.sh
+++ b/scripts/create-binary-archive.sh
@@ -118,7 +118,7 @@ build_opensbi() {
 	# Build and install generic library
 	echo "Build and install generic library XLEN=${BUILD_RISCV_XLEN}"
 	echo ""
-	make -C "${BUILD_OPENSBI_SOURCE_PATH}" O="${BUILD_OUTPUT_PATH}/${BUILD_NAME}" I="${BUILD_OUTPUT_PATH}/${BUILD_ARCHIVE_NAME}" PLATFORM_RISCV_XLEN="${BUILD_RISCV_XLEN}" install_libsbi install_libsbiutils -j "${BUILD_NUM_THREADS}"
+	make -C "${BUILD_OPENSBI_SOURCE_PATH}" O="${BUILD_OUTPUT_PATH}/${BUILD_NAME}" I="${BUILD_OUTPUT_PATH}/${BUILD_ARCHIVE_NAME}" PLATFORM_RISCV_XLEN="${BUILD_RISCV_XLEN}" install_libsbi -j "${BUILD_NUM_THREADS}"
 	echo ""
 
 	# Build and install relevant platforms
-- 
2.34.1


