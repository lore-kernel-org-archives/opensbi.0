From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Jul 2022 20:26:11 +0530
Subject: [PATCH v2 14/14] docs: Update documentation for kconfig support
In-Reply-To: <20220718145611.2211638-1-apatel@ventanamicro.com>
References: <20220718145611.2211638-1-apatel@ventanamicro.com>
Message-ID: <20220718145611.2211638-15-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update all documentation files to:
1) Remove references to platform specific config.mk file since it is
   has been removed.
2) Add details about platform specific configs/defconfig and Kconfig
   files mandatory for each platform.
3) Add required packages in top-level README.md

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 README.md                   | 25 +++++++++++++++++++++++--
 docs/firmware/fw_dynamic.md |  2 +-
 docs/firmware/fw_jump.md    |  4 ++--
 docs/firmware/fw_payload.md |  4 ++--
 docs/platform/platform.md   |  4 ++--
 docs/platform_guide.md      |  9 +++++----
 6 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/README.md b/README.md
index 54fabe4..cd852cb 100644
--- a/README.md
+++ b/README.md
@@ -92,8 +92,8 @@ N.B. Any S-mode boot loader (i.e. U-Boot) doesn't need to support HSM extension,
 as it doesn't need to boot all the harts. The operating system should be
 capable enough to bring up all other non-booting harts using HSM extension.
 
-Required Toolchain
-------------------
+Required Toolchain and Packages
+-------------------------------
 
 OpenSBI can be compiled natively or cross-compiled on a x86 host. For
 cross-compilation, you can build your own toolchain, download a prebuilt one
@@ -115,6 +115,14 @@ triple is used (e.g. *-target riscv64-unknown-elf*).
 Please note that only a 64-bit version of the toolchain is available in
 the Bootlin toolchain repository for now.
 
+In addition to a toolchain, OpenSBI also requires following packages on
+the host:
+
+1. device-tree-compiler: The device tree compiler for compiling device
+   tree sources (DTS files).
+2. kconfig-frontends: A standalone implementation of the Linux Kconfig
+   parser and frontends for OpenSBI platform configuration management.
+
 Building and Installing the OpenSBI Platform-Independent Library
 ----------------------------------------------------------------
 
@@ -196,6 +204,19 @@ top-level make command line. These options, such as *PLATFORM_<xyz>* or
 *docs/platform/<platform_name>.md* files and
 *docs/firmware/<firmware_name>.md* files.
 
+All OpenSBI platforms support Kconfig style build-time configuration. Users
+can change the build-time configuration of a platform using a graphical
+interface as follows:
+```
+make PLATFORM=<platform_subdir> menuconfig
+```
+
+Alternately, an OpenSBI platform can have multiple default configurations
+and users can select a custom default configuration as follows:
+```
+make PLATFORM=<platform_subdir> PLATFORM_DEFCONFIG=<platform_custom_defconfig>
+```
+
 Building 32-bit / 64-bit OpenSBI Images
 ---------------------------------------
 By default, building OpenSBI generates 32-bit or 64-bit images based on the
diff --git a/docs/firmware/fw_dynamic.md b/docs/firmware/fw_dynamic.md
index 7b9b192..e251488 100644
--- a/docs/firmware/fw_dynamic.md
+++ b/docs/firmware/fw_dynamic.md
@@ -20,7 +20,7 @@ the booting stage binary to follow OpenSBI firmware.
 A platform can enable *FW_DYNAMIC* firmware using any of the following methods.
 
 1. Specifying `FW_DYNAMIC=y` on the top level `make` command line.
-2. Specifying `FW_DYNAMIC=y` in the target platform *config.mk* configuration
+2. Specifying `FW_DYNAMIC=y` in the target platform *objects.mk* configuration
 file.
 
 The compiled *FW_DYNAMIC* firmware ELF file is named *fw_dynamic.elf*. It's
diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
index eea3013..35a4301 100644
--- a/docs/firmware/fw_jump.md
+++ b/docs/firmware/fw_jump.md
@@ -15,7 +15,7 @@ and the booting stage binary to follow the OpenSBI firmware.
 A platform *FW_JUMP* firmware can be enabled by any of the following methods:
 
 1. Specifying `FW_JUMP=y` on the top level `make` command line.
-2. Specifying `FW_JUMP=y` in the target platform *config.mk* configuration file.
+2. Specifying `FW_JUMP=y` in the target platform *objects.mk* configuration file.
 
 The compiled *FW_JUMP* firmware ELF file is named *fw_jump.elf*. Its expanded
 image file is *fw_jump.bin*. Both files are created in the platform-specific
@@ -26,7 +26,7 @@ build directory under the *build/platform/<platform_subdir>/firmware* directory.
 
 To operate correctly, a *FW_JUMP* firmware requires some configuration
 parameters to be defined using either the top level `make` command line or the
-target platform *config.mk* configuration file. The possible parameters are as
+target platform *objects.mk* configuration file. The possible parameters are as
 follows:
 
 * **FW_JUMP_ADDR** - Address of the entry point of the booting stage to be
diff --git a/docs/firmware/fw_payload.md b/docs/firmware/fw_payload.md
index 0947448..3bb918f 100644
--- a/docs/firmware/fw_payload.md
+++ b/docs/firmware/fw_payload.md
@@ -20,7 +20,7 @@ Enabling *FW_PAYLOAD* compilation
 The *FW_PAYLOAD* firmware can be enabled by any of the following methods:
 
 1. Specifying `FW_PAYLOAD=y` on the top level `make` command line.
-2. Specifying `FW_PAYLOAD=y` in the target platform *config.mk* configuration
+2. Specifying `FW_PAYLOAD=y` in the target platform *objects.mk* configuration
    file.
 
 The compiled *FW_PAYLOAD* firmware ELF file is named *fw_jump.elf*. Its
@@ -33,7 +33,7 @@ Configuration Options
 
 A *FW_PAYLOAD* firmware is built according to configuration parameters and
 options. These configuration parameters can be defined using either the top
-level `make` command line or the target platform *config.mk* configuration
+level `make` command line or the target platform *objects.mk* configuration
 file. The parameters currently defined are as follows:
 
 * **FW_PAYLOAD_OFFSET** - Offset from *FW_TEXT_BASE* where the payload binary
diff --git a/docs/platform/platform.md b/docs/platform/platform.md
index cb4bec6..b726e1d 100644
--- a/docs/platform/platform.md
+++ b/docs/platform/platform.md
@@ -42,8 +42,8 @@ OpenSBI currently supports the following virtual and hardware platforms:
 The code for these supported platforms can be used as example to implement
 support for other platforms. The *platform/template* directory also provides
 template files for implementing support for a new platform. The *object.mk*,
-*config.mk* and *platform.c* template files provides enough comments to
-facilitate the implementation.
+*Kconfig*, *configs/defconfig* and *platform.c* template files provides enough
+comments to facilitate the implementation.
 
 [generic.md]: generic.md
 [qemu_virt.md]: qemu_virt.md
diff --git a/docs/platform_guide.md b/docs/platform_guide.md
index b6c2c2e..8ac5aa0 100644
--- a/docs/platform_guide.md
+++ b/docs/platform_guide.md
@@ -28,11 +28,12 @@ Adding support for a new platform
 Support for a new platform named *&lt;xyz&gt;* can be added as follows:
 
 1. Create a directory named *&lt;xyz&gt;* under the *platform/* directory.
-2. Create a platform configuration file named *config.mk* under the
-   *platform/&lt;xyz&gt;/* directory. This configuration file will provide
+2. Create a platform configuration files named *Kconfig* and *configs/defconfig*
+   under the *platform/&lt;xyz&gt;/* directory. This configuration files will
+   provide the build time configuration for the sources to be compiled.
+3. Create a *platform/&lt;xyz&gt;/objects.mk* file for listing the platform
+   object files to be compiled. This file also provides platform-specific
    compiler flags, and select firmware options.
-3. Create a *platform/&lt;xyz&gt;/objects.mk* file for listing the
-   platform-specific object files to be compiled.
 4. Create a *platform/&lt;xyz&gt;/platform.c* file providing a
    *struct sbi_platform* instance.
 
-- 
2.34.1


