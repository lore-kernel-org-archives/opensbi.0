Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCC0CA100C
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3jk8pX7nBZPXX1qGpBbD+ZiZf2GOuhZTGr0PRdPcIM=; b=I+hwUfsZkb2/KI
	+ioNRFAdV72wAprNKgxy7byvpqvYvep20pJ+31BornNovxwoXndv6xlzV/MCATGpaEb1RTDEbXIOo
	hwnLrzhBEjxgUZByOOWpEbau5AqX9jkxb0aeJRZtndfWoPK2tBEazTyEzfcpOseeDTw6HlTLDODCR
	M7BId1yWJghF9D6VbFkw38rTbUpeOAEXt6jMBbCwqTmXsNsYpAVpl89LbQjRuMbu0CXKoDcDkXSjP
	dCvhw8MIt3aJcbNh6Ir9XURkG8ReS0NxjuxfJfkeEpnU/vw7FgW//tKAjStXxNGo4avpgXk517WZh
	PSA99l+GQD6b8UL+08mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthP3-00000004pze-2yo7;
	Wed, 03 Sep 2025 06:55:33 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthMA-00000004oHA-1q9j
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 06:52:35 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4c738ee2fbso4871284a12.3
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756882354; x=1757487154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mt3yLenM8zLgH20GjnwvgZoPslJlpLjE69jrws27mNc=;
        b=G87E0bcBRKMS08wDMGgFFXp+QQjyb/O+uP/DiD0KD2HhYQd9pWGt/NrEUsKF0MSy00
         HQxspybLlhsvxo9iugbAd1yw1QXHsPwE+Xmn8WFUiO8ev9pW+s3qjAKebpmvkMwrBi/2
         QgO/yPyJkQFAmFq5QhZ6RkneEnNW29LeeS6ZLDdAgI4gyRnZfyyzj4QTj6er3DZYLuAi
         HwAis/LncRRhLNp9kxFZ8loEVaRtftRfwsYWwLFlU2fkTy+Y+EaJAGByJGb0euMh9/vN
         LD8MEmG41d1HHkZWF3xYAVPH1QHW6roOyyHMELS3GuDjZ1zD37JMg5sZyEr/op5DZuuz
         BO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882354; x=1757487154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mt3yLenM8zLgH20GjnwvgZoPslJlpLjE69jrws27mNc=;
        b=UlZYhEyAyeHLwbOLnKy2hHpeR7WNRnNggOXfra9DTjDEAJwkQOKxt6lUbIBYqEN7nT
         odnEKhvPYLJledCbMv6GqmQkp/Yw8c2LKH6tQPQy/eoceKixHt/kxVuXc4am0/6pCaTV
         qS37e3fEOvvHBwwFaI07ZGicisZujoAE6R6qzsb6C7Sq+CergYD99cxzPRKxRgdhxRCq
         jUzdg76e3XE1skG0yss1WDMkaNMPt4sQ7U5Yd9hmoHtowh73pJohDIeJ5TuA5Wr0K8Kr
         QP4UwmNhrloMs9Lf5V87uR1fcMSZTnJZ8tJL7XA5Edjtf4USDlGrLUvutuGb4+j1f6Yv
         E64Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYbtJG1BMWo/XpEkRU2b4MTW8x4blwBni4fzOTtdGkPvzGHgg4y7v6lKqN69Ccp7ofmn5g4Wop@lists.infradead.org
X-Gm-Message-State: AOJu0YzsNo1DEsQ6ccysghmGEAUtv+eyEH1ao5sGNt2zy18ApGxEALqs
	SlwTFnxi0w73QjQyX9B222G/O2QVfhO6YnODN3KCQwU0j//rlktMSGsI5NF8gO4mdL0=
X-Gm-Gg: ASbGncvgGZf5b/p3sxkTwLLj8LqeoPKxFgHXYvJkB9mXLEIWh9eFTzEwQPfl/TbTyXM
	zt0ND9XpN/OOvAJu1B9YJwfTnVuDw/TxeWcw18jStwSmhDM6c+HL3qg+Z/WcEfk4Il6cSMaJ7By
	rYrXq0OcQU9fNtqAuK0iOLxsNhYqSOGqZelNzkcvdQ4GnnVu5KQiXTYqwGNdW7GQZu+i5ar1IxW
	uF8hCL9o0DizVY482H/fBihZCQJJvKDxeNJgB1WcsZ9o5UtjaAhjfPjlaOhjHLYazdNJ2ThUAqv
	KKxb7cKhWtP9zY/ZNV3enAPwpXGpO1nUEhxh7LFHiHFvJ633x3b6MnHb67lgC4dGCt4tD0OhrKY
	M6AQD+QfPoPk70x6rZz0o8wuVSDni0QoJv3dx/m2BtfEzGFfFWs6xgUl2sQiO7A==
X-Google-Smtp-Source: AGHT+IHzbkKHMppl26qHN1vEEzSukJwazW8f8ZVyJDqERjZVScWt4kVXBn0Ai4g3K0qmhttWLMcX3w==
X-Received: by 2002:a17:902:d4c1:b0:24c:92b5:2175 with SMTP id d9443c01a7336-24c92b5262fmr11563425ad.24.1756882353534;
        Tue, 02 Sep 2025 23:52:33 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b905689d1sm25984655ad.64.2025.09.02.23.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 23:52:33 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/3] include: sbi: Remove platform specific IPI init
Date: Wed,  3 Sep 2025 12:22:19 +0530
Message-ID: <20250903065220.456955-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903065220.456955-1-apatel@ventanamicro.com>
References: <20250903065220.456955-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_235234_479844_69795161 
X-CRM114-Status: GOOD (  17.05  )
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

The platform specfic IPI init is not need anymore because using
IPI device rating multiple IPI devices can be registered in any
order as part of the platform specific early init.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_platform.h               | 17 --------------
 lib/sbi/sbi_ipi.c                        |  5 ----
 platform/fpga/ariane/platform.c          | 29 +++++++++++-------------
 platform/generic/openhwgroup/openpiton.c | 23 ++++++++-----------
 platform/generic/platform.c              |  5 +++-
 platform/kendryte/k210/platform.c        | 17 +++++++-------
 platform/nuclei/ux600/platform.c         | 15 ++++++------
 platform/template/platform.c             | 20 +++++++---------
 8 files changed, 49 insertions(+), 82 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index c6d30080..d75c12de 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -116,9 +116,6 @@ struct sbi_platform_operations {
 	/** Initialize the platform interrupt controller during cold boot */
 	int (*irqchip_init)(void);
 
-	/** Initialize IPI during cold boot */
-	int (*ipi_init)(void);
-
 	/** Get tlb flush limit value **/
 	u64 (*get_tlbr_flush_limit)(void);
 
@@ -528,20 +525,6 @@ static inline int sbi_platform_irqchip_init(const struct sbi_platform *plat)
 	return 0;
 }
 
-/**
- * Initialize the platform IPI support during cold boot
- *
- * @param plat pointer to struct sbi_platform
- *
- * @return 0 on success and negative error code on failure
- */
-static inline int sbi_platform_ipi_init(const struct sbi_platform *plat)
-{
-	if (plat && sbi_platform_ops(plat)->ipi_init)
-		return sbi_platform_ops(plat)->ipi_init();
-	return 0;
-}
-
 /**
  * Initialize the platform timer during cold boot
  *
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index d7ba1902..4e6a36cb 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -357,11 +357,6 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
 		if (ret < 0)
 			return ret;
 		ipi_halt_event = ret;
-
-		/* Initialize platform IPI support */
-		ret = sbi_platform_ipi_init(sbi_platform_ptr(scratch));
-		if (ret)
-			return ret;
 	} else {
 		if (!ipi_data_off)
 			return SBI_ENOMEM;
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 4bc1c5be..1b6b052f 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -71,16 +71,22 @@ static struct aclint_mtimer_data mtimer = {
  */
 static int ariane_early_init(bool cold_boot)
 {
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
-	return uart8250_init(ARIANE_UART_ADDR,
-			     ARIANE_UART_FREQ,
-			     ARIANE_UART_BAUDRATE,
-			     ARIANE_UART_REG_SHIFT,
-			     ARIANE_UART_REG_WIDTH,
-			     ARIANE_UART_REG_OFFSET,
-			     ARIANE_UART_CAPS);
+	rc = uart8250_init(ARIANE_UART_ADDR,
+			   ARIANE_UART_FREQ,
+			   ARIANE_UART_BAUDRATE,
+			   ARIANE_UART_REG_SHIFT,
+			   ARIANE_UART_REG_WIDTH,
+			   ARIANE_UART_REG_OFFSET,
+			   ARIANE_UART_CAPS);
+	if (rc)
+		return rc;
+
+	return aclint_mswi_cold_init(&mswi);
 }
 
 /*
@@ -107,14 +113,6 @@ static int ariane_irqchip_init(void)
 	return plic_cold_irqchip_init(&plic);
 }
 
-/*
- * Initialize IPI during cold boot.
- */
-static int ariane_ipi_init(void)
-{
-	return aclint_mswi_cold_init(&mswi);
-}
-
 /*
  * Initialize ariane timer during cold boot.
  */
@@ -130,7 +128,6 @@ const struct sbi_platform_operations platform_ops = {
 	.early_init = ariane_early_init,
 	.final_init = ariane_final_init,
 	.irqchip_init = ariane_irqchip_init,
-	.ipi_init = ariane_ipi_init,
 	.timer_init = ariane_timer_init,
 };
 
diff --git a/platform/generic/openhwgroup/openpiton.c b/platform/generic/openhwgroup/openpiton.c
index 9be7f9a4..3be66de6 100644
--- a/platform/generic/openhwgroup/openpiton.c
+++ b/platform/generic/openhwgroup/openpiton.c
@@ -104,11 +104,15 @@ static int openpiton_early_init(bool cold_boot)
 				    ACLINT_DEFAULT_MTIMECMP_OFFSET;
 	}
 
-	return uart8250_init(uart.addr, uart.freq, uart.baud,
-			     OPENPITON_DEFAULT_UART_REG_SHIFT,
-			     OPENPITON_DEFAULT_UART_REG_WIDTH,
-			     OPENPITON_DEFAULT_UART_REG_OFFSET,
-			     OPENPITON_DEFAULT_UART_CAPS);
+	rc = uart8250_init(uart.addr, uart.freq, uart.baud,
+			   OPENPITON_DEFAULT_UART_REG_SHIFT,
+			   OPENPITON_DEFAULT_UART_REG_WIDTH,
+			   OPENPITON_DEFAULT_UART_REG_OFFSET,
+			   OPENPITON_DEFAULT_UART_CAPS);
+	if (rc)
+		return rc;
+
+	return aclint_mswi_cold_init(&mswi);
 }
 
 /*
@@ -135,14 +139,6 @@ static int openpiton_irqchip_init(void)
 	return plic_cold_irqchip_init(&plic);
 }
 
-/*
- * Initialize IPI during cold boot.
- */
-static int openpiton_ipi_init(void)
-{
-	return aclint_mswi_cold_init(&mswi);
-}
-
 /*
  * Initialize openpiton timer during cold boot.
  */
@@ -155,7 +151,6 @@ static int openhwgroup_openpiton_platform_init(const void *fdt, int nodeoff, con
 {
 	generic_platform_ops.early_init = openpiton_early_init;
 	generic_platform_ops.timer_init = openpiton_timer_init;
-	generic_platform_ops.ipi_init = openpiton_ipi_init;
 	generic_platform_ops.irqchip_init = openpiton_irqchip_init;
 	generic_platform_ops.final_init = openpiton_final_init;
 
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 889d6905..8ba6bc11 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -229,6 +229,10 @@ int generic_early_init(bool cold_boot)
 			return rc;
 
 		fdt_driver_init_all(fdt, fdt_early_drivers);
+
+		rc = fdt_ipi_init();
+		if (rc)
+			return rc;
 	}
 
 	return 0;
@@ -337,7 +341,6 @@ struct sbi_platform_operations generic_platform_ops = {
 	.extensions_init	= generic_extensions_init,
 	.domains_init		= generic_domains_init,
 	.irqchip_init		= fdt_irqchip_init,
-	.ipi_init		= fdt_ipi_init,
 	.pmu_init		= generic_pmu_init,
 	.pmu_xlate_to_mhpmevent = generic_pmu_xlate_to_mhpmevent,
 	.get_tlbr_flush_limit	= generic_tlbr_flush_limit,
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index aff133c6..65f5d497 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -112,13 +112,19 @@ static struct sbi_system_reset_device k210_reset = {
 
 static int k210_early_init(bool cold_boot)
 {
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
 	sbi_system_reset_add_device(&k210_reset);
 
-	return sifive_uart_init(K210_UART_BASE_ADDR, k210_get_clk_freq(),
-				K210_UART_BAUDRATE);
+	rc = sifive_uart_init(K210_UART_BASE_ADDR, k210_get_clk_freq(),
+			      K210_UART_BAUDRATE);
+	if (rc)
+		return rc;
+
+	return aclint_mswi_cold_init(&mswi);
 }
 
 static int k210_final_init(bool cold_boot)
@@ -141,11 +147,6 @@ static int k210_irqchip_init(void)
 	return plic_cold_irqchip_init(&plic);
 }
 
-static int k210_ipi_init(void)
-{
-	return aclint_mswi_cold_init(&mswi);
-}
-
 static int k210_timer_init(void)
 {
 	return aclint_mtimer_cold_init(&mtimer, NULL);
@@ -158,8 +159,6 @@ const struct sbi_platform_operations platform_ops = {
 
 	.irqchip_init = k210_irqchip_init,
 
-	.ipi_init  = k210_ipi_init,
-
 	.timer_init	   = k210_timer_init,
 };
 
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 1b67b644..14fbaeb6 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -151,6 +151,7 @@ static struct sbi_system_reset_device ux600_reset = {
 static int ux600_early_init(bool cold_boot)
 {
 	u32 regval;
+	int rc;
 
 	if (!cold_boot)
 		return 0;
@@ -168,8 +169,12 @@ static int ux600_early_init(bool cold_boot)
 		UX600_GPIO_IOF_UART0_MASK;
 	writel(regval, (void *)(UX600_GPIO_ADDR + UX600_GPIO_IOF_EN_OFS));
 
-	return sifive_uart_init(UX600_DEBUG_UART, ux600_clk_freq,
-				UX600_UART_BAUDRATE);
+	rc = sifive_uart_init(UX600_DEBUG_UART, ux600_clk_freq,
+			      UX600_UART_BAUDRATE);
+	if (rc)
+		return rc;
+
+	return aclint_mswi_cold_init(&mswi);
 }
 
 static void ux600_modify_dt(void *fdt)
@@ -195,11 +200,6 @@ static int ux600_irqchip_init(void)
 	return plic_cold_irqchip_init(&plic);
 }
 
-static int ux600_ipi_init(void)
-{
-	return aclint_mswi_cold_init(&mswi);
-}
-
 static int ux600_timer_init(void)
 {
 	return aclint_mtimer_cold_init(&mtimer, NULL);
@@ -209,7 +209,6 @@ const struct sbi_platform_operations platform_ops = {
 	.early_init		= ux600_early_init,
 	.final_init		= ux600_final_init,
 	.irqchip_init		= ux600_irqchip_init,
-	.ipi_init		= ux600_ipi_init,
 	.timer_init		= ux600_timer_init,
 };
 
diff --git a/platform/template/platform.c b/platform/template/platform.c
index 292889d2..38be1b5c 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -70,12 +70,18 @@ static struct aclint_mtimer_data mtimer = {
  */
 static int platform_early_init(bool cold_boot)
 {
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
 	/* Example if the generic UART8250 driver is used */
-	return uart8250_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
-			     PLATFORM_UART_BAUDRATE, 0, 1, 0, 0);
+	rc = uart8250_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
+			   PLATFORM_UART_BAUDRATE, 0, 1, 0, 0);
+	if (rc)
+		return rc;
+
+	return aclint_mswi_cold_init(&mswi);
 }
 
 /*
@@ -95,15 +101,6 @@ static int platform_irqchip_init(void)
 	return plic_cold_irqchip_init(&plic);
 }
 
-/*
- * Initialize IPI during cold boot.
- */
-static int platform_ipi_init(void)
-{
-	/* Example if the generic ACLINT driver is used */
-	return aclint_mswi_cold_init(&mswi);
-}
-
 /*
  * Initialize platform timer during cold boot.
  */
@@ -120,7 +117,6 @@ const struct sbi_platform_operations platform_ops = {
 	.early_init		= platform_early_init,
 	.final_init		= platform_final_init,
 	.irqchip_init		= platform_irqchip_init,
-	.ipi_init		= platform_ipi_init,
 	.timer_init		= platform_timer_init
 };
 const struct sbi_platform platform = {
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
