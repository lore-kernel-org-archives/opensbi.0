From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 13 Oct 2022 10:29:43 +0800
Subject: [PATCH v3 05/13] platform: andes/ae350: Use kconfig to set platform version and default name
In-Reply-To: <20221013022951.5206-1-peterlin@andestech.com>
References: <20221013022951.5206-1-peterlin@andestech.com>
Message-ID: <20221013022951.5206-6-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch makes andes platform name and version can be set in
menuconfig interface.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes v2 -> v3
  - No change since v2
---
 platform/andes/ae350/Kconfig    | 18 ++++++++++++++++++
 platform/andes/ae350/platform.c |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
index d57f19f..3abad04 100644
--- a/platform/andes/ae350/Kconfig
+++ b/platform/andes/ae350/Kconfig
@@ -6,3 +6,21 @@ config PLATFORM_ANDES_AE350
 	select IRQCHIP_PLIC
 	select SERIAL_UART8250
 	default y
+
+if PLATFORM_ANDES_AE350
+
+config PLATFORM_ANDES_AE350_NAME
+	string "Platform default name"
+	default "Andes AE350"
+
+config PLATFORM_ANDES_AE350_MAJOR_VER
+	int "Platform major version"
+	range 0 65535
+	default 0
+
+config PLATFORM_ANDES_AE350_MINOR_VER
+	int "Platform minor version"
+	range 0 65535
+	default 1
+
+endif
diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index 33f9c4c..c07f6be 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -168,8 +168,10 @@ const struct sbi_platform_operations platform_ops = {
 
 const struct sbi_platform platform = {
 	.opensbi_version = OPENSBI_VERSION,
-	.platform_version = SBI_PLATFORM_VERSION(0x0, 0x01),
-	.name = "Andes AE350",
+	.platform_version =
+		SBI_PLATFORM_VERSION(CONFIG_PLATFORM_ANDES_AE350_MAJOR_VER,
+				     CONFIG_PLATFORM_ANDES_AE350_MINOR_VER),
+	.name = CONFIG_PLATFORM_ANDES_AE350_NAME,
 	.features = SBI_PLATFORM_DEFAULT_FEATURES,
 	.hart_count = AE350_HART_COUNT,
 	.hart_stack_size = SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
-- 
2.34.1


