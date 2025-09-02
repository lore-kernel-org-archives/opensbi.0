Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E21ECA100E
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LiiWrjMJpXVAUKGM71rmq4HZZP6a21cYzL59t1SaE4=; b=ak07Lb31JZPgbH
	XPUTwO0QxRcvHyg6XXmIubBa76qB2XsmxHOFCHTzCu6wmYXmoloq82qm53qeXkyRasV8PRPO/lm8H
	3DOzAd2LAujAVyMwFg0bHHvBrp0jDKP0jxGlDzcJdObk/j7UJwX8KWwE8ctn8/jwkiiLwAQpaOZpB
	KVg5Jh7gpNjuK3yJeamcCrin/nx6mU5WCmQF9WzXQO6UfM1FFAe65Yz1wgdJJOyMu+1SdHcycfsKg
	MTgmIKE3UB2LhbX0VqNMgrRjjb71nMQJuHoc9e/t1bMEHAh26ccLiNrA/1t4G8oFeYx3b9NRCwmsk
	7KY9Dt1GacmDrEtaxu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTXP-00000000rXp-44o1;
	Tue, 02 Sep 2025 16:07:15 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPxA-0000000HAXg-1nqR
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 12:17:37 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-321cfa7ad29so4759267a91.1
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 05:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756815455; x=1757420255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GtSmJF0NpcXDvhI/YrgXfQVTmdSIK0AcNSysAr4G4Y=;
        b=HGajdoXP/P87SvDydkJSRuyswDV4Ya8lxWbw37+QWQDIAdwwW6byjtCZqqmybDocpv
         RQBTJCGxOyiclT8gZVTEdnpuJrjLbukrrJ9WjzBwWqfO7iOoAJ4lGP+yMCS63Ez5/SQ1
         /g6XQkBZ6777ZXh5hTw6YAYhlRWyYUmaOvDr2yeZAN1PlhpYkDQex4DA0ebOfZE4Wi3K
         tANUAZytx10uIiw/HEIvvHJQ4znSETFpt9YqvYYEEfwbhD+X04p/fCTsdF8pP1ObtZoC
         /BMyD7UV/SXuwVquFG9eUqKObSSDHwxZ9fkrK/Pn0sbUovZWPwVDdj2r2PyLSdZEyXI2
         pBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815455; x=1757420255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GtSmJF0NpcXDvhI/YrgXfQVTmdSIK0AcNSysAr4G4Y=;
        b=I0BmX8XRO/x4S9nkeN3z5UWtjy1cLZlT9VdVzbYZ9uNHunma8gwfFI5yHuLVlaXafd
         +57Px/goGLiYStWLJAUbgs4qTrDsc/Ou6dOeI614TA5S4o3Z7fFzoFQfs4crj3VzPQpU
         P2hd2J0zO0GFWjpa9nYRhi6TywcYlKivNf+3H2LMrul3C+NNmYW+VRg3uAetSMPd/RCi
         RzGijeuUhriNYtqu+OuyUaaDeodbZrq22/KMYeU2OsGPxobWI7B5CruFtyFYhDUsIQf5
         /2zrXK4PMtbXpppwIK2sqgzGgytBNyccgZrvfkdm1WvpjGkZUjwlSjL/KXyThihuRQ8+
         ZFEA==
X-Forwarded-Encrypted: i=1; AJvYcCXf4++OtWpLGOq57EJTbf0cadQv5srFj6IcXIccSIiKNk6f8hFSdZJ2mCNrrrTE00FVHbTCcNQr@lists.infradead.org
X-Gm-Message-State: AOJu0YwAGO2ow0iRZG/jHSW2WkeUTNyLUL3xd1x01V1Ac/quWhRxBTNN
	sw2inL1p8rfdXxZ+LVqIc15oHmytX2Bz3nnmetK22Ynd2lXXTdXzLan+XpfadlOOIZU=
X-Gm-Gg: ASbGnct3D7N1XkPpBTTbI2Kgbi5IuuNG+s4gdVgfxWvjs5or67jLSrmvGFQwtWLg9ra
	YqeRYje8xRbN9qrDMVm6aLKqpt7YYvldPfbjScjKhqJ7EVdtkW30it6kvDbcI5AUT2q8DT8wDLs
	0ctwV5oZC8vFfYe0SqomJ71MPEWv9ck9M5hV2CDBCOdc9xQlbUUWsPSNriKm2X/3zXpdksfHOqs
	k0MtZI3UcBDA7WtQTCJMcFFYR0aJ94L4xLIU38x5xBSBlg+qxZH8gtO65ywLUc0TmwjuyAiTQAy
	bZDf3SB1odK50aC1LkX6YAnm+OGbXMuY5Vm38q3Nk3hTEnCLXDc/NlkaaqrTgHc+PffxSvaicD2
	U6/xgn7Ln2nijJJfGHq97RwxIiJeer9FxULFNWvc0p5CESgpEO9va9A/f/RAAlhhqZYF9/UXT
X-Google-Smtp-Source: AGHT+IHokGCi5mSpr+e29IxWbosDqqSoGIUCqMihoc8aMFzysKvifksUE/UPtfjmdWF3dxmjFgcX9g==
X-Received: by 2002:a17:90b:57e7:b0:32a:15cc:57d5 with SMTP id 98e67ed59e1d1-32a15cc9665mr926841a91.13.1756815455156;
        Tue, 02 Sep 2025 05:17:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e713dsm14265834a91.17.2025.09.02.05.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:17:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/3] include: sbi: Remove platform specific IPI init
Date: Tue,  2 Sep 2025 17:47:20 +0530
Message-ID: <20250902121721.401933-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902121721.401933-1-apatel@ventanamicro.com>
References: <20250902121721.401933-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_051736_471439_619D0D05 
X-CRM114-Status: GOOD (  16.16  )
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
 include/sbi/sbi_platform.h               | 17 -----------------
 lib/sbi/sbi_ipi.c                        |  5 -----
 platform/fpga/ariane/platform.c          | 15 ++++++---------
 platform/generic/openhwgroup/openpiton.c | 13 ++++---------
 platform/generic/platform.c              |  5 ++++-
 platform/kendryte/k210/platform.c        | 13 ++++++-------
 platform/nuclei/ux600/platform.c         | 11 +++++------
 platform/template/platform.c             | 16 ++++++----------
 8 files changed, 31 insertions(+), 64 deletions(-)

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
index b57ec652..c9f5d1d1 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -342,11 +342,6 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
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
index 4bc1c5be..4ca9ca94 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -71,9 +71,15 @@ static struct aclint_mtimer_data mtimer = {
  */
 static int ariane_early_init(bool cold_boot)
 {
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
+	rc = aclint_mswi_cold_init(&mswi);
+	if (rc)
+		return rc;
+
 	return uart8250_init(ARIANE_UART_ADDR,
 			     ARIANE_UART_FREQ,
 			     ARIANE_UART_BAUDRATE,
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
index 9be7f9a4..e4d7a8b0 100644
--- a/platform/generic/openhwgroup/openpiton.c
+++ b/platform/generic/openhwgroup/openpiton.c
@@ -104,6 +104,10 @@ static int openpiton_early_init(bool cold_boot)
 				    ACLINT_DEFAULT_MTIMECMP_OFFSET;
 	}
 
+	rc = aclint_mswi_cold_init(&mswi);
+	if (rc)
+		return rc;
+
 	return uart8250_init(uart.addr, uart.freq, uart.baud,
 			     OPENPITON_DEFAULT_UART_REG_SHIFT,
 			     OPENPITON_DEFAULT_UART_REG_WIDTH,
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
index aff133c6..cd71c795 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -112,9 +112,15 @@ static struct sbi_system_reset_device k210_reset = {
 
 static int k210_early_init(bool cold_boot)
 {
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
+	rc = aclint_mswi_cold_init(&mswi);
+	if (rc)
+		return rc;
+
 	sbi_system_reset_add_device(&k210_reset);
 
 	return sifive_uart_init(K210_UART_BASE_ADDR, k210_get_clk_freq(),
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
index 1b67b644..ccaf87a4 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -151,10 +151,15 @@ static struct sbi_system_reset_device ux600_reset = {
 static int ux600_early_init(bool cold_boot)
 {
 	u32 regval;
+	int rc;
 
 	if (!cold_boot)
 		return 0;
 
+	rc = aclint_mswi_cold_init(&mswi);
+	if (rc)
+		return rc;
+
 	sbi_system_reset_add_device(&ux600_reset);
 
 	/* Measure CPU Frequency using Timer */
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
index 292889d2..4ba3e59a 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -70,9 +70,15 @@ static struct aclint_mtimer_data mtimer = {
  */
 static int platform_early_init(bool cold_boot)
 {
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
+	rc = aclint_mswi_cold_init(&mswi);
+	if (rc)
+		return rc;
+
 	/* Example if the generic UART8250 driver is used */
 	return uart8250_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
 			     PLATFORM_UART_BAUDRATE, 0, 1, 0, 0);
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
