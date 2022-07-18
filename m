From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Jul 2022 20:26:09 +0530
Subject: [PATCH v2 12/14] platform: generic: Use kconfig for enabling/disabling overrides
In-Reply-To: <20220718145611.2211638-1-apatel@ventanamicro.com>
References: <20220718145611.2211638-1-apatel@ventanamicro.com>
Message-ID: <20220718145611.2211638-13-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update generic platform to use kconfig for enabling/disabling
platform overrides. We also enable all platform overrides in generic
platform defconfig.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 platform/generic/Kconfig              | 18 ++++++++++++++++++
 platform/generic/allwinner/objects.mk |  4 ++--
 platform/generic/configs/defconfig    |  3 +++
 platform/generic/sifive/objects.mk    |  8 ++++----
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index c1a77b3..c76bd12 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -6,3 +6,21 @@ config PLATFORM_GENERIC
 	select FDT_DOMAIN
 	select FDT_PMU
 	default y
+
+if PLATFORM_GENERIC
+
+config PLATFORM_ALLWINNER_D1
+	bool "Allwinner D1 support"
+	depends on FDT_IRQCHIP_PLIC
+	default n
+
+config PLATFORM_SIFIVE_FU540
+	bool "SiFive FU540 support"
+	default n
+
+config PLATFORM_SIFIVE_FU740
+	bool "SiFive FU740 support"
+	depends on FDT_RESET && FDT_I2C
+	default n
+
+endif
diff --git a/platform/generic/allwinner/objects.mk b/platform/generic/allwinner/objects.mk
index 9e36ab6..447cdf1 100644
--- a/platform/generic/allwinner/objects.mk
+++ b/platform/generic/allwinner/objects.mk
@@ -2,5 +2,5 @@
 # SPDX-License-Identifier: BSD-2-Clause
 #
 
-carray-platform_override_modules-y += sun20i_d1
-platform-objs-y += allwinner/sun20i-d1.o
+carray-platform_override_modules-$(CONFIG_PLATFORM_ALLWINNER_D1) += sun20i_d1
+platform-objs-$(CONFIG_PLATFORM_ALLWINNER_D1) += allwinner/sun20i-d1.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index d56cef2..2a75394 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,3 +1,6 @@
+CONFIG_PLATFORM_ALLWINNER_D1=y
+CONFIG_PLATFORM_SIFIVE_FU540=y
+CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_FDT_GPIO=y
 CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_I2C=y
diff --git a/platform/generic/sifive/objects.mk b/platform/generic/sifive/objects.mk
index c17e2df..d75e444 100644
--- a/platform/generic/sifive/objects.mk
+++ b/platform/generic/sifive/objects.mk
@@ -2,8 +2,8 @@
 # SPDX-License-Identifier: BSD-2-Clause
 #
 
-carray-platform_override_modules-y += sifive_fu540
-platform-objs-y += sifive/fu540.o
+carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive_fu540
+platform-objs-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive/fu540.o
 
-carray-platform_override_modules-y += sifive_fu740
-platform-objs-y += sifive/fu740.o
+carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_FU740) += sifive_fu740
+platform-objs-$(CONFIG_PLATFORM_SIFIVE_FU740) += sifive/fu740.o
-- 
2.34.1


