Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1914AD65C49
	for <opensbi@archiver.kernel.org>; Wed, 17 Dec 2025 13:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+pUDnaepSBeSlPShqRE49K67ljddvVXcaN140128qM=; b=RzmBKt1CSJVGdt
	gfwbIqHpiL86tTwr3BZQZbcr5xXGxwEnhkXMrul6gXV74PNhWlkYBBZh2K8ZyVP0eSbhL1G9D9HtA
	jKpRd8vuZuKRXvKaJ3ek/SJV9GFTPFzmLowaqHbghrkqESjn7Pyv1jBQdEHcSW7KKB86NUJ8/bEvZ
	UubxnM2Y/i3//RDy3mKQA/Ru9ZLZ73yHmxxD+nq1WpUxpfE6PsubRZmE5BOgtLJtVEI4iWbyMrO0m
	+YGgJcm2ev3+6e8w3vJq265dnA7pbZfJLmktHYrRIPxUx0wL8DcH742x0K65Oxt7V/dqZ6fg2fzGe
	JlUxHV5FYxYq8SonKSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrdH-00000006r7k-0h8z;
	Wed, 17 Dec 2025 13:31:59 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrdD-00000006r4f-3LR0
	for opensbi@lists.infradead.org;
	Wed, 17 Dec 2025 13:31:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso6169470b3a.3
        for <opensbi@lists.infradead.org>; Wed, 17 Dec 2025 05:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765978314; x=1766583114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBGVFxBufiOQDi3xuMjvHNIuqXTuHlBXmwhNn7DRC5I=;
        b=lfQJRNzpB5S4tMLbSFNbt/DrQRkAPormVvwVj/VdxK6UgQ7BIJrXmA/pLtXCHq0pnl
         N18fV21M9pEhvxQLlY6Nh7OvoZX5B+buTfL/tn+SWwxz8P4TJtidj49X2lopptUucTzO
         WlOZIIhVZfElGo8D1phCCIelQWCgEl3jyer4wCrxgJXy7/Cy3TmMAdEw8AS7PJf+v951
         MSc63A9j8jixsUyPUfHrM8uxxh7ND5R0cECByeE9AjAFm3gXBua2+lnWjrnSlAD66fY9
         cT+iyJhTZngNA7Y0Q8/xad/tUdAvzjfPYjuaS/dd+ruGbgdnp/MsS19E1ZTBkiWDNJrZ
         n3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978314; x=1766583114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IBGVFxBufiOQDi3xuMjvHNIuqXTuHlBXmwhNn7DRC5I=;
        b=Mx1FqS4ggCmokum1VhiysHKBkpzvHAKCBk7rWYPozyRq6lM1MSIY1WbxQl6ZG6OKvy
         8ZQGAGYKT3geexd18yQsJKWSzsKyX3EzEGiSw12KQb3C+AwzkQikgrmwnYKvXyMHkDZD
         eXjV6bMRZmb4zUsr/8usYwR6l+dVIkuVoTrs04PhKLWNSwcPqo0Nydjk4hjoh7DfBTWZ
         GvEjvxFZDHEiILSnAHvuV2ga0o29BfYJVStZSnJ71gU+DAQ4tdYAuH82/wUYwwTolowZ
         4fBJ0DPaaf2wGGJpA04HwiAyyyQgtTydXLNcEiv+3am/hGXXgibJvtexNpFJ0kxG31FO
         W8gw==
X-Gm-Message-State: AOJu0YwNSwhxVGEHDL/5e/kGi589YEdnhK9vTcAwUAGBjtlRirrNDnFj
	VhRolF4zOqu2sv7rXRkRVSfEfGsoSkapqC3dBplsFJ6F1q+T0SEiqwka5EVYOA==
X-Gm-Gg: AY/fxX7zCQZ3LT+bfI1xE87V6GI+6YSPM0y3lj6/zWuWiLZ+wkrbShYDxmL2gbiJUXP
	hTXz9NSLbD3z+li+VGvWf5U15+i1Sdoea7wOLrBRHCUAZZLc5+TDmKNMnLYiKHWKgVpZ+RGd4xc
	cFge5uVqdyHyoqnjMLzLoAWhKfpID32p17D0Mhcd6F31ybtid4mfU7xIAC3IIJwX+ANrDbz0aBg
	iOyv1a0vmZqU4UUbrg47W8e2cJTe5dxvMC4fY7tpYDd5I8fdhS3VIkhg3hAr08uWaD39aY0ZlGL
	BhNxhv6K03T7GC4YMV8EyZgdEGdoWtnTU5cAwVeaRs22JEq+EmIIf0XyLv2Pt59fUcqqwOc4SLe
	kXhq0xkoQF9PSNwuUldnHhZ4TQbc1Jp45zQfbJdsmKq5L3rod0D4cYb6RpYK1jA7KyQRFKd1x65
	0LfaDYh0jexgKPtcVLxdBWx2E=
X-Google-Smtp-Source: AGHT+IFxU5QIhKeZTFcgQUP73VQXxtAfuAv9707utTuErms3XsKqw8RqKU9KmnfPx9koJT2oyJLpWw==
X-Received: by 2002:a05:6a00:b483:b0:77f:efd:829b with SMTP id d2e1a72fcca58-7f66fddfe8cmr17842619b3a.22.1765978314278;
        Wed, 17 Dec 2025 05:31:54 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc1c4ef2sm2809104b3a.65.2025.12.17.05.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:31:53 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v5 7/7] platform: generic: eswin: Add shutdown/reboot support for Hifive Premier P550
Date: Wed, 17 Dec 2025 05:29:59 -0800
Message-Id: <20251217132959.545197-8-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217132959.545197-1-ganboing@gmail.com>
References: <20251217132959.545197-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_053155_853532_2C4AFFB1 
X-CRM114-Status: GOOD (  23.86  )
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
index 6942a107..3d4a4c79 100644
--- a/platform/generic/eswin/objects.mk
+++ b/platform/generic/eswin/objects.mk
@@ -6,6 +6,7 @@
 
 carray-platform_override_modules-$(CONFIG_PLATFORM_ESWIN_EIC770X) += eswin_eic7700
 platform-objs-$(CONFIG_PLATFORM_ESWIN_EIC770X) += eswin/eic770x.o
+platform-objs-$(CONFIG_PLATFORM_ESWIN_EIC770X) += eswin/hfp.o
 
 FW_PAYLOAD=y
 FW_PAYLOAD_OFFSET=0x200000
diff --git a/platform/generic/include/eswin/eic770x.h b/platform/generic/include/eswin/eic770x.h
index 9ea95849..24d6eb88 100644
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
