From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  4 Aug 2022 17:34:26 +0530
Subject: [PATCH v6 14/17] platform: generic: Use kconfig to set platform version and default name
In-Reply-To: <20220804120429.59444-1-apatel@ventanamicro.com>
References: <20220804120429.59444-1-apatel@ventanamicro.com>
Message-ID: <20220804120429.59444-15-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform version and default name should be set based
on kconfig options so that users can override it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
---
 platform/generic/Kconfig    | 14 ++++++++++++++
 platform/generic/platform.c |  6 ++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index c76bd12..63d1be4 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -9,6 +9,20 @@ config PLATFORM_GENERIC
 
 if PLATFORM_GENERIC
 
+config PLATFORM_GENERIC_NAME
+	string "Platform default name"
+	default "Generic"
+
+config PLATFORM_GENERIC_MAJOR_VER
+	int "Platform major version"
+	range 0 65535
+	default 0
+
+config PLATFORM_GENERIC_MINOR_VER
+	int "Platform minor version"
+	range 0 65535
+	default 1
+
 config PLATFORM_ALLWINNER_D1
 	bool "Allwinner D1 support"
 	depends on FDT_IRQCHIP_PLIC
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index bf93af6..cc3620f 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -265,8 +265,10 @@ const struct sbi_platform_operations platform_ops = {
 
 struct sbi_platform platform = {
 	.opensbi_version	= OPENSBI_VERSION,
-	.platform_version	= SBI_PLATFORM_VERSION(0x0, 0x01),
-	.name			= "Generic",
+	.platform_version	=
+		SBI_PLATFORM_VERSION(CONFIG_PLATFORM_GENERIC_MAJOR_VER,
+				     CONFIG_PLATFORM_GENERIC_MINOR_VER),
+	.name			= CONFIG_PLATFORM_GENERIC_NAME,
 	.features		= SBI_PLATFORM_DEFAULT_FEATURES,
 	.hart_count		= SBI_HARTMASK_MAX_BITS,
 	.hart_index2id		= generic_hart_index2id,
-- 
2.34.1


