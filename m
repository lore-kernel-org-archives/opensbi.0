From: zhangdongdong@eswincomputing.com <zhangdongdong@eswincomputing.com>
Date: Tue, 25 Oct 2022 08:57:41 +0800
Subject: [PATCH] docs: fix some typos
Message-ID: <20221025005741.2441-1-zhangdongdong@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: zhangdongdong <zhangdongdong@eswincomputing.com>

Corrected the typos of some documents in the 'docs' folder.

Signed-off-by:  zhangdongdong <zhangdongdong@eswincomputing.com>
---
 docs/contributing.md          | 2 +-
 docs/firmware/fw_dynamic.md   | 2 +-
 docs/platform/fpga-ariane.md  | 2 +-
 docs/platform/sifive_fu540.md | 2 +-
 docs/platform/thead-c9xx.md   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/contributing.md b/docs/contributing.md
index 9c2b3ba..78d909e 100644
--- a/docs/contributing.md
+++ b/docs/contributing.md
@@ -29,7 +29,7 @@ and "top:".
 5. Maintainers should use "Rebase and Merge" when using GitHub to merge pull
 requests to avoid creating unnecessary merge commits.
 6. Maintainers should avoid creating branches directly in the main
-riscv/opensbi repository. Instead prefer using a fork of the riscv/opensbi main
+riscv/opensbi repository. Instead, prefer using a fork of the riscv/opensbi main
 repository and branches within that fork to create pull requests.
 7. A maintainer cannot merge his own pull requests in the riscv/opensbi main
 repository.
diff --git a/docs/firmware/fw_dynamic.md b/docs/firmware/fw_dynamic.md
index e251488..9fc8cfa 100644
--- a/docs/firmware/fw_dynamic.md
+++ b/docs/firmware/fw_dynamic.md
@@ -31,6 +31,6 @@ directory.
 *FW_DYNAMIC* Firmware Configuration Options
 -------------------------------------------
 
-The *FW_DYNAMIC* firmware does not requires any platform specific configuration
+The *FW_DYNAMIC* firmware does not require any platform specific configuration
 parameters because all required information is passed by previous booting stage
 at runtime via *struct fw_dynamic_info*.
diff --git a/docs/platform/fpga-ariane.md b/docs/platform/fpga-ariane.md
index f95001f..9b1e156 100644
--- a/docs/platform/fpga-ariane.md
+++ b/docs/platform/fpga-ariane.md
@@ -7,7 +7,7 @@ Linux.
 
 The FPGA SoC currently contains the following peripherals:
 - DDR3 memory controller
-- SPI controller to conncet to an SDCard
+- SPI controller to connect to an SDCard
 - Ethernet controller
 - JTAG port (see debugging section below)
 - Bootrom containing zero stage bootloader and device tree.
diff --git a/docs/platform/sifive_fu540.md b/docs/platform/sifive_fu540.md
index 5cbca21..3dc1d28 100644
--- a/docs/platform/sifive_fu540.md
+++ b/docs/platform/sifive_fu540.md
@@ -150,7 +150,7 @@ If you want to test OpenSBI with QEMU 'sifive_u' machine, please follow the
 same instructions above, with the exception of not passing FW_FDT_PATH.
 
 This is because QEMU generates a device tree blob on the fly based on the
-command line parameters and it's compatible with the one used in the upstream
+command line parameters, and it's compatible with the one used in the upstream
 Linux kernel.
 
 When U-Boot v2021.07 (or higher) is used as the payload, as the SiFive FU540
diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
index ced784d..8bb9e91 100644
--- a/docs/platform/thead-c9xx.md
+++ b/docs/platform/thead-c9xx.md
@@ -13,7 +13,7 @@ Platform Options
 ----------------
 
 The *T-HEAD C9xx* does not have any platform-specific compile options
-because it use generic platform.
+because it uses generic platform.
 
 ```
 CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic /usr/bin/make
-- 
2.17.1


