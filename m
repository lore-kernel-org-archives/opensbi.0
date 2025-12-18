Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976F0D6ACE1
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Cn8e91dv+2QZhkgzzcOKCzznuEIV+mRijIHPCKgZHc=; b=YOeDLq3l7tO+Ht
	QKVbaD4qd5PU9MUJYl4OuD03+Xr2/N8yYLULYoVsHc9xEE5imE4VOykbXg/19uKqkmz5QWg0loNBW
	pRgv3WQM9mmgEIIN9Vb909qIH9q+fZTs3ip3PGMVDKqNlhR4hFTD2YstnjFgPPTp3ODZNpgH/rS6J
	e3m+SmSazn9GFM7vNcLWgUigyt3g2W3S3HSEVWOr41M5eMOQkFSSETFuRRNoiDRzZETZhsO3LIjLQ
	kOTe1d8OmLyxzNW48wwfXcfrII7yfa4HB3Fd18pEyQOnjY+viXnVIKqqkaJphqUbjKBXF4OTRhrV+
	IVTf6TTy/uEOZ9/GndQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBV6-00000008Fn0-3YDl;
	Thu, 18 Dec 2025 10:44:52 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBV4-00000008Fjx-1Z3N
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 10:44:51 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso305423b3a.0
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 02:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766054689; x=1766659489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIkZS9ZKu004UJyb7/JJ61oeTTEV3oNBp2atfy76wQ0=;
        b=mWzfz0xZPVR+whxgq162OpQXz5LGYf2ePnxwMncW7PxUKb3lQpBHxlWmzazTnUE26J
         xF1tMajVIMj1j7pvDMfuz2F9BHKFzaymq2gTjGd4j6t93Wt5zQMG9cXEVpLGHhwApJV5
         06J0gNdiTDdw7ajAHO0/AKkT9l1XBLx/oRSrlxuF/V5DTE7wIV0DqypPKqLLWLTM8TqT
         sGgo0xEKeEPH/7qqV5ACv4ILDYv6JeglnsUDJSLnnuBc3juJIlUw2tm+O6jF5Db6S3i5
         5N7DDhcux5mIPI7e5vXpamFjDX38pUEtX0I8Q6AU8DE7EvfuNIjD5bPPbs36uIjCzYCq
         l6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054689; x=1766659489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIkZS9ZKu004UJyb7/JJ61oeTTEV3oNBp2atfy76wQ0=;
        b=gEGVPnSUm7XE0fkGW0981uixT7vwZt6Dt0bngoWRcgTxgd3kufshYuzE31hdggKscJ
         TRDVOOvi7mgQaRRqRJDDMp84B8ll83swLDS5eUjl1jFgAS48ltb5d+5XN3n8Kd1OimRS
         1xgP+wQy9Qt17w7kZ4OpQNFHjBDgWa00xbkkr6BZk+hLVFYGgNYbucXT0a2fRtK+6EgO
         H0pDBcFqeipD1jH6toFDLJa6DUkUu7rXL6jSuSa5eZAJNzEB+XhxOhGCQ2BDjQfMBsts
         WrmmmzfY6o+S9pyT7HrF+yeCiUsHS2/6d0mIOjU/bKfRQFQ0iyutU5+PA+2kG+sujulQ
         UFRg==
X-Gm-Message-State: AOJu0YwPh0t9Fxdo/DpNyDjacfZW8elpoXCkLnDu54poidMdRNxBWX6g
	X6hNMoPsstgaINYxr+CQLpR26HOMNeyUR0AQtoU/bHOYWJ6zgfquEgBcsh5TuA==
X-Gm-Gg: AY/fxX5IqPv9qP9iftOla/AwEgdlo416sdOegVzBRN3mIHHtJ4uU4RfYex6KDkQutCx
	8pcs3xtYimMaCVQOqE3WfrlNJ7nirU0JILs/iILDz1upwjSKFoRQ4J+7+Yak+R8u1iyzLKjyILv
	huBGsi+jJPjI8KvxIwW7ZrA4DKww90We52egClVDdOm7l4+k+z1uEcYORVO1eZyh7yBhAVmvHRv
	k+qptujUD/5zQMfvjw9NlIxyTQjnI8iU6sUieyfMVvjbaxbc3SU1j0kMJLWjVEllJunrE5HYhJt
	rw+vT5+aIg3JUQY96MGOMXCeEE3aGispnYYJDwVPtHRd+B1A0f1ZMMhKS0YskAcYwCdwsnUFQ48
	5g5mkdpE7NTmaGtvlkjiCnGYq8cydEsqmuz4cqik7daZOmkl27uyP/T/aVRsSWDkH9tA+9ABaEB
	sFgO/1SGZI5m2Off62HQATtRw=
X-Google-Smtp-Source: AGHT+IHARdQcPF7x1HTkc8Lq1junpykO2JHM2ujGoKednqFU5mzjSWB/gKRDc56pAajkTDhcIOljtw==
X-Received: by 2002:a05:6a00:b486:b0:7e8:3fcb:bc4e with SMTP id d2e1a72fcca58-7fe0d1bbc71mr2799681b3a.35.1766054688902;
        Thu, 18 Dec 2025 02:44:48 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe11d3e004sm2264795b3a.15.2025.12.18.02.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:44:48 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v6 7/7] platform: generic: eswin: Add shutdown/reboot support for Hifive Premier P550
Date: Thu, 18 Dec 2025 02:42:43 -0800
Message-Id: <20251218104243.562667-8-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218104243.562667-1-ganboing@gmail.com>
References: <20251218104243.562667-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024450_431111_3670E289 
X-CRM114-Status: GOOD (  24.00  )
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

Hifive Premier P550[1] is a Mini-DTX form factor board with EIC7700X.
It has a STM32F407VET6 onboard MCU acting as the BMC, controlling
ATX power on/off while providing remote management features. The
EIC7700X SoC/SoM communicates with the BMC via UART2, using ESWIN's
protocol. The messages transmitted are fixed sizes (267 bytes), and
depending on the type, can be directional or bi-directional. The
shutdown and cold reboot requests are directional messages from SoC
to BMC (NOTIFY type) with CMD_POWER_OFF or CMD_RESTART. The payload
of shutdown/cold reboot requests should be empty and are ignored by
the BMC at the moment. A HFP (Hifive Premier) specific reset device
is registered in addition to the SoC reset device. For shutdown and
cold reboot, the board-level reset takes precedence.

The definitions of the SoC <-> BMC message protocol is taken from
ESWIN's repo [2]. The only file used from that repo is `hf_common.h`
It's disjunctively dual licensed as (GPL-2.0-only OR BSD-2-Clause),
hence, compatible with the license of OpenSBI. It's heavily modified
and renamed as platform/generic/include/eswin/hfp.h. The author and
copyright in the original file are retained.

Validated shutdown/core reboot working on Hifive Premier P550.

[1] https://www.sifive.com/boards/hifive-premier-p550#documentation
[2] https://github.com/eswincomputing/hifive-premier-p550-mcu-patches.git

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 platform/generic/eswin/eic770x.c         |   2 +
 platform/generic/eswin/hfp.c             | 118 +++++++++++++++++++++++
 platform/generic/eswin/objects.mk        |   1 +
 platform/generic/include/eswin/eic770x.h |  22 +++++
 platform/generic/include/eswin/hfp.h     |  64 ++++++++++++
 5 files changed, 207 insertions(+)
 create mode 100644 platform/generic/eswin/hfp.c
 create mode 100644 platform/generic/include/eswin/hfp.h

diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index bce53a19..7330df9f 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/sbi_hart_protection.h>
 #include <eswin/eic770x.h>
+#include <eswin/hfp.h>
 
 static struct sbi_hart_protection eswin_eic7700_pmp_protection;
 
@@ -393,6 +394,7 @@ static int eswin_eic7700_platform_init(const void *fdt, int nodeoff,
 }
 
 static const struct fdt_match eswin_eic7700_match[] = {
+	{ .compatible = "sifive,hifive-premier-p550", .data = &hfp_override },
 	{ .compatible = "eswin,eic7700" },
 	{ },
 };
diff --git a/platform/generic/eswin/hfp.c b/platform/generic/eswin/hfp.c
new file mode 100644
index 00000000..eabed191
--- /dev/null
+++ b/platform/generic/eswin/hfp.c
@@ -0,0 +1,118 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Bo Gan <ganboing@gmail.com>
+ *
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_system.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi_utils/serial/uart8250.h>
+#include <eswin/eic770x.h>
+#include <eswin/hfp.h>
+
+/* HFP -> HiFive Premier P550 */
+
+#define HFP_MCU_UART_PORT	2
+#define HFP_MCU_UART_BAUDRATE	115200
+
+static unsigned long eic770x_sysclk_rate(void)
+{
+	/* syscfg clock is a mux of 24Mhz xtal clock and spll0_fout3/divisor */
+	uint32_t syscfg_clk = readl_relaxed((void*)EIC770X_SYSCRG_SYSCLK);
+
+	if (EIC770X_SYSCLK_SEL(syscfg_clk))
+		return EIC770X_XTAL_CLK_RATE;
+
+	return EIC770X_SPLL0_OUT3_RATE / EIC770X_SYSCLK_DIV(syscfg_clk);
+}
+
+static void eic770x_enable_uart_clk(unsigned port)
+{
+	uint32_t lsp_clk_en = readl_relaxed((void*)EIC770X_SYSCRG_LSPCLK0);
+
+	lsp_clk_en |= EIC770X_UART_CLK_BIT(port);
+	writel(lsp_clk_en, (void*)EIC770X_SYSCRG_LSPCLK0);
+}
+
+static void hfp_send_bmc_msg(uint8_t type, uint8_t cmd,
+			     const uint8_t *data, uint8_t len)
+{
+	unsigned long sysclk_rate;
+	struct uart8250_device uart_dev;
+	union {
+		struct hfp_bmc_message msg;
+		char as_char[sizeof(struct hfp_bmc_message)];
+	} xmit = {{
+		.header_magic = MAGIC_HEADER,
+		.type = type,
+		.cmd = cmd,
+		.data_len = len,
+		.tail_magic = MAGIC_TAIL,
+	}};
+
+	/**
+	 * Re-initialize UART.
+	 * S-mode OS may have changed the clock frequency of syscfg clock
+	 * which is the clock of all low speed peripherals, including UARTs.
+	 * S-mode OS may also have disabled the UART2 clock via clock gate.
+	 * (lsp_clk_en0 bit 17-21 controls UART0-4). Thus, we re-calculate
+	 * the clock rate, enable UART clock, and re-initialize UART.
+	 */
+
+	sysclk_rate = eic770x_sysclk_rate();
+	eic770x_enable_uart_clk(HFP_MCU_UART_PORT);
+
+	uart8250_device_init(&uart_dev,
+			EIC770X_UART(HFP_MCU_UART_PORT),
+			sysclk_rate,
+			HFP_MCU_UART_BAUDRATE,
+			EIC770X_UART_REG_SHIFT,
+			EIC770X_UART_REG_WIDTH,
+			0, 0);
+
+	sbi_memcpy(&xmit.msg.data, data, len);
+	hfp_bmc_checksum_msg(&xmit.msg);
+
+	for (unsigned int i = 0; i < sizeof(xmit.as_char); i++)
+		uart8250_device_putc(&uart_dev, xmit.as_char[i]);
+}
+
+static int hfp_system_reset_check(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+		return 255;
+	default:
+		return 0;
+	}
+}
+
+static void hfp_system_reset(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+		hfp_send_bmc_msg(HFP_MSG_NOTIFY, HFP_CMD_POWER_OFF,
+				NULL, 0);
+		break;
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+		hfp_send_bmc_msg(HFP_MSG_NOTIFY, HFP_CMD_RESTART,
+				NULL, 0);
+		break;
+	}
+	sbi_hart_hang();
+}
+
+static struct sbi_system_reset_device hfp_reset = {
+	.name = "hfp_reset",
+	.system_reset_check = hfp_system_reset_check,
+	.system_reset = hfp_system_reset,
+};
+
+const struct eic770x_board_override hfp_override = {
+	.reset_dev = &hfp_reset,
+};
diff --git a/platform/generic/eswin/objects.mk b/platform/generic/eswin/objects.mk
index be5420ce..a7165aa3 100644
--- a/platform/generic/eswin/objects.mk
+++ b/platform/generic/eswin/objects.mk
@@ -7,4 +7,5 @@
 ifeq ($(PLATFORM_RISCV_XLEN), 64)
 carray-platform_override_modules-$(CONFIG_PLATFORM_ESWIN_EIC770X) += eswin_eic7700
 platform-objs-$(CONFIG_PLATFORM_ESWIN_EIC770X) += eswin/eic770x.o
+platform-objs-$(CONFIG_PLATFORM_ESWIN_EIC770X) += eswin/hfp.o
 endif
diff --git a/platform/generic/include/eswin/eic770x.h b/platform/generic/include/eswin/eic770x.h
index b1994669..67764ec0 100644
--- a/platform/generic/include/eswin/eic770x.h
+++ b/platform/generic/include/eswin/eic770x.h
@@ -48,7 +48,16 @@ struct eic770x_board_override {
 #define EIC770X_SYSPORT_SIZE	0x20000000UL
 #define EIC770X_SYSPORT_BASE(d)	(0x40000000UL + EIC770X_SYSPORT_SIZE * (d))
 #define EIC770X_SYSPORT_LOCAL	EIC770X_SYSPORT_BASE(current_hart_die())
+
+#define EIC770X_UART0		(EIC770X_SYSPORT_LOCAL + 0x10900000UL)
+#define EIC770X_UART_SIZE	0x10000UL
+#define EIC770X_UART(x)		(EIC770X_UART0 + EIC770X_UART_SIZE * (x))
+#define EIC770X_UART_REG_SHIFT	2
+#define EIC770X_UART_REG_WIDTH	4
+
 #define EIC770X_SYSCRG		(EIC770X_SYSPORT_LOCAL + 0x11828000UL)
+#define EIC770X_SYSCRG_LSPCLK0	(EIC770X_SYSCRG + 0x200UL)
+#define EIC770X_SYSCRG_SYSCLK	(EIC770X_SYSCRG + 0x20cUL)
 #define EIC770X_SYSCRG_RST	(EIC770X_SYSCRG + 0x300UL)
 #define EIC770X_SYSCRG_RST_VAL	0x1AC0FFE6UL
 
@@ -76,4 +85,17 @@ struct eic770x_board_override {
 #define EIC770X_TO_UNCACHED(x)	((x) - EIC770X_CACHED_BASE + \
 				EIC770X_UNCACHED_BASE)
 
+/* Clock definitions */
+#define EIC770X_XTAL_CLK_RATE	24000000UL
+#define EIC770X_SPLL0_OUT1_RATE	1600000000UL
+#define EIC770X_SPLL0_OUT2_RATE	800000000UL
+#define EIC770X_SPLL0_OUT3_RATE	400000000UL
+#define EIC770X_UART_CLK_BIT(x)	(1UL << ((x) + 17))
+#define EIC770X_SYSCLK_SEL(x)	((x) & 1)
+#define EIC770X_SYSCLK_DIV(x) 				\
+	({ 						\
+		uint32_t divisor = ((x) >> 4) & 7; 	\
+		divisor > 2 ? divisor : 2; 		\
+	})
+
 #endif
diff --git a/platform/generic/include/eswin/hfp.h b/platform/generic/include/eswin/hfp.h
new file mode 100644
index 00000000..6ed1b568
--- /dev/null
+++ b/platform/generic/include/eswin/hfp.h
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Copyright (c) 2024 Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ * Authors:
+ *   Lin Min <linmin@eswincomputing.com>
+ *   Bo Gan <ganboing@gmail.com>
+ *
+ * Adapted from Core/Inc/hf_common.h from ESWIN's Hifive Premier P550
+ * onboard BMC (MCU) source repo:
+ *   https://github.com/eswincomputing/hifive-premier-p550-mcu-patches.git
+ *
+ */
+
+#ifndef __ESWIN_HFP_H__
+#define __ESWIN_HFP_H__
+
+#include <sbi/sbi_types.h>
+
+enum hfp_bmc_msg {
+	HFP_MSG_REQUEST = 1,
+	HFP_MSG_REPLY,
+	HFP_MSG_NOTIFY,
+};
+
+enum hfp_bmc_cmd {
+	HFP_CMD_POWER_OFF = 1,
+	HFP_CMD_REBOOT,
+	HFP_CMD_READ_BOARD_INFO,
+	HFP_CMD_CONTROL_LED,
+	HFP_CMD_PVT_INFO,
+	HFP_CMD_BOARD_STATUS,
+	HFP_CMD_POWER_INFO,
+	HFP_CMD_RESTART, // cold reboot with power off/on
+};
+
+#define MAGIC_HEADER	0xA55AAA55
+#define MAGIC_TAIL	0xBDBABDBA
+
+struct hfp_bmc_message {
+	uint32_t header_magic;
+	uint32_t task_id;
+	uint8_t type;
+	uint8_t cmd;
+	uint8_t result;
+	uint8_t data_len;
+	uint8_t data[250];
+	uint8_t checksum;
+	uint32_t tail_magic;
+} __packed;
+
+static inline void hfp_bmc_checksum_msg(struct hfp_bmc_message *msg)
+{
+	msg->checksum = 0;
+	msg->checksum ^= msg->type;
+	msg->checksum ^= msg->cmd;
+	msg->checksum ^= msg->data_len;
+	for (uint8_t i = 0; i != msg->data_len; i++)
+		msg->checksum ^= msg->data[i];
+}
+
+extern const struct eic770x_board_override hfp_override;
+
+#endif
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
