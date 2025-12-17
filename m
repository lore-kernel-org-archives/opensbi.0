Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A807D65C46
	for <opensbi@archiver.kernel.org>; Wed, 17 Dec 2025 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/nTap3S0i0tmw/6s7+TemOH3cvTs4zX5goKMHOFXpc=; b=0ul8GJS+mXYIuR
	G1Foh0WRe8Th4t4fY9upISKxmTGCOFrtjFVdct1fh6H54MIdwMXgQfzWjWbv7qoJbp/OydaAYSTzV
	Y2lDjlr/2wkz027zj9lll1dqekjSgbUHkpj5gVNW3qB+NobAifd05eZaKdxlQ6n9EQBeBkfbEw9HA
	AZ+C2pfRD/D356XS9v2m1RrnTdOkEndOofSq9dLoizXplf+XSnXlKEvoSlNVGyDL8xCfByc8VYzhL
	9GU8dVPqFocMv7h9VRAS30+9BjhEqQJQ4v44AZE2i2nmyxfPAlg0Ys3QdCkI+VQqwoZHyw44QIjQC
	TW6qY7i/n/R0q/uRinhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrdE-00000006r5w-3ipN;
	Wed, 17 Dec 2025 13:31:56 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrdC-00000006r3P-0yYp
	for opensbi@lists.infradead.org;
	Wed, 17 Dec 2025 13:31:55 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7f121c00dedso6938491b3a.0
        for <opensbi@lists.infradead.org>; Wed, 17 Dec 2025 05:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765978313; x=1766583113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIT4B15Uv7s4AxSGReqiIk/KbR2zK/NhVJ+urA9SX8I=;
        b=a/MqNBD/UrdGx5HgmMMuk2Rw8y+4GtOGW16tbLiVXZyV9C1N4jbCtDXZKkV3HYhfwz
         YiijUhoLdYjRmFVDaLyMos0XKjsQoTc/sf0O7Hho0Il8Kq8S7MCKq4/kYI/xvhS6xo+h
         P4cDY+7g88K97b1vGLKC4ALjzI1ZI69N+ranj6qfRJpvpab7NbsXln4kNlJLav+RSpxx
         r5pC9rP71YNA2G6EJ6Ek6vKm9SNAUprYqoiyBCOZDp91KIlA9f71bdVBKF+ainlxWRjj
         n+mMpVnrOt07ZtlRg+XjUXvIQg3YgcIOzI1XZaHZwu5y0Dzh414V0hHb9T2yrUEfpV7S
         IMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978313; x=1766583113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIT4B15Uv7s4AxSGReqiIk/KbR2zK/NhVJ+urA9SX8I=;
        b=J5WgBTwlrfJ1zScTajJe60kFswJb6pB+6b7YaoPcnGYpCqOpFO0ONcP5ZjDXgeVBM/
         CRN5v+/C6cDGs2mTMJAV8WfsCbj50g/OeomBgnCHeRBn8c1AA6LNEij+OkQ2AnBIDCux
         aHOcuOBVHH983gcE82iIkuQbdMoWA1/laAXscyo3f0OnGVz/B7SAood1wPKucQEOR3OB
         aEo6Y+0dNyCwbxHIVETIi9URlSO/rrKhvuKq/3sdklGFsPWV0yDT53cVkIc+0WAVNnqV
         AbKzz4BQP2YooafO4CghyR4H4pBmkbZHXzVlq9a0j+Z//Vnx1AXrxQubZydejLfHOX9t
         8OhA==
X-Gm-Message-State: AOJu0Yw/QF/sEm9803078zTXf9k4EbJy55QI7SOvaK82NoDsy85g1vl7
	U0ouMqE+vJljJwMHrZ72Of96Kz0E9XOIChdnvQKsqF3RbvuEXXPc6MP+lOvtZw==
X-Gm-Gg: AY/fxX6VDlJwoWNlF/FqbQdyMpI3bNArtm84gL2Pt9S2ROidpIrBhBoICiwWTU6OuqC
	GNCAnRuPkOwXA0Ssk6jCjRKOw0eGQgqhuTirtjDnaMasm8N9yMFk8OSXawagQcomB72Zh6lO+Y8
	2jJqwve9opYuDSURFAnIq77kvy0QR2MnyVE3m5ygVaHpOI6rJHHB/mNQ1KbqeD6VLQZZkdwCG0F
	n2SC4fZwOKyinbjeO1d8Upav2VmqLxXLlhcI/jtRMtSOUBuf06zRZzcDLROzgaqMhO7dXvdJNMJ
	lagU9QJf4JSqTIJl5oT6VwGekMS6FlZPqmEZgJz5wNYY26LZmBpjUXk9F+XcHs902gMPMvVFdCV
	5RIwy1okgkl7mbhiulB6e7OPCX/kybwWTdD1CGdsHsE4WeGkRyEk7L6otcUeEFW786K9bCygqke
	GtsMH064DWiAb1YEKAIVfAgvw=
X-Google-Smtp-Source: AGHT+IEeKDNWZwpMtztINQ6u9PdM05hnBrYOmxFy44v3m52StQjVfCXMAJnAh43Gp9GADSgEk/dqDg==
X-Received: by 2002:a05:6a00:3498:b0:7e1:7a1c:68a8 with SMTP id d2e1a72fcca58-7f6679310b5mr18256211b3a.15.1765978312741;
        Wed, 17 Dec 2025 05:31:52 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc1c4ef2sm2809104b3a.65.2025.12.17.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:31:51 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v5 6/7] lib: utils/serial: Support multiple UART8250 devices
Date: Wed, 17 Dec 2025 05:29:58 -0800
Message-Id: <20251217132959.545197-7-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217132959.545197-1-ganboing@gmail.com>
References: <20251217132959.545197-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_053154_309155_C0AB341B 
X-CRM114-Status: GOOD (  15.71  )
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

Previously we assume only 1 UART8250 instance can be used. Now we support
multiple instances by introducing counterpart functions to putc/getc/init
which take an extra *dev parameter, and name them as uart8250_device_xyz()
The original functions without the *dev parameter will operate on the
default instance exactly the same as before, so no changes on the caller
is required.

Note: uart8250_device_init only does device initialization without the
console registration logic.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi_utils/serial/uart8250.h |  16 +++++
 lib/utils/serial/uart8250.c         | 104 ++++++++++++++++------------
 2 files changed, 75 insertions(+), 45 deletions(-)

diff --git a/include/sbi_utils/serial/uart8250.h b/include/sbi_utils/serial/uart8250.h
index 70cd2912..78c0e614 100644
--- a/include/sbi_utils/serial/uart8250.h
+++ b/include/sbi_utils/serial/uart8250.h
@@ -14,6 +14,22 @@
 
 #define UART_CAP_UUE	BIT(0)	/* Check UUE capability for XScale PXA UARTs */
 
+struct uart8250_device {
+	volatile char *base;
+	u32 in_freq;
+	u32 baudrate;
+	u32 reg_width;
+	u32 reg_shift;
+};
+
+int uart8250_device_getc(struct uart8250_device *dev);
+
+void uart8250_device_putc(struct uart8250_device *dev, char ch);
+
+void uart8250_device_init(struct uart8250_device *dev, unsigned long base,
+			  u32 in_freq, u32 baudrate, u32 reg_shift,
+			  u32 reg_width, u32 reg_offset, u32 caps);
+
 int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
 		  u32 reg_width, u32 reg_offset, u32 caps);
 
diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index bb209c9a..d65f127d 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -47,97 +47,111 @@
 
 /* clang-format on */
 
-static volatile char *uart8250_base;
-static u32 uart8250_in_freq;
-static u32 uart8250_baudrate;
-static u32 uart8250_reg_width;
-static u32 uart8250_reg_shift;
+static struct uart8250_device uart8250_dev;
 
-static u32 get_reg(u32 num)
+static u32 get_reg(struct uart8250_device *dev, u32 num)
 {
-	u32 offset = num << uart8250_reg_shift;
+	u32 offset = num << dev->reg_shift;
 
-	if (uart8250_reg_width == 1)
-		return readb(uart8250_base + offset);
-	else if (uart8250_reg_width == 2)
-		return readw(uart8250_base + offset);
+	if (dev->reg_width == 1)
+		return readb(dev->base + offset);
+	else if (dev->reg_width == 2)
+		return readw(dev->base + offset);
 	else
-		return readl(uart8250_base + offset);
+		return readl(dev->base + offset);
 }
 
-static void set_reg(u32 num, u32 val)
+static void set_reg(struct uart8250_device *dev, u32 num, u32 val)
 {
-	u32 offset = num << uart8250_reg_shift;
+	u32 offset = num << dev->reg_shift;
 
-	if (uart8250_reg_width == 1)
-		writeb(val, uart8250_base + offset);
-	else if (uart8250_reg_width == 2)
-		writew(val, uart8250_base + offset);
+	if (dev->reg_width == 1)
+		writeb(val, dev->base + offset);
+	else if (dev->reg_width == 2)
+		writew(val, dev->base + offset);
 	else
-		writel(val, uart8250_base + offset);
+		writel(val, dev->base + offset);
 }
 
-static void uart8250_putc(char ch)
+void uart8250_device_putc(struct uart8250_device *dev, char ch)
 {
-	while ((get_reg(UART_LSR_OFFSET) & UART_LSR_THRE) == 0)
+	while ((get_reg(dev, UART_LSR_OFFSET) & UART_LSR_THRE) == 0)
 		;
 
-	set_reg(UART_THR_OFFSET, ch);
+	set_reg(dev, UART_THR_OFFSET, ch);
 }
 
-static int uart8250_getc(void)
+static void uart8250_putc(char ch)
 {
-	if (get_reg(UART_LSR_OFFSET) & UART_LSR_DR)
-		return get_reg(UART_RBR_OFFSET);
+	return uart8250_device_putc(&uart8250_dev, ch);
+}
+
+int uart8250_device_getc(struct uart8250_device *dev)
+{
+	if (get_reg(dev, UART_LSR_OFFSET) & UART_LSR_DR)
+		return get_reg(dev, UART_RBR_OFFSET);
 	return -1;
 }
 
+static int uart8250_getc(void)
+{
+	return uart8250_device_getc(&uart8250_dev);
+}
+
 static struct sbi_console_device uart8250_console = {
 	.name = "uart8250",
 	.console_putc = uart8250_putc,
 	.console_getc = uart8250_getc
 };
 
-int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
-		  u32 reg_width, u32 reg_offset, u32 caps)
+void uart8250_device_init(struct uart8250_device *dev, unsigned long base,
+			  u32 in_freq, u32 baudrate, u32 reg_shift,
+			  u32 reg_width, u32 reg_offset, u32 caps)
 {
 	u16 bdiv = 0;
 
-	uart8250_base      = (volatile char *)base + reg_offset;
-	uart8250_reg_shift = reg_shift;
-	uart8250_reg_width = reg_width;
-	uart8250_in_freq   = in_freq;
-	uart8250_baudrate  = baudrate;
+	dev->base      = (volatile char *)base + reg_offset;
+	dev->reg_shift = reg_shift;
+	dev->reg_width = reg_width;
+	dev->in_freq   = in_freq;
+	dev->baudrate  = baudrate;
 
-	if (uart8250_baudrate) {
-		bdiv = (uart8250_in_freq + 8 * uart8250_baudrate) /
-		       (16 * uart8250_baudrate);
+	if (dev->baudrate) {
+		bdiv = (dev->in_freq + 8 * dev->baudrate) /
+		       (16 * dev->baudrate);
 	}
 
 	/* Disable all interrupts */
-	set_reg(UART_IER_OFFSET, (caps & UART_CAP_UUE) ?
+	set_reg(dev, UART_IER_OFFSET, (caps & UART_CAP_UUE) ?
 				 UART_IER_UUE : 0x00);
 	/* Enable DLAB */
-	set_reg(UART_LCR_OFFSET, 0x80);
+	set_reg(dev, UART_LCR_OFFSET, 0x80);
 
 	if (bdiv) {
 		/* Set divisor low byte */
-		set_reg(UART_DLL_OFFSET, bdiv & 0xff);
+		set_reg(dev, UART_DLL_OFFSET, bdiv & 0xff);
 		/* Set divisor high byte */
-		set_reg(UART_DLM_OFFSET, (bdiv >> 8) & 0xff);
+		set_reg(dev, UART_DLM_OFFSET, (bdiv >> 8) & 0xff);
 	}
 
 	/* 8 bits, no parity, one stop bit */
-	set_reg(UART_LCR_OFFSET, 0x03);
+	set_reg(dev, UART_LCR_OFFSET, 0x03);
 	/* Enable FIFO */
-	set_reg(UART_FCR_OFFSET, 0x01);
+	set_reg(dev, UART_FCR_OFFSET, 0x01);
 	/* No modem control DTR RTS */
-	set_reg(UART_MCR_OFFSET, 0x00);
+	set_reg(dev, UART_MCR_OFFSET, 0x00);
 	/* Clear line status and read receive buffer */
-	if (get_reg(UART_LSR_OFFSET) & UART_LSR_DR)
-		get_reg(UART_RBR_OFFSET);
+	if (get_reg(dev, UART_LSR_OFFSET) & UART_LSR_DR)
+		get_reg(dev, UART_RBR_OFFSET);
 	/* Set scratchpad */
-	set_reg(UART_SCR_OFFSET, 0x00);
+	set_reg(dev, UART_SCR_OFFSET, 0x00);
+}
+
+int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
+		  u32 reg_width, u32 reg_offset, u32 caps)
+{
+	uart8250_device_init(&uart8250_dev, base, in_freq, baudrate,
+			     reg_shift, reg_width, reg_offset, caps);
 
 	sbi_console_set_device(&uart8250_console);
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
