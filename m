Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C499E9B269
	for <opensbi@archiver.kernel.org>; Tue, 24 Feb 2026 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Mime-Version:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cdCA+XsB93D+GZEUWuegKVXcKU9XQ/yT5bkjKNfWCVA=; b=wqBzL9Co9NLGST
	Qditp9AQiQY5TfdXmbUeIb1GBCTy4Mq2hQC655gG0LZXWVTSAYKWvbq8KAXgy8j9NCDpkULGL0vJQ
	y7UnHV5g+rL/zBaM4XX66+zDxjh4XaBpAvLDmCkDDp0EtPyFQexAsxdM/x6iWLggiaXeXZWk8r4fs
	DqMSPlhhLpX3qdOIv2pxNAdztkmEaDOUqRn/MjIsUzj0SeeYQexUGFrLVJfuIuP3WsvDyUM7U+XnT
	RGYPZy/VJbPDBi/13xNbrsTK1t4fcr1434KqMAem3ngdYvqDEVDeZP2GAnK6x+wFwjwa5GucWJSxO
	67PJCZDq4CbxMLzyo8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vut19-00000002AuE-317z;
	Tue, 24 Feb 2026 14:04:03 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vut16-00000002Atd-1CX3
	for opensbi@lists.infradead.org;
	Tue, 24 Feb 2026 14:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1771941829; bh=pbCq0q0XMUo0S7LsSAo7iTrHWUwe/rhlpkYgF237Q7s=;
	h=From:To:Cc:Subject:Date;
	b=oj8T2uHPhD8idXvM1o1WGR7KFLFpSp4t2iwggcZhed/ESUt56Pf02PXNYcJiNQy8H
	 8HBOnbZ2sQ/2MhseYa2zTNCIHaguj/qO9O0Xfi5r5riqNPoMWPHgoDXE+IXCobuGjs
	 yHGJpabxdWfXmkMyRvYmxshZiImrRlPgaabPPJFI=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: MMrzn/u3YKbkjJLoExMptwtKBH6KemvEt/EyixiaQ7Am7YdSdZNMrIqLQwe4wo
	 R0w9GWCPL+sGCtKlonIBlD8z0P0qUaG1hcAeb8p3eqkHBqA8NWCtxXzq03U9aJvgCLNU4jl8uUKdX
	 0XZwwXaI+iHAt+/39waKHjYKbT5nB0wG34F1iqav7W5KrktvNLIuPsnt+fomWgSOTog6gROaTOZFt
	 DC3suCUsiRoKfYu40R/K5eFZk9kTDekwXS66NWqb5jJKZqRFBPb7L6z5WSlxuDn76v+nUVWYhjDbx
	 1xhUiifOnDMbmu3vH1rhZ2OA12rXEGjFFv+9tp3vTW7Ul32Z4jTDgkkXjFtThjb46WdhCa7KGetRg
	 lxcXpwGnKhd+lGRjV4QmexzQdTJKiLOgHHt1yUmqLpDr9saB5PTUt3VR173WRiurvi0aiTyTqae8r
	 ZX9UxDOmRBNeKoj4AN9ewGcQQoeHr2epZQAbM9xsGV+V1o7aFq6l40puIeC/vYpBJ5LbVouo/xTb0
	 T5Fn8aZVOPoWtuP9GlI2AkTjB58IFsCkBoG1V1WGNILZW4mdFgl8eUQfPB8HlkvsferuPYxfL7s0w
	 k5uf0T0+IoUAHyCDnBP3Ew29EjWYWk7PTXZUqqWl0LLREddXh+ugskWagUgrHE4O38Ng8OxKLcM/U
	 AKQB2uCkaX/iAFBdgHmQXYmoyoKBhrPoLjyJhQ96F8aeVQixEVbVVZ+RvGVRISgsuHqrato4h5N02
	 47AqDGWCO+kl6KYCQ7lWRC5iG0sY2rIntgTApBjMxmYjiaLk6VDWEBEZDCi1mqtuPkOqs7vq2jw48
	 U8z0brgP3/HkEMGfOl1pSUefwuErX5Llvvk/Pa0DNqRdC6+089NimatrMjvf61xKLei2SiH9RSfGK
	 vg82yYXe9/ZFcINjO3Acc+pShhYE60HVno8GBCOw1hT9EJ9XLQWDs/fmnpri5gEOWLGtxmqQEw52n
	 pq6Ey+sl514mK8fSBdZoHXQzTtLLFr4+qIJ8+GuzZxUD5x9oTtZTDxzpuZURnrhKT9waD/pV/wGlG
	 XK3/oxbAqmYhQLYR+o52b88wSNg==
From: "=?utf-8?B?MzYyODAwMTc1?=" <362800175@qq.com>
To: "=?utf-8?B?b3BlbnNiaQ==?=" <opensbi@lists.infradead.org>
Cc: "=?utf-8?B?MzYyODAwMTc1?=" <362800175@qq.com>
Subject: [PATCH] platform: support starriver 9530
Mime-Version: 1.0
Date: Tue, 24 Feb 2026 22:03:47 +0800
X-Priority: 3
Message-ID: <tencent_A98700944AE61B8E17C72D35E968CF123708@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmsepub7-2t1771941827tu7m1evkk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_060400_827167_64F386B3 
X-CRM114-Status: GOOD (  20.25  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

From f93376ac9420836b1c23e885c2dafa30da96aeb3 Mon Sep 17 00:00:00 2001
From: nwumengfei <362800175@qq.com>
Date: Tue, 24 Feb 2026 21:34:09 +0800
Subject: [PATCH] platform: support starriver 9530

---
 lib/utils/serial/Kconfig                   |   3 +
 lib/utils/serial/objects.mk                |   1 +
 lib/utils/serial/starriver_uart.c          |  55 ++++++++
 platform/generic/Kconfig                   |   4 +
 platform/generic/configs/defconfig         |   1 +
 platform/generic/starriver/9530/9530.c     | 141 +++++++++++++++++++++
 platform/generic/starriver/9530/objects.mk |   3 +
 7 files changed, 208 insertions(+)
 create mode 100755 lib/utils/serial/starriver_uart.c
 create mode 100755 platform/generic/starriver/9530/9530.c
 create mode 100755 platform/generic/starriver/9530/objects.mk

diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
index 21619d0d..75334425 100644
--- a/lib/utils/serial/Kconfig
+++ b/lib/utils/serial/Kconfig
@@ -101,4 +101,7 @@ config SERIAL_SEMIHOSTING
 	bool "Semihosting support"
 	default n
 
+config SERIAL_STARRIVER
+	bool "Starriver support"
+	default y
 endmenu
diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
index 94cf3a4b..24b57133 100644
--- a/lib/utils/serial/objects.mk
+++ b/lib/utils/serial/objects.mk
@@ -50,3 +50,4 @@ libsbiutils-objs-$(CONFIG_SERIAL_LITEX) += serial/litex-uart.o
 libsbiutils-objs-$(CONFIG_SERIAL_UART8250) += serial/uart8250.o
 libsbiutils-objs-$(CONFIG_SERIAL_XILINX_UARTLITE) += serial/xlnx-uartlite.o
 libsbiutils-objs-$(CONFIG_SERIAL_SEMIHOSTING) += serial/semihosting.o
+libsbiutils-objs-$(CONFIG_SERIAL_STARRIVER) += serial/starriver_uart.o
diff --git a/lib/utils/serial/starriver_uart.c b/lib/utils/serial/starriver_uart.c
new file mode 100755
index 00000000..47247a93
--- /dev/null
+++ b/lib/utils/serial/starriver_uart.c
@@ -0,0 +1,55 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   362800175 <362800175@qq.com>
+ *
+ */
+ 
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_console.h>
+
+#define UART0_BASE              0x9000000UL
+#define PADDR_UARTCR            (UART0_BASE + 0x030)
+#define PADDR_UARTDR            (UART0_BASE + 0x000)
+#define PADDR_UARTSR            (UART0_BASE + 0x4)
+#define PADDR_UARTFR            (UART0_BASE + 0x18)
+#define UART0                   PADDR_UARTDR
+#define STAR_UART_TXFIFO_FULL   (1<<3)
+
+void starriver_uart_putc(char c)
+{
+    volatile uint64_t *dr_addr = (volatile uint64_t *)PADDR_UARTDR;
+    volatile uint64_t *fr_addr = (volatile uint64_t *)PADDR_UARTFR;
+
+    while(*(fr_addr) & STAR_UART_TXFIFO_FULL);
+
+    *dr_addr = c & 0xff;
+}
+
+unsigned long starriver_uart_puts(const char *str, unsigned long len)
+{
+    unsigned long i;
+    for (i = 0; i < len; i++) {
+        if (str[i] == '\n')
+            starriver_uart_putc('\r');
+        starriver_uart_putc(str[i]);
+    }
+
+    return len;
+}
+
+
+struct sbi_console_device starriver_console = {
+    .name = "starriver_uart",
+    .console_putc = starriver_uart_putc,
+    .console_puts = starriver_uart_puts,
+};
+
+int starriver_uart_init(void)
+{
+    sbi_console_set_device(&starriver_console);
+
+    return 0;
+}
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 0c11fbd2..4a783bff 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -99,6 +99,10 @@ config PLATFORM_SPACEMIT_K1
 	bool "Spacemit K1 support"
 	select FDT_HSM_SPACEMIT
 	default n
+    
+config PLATFORM_STARRIVER_9530
+	bool "StarRiver 9530 support"
+	default n
 
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/eswin/Kconfig"
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 727c5f4a..b531b73e 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -12,6 +12,7 @@ CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700=y
 CONFIG_PLATFORM_SPACEMIT_K1=y
+CONFIG_PLATFORM_STARRIVER_9530=y
 CONFIG_FDT_CACHE=y
 CONFIG_FDT_CACHE_ANDES_LLCACHE=y
 CONFIG_FDT_CACHE_SIFIVE_CCACHE=y
diff --git a/platform/generic/starriver/9530/9530.c b/platform/generic/starriver/9530/9530.c
new file mode 100755
index 00000000..37705692
--- /dev/null
+++ b/platform/generic/starriver/9530/9530.c
@@ -0,0 +1,141 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   362800175 <362800175@qq.com>
+ *
+ */
+#include <platform_override.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+
+#include <sbi_utils/irqchip/plic.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
+
+#define STARRIVER_HART_COUNT            2
+#define STARRIVER_TIMER_FREQ            375000
+#define STARRIVER_TIMER_ADDR            0x2000000
+
+#define STARRIVER_ACLINT_MSWI_ADDR      (STARRIVER_TIMER_ADDR + CLINT_MSWI_OFFSET)
+#define STARRIVER_ACLINT_MTIMER_ADDR    (STARRIVER_TIMER_ADDR + 0xbff8)
+#define STARRIVER_ACLINT_MTIMECMP_ADDR  (STARRIVER_TIMER_ADDR + 0x4000)
+
+#define STARRIVER_PLIC_ADDR             0xc000000
+#define STARRIVER_PLIC_SIZE             0x10000000
+
+#define STARRIVER_PLIC_NUM_SOURCES      0x35
+#define STARRIVER_PLIC_NUM_PRIORITIES   7
+
+#define STARRIVER_MTIMECMP_SIZE         0xbff8
+#define STARRIVER_MTIME_SIZE            0x8
+
+#define UART0_BASE                      (0x09000000UL) /*!< (UART0) Base Address */
+#define PADDR_UARTCR                    (UART0_BASE + 0x030)
+#define PADDR_UARTDR                    (UART0_BASE + 0x000)
+#define SOC_DEBUG_UART                  PADDR_UARTDR
+#define PADDR_UARTIBRD                  (UART0_BASE + 0x024)
+#define PADDR_UARTFBRD                  (UART0_BASE + 0x028)
+#define PADDR_UUARTLCR_H                (UART0_BASE + 0x02c)
+
+#define STARRIVER_TIMER_VALUE()         readl((void *)STARRIVER_ACLINT_MTIMER_ADDR)
+
+static struct plic_data plic = {
+    .addr = STARRIVER_PLIC_ADDR,
+    .size = STARRIVER_PLIC_SIZE,
+    .num_src = STARRIVER_PLIC_NUM_SOURCES,
+};
+
+static struct aclint_mtimer_data mtimer = {
+    .mtime_freq = STARRIVER_TIMER_FREQ,
+    .mtime_addr = STARRIVER_ACLINT_MTIMER_ADDR,
+    .mtime_size = STARRIVER_MTIME_SIZE,
+    .mtimecmp_addr = STARRIVER_ACLINT_MTIMECMP_ADDR,
+    .mtimecmp_size = STARRIVER_MTIMECMP_SIZE,
+    .first_hartid = 0,
+    .hart_count = STARRIVER_HART_COUNT,
+    .has_64bit_mmio = true,
+};
+
+static u32 measure_cpu_freq(u32 n)
+{
+    u32 start_mtime, delta_mtime;
+    u32 mtime_freq = STARRIVER_TIMER_FREQ;
+    u32 tmp = (u32)STARRIVER_TIMER_VALUE();
+    u32 start_mcycle, delta_mcycle, freq;
+    /* Don't start measuring until we see an mtime tick */
+    do {
+        start_mtime = (u32)STARRIVER_TIMER_VALUE();
+    } while (start_mtime == tmp);
+    start_mcycle = csr_read(mcycle);
+    do {
+        delta_mtime = (u32)STARRIVER_TIMER_VALUE() - start_mtime;
+    } while (delta_mtime < n);
+
+    delta_mcycle = csr_read(mcycle) - start_mcycle;
+
+    freq = (delta_mcycle / delta_mtime) * mtime_freq
+        + ((delta_mcycle % delta_mtime) * mtime_freq) / delta_mtime;
+
+    sbi_printf("%s: delta_mcycle = %u delta_mtime = %u mtime_freq = %u freq = %u\n",
+        __func__, delta_mcycle, delta_mtime, mtime_freq, freq);
+
+    return freq;
+}
+
+extern int starriver_uart_init(void);
+
+static int starriver_console_init(void)
+{
+    return starriver_uart_init();
+}
+
+static int starriver_irqchip_init(bool cold_boot)
+{
+    int rc = 0;
+
+    if (cold_boot) {
+        rc = plic_cold_irqchip_init(&plic);
+    }
+
+    return rc;
+}
+
+static int starriver_timer_init(bool cold_boot)
+{
+    int rc = 0;
+
+    if (cold_boot) {
+        measure_cpu_freq(100);
+        rc = aclint_mtimer_cold_init(&mtimer, NULL);
+    }
+
+    return rc;
+}
+
+static int starriver_early_init(bool cold_boot)
+{
+    starriver_console_init();
+    
+    starriver_irqchip_init(cold_boot);
+    
+    starriver_timer_init(cold_boot);
+
+    return 0;
+}
+
+static int starriver_9530_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+    generic_platform_ops.final_init = starriver_early_init;
+
+    return 0;
+}
+
+static const struct fdt_match starriver_9530_match[] = {
+	{ .compatible = "starriver,9530" },
+	{ },
+};
+
+const struct fdt_driver starriver_9530 = {
+	.match_table = starriver_9530_match,
+	.init = starriver_9530_platform_init,
+};
\ No newline at end of file
diff --git a/platform/generic/starriver/9530/objects.mk b/platform/generic/starriver/9530/objects.mk
new file mode 100755
index 00000000..b88af7cd
--- /dev/null
+++ b/platform/generic/starriver/9530/objects.mk
@@ -0,0 +1,3 @@
+carray-platform_override_modules-$(CONFIG_PLATFORM_STARRIVER_9530) += starriver_9530
+
+platform-objs-$(CONFIG_PLATFORM_STARRIVER_9530) += starriver/9530/9530.o
-- 
2.34.1

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
