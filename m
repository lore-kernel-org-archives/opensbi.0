From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 21 Jul 2023 22:40:10 +0530
Subject: [PATCH 6/6] lib: utils/reset: Remove SiFive Test reset driver
In-Reply-To: <20230721171010.2572232-1-apatel@ventanamicro.com>
References: <20230721171010.2572232-1-apatel@ventanamicro.com>
Message-ID: <20230721171010.2572232-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The functionality of SiFive Test reset driver is easily available
through Syscon reset driver so let us remove the SiFive Test driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/sys/sifive_test.h     | 17 -------
 lib/utils/reset/Kconfig                 |  5 --
 lib/utils/reset/fdt_reset_sifive_test.c | 36 --------------
 lib/utils/reset/objects.mk              |  3 --
 lib/utils/sys/Kconfig                   |  4 --
 lib/utils/sys/objects.mk                |  1 -
 lib/utils/sys/sifive_test.c             | 65 -------------------------
 platform/generic/configs/defconfig      |  1 -
 8 files changed, 132 deletions(-)
 delete mode 100644 include/sbi_utils/sys/sifive_test.h
 delete mode 100644 lib/utils/reset/fdt_reset_sifive_test.c
 delete mode 100644 lib/utils/sys/sifive_test.c

diff --git a/include/sbi_utils/sys/sifive_test.h b/include/sbi_utils/sys/sifive_test.h
deleted file mode 100644
index 0a09499..0000000
--- a/include/sbi_utils/sys/sifive_test.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-3-Clause
- *
- * Copyright (c) 2020 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#ifndef __SYS_SIFIVE_TEST_H__
-#define __SYS_SIFIVE_TEST_H__
-
-#include <sbi/sbi_types.h>
-
-int sifive_test_init(unsigned long base);
-
-#endif
diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index c0b9640..23f50c4 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -24,11 +24,6 @@ config FDT_RESET_HTIF
 	select SYS_HTIF
 	default n
 
-config FDT_RESET_SIFIVE_TEST
-	bool "SiFive Test FDT reset driver"
-	select SYS_SIFIVE_TEST
-	default n
-
 config FDT_RESET_SUNXI_WDT
 	bool "Sunxi WDT FDT reset driver"
 	default n
diff --git a/lib/utils/reset/fdt_reset_sifive_test.c b/lib/utils/reset/fdt_reset_sifive_test.c
deleted file mode 100644
index 7e0eba3..0000000
--- a/lib/utils/reset/fdt_reset_sifive_test.c
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2020 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#include <sbi/sbi_scratch.h>
-#include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/reset/fdt_reset.h>
-#include <sbi_utils/sys/sifive_test.h>
-
-static int sifive_test_reset_init(void *fdt, int nodeoff,
-				  const struct fdt_match *match)
-{
-	int rc;
-	uint64_t addr;
-
-	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
-	if (rc)
-		return rc;
-
-	return sifive_test_init(addr);
-}
-
-static const struct fdt_match sifive_test_reset_match[] = {
-	{ .compatible = "sifive,test1" },
-	{ },
-};
-
-struct fdt_reset fdt_reset_sifive_test = {
-	.match_table = sifive_test_reset_match,
-	.init = sifive_test_reset_init,
-};
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index 17287a5..ea9cedc 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -20,9 +20,6 @@ libsbiutils-objs-$(CONFIG_FDT_RESET_GPIO) += reset/fdt_reset_gpio.o
 carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_HTIF) += fdt_reset_htif
 libsbiutils-objs-$(CONFIG_FDT_RESET_HTIF) += reset/fdt_reset_htif.o
 
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SIFIVE_TEST) += fdt_reset_sifive_test
-libsbiutils-objs-$(CONFIG_FDT_RESET_SIFIVE_TEST) += reset/fdt_reset_sifive_test.o
-
 carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SUNXI_WDT) += fdt_reset_sunxi_wdt
 libsbiutils-objs-$(CONFIG_FDT_RESET_SUNXI_WDT) += reset/fdt_reset_sunxi_wdt.o
 
diff --git a/lib/utils/sys/Kconfig b/lib/utils/sys/Kconfig
index 76190f8..a22191c 100644
--- a/lib/utils/sys/Kconfig
+++ b/lib/utils/sys/Kconfig
@@ -10,8 +10,4 @@ config SYS_HTIF
 	bool "Host transfere interface (HTIF) support"
 	default n
 
-config SYS_SIFIVE_TEST
-	bool "SiFive test support"
-	default n
-
 endmenu
diff --git a/lib/utils/sys/objects.mk b/lib/utils/sys/objects.mk
index 03d6740..409d7e8 100644
--- a/lib/utils/sys/objects.mk
+++ b/lib/utils/sys/objects.mk
@@ -8,5 +8,4 @@
 #
 
 libsbiutils-objs-$(CONFIG_SYS_HTIF) += sys/htif.o
-libsbiutils-objs-$(CONFIG_SYS_SIFIVE_TEST) += sys/sifive_test.o
 libsbiutils-objs-$(CONFIG_SYS_ATCSMU) += sys/atcsmu.o
diff --git a/lib/utils/sys/sifive_test.c b/lib/utils/sys/sifive_test.c
deleted file mode 100644
index a9ebb5c..0000000
--- a/lib/utils/sys/sifive_test.c
+++ /dev/null
@@ -1,65 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-3-Clause
- *
- * Copyright (c) 2020 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#include <sbi/riscv_io.h>
-#include <sbi/sbi_ecall_interface.h>
-#include <sbi/sbi_system.h>
-#include <sbi_utils/sys/sifive_test.h>
-
-#define FINISHER_FAIL		0x3333
-#define FINISHER_PASS		0x5555
-#define FINISHER_RESET		0x7777
-
-static void *sifive_test_base;
-
-static int sifive_test_system_reset_check(u32 type, u32 reason)
-{
-	switch (type) {
-	case SBI_SRST_RESET_TYPE_SHUTDOWN:
-	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
-	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
-		return 1;
-	}
-
-	return 0;
-}
-
-static void sifive_test_system_reset(u32 type, u32 reason)
-{
-	/*
-	 * Tell the "finisher" that the simulation
-	 * was successful so that QEMU exits
-	 */
-	switch (type) {
-	case SBI_SRST_RESET_TYPE_SHUTDOWN:
-		if (reason == SBI_SRST_RESET_REASON_NONE)
-			writew(FINISHER_PASS, sifive_test_base);
-		else
-			writew(FINISHER_FAIL, sifive_test_base);
-		break;
-	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
-	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
-		writew(FINISHER_RESET, sifive_test_base);
-		break;
-	}
-}
-
-static struct sbi_system_reset_device sifive_test_reset = {
-	.name = "sifive_test",
-	.system_reset_check = sifive_test_system_reset_check,
-	.system_reset = sifive_test_system_reset
-};
-
-int sifive_test_init(unsigned long base)
-{
-	sifive_test_base = (void *)base;
-	sbi_system_reset_add_device(&sifive_test_reset);
-
-	return 0;
-}
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 5008c7e..634d410 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -24,7 +24,6 @@ CONFIG_FDT_RESET=y
 CONFIG_FDT_RESET_ATCWDT200=y
 CONFIG_FDT_RESET_GPIO=y
 CONFIG_FDT_RESET_HTIF=y
-CONFIG_FDT_RESET_SIFIVE_TEST=y
 CONFIG_FDT_RESET_SUNXI_WDT=y
 CONFIG_FDT_RESET_SYSCON=y
 CONFIG_FDT_RESET_THEAD=y
-- 
2.34.1


