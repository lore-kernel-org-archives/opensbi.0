Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B4FCCD193
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0pQimmmEXaOz3x5c8evgFlwSe/Z/GjKqPZqV7WdHhU=; b=xT9fEqIOrj7oah
	Ra7kYGEDYSTgbBFnMGfeByE4IAXMAWqYFD+aThdbfYUDrwhL+GQxRQYwG9tNlysSyChW5HFxn2Ids
	R1MFqgOYK6l69IiA7r8P4nGHDY8GPC4fZKVAHpium/7hsHSrZaZWvQxkV0pPVBq0NhGfsb1GhHNY+
	/noiIn1PDVnPepUSEzLdZMy4XpirUbKDm2verc6lIM0ctKaZ7TWY55Cp8yUgax5X5dCx8XUBqr6Al
	qoR/jaJbsHdlrEB1HYI++l8ms/zdqscLB2Z+sVRXl/0RcX/PoExpO8UMyLB9b47CsWsMSJRarI0wK
	dePKUxBhws7HKE2rPTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMF-0000000C23J-1unk;
	Mon, 20 Oct 2025 06:27:03 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMC-0000000C1yu-1PZD
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:27:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-782e93932ffso3354986b3a.3
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941619; x=1761546419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pgKnKQuhRyQVTLbcwpbYLcYtuB7oXxhrJRg+f4Q/iE=;
        b=BEYGeQHmusfObvnjg+on8eQNNRMVo/3sIZ7Cea11evdM1Zon4x8DzgcVbl/I6mKsPI
         h5JsK80s0/4nei5OEYYONTwnu/qLCxsvvRfcVePdOdL/DeVyG2BbtuZh0eV1pt1J3k7I
         cybrSR3M3qh6Wy9s4NUt3vSyegyyi/UNZd+/VsT770zvCLuz1S47zXGvDp48SmrO2pQI
         pDGsvWROootppsKM56h2CAxdekVpew61LatL1FVotmE2Nzs6TaVaAvfFJMqEc+eEzM8W
         N2qyjLvKSW6kh6Nuv+M2a0knFSu/o8GXRx6ZF5ULNYXX6Yz5FqDaxDftqBZusaxUtM1p
         p0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941619; x=1761546419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pgKnKQuhRyQVTLbcwpbYLcYtuB7oXxhrJRg+f4Q/iE=;
        b=RMDo0RyD3gkBnAhJq24vmcWhXEDbs4JFfSZ5S0SRNIISXjyy1yvVvX9H1YSsZOaJKF
         ByGWBwGcnN+YxufIXEv8W1jxag+htPE1YfxE7V6VVYg5hrvsB8XCQ6U6i6W0fKRM+VGk
         QvQJn4Io88Bahf28gOR483Z8BHSeiDJVfUtmPQKb3R/jeD1NzNlcNipqcQO2EjPLs2vY
         pESD+eeOP5VUzjdT05bPpFNJWqqNXNBP9ZvCR0mbKBXVt29C8l+V9WB+44pg/1ktC2ln
         MYdOgHjshFAyszqhX81UQY0ZaIy/M7DjpI9fns+SJqzpckDVWSIZYZ87hV0MxyQ5iXi0
         3dWw==
X-Gm-Message-State: AOJu0YwlvBw8SS2Q5VfIZFYmwoGiHcZpGcwaKfLJlQF8yzGUoTZL5GAo
	fsaQ0SmtjyiM4QKdmzIk+Ydt9EWFODXvdTbAiD7M0a8JRGbhMtDxgjxoqGKwGlVMZumaezp5Amx
	oOvTi
X-Gm-Gg: ASbGncuT7XFmCZfKt3ue9T92EHkUNHDsy7QH52rETFkkuJF8IWEyh5wqSbVXkLdf2gt
	kLDihwX1YrW0lv+9rP0qI9xeakhPt/s0tH5vnVda7Ejxyysd4E/4ChPnLohyFjQFX7EUld5k8ek
	9ZDuppLzNLKOa81xScnIOZu5gQlbdMnS9dZVEEKptbHVOpXShnnly7kCYB3cZmkbaIe5Ib2l2kf
	H3Glb2Nq/5AZPARCu9jHIAjbd03Lt+o3qMcAXKeTXTDmPk1TkWTcq+oyk00u6gDsqb7kcn9Xpis
	1oGto9szS/eX+j6+chF816BnXIoHzbwhquAvxjxZcwIzBdZZqKyiHub9VlRTXBm7n9gkhfzGkPD
	OlwypXyNEOMs5uDWUvjUsSu9tVYpw9+M5Ag1wf0mDk7YRMX8qy+7v6cA1kiKX+0GqJFwOAlcGUg
	==
X-Google-Smtp-Source: AGHT+IHdr2mHcfaBInUx8tr3+U4Kk0GbWplynplfQ4nA1+QMwI3R4Kq9XtkNCxGKLLQCxPh0VeCJeg==
X-Received: by 2002:a05:6a00:2301:b0:78c:99a8:b748 with SMTP id d2e1a72fcca58-7a220144d3cmr13421369b3a.0.1760941619293;
        Sun, 19 Oct 2025 23:26:59 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:26:59 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:09 +0800
Subject: [PATCH v7 07/12] lib: utils/irqchip: Add APLIC restore function
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-7-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232700_393436_1C56DC84 
X-CRM114-Status: GOOD (  20.37  )
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

Since the APLIC may enter a reset state upon system wake-up from a
platform low power state, adding a restore function to reinitialize
the APLIC.

Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi_utils/irqchip/aplic.h |   3 +
 lib/utils/irqchip/aplic.c         | 164 ++++++++++++++++++++++----------------
 2 files changed, 99 insertions(+), 68 deletions(-)

diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index e31f48a45019e1874e3223e3fb232f553890d06d..cbfcd3fd17bc09a644bf47e7d2716123c25a305e 100644
--- a/include/sbi_utils/irqchip/aplic.h
+++ b/include/sbi_utils/irqchip/aplic.h
@@ -33,6 +33,7 @@ struct aplic_delegate_data {
 struct aplic_data {
 	/* Private members */
 	struct sbi_irqchip_device irqchip;
+	struct sbi_dlist node;
 	/* Public members */
 	unsigned long addr;
 	unsigned long size;
@@ -48,4 +49,6 @@ struct aplic_data {
 
 int aplic_cold_irqchip_init(struct aplic_data *aplic);
 
+void aplic_reinit_all(void);
+
 #endif
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index efaaf0ca5b0e672e71a954d84029b0792ea539c0..8d0db1681583a397bbcec65c5033229752b080df 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -115,6 +115,90 @@
 #define APLIC_DISABLE_ITHRESHOLD	1
 #define APLIC_ENABLE_ITHRESHOLD		0
 
+static SBI_LIST_HEAD(aplic_list);
+static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
+				void *msicfgaddr, void *msicfgaddrH);
+
+static void aplic_init(struct aplic_data *aplic)
+{
+	struct aplic_delegate_data *deleg;
+	u32 i, j, tmp;
+	int locked;
+
+	/* Set domain configuration to 0 */
+	writel(0, (void *)(aplic->addr + APLIC_DOMAINCFG));
+
+	/* Disable all interrupts */
+	for (i = 0; i <= aplic->num_source; i += 32)
+		writel(-1U, (void *)(aplic->addr + APLIC_CLRIE_BASE +
+				     (i / 32) * sizeof(u32)));
+
+	/* Set interrupt type and priority for all interrupts */
+	for (i = 1; i <= aplic->num_source; i++) {
+		/* Set IRQ source configuration to 0 */
+		writel(0, (void *)(aplic->addr + APLIC_SOURCECFG_BASE +
+			  (i - 1) * sizeof(u32)));
+		/* Set IRQ target hart index and priority to 1 */
+		writel(APLIC_DEFAULT_PRIORITY, (void *)(aplic->addr +
+						APLIC_TARGET_BASE +
+						(i - 1) * sizeof(u32)));
+	}
+
+	/* Configure IRQ delegation */
+	for (i = 0; i < APLIC_MAX_DELEGATE; i++) {
+		deleg = &aplic->delegate[i];
+		if (!deleg->first_irq || !deleg->last_irq)
+			continue;
+		if (aplic->num_source < deleg->first_irq ||
+		    aplic->num_source < deleg->last_irq)
+			continue;
+		if (deleg->child_index > APLIC_SOURCECFG_CHILDIDX_MASK)
+			continue;
+		if (deleg->first_irq > deleg->last_irq) {
+			tmp = deleg->first_irq;
+			deleg->first_irq = deleg->last_irq;
+			deleg->last_irq = tmp;
+		}
+		for (j = deleg->first_irq; j <= deleg->last_irq; j++)
+			writel(APLIC_SOURCECFG_D | deleg->child_index,
+			       (void *)(aplic->addr + APLIC_SOURCECFG_BASE +
+			       (j - 1) * sizeof(u32)));
+	}
+
+	/* Default initialization of IDC structures */
+	for (i = 0; i < aplic->num_idc; i++) {
+		writel(0, (void *)(aplic->addr + APLIC_IDC_BASE +
+				   i * APLIC_IDC_SIZE + APLIC_IDC_IDELIVERY));
+		writel(0, (void *)(aplic->addr + APLIC_IDC_BASE +
+				   i * APLIC_IDC_SIZE + APLIC_IDC_IFORCE));
+		writel(APLIC_DISABLE_ITHRESHOLD, (void *)(aplic->addr +
+						  APLIC_IDC_BASE +
+						  (i * APLIC_IDC_SIZE) +
+						  APLIC_IDC_ITHRESHOLD));
+	}
+
+	/* MSI configuration */
+	locked = readl((void *)(aplic->addr + APLIC_MMSICFGADDRH)) & APLIC_xMSICFGADDRH_L;
+	if (aplic->targets_mmode && aplic->has_msicfg_mmode && !locked) {
+		aplic_writel_msicfg(&aplic->msicfg_mmode,
+				    (void *)(aplic->addr + APLIC_MMSICFGADDR),
+				    (void *)(aplic->addr + APLIC_MMSICFGADDRH));
+	}
+	if (aplic->targets_mmode && aplic->has_msicfg_smode && !locked) {
+		aplic_writel_msicfg(&aplic->msicfg_smode,
+				    (void *)(aplic->addr + APLIC_SMSICFGADDR),
+				    (void *)(aplic->addr + APLIC_SMSICFGADDRH));
+	}
+}
+
+void aplic_reinit_all(void)
+{
+	struct aplic_data *aplic;
+
+	sbi_list_for_each_entry(aplic, &aplic_list, node)
+		aplic_init(aplic);
+}
+
 static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
 				void *msicfgaddr, void *msicfgaddrH)
 {
@@ -163,10 +247,9 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 
 int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
-	int rc, locked;
-	u32 i, j, tmp;
+	int rc;
 	struct aplic_delegate_data *deleg;
-	u32 first_deleg_irq, last_deleg_irq;
+	u32 first_deleg_irq, last_deleg_irq, i;
 
 	/* Sanity checks */
 	if (!aplic ||
@@ -184,82 +267,24 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 			return rc;
 	}
 
-	/* Set domain configuration to 0 */
-	writel(0, (void *)(aplic->addr + APLIC_DOMAINCFG));
+	/* Init the APLIC registers */
+	aplic_init(aplic);
 
-	/* Disable all interrupts */
-	for (i = 0; i <= aplic->num_source; i += 32)
-		writel(-1U, (void *)(aplic->addr + APLIC_CLRIE_BASE +
-				     (i / 32) * sizeof(u32)));
-
-	/* Set interrupt type and priority for all interrupts */
-	for (i = 1; i <= aplic->num_source; i++) {
-		/* Set IRQ source configuration to 0 */
-		writel(0, (void *)(aplic->addr + APLIC_SOURCECFG_BASE +
-			  (i - 1) * sizeof(u32)));
-		/* Set IRQ target hart index and priority to 1 */
-		writel(APLIC_DEFAULT_PRIORITY, (void *)(aplic->addr +
-						APLIC_TARGET_BASE +
-						(i - 1) * sizeof(u32)));
-	}
-
-	/* Configure IRQ delegation */
+	/*
+	 * Add APLIC region to the root domain if:
+	 * 1) It targets M-mode of any HART directly or via MSIs
+	 * 2) All interrupts are delegated to some child APLIC
+	 */
 	first_deleg_irq = -1U;
 	last_deleg_irq = 0;
 	for (i = 0; i < APLIC_MAX_DELEGATE; i++) {
 		deleg = &aplic->delegate[i];
-		if (!deleg->first_irq || !deleg->last_irq)
-			continue;
-		if (aplic->num_source < deleg->first_irq ||
-		    aplic->num_source < deleg->last_irq)
-			continue;
-		if (APLIC_SOURCECFG_CHILDIDX_MASK < deleg->child_index)
-			continue;
-		if (deleg->first_irq > deleg->last_irq) {
-			tmp = deleg->first_irq;
-			deleg->first_irq = deleg->last_irq;
-			deleg->last_irq = tmp;
-		}
 		if (deleg->first_irq < first_deleg_irq)
 			first_deleg_irq = deleg->first_irq;
 		if (last_deleg_irq < deleg->last_irq)
 			last_deleg_irq = deleg->last_irq;
-		for (j = deleg->first_irq; j <= deleg->last_irq; j++)
-			writel(APLIC_SOURCECFG_D | deleg->child_index,
-				(void *)(aplic->addr + APLIC_SOURCECFG_BASE +
-				(j - 1) * sizeof(u32)));
-	}
-
-	/* Default initialization of IDC structures */
-	for (i = 0; i < aplic->num_idc; i++) {
-		writel(0, (void *)(aplic->addr + APLIC_IDC_BASE +
-			  i * APLIC_IDC_SIZE + APLIC_IDC_IDELIVERY));
-		writel(0, (void *)(aplic->addr + APLIC_IDC_BASE +
-			  i * APLIC_IDC_SIZE + APLIC_IDC_IFORCE));
-		writel(APLIC_DISABLE_ITHRESHOLD, (void *)(aplic->addr +
-						  APLIC_IDC_BASE +
-						  (i * APLIC_IDC_SIZE) +
-						  APLIC_IDC_ITHRESHOLD));
-	}
-
-	/* MSI configuration */
-	locked = readl((void *)(aplic->addr + APLIC_MMSICFGADDRH)) & APLIC_xMSICFGADDRH_L;
-	if (aplic->targets_mmode && aplic->has_msicfg_mmode && !locked) {
-		aplic_writel_msicfg(&aplic->msicfg_mmode,
-				(void *)(aplic->addr + APLIC_MMSICFGADDR),
-				(void *)(aplic->addr + APLIC_MMSICFGADDRH));
-	}
-	if (aplic->targets_mmode && aplic->has_msicfg_smode && !locked) {
-		aplic_writel_msicfg(&aplic->msicfg_smode,
-				(void *)(aplic->addr + APLIC_SMSICFGADDR),
-				(void *)(aplic->addr + APLIC_SMSICFGADDRH));
 	}
 
-	/*
-	 * Add APLIC region to the root domain if:
-	 * 1) It targets M-mode of any HART directly or via MSIs
-	 * 2) All interrupts are delegated to some child APLIC
-	 */
 	if (aplic->targets_mmode ||
 	    ((first_deleg_irq < last_deleg_irq) &&
 	    (last_deleg_irq == aplic->num_source) &&
@@ -275,5 +300,8 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	/* Register irqchip device */
 	sbi_irqchip_add_device(&aplic->irqchip);
 
+	/* Attach to the aplic list */
+	sbi_list_add_tail(&aplic->node, &aplic_list);
+
 	return 0;
 }

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
