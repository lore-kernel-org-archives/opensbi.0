Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D537C3600B
	for <opensbi@archiver.kernel.org>; Thu, 27 Mar 2025 06:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qG7mmMshKNapoh4DLdcBL0RFLoAf+TtEPl6iXNbcTIQ=; b=1L8FGHCLY3o2wR
	GWEu+/Lw7crTtB0ch0n7OYSqRX58mqqRJso0k3zjz25Ds9GXBseanSYCTCU/3zEQNY98uyNTUd2ad
	8yl6esVtnKnD3jQWRt6rKeBDhOF2bvT8DBpjLTmFZ9CJRwnazWDg7JZQDnNGSvr8QNwvehPgoeSsd
	rmxgLI2+E6IYRCwMljSDZKT4puNUese93wDCvT3HGozyaRtFMXQTI6GQT9ANpsrC7qxqSiu/iupri
	b19aEQH+NojLhODfV0l4CcMXb4wNe+CWsda/FVMKBNY/muPErFW1PrqQuw5474UeSXJBq2BbngbEr
	58OFNfVvrNb5yQH9eNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txh5e-0000000AIEn-31zJ;
	Thu, 27 Mar 2025 06:51:46 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txh5b-0000000AIEP-1Fhj
	for opensbi@lists.infradead.org;
	Thu, 27 Mar 2025 06:51:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1743058299; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kGHYEVn+dLEiQJKM1QOR3I7eTR1nB8SHKh39KmJv/jMDlDr9w2LoA+K/t0ky4WrCSxRfaZgOXYYqqTU3X8Hmbx2W4hYjWFXK8SGxZSdZ2LoOazTH8qvuKNJjVk/9lnZfU3E8sqv0a5IbUTbCYLzoOTbeLCyT66Mn+m/X+lcVwMU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743058299; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=amet2zOOkpmXWECfFYqyDHEQTzXZufWkQwXvBjHukr0=; 
	b=N81G01ceVuQvOQsAmiU+5SrVP2JZvC6YadrzRuUXr+W1mgYgJHJs0Dx1G9iBjmop3wYp4A5izrKViOKQJxKCAhrwyDQzsSRZ67ZNcEhk6ncGoVVJpajrbIrL9SZtlNbzfZ2+CpiZ23N9Wa9fLgLEbh8ejyHM5Ar5nAiZjHyBbWE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743058299;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=amet2zOOkpmXWECfFYqyDHEQTzXZufWkQwXvBjHukr0=;
	b=P5EStvH/GxwsCx9vL2cAGvwgSItcrQePGcwtIFTbTJC0N8kmp9QSI+badB7u7+2H
	Ov5MDbeAS+aDHLxvFHltaLVxCsiQJ5flps93j8Hv3l7ot35CgbgwDdwDl7LszneqskY
	qZ7Rzyh6etKl4JCTXabsJ9pKwib+azqr5Grcq6js=
Received: by mx.zohomail.com with SMTPS id 1743058298303946.8080819160424;
	Wed, 26 Mar 2025 23:51:38 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 27 Mar 2025 14:48:18 +0800
Subject: [PATCH v2] lib: utils/serial: Add PXA UARTs support
MIME-Version: 1.0
Message-Id: <20250327-pxa-uart-support-v2-1-c4400c1fcd0b@pigmoral.tech>
X-B4-Tracking: v=1; b=H4sIALH05GcC/32NQQ6CMBBFr0JmbQ0dQMSV9zAsShlhEqVNWxoM6
 d2tHMDVz/vJf38HT47Jw63YwVFkz2bJgKcC9KyWiQSPmQFLbErESthNiVW5IPxqrck5dPUV1WV
 osWshz6yjJ2+H8tFnntkH4z7HQ5S/9o8sSiFFM+oaq5qQyuZueXobp17nQHqGPqX0BVqsV6m0A
 AAA
X-Change-ID: 20250223-pxa-uart-support-b9482a6b7297
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743058287; l=6418;
 i=junhui.liu@pigmoral.tech; s=20250223; h=from:subject:message-id;
 bh=8u6umdueigjVkUggt2xYD9ExalNRznhaEO/AlFt2XyY=;
 b=EUOGOMLdjRB9mhiK6M5aFXYe/tiMqos/G0fVZw3+Hp3eug/NFXMJkey9AL5fwxuDIesHUhz/7
 o6tihAdhBGsAlV/HUBdbHgN68TyCobSeAf6F1KkH2C48aKc+nEmLB0k
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=ZRZkOjG47iI+To+oAo2R4KIpMwtz8r0TffJ5/nO2tcg=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_235143_698133_78546A5D 
X-CRM114-Status: GOOD (  16.27  )
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

The PXA variant of the uart8250 adds the UART Unit Enable bit (UUE) that
needs to be set to enable the XScale PXA UART. And it is required for
some RISC-V SoCs like the Spacemit K1 that implement the PXA UART.

This introduces the "intel,xscale-uart" compatible to handle setting the
UUE bit.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Changes in v2:
- Simplify word capabilities to caps
- Apply patch to all uses of uart8250_init()
- Link to v1: https://lore.kernel.org/r/20250223-pxa-uart-support-v1-1-5dc4234e2e05@pigmoral.tech
---
 include/sbi_utils/serial/uart8250.h    |  4 +++-
 lib/utils/serial/fdt_serial_uart8250.c |  7 +++++--
 lib/utils/serial/uart8250.c            | 11 +++++++++--
 platform/fpga/ariane/platform.c        |  4 +++-
 platform/fpga/openpiton/platform.c     |  4 +++-
 platform/template/platform.c           |  2 +-
 6 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/include/sbi_utils/serial/uart8250.h b/include/sbi_utils/serial/uart8250.h
index d4a8c136a4552c8045a3c83820a35ae2ae86e810..70cd2912d9e9a7cf42079e820603c790ce956b09 100644
--- a/include/sbi_utils/serial/uart8250.h
+++ b/include/sbi_utils/serial/uart8250.h
@@ -12,7 +12,9 @@
 
 #include <sbi/sbi_types.h>
 
+#define UART_CAP_UUE	BIT(0)	/* Check UUE capability for XScale PXA UARTs */
+
 int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
-		  u32 reg_width, u32 reg_offset);
+		  u32 reg_width, u32 reg_offset, u32 caps);
 
 #endif
diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
index af5ceac924873216a85374b6c937af1b067841d0..3a6650d6e74603a64f26d8a0c9a668701678525c 100644
--- a/lib/utils/serial/fdt_serial_uart8250.c
+++ b/lib/utils/serial/fdt_serial_uart8250.c
@@ -14,8 +14,9 @@
 static int serial_uart8250_init(const void *fdt, int nodeoff,
 				const struct fdt_match *match)
 {
-	int rc;
 	struct platform_uart_data uart = { 0 };
+	ulong caps = (ulong)match->data;
+	int rc;
 
 	rc = fdt_parse_uart_node(fdt, nodeoff, &uart);
 	if (rc)
@@ -23,13 +24,15 @@ static int serial_uart8250_init(const void *fdt, int nodeoff,
 
 	return uart8250_init(uart.addr, uart.freq, uart.baud,
 			     uart.reg_shift, uart.reg_io_width,
-			     uart.reg_offset);
+			     uart.reg_offset, caps);
 }
 
 static const struct fdt_match serial_uart8250_match[] = {
 	{ .compatible = "ns16550" },
 	{ .compatible = "ns16550a" },
 	{ .compatible = "snps,dw-apb-uart" },
+	{ .compatible = "intel,xscale-uart",
+	  .data = (void *)UART_CAP_UUE },
 	{ },
 };
 
diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 1fe053f860e56e7a447259dadb649734ff5016b0..82fb142a309fb692a85ac906218979f1664266ae 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -39,6 +39,12 @@
 #define UART_LSR_DR		0x01	/* Receiver data ready */
 #define UART_LSR_BRK_ERROR_BITS	0x1E	/* BI, FE, PE, OE bits */
 
+/* The XScale PXA UARTs define these bits */
+#define UART_IER_DMAE		0x80	/* DMA Requests Enable */
+#define UART_IER_UUE		0x40	/* UART Unit Enable */
+#define UART_IER_NRZE		0x20	/* NRZ coding Enable */
+#define UART_IER_RTOIE		0x10	/* Receiver Time Out Interrupt Enable */
+
 /* clang-format on */
 
 static volatile char *uart8250_base;
@@ -93,7 +99,7 @@ static struct sbi_console_device uart8250_console = {
 };
 
 int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
-		  u32 reg_width, u32 reg_offset)
+		  u32 reg_width, u32 reg_offset, u32 caps)
 {
 	u16 bdiv = 0;
 
@@ -109,7 +115,8 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
 	}
 
 	/* Disable all interrupts */
-	set_reg(UART_IER_OFFSET, 0x00);
+	set_reg(UART_IER_OFFSET, (caps & UART_CAP_UUE) ?
+				 UART_IER_UUE : 0x00);
 	/* Enable DLAB */
 	set_reg(UART_LCR_OFFSET, 0x80);
 
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 0b4455f1ddbb8512755c7d849c54a781eba52628..4bc1c5be07e9f6f679cb0e3359286011e5c27a69 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -23,6 +23,7 @@
 #define ARIANE_UART_REG_SHIFT			2
 #define ARIANE_UART_REG_WIDTH			4
 #define ARIANE_UART_REG_OFFSET			0
+#define ARIANE_UART_CAPS			0
 #define ARIANE_PLIC_ADDR			0xc000000
 #define ARIANE_PLIC_SIZE			(0x200000 + \
 						 (ARIANE_HART_COUNT * 0x1000))
@@ -78,7 +79,8 @@ static int ariane_early_init(bool cold_boot)
 			     ARIANE_UART_BAUDRATE,
 			     ARIANE_UART_REG_SHIFT,
 			     ARIANE_UART_REG_WIDTH,
-			     ARIANE_UART_REG_OFFSET);
+			     ARIANE_UART_REG_OFFSET,
+			     ARIANE_UART_CAPS);
 }
 
 /*
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 9f4378a4d3aa74d5da51c6c6f6314f8f8f6db2bf..d2cf3e32e41db9d7242f48d8524e853a7bbd2286 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -22,6 +22,7 @@
 #define OPENPITON_DEFAULT_UART_REG_SHIFT	0
 #define OPENPITON_DEFAULT_UART_REG_WIDTH	1
 #define OPENPITON_DEFAULT_UART_REG_OFFSET	0
+#define OPENPITON_DEFAULT_UART_CAPS		0
 #define OPENPITON_DEFAULT_PLIC_ADDR		0xfff1100000
 #define OPENPITON_DEFAULT_PLIC_SIZE		(0x200000 + \
 				(OPENPITON_DEFAULT_HART_COUNT * 0x1000))
@@ -111,7 +112,8 @@ static int openpiton_early_init(bool cold_boot)
 	return uart8250_init(uart.addr, uart.freq, uart.baud,
 			     OPENPITON_DEFAULT_UART_REG_SHIFT,
 			     OPENPITON_DEFAULT_UART_REG_WIDTH,
-			     OPENPITON_DEFAULT_UART_REG_OFFSET);
+			     OPENPITON_DEFAULT_UART_REG_OFFSET,
+			     OPENPITON_DEFAULT_UART_CAPS);
 }
 
 /*
diff --git a/platform/template/platform.c b/platform/template/platform.c
index bc351bc9937c3c8933ac7730d9f77838f1ae4e9d..292889d279cff40d01182a9addec9ad8d375ba65 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -75,7 +75,7 @@ static int platform_early_init(bool cold_boot)
 
 	/* Example if the generic UART8250 driver is used */
 	return uart8250_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
-			     PLATFORM_UART_BAUDRATE, 0, 1, 0);
+			     PLATFORM_UART_BAUDRATE, 0, 1, 0, 0);
 }
 
 /*

---
base-commit: 321ca8063b7ea9863cdeb6c80fe8bce340bcd04b
change-id: 20250223-pxa-uart-support-b9482a6b7297

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
