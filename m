Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53679C83F15
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x2K2kQIigFLW6994+gtHsHkPVAHFL8yC440FGtaIHpU=; b=a+56eVK20vPTWH04TMJVrr/VIh
	o1bSmvDhLG57PZqJUzMvVCBxT02PCWKcLQVbJebD/KH6HYYwWnpxEo/54gWARBra/x/PNqvXRogSo
	wkFts2KwrEaexLA5mpGQB3dCyFp49BhXD1+x0WT1JlSbs2utl4r0vqaNaqJvjfZ8k7OCngmSq2wVD
	QFNDnX2KVRoWJ3g2UDWnh/O2tczg/huECoDTys231H9P/wsJd/QV88X8F3dMm6HxjFN1dCefxwbCO
	XSqKVeLyNUtFAt6BFM/76mjJzI+Wv6+aGrbjgGDkqsCzX0TgGlyr7CoK73RoKwFGUv9FKKPfaHH3Z
	uS0xjsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Eb-00000004fSS-1xoK;
	Tue, 08 Jul 2025 07:59:25 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35j-00000004dQf-2EmF
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:16 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso44034306d6.1
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961014; x=1752565814; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQjfVILwCaNXB3Ehaj4l+o3Kj/rYAyKc19X6dOd7fcA=;
        b=NsNCg90WORYBMhUtFzJtMsnrTDw7qqrINlW0UZVoHmSPj4kjq4ec4PGCqgnnixP2M5
         ZR/Hx2kBMMMfUGhUJtiZ3ZxZgnPuZwQeY/prQdsT1U4Hf5YGlkw1dD9c5qJU4BmOosys
         RFRdC9whRNwHL1LRi5Do9uWW4kS72Yb80bP7iRC/X42V36d1gcH/bW6Jci+tScXlHwlk
         XmrEDedsg6++D0B9IoycOX6EQRJMjhrxxlAbL8XO7c0TKnUIF82cZJ1zIGSzqNMMLani
         Jx1qomonNKDbWD++2kNGUIdPFutWyl2BLSFkv7jeJDJPXx596SzqE+OEeY4fvd4M73MX
         pdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961014; x=1752565814;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQjfVILwCaNXB3Ehaj4l+o3Kj/rYAyKc19X6dOd7fcA=;
        b=FZ0BMLiSKASK7l9hfJAJ7+wBCBwuSwL5ZTk2KL8rAF8Z+cHjOBCAOsVbkxECuRrRqn
         UBBAUbIGqPLwqhrd+PnscBMqRVimbDAmqj9gH5cLfx6iH165D4kzUnkkLd8NLZztXFTg
         hjeYIMql6VVtqAWR/G9Y0z7FGKAhmHHWu+vRpD2gYvk0eso8/+UeHptenyjUrxg+cD2B
         fyqVjz+5hSbt2cfPMyZguI1SvvHhGEQMhfJ+h0fJBOhgOWIzyg/npfsiADKm93fShZ9e
         JNF30y6JLUbJyQfDIVcYYv3skhLuh8i9ErNKS9e/BDES4qZRaNQDvgg09WMg6McIhoom
         NDNw==
X-Gm-Message-State: AOJu0Yx0ub5aZo+mNZwxMtpIcSLyGj353T7qwjIbYWFMOS0SwDWMI6cX
	qp99FNN7Y7Jibv+81qdSYhigvBOh/9870jrsrTHG0R/e1ux6YnQnEqUQG/GQ7fPOpHY2beSgvCS
	RQ9yZCqGNbaoSQIvTxyhSxI7NS+VxfEKb1pP6Uv7P4n0Irhz/GxnSzBSFHU6ttCCbQcHZEvRqTq
	FodP2N1qzUVCS73DmCaKG8fC7FlkiypMBdklsvfAd/ZZqCfQ==
X-Gm-Gg: ASbGncvqM9gzxoFbSVVrEYvk2Z5WOVHE8mMqgT75ad6SIPfRPM7zx/1zHgtneFQfLau
	bNeptCkm0gjvpz1dapsPh9TcSOBkhlgZkKWishmZ3CkCVIuIyBBap9Y9wh9GDC9yZ2xNdD1JCNc
	Ia0d7vyEFo1u3UKbvUgrUU1bs88bEpYSsDldHQ/dHoEIIjeGkP2I39cLnebslDHqT5hX6kbGkEj
	K3YUQNPH6XS/SIoOCfQ00WHqDJPtNS8JBaqj8BK76GVcBf3my0CTy6tAelKx0VpziiQAJLEE9nB
	zxcb1u/EpvD5+Zh6nbC3aNEHsOzqa5rwckN9zsVcXzLTUl0jgVWLHSikrvziapr9VXhhdA/OY5r
	Kx4bNsBiZ
X-Google-Smtp-Source: AGHT+IEw7NaL11BUVzPHUzsx3jVgiZrMjxP1DfsT7w6Zr3Zk4Q07VobCOap8hMccpp3Xzqkh8Ec3yA==
X-Received: by 2002:a05:6214:4404:b0:704:761c:d021 with SMTP id 6a1803df08f44-704761cd033mr92055176d6.12.1751961014093;
        Tue, 08 Jul 2025 00:50:14 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:13 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 09/12] lib: utils/irqchip: Add APLIC restore function
Date: Tue,  8 Jul 2025 15:49:37 +0800
Message-Id: <20250708074940.10904-10-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005015_571433_94D6A90D 
X-CRM114-Status: GOOD (  21.10  )
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
