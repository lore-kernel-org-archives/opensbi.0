Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4A5CD3427
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WlZ7mvN5CwiLpd9daFhgQyaqtCo6vw00i4zUuxuA7ng=; b=w/3ydSO5uai9rA
	wTJDVyr0N1KLtRAwgXN76sOduoHS8MRw3dZsJ3ylZYbQN5kDtzsJMlPFbN5BNxsv2ZxyyISD2A7yF
	hWIpCdrKRFp7XNhzNxgHePh8YZPT5SuVDPSeNMETmje9mt57QN2+9eW2ifY3bLz/3zOkDxwUYJVqV
	DEGqTbsrxYp+VXNyidfZ/Ix6jDyX1osGFTZl5xiFWSWD9JTArN01agjditYb3khYZlbeF9o+cjw/w
	VhFKoxYACcxLqasgoL+GVBSUjwsa/nSw1ouiYhNUARKrwRFfn8tYqvFNLdpxLqydnivyhGkFSYHhq
	+bCPf9m6vkDUGLX+QCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwrk-0000000Do0Q-0zkr;
	Mon, 04 May 2026 17:13:56 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwrh-0000000Dnzy-1OQG
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 17:13:54 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50e63771d91so46844341cf.0
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 10:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777914831; x=1778519631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwcU9C+Fb00TAYZBFd/cllroMLG99hVE1xsW6E2kDDg=;
        b=qxKlV2NIw4Q3gAGrVD5vzfzYP3BxM5fitcL0NgbuLTlGIFUoCJX+0lpcajshz0VyqE
         Dr+VpDMVnUwfi3T6B1JGZhtlW3Ce/d2nMm7apnOAWGSXMRZ1APVd0P1uu0e+kSeAy2Ya
         rtWAlaG60A9suvtaveBLXxQAucPj6ZHPQGUB4XdlTyTiuQjMK568EgSJVAc9gRCdFFuj
         2oGZR9t5jOHi2zXLJIjROJ/uQnS5gcVcRaFcyvu9ggST3sJ8iIvNHAU7WEO/SA6GylVu
         aVItTpkP2zzvDFnYiEyfm79xlSc8kW/DLdb2xPw9PwXIFqR2fONQ7n7eAfQG3Zwvpwog
         WAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914831; x=1778519631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwcU9C+Fb00TAYZBFd/cllroMLG99hVE1xsW6E2kDDg=;
        b=hK72v6nWkJG7NhtW3aUrkhZ9jGgxsCZx39V2qz5oBYiznhyp6eraWLkV5b6JB1prXs
         tYU9SjeCBiq9phugsAobmVarEO1DE5WlZz1d9T++GPIIncOWoG9sdwM5FPoYnYWYGQVd
         kp/f1vkAqoWyLMbW6DNeNZMIgWtDsGLAg3YslzzR+XtFKwT8tbEcdgNNqgfxDbN70cxw
         23ozyRkyZjBQroWzOYOXMUQua6sWfPVfNW5DdxullrauQ4aLepZ4Rh9X2eYkdyDGlZDY
         XLi3DYiziOGK/TaF60Fv4btSWLt/pWi/6Rqk/4uOYuaixtI/g83EHYQAB1+hyob/RBqA
         p6ew==
X-Gm-Message-State: AOJu0Yx+ijNlCFWptu+EVFMdQ14fSuQXQuWwrsMn3+IxWZZfywobcyLK
	po651EGtZ5LkPDdjFids34r4SFoMmruF+e9u09zoTOVfRgty0oYHEc9YPn+dghlns6Q=
X-Gm-Gg: AeBDieutrO8o1TIvpJcbGik6EtBPbrwOIYzeurU3zuje1DvmY/FOz2VH5nTvrHYvUA/
	oZhLlvvasZMmneflyVvqfz+VrCEux1sniPmQrPQ/hTm8SevihZmI1fEgpUUCka5lPTZ8xCxkg1e
	ib1kRejbxxR3yOOYtvRL7yuN7rr7MRBptc9V4a314+BqqRXbqkQ3JkzLIhFPzdA9wzgtADoZEHW
	MzTqFjfJWcFE6niBoRgAuGJp2BeMnzpg63yYP2vbQh99dRy/2WenJCfbMOrQU7Fh5K6sbyhnXhD
	Re1XIlcUjzfDhALzoX+mZ9F7F7RWUbVvV40eIp5OyLswcNhYYtIMvkdUqZXWEmmm3uxZ4sNqiTK
	O4EPd7KVXAwg9vEHLs55xlKGXYm/ZdofI4LLncUfDrDp4MmCcDXlVEOH8dQCNXyTilHTJS59kOI
	OkIMTEYGmWmRpNd6auPXyLJyfdhBTWdPIiesXM3lPIEqMeUIB1NGLyz9Xy1qa78rmswynbJlCkp
	tzn3D3vJuHW4taFRX24DQ==
X-Received: by 2002:a05:622a:5485:b0:50f:be4f:465e with SMTP id d75a77b69052e-5104c014372mr156166051cf.53.1777914831203;
        Mon, 04 May 2026 10:13:51 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040927789sm102332871cf.11.2026.05.04.10.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:13:50 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH v2 1/3] lib: utils: irqchip: implement APLIC hwirq operation hooks
Date: Mon,  4 May 2026 13:13:40 -0400
Message-Id: <20260504171342.1655882-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_101353_393945_D0841C60 
X-CRM114-Status: GOOD (  19.46  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Implement the APLIC hardware interrupt hooks used by the generic
irqchip framework for M-mode direct-mode wired interrupts.

Program a minimal APLIC direct-mode configuration during hwirq setup
and claim external interrupts via IDC.CLAIMI. Add the helper logic
needed to derive the source ID from CLAIMI, map hart index to IDC
index, skip delegated interrupts, and register process_hwirqs()
only for the M-mode direct-mode provider.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 lib/utils/irqchip/aplic.c | 227 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 227 insertions(+)

diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index ec69c82b..3f4991b5 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -245,6 +245,220 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 	return 0;
 }
 
+static inline void *aplic_idc_base(unsigned long aplic_addr, u32 idc_index)
+{
+	return (void *)(aplic_addr + APLIC_IDC_BASE +
+			(unsigned long)idc_index * APLIC_IDC_SIZE);
+}
+
+static inline struct aplic_data *aplic_irqchip_to_data(struct sbi_irqchip_device *chip)
+{
+	return container_of(chip, struct aplic_data, irqchip);
+}
+
+static bool aplic_hwirq_delegated(const struct aplic_data *aplic, u32 hwirq)
+{
+	u32 i;
+
+	for (i = 0; i < APLIC_MAX_DELEGATE; i++) {
+		const struct aplic_delegate_data *deleg = &aplic->delegate[i];
+
+		if (!deleg->first_irq || !deleg->last_irq)
+			continue;
+		if (deleg->first_irq <= hwirq && hwirq <= deleg->last_irq)
+			return true;
+	}
+
+	return false;
+}
+
+static bool aplic_mmode_direct(const struct aplic_data *aplic)
+{
+	return aplic->targets_mmode && aplic->num_idc;
+}
+
+static int aplic_hartindex_to_idc_index(const struct aplic_data *aplic,
+					u32 hartindex)
+{
+	u32 i;
+
+	if (!aplic->num_idc)
+		return SBI_ENODEV;
+
+	if (aplic->idc_map) {
+		for (i = 0; i < aplic->num_idc; i++) {
+			if (aplic->idc_map[i] == hartindex)
+				return i;
+		}
+
+		return SBI_ENODEV;
+	}
+
+	if (hartindex < aplic->num_idc)
+		return hartindex;
+
+	return SBI_ENODEV;
+}
+
+static int aplic_hwirq_target_idc_index(struct sbi_irqchip_device *chip)
+{
+	u32 hartindex = current_hartindex();
+
+	if (!sbi_hartmask_test_hartindex(hartindex, &chip->target_harts)) {
+		sbi_hartmask_for_each_hartindex(hartindex, &chip->target_harts)
+			break;
+		if (hartindex >= SBI_HARTMASK_MAX_BITS)
+			return SBI_ENODEV;
+	}
+
+	return aplic_hartindex_to_idc_index(aplic_irqchip_to_data(chip),
+					    hartindex);
+}
+
+static u32 aplic_domaincfg_value(void)
+{
+	u32 val = APLIC_DOMAINCFG_IE;
+
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+	val |= APLIC_DOMAINCFG_BE;
+#endif
+
+	return val;
+}
+
+static void aplic_hwirq_mask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *aplic = aplic_irqchip_to_data(chip);
+
+	if (!hwirq || aplic_hwirq_delegated(aplic, hwirq))
+		return;
+
+	if (!aplic->addr || hwirq > aplic->num_source)
+		return;
+
+	/* Disable source */
+	writel(hwirq, (void *)(aplic->addr + APLIC_CLRIENUM));
+}
+
+static void aplic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *aplic = aplic_irqchip_to_data(chip);
+
+	if (!hwirq || aplic_hwirq_delegated(aplic, hwirq))
+		return;
+
+	if (!aplic->addr || hwirq > aplic->num_source)
+		return;
+
+	/* Enable source */
+	writel(hwirq, (void *)(aplic->addr + APLIC_SETIENUM));
+}
+
+static int aplic_hwirq_claim(struct sbi_irqchip_device *chip, u32 *hwirq)
+{
+	struct aplic_data *aplic = aplic_irqchip_to_data(chip);
+	int idc_index;
+	void *idc;
+	u32 v, id;
+
+	if (!hwirq)
+		return SBI_EINVAL;
+
+	idc_index = aplic_hartindex_to_idc_index(aplic, current_hartindex());
+	if (!aplic->addr || idc_index < 0)
+		return SBI_ENODEV;
+
+	idc = aplic_idc_base(aplic->addr, idc_index);
+
+	/*
+	 * Read CLAIMI: returns TOPI value.
+	 * ID==0 means spurious interrupt (spec-defined).
+	 */
+	v = readl(idc + APLIC_IDC_CLAIMI); /* dequeue */
+
+	id = (v >> APLIC_IDC_TOPI_ID_SHIFT) & APLIC_IDC_TOPI_ID_MASK;
+
+	/* ID==0 means spurious / no pending wired interrupt */
+	if (!id)
+		return SBI_ENOENT;
+
+	/* Bound check against DT-discovered num_src */
+	if (id > aplic->num_source)
+		return SBI_EINVAL;
+
+	*hwirq = id;
+
+	return SBI_OK;
+}
+
+static int aplic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *aplic = aplic_irqchip_to_data(chip);
+	unsigned long idc;
+	int idc_index;
+
+	if (!hwirq || hwirq > aplic->num_source)
+		return SBI_EINVAL;
+	if (!aplic_mmode_direct(aplic))
+		return SBI_ENOTSUPP;
+	if (aplic_hwirq_delegated(aplic, hwirq))
+		return SBI_ENOTSUPP;
+
+	idc_index = aplic_hwirq_target_idc_index(chip);
+	if (idc_index < 0)
+		return idc_index;
+
+	idc = aplic->addr + APLIC_IDC_BASE + idc_index * APLIC_IDC_SIZE;
+
+	/* APLIC: sourcecfg/target/enable */
+	writel(APLIC_SOURCECFG_SM_LEVEL_HIGH,
+	       (void *)(aplic->addr + APLIC_SOURCECFG_BASE + (hwirq - 1) * 4));
+
+	writel(((u32)idc_index << APLIC_TARGET_HART_IDX_SHIFT) |
+	       APLIC_DEFAULT_PRIORITY,
+	       (void *)(aplic->addr + APLIC_TARGET_BASE + (hwirq - 1) * 4));
+
+	writel(hwirq, (void *)(aplic->addr + APLIC_SETIENUM));
+
+	/* Direct mode for aia=aplic: DM=0 => don't set DM bit */
+	writel(aplic_domaincfg_value(), (void *)(aplic->addr + APLIC_DOMAINCFG));
+
+	/* IDC delivery */
+	writel(APLIC_ENABLE_IDELIVERY, (void *)(idc + APLIC_IDC_IDELIVERY));
+	writel(APLIC_ENABLE_ITHRESHOLD, (void *)(idc + APLIC_IDC_ITHRESHOLD));
+
+	return SBI_OK;
+}
+
+static int aplic_process_hwirqs(struct sbi_irqchip_device *chip)
+{
+	if (!chip)
+		return SBI_ENODEV;
+
+	for (;;) {
+		u32 hwirq = 0;
+		int rc = aplic_hwirq_claim(chip, &hwirq);
+
+		if (rc == SBI_ENOENT)
+			break;
+		if (rc)
+			return rc;
+
+		if (!hwirq)
+			break;
+
+		if (hwirq > chip->num_hwirq) {
+			return SBI_EINVAL;
+		}
+
+		rc = sbi_irqchip_process_hwirq(chip, hwirq);
+		if (rc)
+			return rc;
+	}
+
+	return SBI_OK;
+}
+
 int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
 	int rc;
@@ -308,6 +522,19 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	/* Register irqchip device */
 	aplic->irqchip.id = aplic->unique_id;
 	aplic->irqchip.num_hwirq = aplic->num_source + 1;
+	aplic->irqchip.hwirq_mask = aplic_hwirq_mask;
+	aplic->irqchip.hwirq_unmask = aplic_hwirq_unmask;
+	/*
+	 * Only the domain that directly injects interrupts into M-mode external
+	 * interrupt line should provide process_hwirqs().
+	 *
+	 * The other domain (e.g. S-mode) may still be registered so that its
+	 * other ops (mask/unmask/config/etc.) can be used, but it must not
+	 * claim to be the external interrupt line provider.
+	 */
+	if (aplic_mmode_direct(aplic))
+		aplic->irqchip.process_hwirqs = aplic_process_hwirqs;
+	aplic->irqchip.hwirq_setup = aplic_hwirq_setup;
 	rc = sbi_irqchip_add_device(&aplic->irqchip);
 	if (rc)
 		return rc;
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
