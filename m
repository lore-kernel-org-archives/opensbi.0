Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38461ECD6F7
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0fYFRe6Wq0CkEMVu6frgpVMfbKIuN5Ebm4DgJP1330=; b=1A9P4IbhZimBlS
	52WlreMxb6rvblGIgA/UTo0Iswj8R/SeSxcPjM3UkMfO9W7AdHKsJfGiuNh2rwtl03Ovsrq8fcHxZ
	wrvKBL+eb02KDwK8zcajB2J4Dxei0Aowe0v2RQSczehaEyE8OSxheaksgIYPM2I4InH5ub80OdNTo
	t91xJQfzFylbd/nVwxY9gZmRrDafrTV3YdtDWSCr16IqW4xWPpsiTdhC3cgqrQ3Kn1cdjLbZfV3CZ
	Ii/QXwiGnogjjOn2tuUZHRPXtGAUz/Rw8o9wqenpiJSrJW+f2fEqFvGqd3MaixrNsGT47Empy2KAw
	+poHWxHQ74bWnHXkUtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIZi-000000017y9-1oF3;
	Wed, 11 Feb 2026 22:20:46 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIZf-000000017wa-2DGC
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 22:20:44 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50686cd093dso8032831cf.3
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 14:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770848442; x=1771453242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0oUF/yXoa3yx8OZxDltX0SSitiFNmmS/M11Q7PywcY=;
        b=dWFX2rajbuauKKkBdFHAaYdjJHCMX9uoS1Z+MTTNEZYw8Uy3baBUBeU6Gwwy4LsvP6
         rdo86SPJBo2oOR7Cly/GSYnqEBU9t0dzh76pcCv6PLrnHNkLn0Hc00+Dn9Ud5SZEbap+
         uG+zUuzNNKpcrwV4p9E4p2LBx0jv977S9knkrRDGgmb0oqSRQCz3UEfQiFsuzhWomsLE
         zQdt/cd8rm7FNb8h606Ud80S/Cq+aPMMqviQtTBO/rYXsGDC8Gy6fX0YVbYvFW5lAZw4
         IOUDejWPkRDbRONjnRzUOPTi42GlYnU+TQR/WErjEAWzdBkGOLBTBAR//XGU7CZyFOkh
         a77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770848442; x=1771453242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D0oUF/yXoa3yx8OZxDltX0SSitiFNmmS/M11Q7PywcY=;
        b=bPd7DbDdfPxPIHkeCB0g7FAATZwBMZ5Owk1hNAUt+9+2LEBl0Zn88pkFug8FFd5/TL
         5UN3X9HyqrnKkVcoDkSi5R6OXmFSTDaZE4+2tqHxNCJ43/YpRzoC+gxQXwU/jaDN186e
         wNNHX/WQ4XRNhVpGtI68UegmHWKJBKXHoUGa27J8/yPmpE0xT5FPAtp5tR+S2m3QulJZ
         pUDMFsMp1cM3CFAUtyPAIGcEyVBZWto9QgrG0pp3rvAB7q26cBJ8giHHmd5tjmxJ3Jue
         cMtkG+DvzD7DmaYtHqoR3J8ytSo9mRfTOdrQkBUURMc40RhCm5Q4/jCnwBiJnjZ2dm5g
         M0rw==
X-Gm-Message-State: AOJu0YwkuRYxvyhTpfHOwRfU/t2GbYOD1w2kNmB4i8EOvX3HFGUxWEH7
	3pBMjyI42Jf3fzizm7CBvdRdolZrqFq/8p876LGlRfTrQA4VMBr5VWupa2dNew==
X-Gm-Gg: AZuq6aLKbOVVsdUvIIgNgkuDQKqeqjqEG7Ja/0k3t6iKEBP8QhVvHsLqfl6BKkgDnmd
	hNYHzZ6qcN4rZW899ym4Zu7SLPQS1X8eA5hVG/8qEVSI4gf/J9Rjfv76ov8apGOdCfOMjbQ9WDC
	Nyx+mHSWoAky+qJqtP+e8LXpBABICBeN7wEI4E+fYQs1gybxs4R9oxC5N7SH0JDZFWFb9aSv4OD
	saO04BtdMQOeYHp6yWnSmIhZcTr0bYYIRUjLiBRuQ1nN2t0qVJUUUgt93SwZ0NFScnViZaleCfT
	skJV2VyFc0wDKjAzhG8DhQFM4TEWXy3J1PCljwtD134ZzkUqyLU6v0ZTavFmIb+7zbcAovEOn6M
	QYPc3Mg0W+U5+yY5Qv8/LFQIre29NoUGO195yIfHv8EF1h/45DvSd/HTXzWlc9Mbo26feeGTrWn
	ps8yQRY9ULIMm4yZSc+3GAsylCP06u1qay0Qq0B6SxTbLjCPVTOc2U81QqTLUXFPmvwS40ur577
	KljzFTooac=
X-Received: by 2002:a05:622a:1391:b0:503:2d1f:68a2 with SMTP id d75a77b69052e-50691c5c449mr16665641cf.70.1770848442400;
        Wed, 11 Feb 2026 14:20:42 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b6b576sm22824291cf.21.2026.02.11.14.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 14:20:42 -0800 (PST)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 2/3] lib: utils: irqchip: implement APLIC hwirq operation hooks
Date: Wed, 11 Feb 2026 17:20:24 -0500
Message-Id: <20260211222025.2463312-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260211222025.2463312-1-raymondmaoca@gmail.com>
References: <20260211222025.2463312-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_142043_594750_DD0FE72A 
X-CRM114-Status: GOOD (  18.38  )
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

Add all APLIC reqiured operation hooks, includeing mask / unmask /
eoi / setup / process and register them during cold init.
During setup, program a minimal APLIC direct-mode configuration and
enable MEIE, confirm external interrupts are claimed via IDC.CLAIMI.
Add function to fetch the TOPI value and extract the source ID (hwirq)
from CLAIMI, which is used by APLIC process hook.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 lib/utils/irqchip/aplic.c | 191 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index ec69c82b..f0ecef42 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -245,6 +245,178 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 	return 0;
 }
 
+static int aplic_hwirq_handler(u32 hwirq, void *opaque)
+{
+	(void)opaque;
+
+	sbi_printf("[APLIC] Enter registered hwirq %u raw handler callback\n",
+		   hwirq);
+
+	return SBI_OK;
+}
+
+static inline void *aplic_idc_base(unsigned long aplic_addr, u32 idc_index)
+{
+	return (void *)(aplic_addr + APLIC_IDC_BASE +
+			(unsigned long)idc_index * APLIC_IDC_SIZE);
+}
+
+static void aplic_hwirq_mask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *w = chip->chip_priv;
+
+	if (!w || !hwirq)
+		return;
+
+	if (!w->addr || hwirq > w->num_source)
+		return;
+
+	/* Disable source */
+	writel(hwirq, (void *)(w->addr + APLIC_CLRIENUM));
+}
+
+static void aplic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *w = chip->chip_priv;
+
+	if (!w || !hwirq)
+		return;
+
+	if (!w->addr || hwirq > w->num_source)
+		return;
+
+	/* Enable source */
+	writel(hwirq, (void *)(w->addr + APLIC_SETIENUM));
+}
+
+static int aplic_hwirq_claim(struct sbi_irqchip_device *chip, u32 *hwirq)
+{
+	struct aplic_data *w = chip->chip_priv;
+	u32 hartid = current_hartid();
+	int hidx = sbi_hartid_to_hartindex(hartid);
+	void *idc;
+	u32 v, id;
+
+	if (!w || !hwirq)
+		return SBI_EINVAL;
+
+	if (!w->addr || hidx < 0 || (u32)hidx >= w->num_idc)
+		return SBI_ENODEV;
+
+	idc = aplic_idc_base(w->addr, (u32)hidx);
+
+	/*
+	 * Read CLAIMI: returns TOPI value.
+	 * ID==0 means spurious interrupt (spec-defined).
+	 */
+	v = readl(idc + APLIC_IDC_CLAIMI); /* dequeue */
+	/*
+	 * QEMU workaround: Read CLAIMI a second time since QEMU's APLIC model
+	 * currently has a bug and may not clear pending on deassert after the
+	 * first reading.
+	 */
+	if (readl(idc + APLIC_IDC_CLAIMI) != v)
+		return SBI_ENOENT;
+
+	id = (v >> APLIC_IDC_TOPI_ID_SHIFT) & APLIC_IDC_TOPI_ID_MASK;
+
+	/* ID==0 means spurious / no pending wired interrupt */
+	if (!id)
+		return SBI_ENOENT;
+
+	/* Bound check against DT-discovered num_src */
+	if (id > w->num_source)
+		return SBI_EINVAL;
+
+	*hwirq = id;
+
+	return SBI_OK;
+}
+
+static void aplic_hwirq_eoi(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *w = chip->chip_priv;
+	u32 hartid = current_hartid();
+	int hidx = sbi_hartid_to_hartindex(hartid);
+	void *idc;
+
+	sbi_printf("[APLIC] Enter regitered EOI of hwirq %u\n", hwirq);
+
+	if (!w || !w->addr)
+		return;
+	if (hidx < 0 || (u32)hidx >= w->num_idc)
+		return;
+
+	idc = aplic_idc_base(w->addr, (u32)hidx);
+
+	/* QEMU workaround: clear pending after source deassert for level IRQ */
+	writel(hwirq, idc + APLIC_CLRIPNUM);
+}
+
+static int aplic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	const u32 hart_idx = 0;
+	unsigned long idc;
+	struct aplic_data *w = chip->chip_priv;
+
+	idc = w->addr + APLIC_IDC_BASE + hart_idx * APLIC_IDC_SIZE;
+
+	/* APLIC: sourcecfg/target/enable */
+	writel(APLIC_SOURCECFG_SM_LEVEL_HIGH,
+	       (void *)(w->addr + APLIC_SOURCECFG_BASE + (hwirq - 1) * 4));
+
+	writel((hart_idx << APLIC_TARGET_HART_IDX_SHIFT) | APLIC_DEFAULT_PRIORITY,
+	       (void *)(w->addr + APLIC_TARGET_BASE + (hwirq - 1) * 4));
+
+	writel(hwirq, (void *)(w->addr + APLIC_SETIENUM));
+
+	/* Direct mode for aia=aplic: DM=0 => don't set DM bit */
+	writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_BE,
+	       (void *)(w->addr + APLIC_DOMAINCFG));
+
+	/* IDC delivery */
+	writel(APLIC_ENABLE_IDELIVERY, (void *)(idc + APLIC_IDC_IDELIVERY));
+	writel(APLIC_ENABLE_ITHRESHOLD, (void *)(idc + APLIC_IDC_ITHRESHOLD));
+
+	/* Enable MEIE + global MIE */
+	csr_set(CSR_MIE, (1UL << 11));  /* MEIE */
+	csr_set(CSR_MSTATUS, MSTATUS_MIE);
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
+		sbi_printf("[APLIC] IDC_TOPI_ID from CLAIMI (hwirq) %u\n",
+			   hwirq);
+
+		if (hwirq > chip->num_hwirq) {
+			sbi_printf("[APLIC] hwirq %u > max (num_hwirq) %u)\n",
+				   hwirq, chip->num_hwirq);
+			break;
+		}
+
+		sbi_irqchip_process_hwirq(chip, hwirq);
+	}
+
+	return SBI_OK;
+}
+
 int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
 	int rc;
@@ -308,12 +480,31 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	/* Register irqchip device */
 	aplic->irqchip.id = aplic->unique_id;
 	aplic->irqchip.num_hwirq = aplic->num_source + 1;
+	aplic->irqchip.chip_priv = aplic;
+	aplic->irqchip.hwirq_mask = aplic_hwirq_mask;
+	aplic->irqchip.hwirq_unmask = aplic_hwirq_unmask;
+	aplic->irqchip.hwirq_eoi = aplic_hwirq_eoi;
+	/*
+	 * Only the domain that directly injects interrupts into M-mode external
+	 * interrupt line should provide process_hwirqs().
+	 *
+	 * The other domain (e.g. S-mode) may still be registered so that its
+	 * other ops (mask/unmask/config/etc.) can be used, but it must not
+	 * claim to be the external interrupt line provider.
+	 */
+	if (aplic->targets_mmode)
+		aplic->irqchip.process_hwirqs = aplic_process_hwirqs;
+	aplic->irqchip.hwirq_setup = aplic_hwirq_setup;
 	rc = sbi_irqchip_add_device(&aplic->irqchip);
 	if (rc)
 		return rc;
 
 	/* Attach to the aplic list */
 	sbi_list_add_tail(&aplic->node, &aplic_list);
+	rc = sbi_irqchip_register_handler(&aplic->irqchip, 1, aplic->num_source,
+					  aplic_hwirq_handler, NULL);
+	if (rc)
+		return rc;
 
 	return 0;
 }
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
