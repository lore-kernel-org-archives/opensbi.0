Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FA5CA0EFF
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x2K2kQIigFLW6994+gtHsHkPVAHFL8yC440FGtaIHpU=; b=eAMQGy44vc+yo6cEcKzPDpvUIv
	eX0FDMoa9UhkhoYBNmxWrL/6UsXDvSrUaWiR6lYJmr3Mgi2tZtzSx0XdrS0KNX0XGazgwPZs+enBy
	iqaKxsALZl6VC0W/dVJ8LonSD/JJRvMApZ84oMpEvyNG71gKw/xc31DczpPNRrsWP9x3YiUM8S9M+
	Y0AwDKNxkwIrQNQy4AFpLbnHPcJ1XBYruSUs7nL2MBFguBH2sc59mWqDE07jHKX8pH7TQ8xN7btUg
	PiafQGu9hLMAuScBO+JOi/lHPnSzFH5rvw4rM7Cmo7Sxhzq0FN8wZvTiu8EdLBcb6ym0dGVV++2rY
	UM6ifGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbL-0000000CHSN-36As;
	Wed, 20 Aug 2025 03:35:03 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZc-0000000CHEC-05cH
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:17 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-32326bd4f4dso483981a91.1
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660795; x=1756265595; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQjfVILwCaNXB3Ehaj4l+o3Kj/rYAyKc19X6dOd7fcA=;
        b=Em4l1RSBBnW6yC5Gj7hEeZHUGhWe5h1/Ujy2DjAkq9u7Ue5OJfjEY2irIxUa2TyZGs
         p1ycjFcV1UuoIfVB58i0Ph30By4rZAxKN+z9ZQJvptZOUZXQ2GewyPktFYuoMPhanNyz
         chOlZJxXq2f5M5AIjGyKLi+ItmqjD89g0oCV4GvIj0cDX1OwPZvV/5R5DIxqLXrFOqvU
         PJZvqYttvhyzjEWirXbvhkE+yvMTJhG7qYwCEvnnbkky12HCO+HhSiXR7DDFnDL2LTse
         7zpQfO7f/vMWMY2KfFUJ57CHZSIiKyaW1P0PkJJrMYmQ4aFQpo6XltBD6l5EBkuTD9Y8
         Yfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660795; x=1756265595;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQjfVILwCaNXB3Ehaj4l+o3Kj/rYAyKc19X6dOd7fcA=;
        b=k6AEGIchOB1ztTSt0WjgC6uyWA+HeGRYCmV83yuCkxep8XOQUxT6+0Aa/evKkeMd/x
         OiIzvic+0SsGfjfWe9ljrsKRpdP6msTDAQk2d9H9pQyUT2EyEi5/IKS4+0NFeU9uhmeu
         LltuGgAPRMsrS7GR+uHv0oTCpouvUpiE2Sc/Xy2qjS8JOR71ZmVOC39d9bHRzwaW+paz
         OxeVOfMqxmIYXmfj5vVMcNrZ43ZqX/hBkesNrNN+goq8fRQtxSQTH/4WuLXMJmMEfeM/
         I7zMH2bzlY8ICd/dTYZt3DTZNoWo67e4Kr/ZMbRQijTEsB+oQkCXJ5UFYXBSnGduBI6a
         +Crg==
X-Gm-Message-State: AOJu0Yys26waEcd9p0b9MBu0vV61C6UW/k4ZTJjyzSVAOAVvid6q3Va1
	inkwGxpOIfEDPNGWBUvYWv3XVxD+whrwrtVX56cUuXjcID/Ukx66uI6MQf8J2pTDtfYa0C+BPve
	GeLGFQbN1M18i8j4vJRBMzwlhdKLhsihamQ0i12G5U4ix+qHFk8jE7ILEmlzAePzQ20RNPaKUo6
	8/jGfjfyWxCHhXi8ulFKWkdO0oZaJCakZOX/FAveqt6lGLkg==
X-Gm-Gg: ASbGnctpG01UPOCnfld4Q5++W14DgzYPdbjCuaVbgdkrU1tgiO/U5+3xKhAI9wvK664
	5hzCGFaRX87h40XWzWAxromAOVI8Ho4Pe9FMxf6Zz/kf8mq7vMf3BGpbDYMGBe11IRLdCYDT03e
	3dt0jv74mBVgtfgxYSpkyZZ8EsTjUxAZdU2PYBgDNnnZGYfynNQhW7UQAJAhlz4+sspFE07WAZI
	MrNBDzw5tVPVY1tq/fo++vWev3P6t3wTNEnBbpVniRAnpzNzVovoSGrmGNqVbHigKdnJ7laEpaf
	18DY4ZcJ8gRl1l+CFuKoif/gszzsldU2+thWObs21zLMF+JFAkz7waxFAecxZ8MxoNTZMPg2i1s
	RakzWsRoe2C27oUbl2yOBlomrfbglGwMbsYtMzSMQVLef
X-Google-Smtp-Source: AGHT+IE46cdVQJwmHUIxVZnQDt9jgSO91BzdTvDFct4A5Hx/FBQldhiyGN4lcudgOWudquC8PB9CuA==
X-Received: by 2002:a17:90b:558e:b0:323:7ea0:ace8 with SMTP id 98e67ed59e1d1-324d352d237mr5878851a91.15.1755660795006;
        Tue, 19 Aug 2025 20:33:15 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:14 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 08/11] lib: utils/irqchip: Add APLIC restore function
Date: Wed, 20 Aug 2025 11:32:47 +0800
Message-Id: <20250820033250.544-9-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203316_062333_EFB50DA5 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Since the APLIC may enter a reset state upon system wake-up from a
platform low power state, adding a restore function to reinitialize
the APLIC.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi_utils/irqchip/aplic.h |   3 +
 lib/utils/irqchip/aplic.c         | 160 +++++++++++++++++-------------
 2 files changed, 96 insertions(+), 67 deletions(-)

diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index e31f48a4..ca606d06 100644
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
 
+void aplic_restore(void);
+
 #endif
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 72906d5d..68f5d107 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -115,6 +115,88 @@
 #define APLIC_DISABLE_ITHRESHOLD	1
 #define APLIC_ENABLE_ITHRESHOLD		0
 
+static SBI_LIST_HEAD(aplic_list);
+static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
+				void *msicfgaddr, void *msicfgaddrH);
+
+static void aplic_init(struct aplic_data *aplic)
+{
+	u32 i, j, tmp;
+	struct aplic_delegate_data *deleg;
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
+	if (aplic->targets_mmode && aplic->has_msicfg_mmode) {
+		aplic_writel_msicfg(&aplic->msicfg_mmode,
+				    (void *)(aplic->addr + APLIC_MMSICFGADDR),
+				    (void *)(aplic->addr + APLIC_MMSICFGADDRH));
+	}
+	if (aplic->targets_mmode && aplic->has_msicfg_smode) {
+		aplic_writel_msicfg(&aplic->msicfg_smode,
+				    (void *)(aplic->addr + APLIC_SMSICFGADDR),
+				    (void *)(aplic->addr + APLIC_SMSICFGADDRH));
+	}
+}
+
+void aplic_restore(void)
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
@@ -168,9 +250,8 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
 	int rc;
-	u32 i, j, tmp;
 	struct aplic_delegate_data *deleg;
-	u32 first_deleg_irq, last_deleg_irq;
+	u32 first_deleg_irq, last_deleg_irq, i;
 
 	/* Sanity checks */
 	if (!aplic ||
@@ -188,81 +269,23 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 			return rc;
 	}
 
-	/* Set domain configuration to 0 */
-	writel(0, (void *)(aplic->addr + APLIC_DOMAINCFG));
-
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
+	/* Init the APLIC registers */
+	aplic_init(aplic);
 
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
-	if (aplic->targets_mmode && aplic->has_msicfg_mmode) {
-		aplic_writel_msicfg(&aplic->msicfg_mmode,
-				(void *)(aplic->addr + APLIC_MMSICFGADDR),
-				(void *)(aplic->addr + APLIC_MMSICFGADDRH));
-	}
-	if (aplic->targets_mmode && aplic->has_msicfg_smode) {
-		aplic_writel_msicfg(&aplic->msicfg_smode,
-				(void *)(aplic->addr + APLIC_SMSICFGADDR),
-				(void *)(aplic->addr + APLIC_SMSICFGADDRH));
 	}
-
-	/*
-	 * Add APLIC region to the root domain if:
-	 * 1) It targets M-mode of any HART directly or via MSIs
-	 * 2) All interrupts are delegated to some child APLIC
-	 */
 	if (aplic->targets_mmode ||
 	    ((first_deleg_irq < last_deleg_irq) &&
 	    (last_deleg_irq == aplic->num_source) &&
@@ -278,5 +301,8 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	/* Register irqchip device */
 	sbi_irqchip_add_device(&aplic->irqchip);
 
+	/* Attach to the aplic list */
+	sbi_list_add_tail(&aplic->node, &aplic_list);
+
 	return 0;
 }
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
