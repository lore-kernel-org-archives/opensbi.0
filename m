Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7D6D6ACE4
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/nTap3S0i0tmw/6s7+TemOH3cvTs4zX5goKMHOFXpc=; b=qfQmV7GYf0yeqw
	6YqzcCGfD/YodRrpSSfmn9A+sb+T+7B/U9ur2vzLQcUeUQNxx4zaN/Ch9h7lCQjMX2628DDnRbfZ7
	E4XMgBCRoFUkcqsbBUawJFPJzto+Ke64kpjV8HEUUhYPnA7M8P0y1cp7nV0MZbnTrfdLtpq0BnR9k
	Oi7nWzNrxYzpszz36k6nbKgr29Lyv1zBIm14+D/oIwRHoNAhSi5jp+onP1AEAjmK3dQxmHyE/34eX
	AdSFqYUmzBL9xftbx7jvhWewE5i6APGehdpApub03gfIEgzVnT0oH/ij2Kt8cuyH1zpQXhgCQb+oM
	ofhA4/NjSFWSBihQUy2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBV5-00000008Flq-2J1F;
	Thu, 18 Dec 2025 10:44:51 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBV3-00000008Fj0-0fMZ
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 10:44:50 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so438800b3a.3
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766054688; x=1766659488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIT4B15Uv7s4AxSGReqiIk/KbR2zK/NhVJ+urA9SX8I=;
        b=eGHlZAubSYpJF2A0MuT00OYdi2IYx4xXh5c0sG1Drl2sKO1dOzidNDgWFtoDoOzR8r
         vTmhu5/TiJ7Rp/6lT0zHrc4s0buHpv59C+GWFCq4BfzXPKtTE6GmhWAzyUPgFlwtrDOI
         EkmF7818Z9Ni1U9IyfRx0jt8wM7ZqdggTla5rkjMaq0wkt3NUh7ZMifWz+qpQQDVIBZC
         2jukmYn8E5GHr5j2IcYBZ4u4qpbqIm1B3MX2cMQ9fnT81rTEnILO4u+YXhHpGLY14C+n
         ZIufUyKYdwfhT4s3j2bcqOMcqdjteLELt3Eyw+lClKP5z1FMRhSqqaIMvreNbJpLFjoE
         MvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054688; x=1766659488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIT4B15Uv7s4AxSGReqiIk/KbR2zK/NhVJ+urA9SX8I=;
        b=dXhl/y4L5oSGXigpDPRVNV/XJIGCbBcv92ryNL44FjXna6ZLFozZkc1KpKr3lZK949
         4+iJSMnXhdRzJKfE79ekAANlW3259I9NvalK91nkfjiBWskOOeNcizgLRC/HE/+OMJVy
         aV3wnj3GMD15NtRZfgW0zXS0+7kBGpe9YL7+bg+inLGY/82+aRwOUKEVcMFRAz9YopUL
         QUwrjbtxr6b+/m40zoYSiGMCa/C0uqwI97WwxbYzQbjyqEFuZUdkj4OxZ98uYzxoB6Eo
         /9EuwfhjljTUVdmtJyJXPxT7k6HI98vDx0tv1WPWDlBLdcFHeKxU/w7lVzN9BqJh2oTa
         DrPQ==
X-Gm-Message-State: AOJu0YwGRDIErQee48a29AftoA85Kr9ZS08be2X0wZBes9X/Om5qAhgE
	pxokk3bK1Q4p4/OK+IM76wkU0BDKEhowznsDRn6cQ8JXxxF6si3/OJj/pDaYAQ==
X-Gm-Gg: AY/fxX5t/pOl6LbrAVPAYZJsv/V9f9L8ZSh8aDlyO5wYKpOF9w3+oCC6eaz+iKT+k2M
	KycWmkBMaFGMbPiM++u10Inbm0VtPZcLeofspD6sgymaQSLLpMs9BuRFAKtR/SMkxxGx02KZBF0
	Thu6q9IwkfPpvy4g2xa7tliNQo3qDMX5QF/Ne4RxIcvORKTwfvGaPfiS9SXd4DIXpRTGxzhv9PN
	RaY4BCGs1s/THsTKu03IfEEQ8th5iwGNBoYh4vfQwJWbG6aoJhCjNTWbe3wz/pik6LbVXhX0S0V
	zehlS6iV4Iep1ICcQoziddKkrT3pxfG66rGzI8mFNnWcfIl5hFjDlkK/S/1Glbn/Jp2hDIlp1Ex
	qvfBLTAQF+k2AD0p8F5KOHQnDPBJc3VwUrYRYCu9Wgm9Li4sAcF2IM+6hnvzBtlRfSHlwxFk6XX
	xzEfKJ0bgiYfx5GIkAOeOYypE=
X-Google-Smtp-Source: AGHT+IELSopj+pORQaVC9LHLoCy2Etb+kFTugvMx0m+ha5uxU0ieyuK1ogxET3ohYoURMzzUcre4Ug==
X-Received: by 2002:a05:6a00:1c8e:b0:7ef:3f4e:9172 with SMTP id d2e1a72fcca58-7f66754899emr21621150b3a.8.1766054687668;
        Thu, 18 Dec 2025 02:44:47 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe11d3e004sm2264795b3a.15.2025.12.18.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:44:47 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v6 6/7] lib: utils/serial: Support multiple UART8250 devices
Date: Thu, 18 Dec 2025 02:42:42 -0800
Message-Id: <20251218104243.562667-7-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218104243.562667-1-ganboing@gmail.com>
References: <20251218104243.562667-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024449_195154_87E259C6 
X-CRM114-Status: GOOD (  15.77  )
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
