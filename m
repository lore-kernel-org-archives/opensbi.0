Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45574CA1012
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 02:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBp9qE7bPQuUu6yc6yKDkF9fflyYuTsb45koJqntgLQ=; b=yPZV1+E62PjAjr
	EoR1RaWPTr9Yt8Id7OTmnGEE2HKHlmU7MCuQIs2K8jT4gMTiH8s3uDlMedJ5pKUxOcZaInttL997k
	sbxMjPOXbzuoPHEukfyLBPJytNCk28sM1i+yueuBmlJM7JDpzA3H7V7P+De3UaMBf6rfipS2kdUe/
	T44zV0rYC6kJJ27DfXu+UOiyOI0rT3h3NPZ/d0gUETUdzH4Ai34hp9gc7AF/lOpzHWEon52AE2t50
	diTXu7Zwoxdd9nqMSzH8fsTDCdoTqiO4InwYeTun2OyyulyxxvkhpBzwEslYwj6kYzg/CIDoeuMLY
	YRcyZ42xuANlbYbzdaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM7t-0000000G851-0l7U;
	Fri, 05 Sep 2025 02:24:33 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0K-0000000Fxhn-1leE
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:45 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b4c29d2ea05so2025800a12.0
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038603; x=1757643403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySoJwy/A9pQClp8Vvz5zLwcJT8LfTSXE6t+mRov1uz4=;
        b=YxKhmZE+DC7iJ+DwrRPkHZ64YsiA+fX7Zcc+UPvl1YVtYUeISsfVDeMzFXQ6r/HTl0
         3tETA9/+6rhyJdGoHS9zVUJMRpgBmZEK923k/oTFdmDBb6bhtPVX7cXz+Ej1CxDeuofZ
         o1PO/4LZ/q7HXizUq1Ki+E3Izq66HarF9uTas7YGciKoJYUQXuotG9zPFAuw3WCGunA/
         tuig/RC1BEWijLG7Z+k7DYQcq2sLUpB0z+n2Z5NwnWL6wQDeHMv9WF2TobQjA0MbnJ8B
         QFxETweCJjY11TDX6+jB7XIUYSD/9tRTP/drCzNWQtq/uuAWz4qc26x2OuO8tA8ybP4q
         L1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038603; x=1757643403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySoJwy/A9pQClp8Vvz5zLwcJT8LfTSXE6t+mRov1uz4=;
        b=KLeuRpJQzZtc1idPjZQHr300LR40dC/653eTICHw2qOI21RC+EVrIScKuzKnIfssKW
         Bry7vBadPzf2mBEJvp3k73ZFLW2hHXt5OQEZqkCGNqRrKHio+eCtvqpsD/R5ViL7HtqJ
         3Z9GqJlvFzOUxYkkro2NbQ+nozqXEOjXJhqsDLyBfMIyKegl2HWXLF4EhNC/Ln/7Vr4+
         Lcpn4uvA1m3U1H3PCeGbnPBla/VE5JvXVl+FTAkt5zn0Qe0I2hNJl5S50saBBWKVCFoz
         OxlrTska+ZHdx8I5oOSqj4dpYi6TOobEFgCyj+onwkMRYLJs0UCRhA2K090zjtiDSA41
         d4Sg==
X-Gm-Message-State: AOJu0Ywme+kvPYzMdkkd4B6fuuEAVkCpxbQg+/IzH+F4P/QPdnjbfrL7
	DYsDG59Y2/oYNnRQncMmUfOofLgoCRP/dyX8AeHAalbhftmJ4qIb9z+iVhO21Lvat5aDjQlu8Dy
	Uo+VjYNazPtH0owqQo6vmiVhO76q3pmFTz/k9Chkr3HCtiEMNk8BH+yOFw8mTwaD9duuj9QV5RH
	u4nihAhuqoikbcB2gY2p5yjz0tm6AiaYEczl8uVz2XKYaz9qRg
X-Gm-Gg: ASbGnct53GKMewZb+6vuUc3DvzYDnhQFF4894I23F2KreQKDsakMGx2h9LFKWzjMKdM
	ERnKm51H9rM/zbT465vU+DBg3KBxjSIiQ5lX4fGJ7SBfHf/Wl1oCdukmXfYuBlu56Nk0tGW6W8W
	NMyR7Utk5/B/EGaXjjcijEmj/bck5ImchUUTNPm5TvYh6YX/TgFbNu+l0exSWLCnW/cAwSISN6Z
	NkifhsW1HXs7n1dMb088KhfOV4+90/QKzZS9UlT1nYXpFNQmJ+MBVHu4P85wEqMqPyCQNQjd0UD
	C6Hk5FePnuQFakO83EKAnz13ZSN7qHUL/vOe5iApKF6OTb1cFa3Ej0DECK7RT6/5wvuqM6BTt/M
	gtYUi/KhyQpKLdyqejLrj001s2kXd+52PE74W7GKI3A==
X-Google-Smtp-Source: AGHT+IFHXyYXQnCCzDC3WCX/NpFzBFQAEuWbXsgdVEzBE5bojHuS/XOvmf+OcLTefETvNDlwGr6zEg==
X-Received: by 2002:a17:902:d4c9:b0:24c:e211:daed with SMTP id d9443c01a7336-24cefe2272emr19221735ad.26.1757038603192;
        Thu, 04 Sep 2025 19:16:43 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:42 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 05 Sep 2025 10:24:41 +0800
Subject: [PATCH v6 08/11] lib: utils/irqchip: Add APLIC restore function
MIME-Version: 1.0
Message-Id: <20250905-cache-upstream-v6-8-6a6da629c961@sifive.com>
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 Cyan Yang <cyan.yang@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191644_468602_95DEF2B5 
X-CRM114-Status: GOOD (  20.60  )
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
index 72906d5d13995fd4e40dc0dc74a609148d65c742..e40d8829d5196dedafeafcd8f1e31d4a88cb5dbb 100644
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
