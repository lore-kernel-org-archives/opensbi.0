Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E0DCA100E
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 02:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NY8hUpoAie3C9S3hhKpeK0UHFslOTIeKFeWzbd2fIY=; b=3Kj32PxH1WF1xf
	xx8ZUOEe/eUtbFzEbQYLKrqV9oOzA+IV1d/y8Sc8Kh6j3uUOXOiWBXCExLQ9RtshsmLmvC6h4/Ev3
	avZ6Sx5NFbmedbh03CFbWbWOmDjWSqE7iFBuQTQt+pLyswjeOAGGmKSli2+xhpXHARP2qi8P4fT+5
	rkrV1gzs+uIwqm4McNlbpLdx+exS0jxMDoBfZ8aHYAk1px+2JXd9qlwgJ45mng7ObBOYp2pokGifb
	CJlkiwC6lI1F1Pt6/pwfYn5f+ZBvEDiuU0gqGJQ7kmvamt0CeZRCh8GfqTm4xd5EuhyikUq5aiQk3
	w89HFM8gfngOeCyOlkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbx-0000000Epef-2L3U;
	Tue, 02 Sep 2025 02:19:05 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbu-0000000Epcf-3ZXP
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:19:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-24abf0215e8so15336575ad.1
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779542; x=1757384342; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6pnkqdxK61+uhRhR+8j29+ol6NVen3TOKqpU86KTCQ=;
        b=ArCRte9XuxhC3748U/oMxw4Ty6yklrNhavXlrTY/WQRZ8liSmcJUWT0Gm1BR67Gr8q
         Zuu7zB9TFn+MjWUiEF4XmQfID2CF37p8OUlwt9RMpDD52paSgLZIo/QtG4dursMpDVBd
         nlknvei0Q2DdHL868R+pYCHTqGv4FaaZ5MYPgmIk8PIgJBuyN7lAW6hUm/622XtaElL/
         jVexvtl9Qk7NURFHz1FK3BvvPj0YRQAUW2OFYqoyE/O8e5CoXvuorF2/gVMzqARyQas5
         lwbEUmUjjBAk9DUjxHP5rJLJWPuDmRMeJO3/1gjXNkJXrAnrJAYyh/+y5EHfq9abDi1w
         hfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779542; x=1757384342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6pnkqdxK61+uhRhR+8j29+ol6NVen3TOKqpU86KTCQ=;
        b=jSP/H6JG7con106lc91L2G2pVK6FthatX8y/vNEGmQphgfCDxWPodByN3jKwep6u4U
         k6dq7oHX98Oyu7ri7Gze0vNYsHhEHdaNCAjxjvsLOFfB+/7lDGaml7mABgdEdSSFkoLI
         MU7k1PreseHXGVuBtZYdrYI3wH/xmeeDeAn40VKUUddN429Zox4DguDEkbM/gGse1oa5
         bYuijUZb/84HdJCOIjJIrwqrWjaPzIF07JuW54Rx36secoLj2kmxDFZsKPogpcvdTkNR
         aTXEbjLxrZMbD4Q4MypH4ajHQ8Ly1wZzNf2iYwpMjI4DFOgOH1XtnvMLlSkqkVd5ZcgT
         i77w==
X-Gm-Message-State: AOJu0Yzw1/3lyG38Vflv0DUnLq8PErddPaSuw1728xTOPXw1UX3QSPyn
	7yqGD4imWw1zsLe15ygKtB8WL3i+ft1zvZAqsLc2LcFxwh+WHaqs4Y8st7+whi7u9KM7/2oblC1
	0SU/bBYjhY/o2lc3cyiY9cAhpv+JdkwV4s8RO6ATsDYWHdQ1oGIyZKPKCCYzLt7+m5q8n5Q49av
	hi5acGI3N0cucHbHlln7u1GkPRxhAL/1HiftruImlnEEFNTw==
X-Gm-Gg: ASbGnctyVDu5pt9/vNOh1mvUPJv1g+9AIEa2HCI1v3cdDtj2xHmqO2vUrnIWeNdWtSz
	CJ5jXLvLgxbmzOL0JfnTi7gSEPTGQaBLtrp5zCVDvtEGHuTX3Gvet/3Xdx7FPkbu5Vig0aB3rRt
	hLy2iYdb09OcUm8zkSQnuHdGEOSCQyOZIWxU3Emh+tK/4EsQ8e2Q7IMJuox4cP9qO86fVgNMzlA
	LWtgjmnjU1ZslQbniJtQYMGoDAfBevbiPVMfqzKmxEoMKG9j/KAFhnDi+SOEl6UHl0to01bRIRB
	GxcHdaGAx5gEUHDJSZ41nePUN+XkIt69SU7ZWjEnvWPUXuGUeuesacUyQZnsvEikcbPf8H/iGol
	dB9a1TXNg4QuXR09njNxuMUPOCW2p+UQ=
X-Google-Smtp-Source: AGHT+IFrHgDE2Q6dGE9J9hcMXewo+NnvXqp2I1cZKOMhkTiT4FROeozDOHH+upzZjyKLAUDw7ZND3Q==
X-Received: by 2002:a17:902:e80d:b0:248:9b4f:f688 with SMTP id d9443c01a7336-2494485db43mr102329785ad.4.1756779541903;
        Mon, 01 Sep 2025 19:19:01 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:19:01 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:47 +0800
Subject: [PATCH v5 08/11] lib: utils/irqchip: Add APLIC restore function
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-8-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 Cyan Yang <cyan.yang@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191902_901302_5940C2A6 
X-CRM114-Status: GOOD (  20.89  )
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

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi_utils/irqchip/aplic.h |   3 +
 lib/utils/irqchip/aplic.c         | 160 ++++++++++++++++++++++----------------
 2 files changed, 96 insertions(+), 67 deletions(-)

diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index e31f48a45019e1874e3223e3fb232f553890d06d..ca606d06fdce774ea19b90e4686019e86171c641 100644
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
index 72906d5d13995fd4e40dc0dc74a609148d65c742..68f5d107168277849c6e6abfdf7dec5be23900c9 100644
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
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
