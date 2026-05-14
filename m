Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7C8CD4F25
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8Uw00BheBZg2Fvd4gR4vgrtjyPN1XsjO6EfYl7lb24=; b=VNTJXhObFVnaVN
	r1931wGq5iGV3CpH0/YbJzEnfx26e2bqAXXdr669dp3iwtGktpiYl/jlYjyuSrDNfmvr36vKn9b+l
	Td0x45uamxCL5646axd/Z1W+cvZyUqOGVaitJAaX0+GJoqz24u+cxHXzCrklENPmqQz4D9iIAdo8z
	gxWBS63IqIlzvcfaMhfwnGivsqYtLfMPlhtpIggVjBd8xH2GT1TiQTBAGbCFz5P2mt7p/ljwHLMZL
	FkAMdxCvK41W4XIduWszPJKkDo4l/k8jzU0bmk+U6AKOmkeJIgkgqj3aNabyOvMuWtJx9i8rgXORd
	Ets2KgtqcTjW/R6f32TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0h-00000006m7n-2vkZ;
	Thu, 14 May 2026 22:58:31 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0e-00000006m4V-3uRI
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:30 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8c92737a8d3so8751146d6.1
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799507; x=1779404307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAPu8svqAobePpZN0TO9jgIKKrtGuLJJsHG/JJ9OsMs=;
        b=JE3paHE06Jz3CIvmdymUGL+W9ts4svJjfTFJhNXtUSVTjGWBYr1qDryXnEvHkAexHA
         sXYD5U6rQ4/v3FipUM5NVOfjDqYi6gnStrMa98yIPL4Syp0w4UFSK70QyxyRkUN3KzkD
         VXdhv3+bKVzKGRYk+u5dcn4paVAzHeEp7osLSpSbYpUdBKbk5fQqMk+mNnJrFKtxan8T
         uoFE8TDoRJyBaDaBeTEU1jKt9eDmoU2UHu1AzatdvEGG2lG53kKf7ouCfOm3Lyz5d54A
         SJf2HfuBslBAq1G+oQRvczBxvObMsbFh+fV3XCSukVQOGvZod/nhUPuPfr8fZQQhriVd
         3XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799507; x=1779404307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nAPu8svqAobePpZN0TO9jgIKKrtGuLJJsHG/JJ9OsMs=;
        b=LgS0pdveRgMEURBg19dFaXUrmcL64r/yHCCzo9aEZjSKm0ANCeTKG7BhflU82J+R1q
         jwekWiUM/L68MHPSeqH2QlWRWHXz1ied0uXDun4dsbyHDnv2X3tuh3GVxMBKNfYltjdV
         HMbw78sHDmQgEtdM+xwIApnJV7Fg6V4PeUUdFDlUAtlFIEB6NdHK9nVBxBCc6FirTkrA
         zpPMfdQR8IYqtrzPSiXZ+nViwNREU4Si+ftMBOjZA3GsDBJp/F83KIAP6LnqW55u1+lx
         o9b3gERumMNoqPeKj8XZnW3PNlwOAb39NByIiNwjwvqQhid4tazlq3PLXYePTQpeTpeq
         kYvA==
X-Gm-Message-State: AOJu0Yyd6i/zo7l5tE8sJSI8cPXbCAMx2cOgV0lL3VUOnkZzxKzfoLAO
	yQRMfRycShjhZ/iWMBFCI4tXrFaqXBa3bgRFjrOd1BCGge6Fd6qhLoZPUC3fWw==
X-Gm-Gg: Acq92OEMIHatjaN5usotNjdkFpNhOPxgHE25UqvlZ/NexpS1lEjUX1Vd7KVMy4GjYga
	uCDbctxT16KacVfKrrJ6VAvSI5wKSawTz7+4U4r36+c16N2vZOjCrPHUxlS5fCjCm3T7gsa7snb
	PqlxAEcdun5YEiVjBQwWfq27JgfoDiOb54S31KT/gzKgzSI6rPFSBoSUAVJ4elmZbOqupZ7HB/a
	8Z1ul5jDbvPAmi5/6MVNahXVAz4egl2IBSqItmkykhPiVGdCwCV4AxvqzDXU11Jw1tKjF/wE9nE
	VC20CXpWdhrkRqzpEH6RDQDtJyz6yAR1n+tBz/0WLua4b3Y3L44tNHcialT1s931mU0u+hv4a5b
	CisVzAQnhQL8lkkj6RH5NPwiVL2vnjUqcp/00OWm/UZrDcQ5OJyBwMXSm6OS11tkPyQn8Qdv0Fh
	6uENWFBXe7NDyD5EgE2oPTa8f4P2TCjDg3Tf6GICpYAy9wXFQQss9WIg/fV5mWycRODQBnndT/f
	Kj2sLpGl1k=
X-Received: by 2002:a05:6214:4708:b0:8ac:b4d5:50e4 with SMTP id 6a1803df08f44-8ca0f67fc67mr26177476d6.38.1778799507505;
        Thu, 14 May 2026 15:58:27 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:27 -0700 (PDT)
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
Subject: [PATCH 08/10] lib: irqchip: support deferred completion and per-HWIRQ APLIC targets
Date: Thu, 14 May 2026 18:57:54 -0400
Message-Id: <20260514225756.2255758-9-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155828_990216_102C000A 
X-CRM114-Status: GOOD (  16.69  )
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

Lazily resolve the active irqchip provider for each hart when the
scratch-local provider is not yet populated.
Program APLIC target IDCs from the precomputed per-HWIRQ hart map,
and treat SBI_EALREADY as deferred completion so the normal process
path does not complete an interrupt that will be finished later by
the VIRQ flow.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 lib/sbi/sbi_irqchip.c     | 21 ++++++++++++++
 lib/utils/irqchip/aplic.c | 60 ++++++++++++++++++++++++++++++---------
 2 files changed, 68 insertions(+), 13 deletions(-)

diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index e022d534..45b2992f 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -45,11 +45,28 @@ struct sbi_irqchip_hart_data {
 static unsigned long irqchip_hart_data_off;
 static SBI_LIST_HEAD(irqchip_list);
 
+static struct sbi_irqchip_device *sbi_irqchip_find_hart_device(u32 hartindex)
+{
+	struct sbi_irqchip_device *chip;
+
+	sbi_list_for_each_entry(chip, &irqchip_list, node) {
+		if (!chip->process_hwirqs)
+			continue;
+		if (!sbi_hartmask_test_hartindex(hartindex, &chip->target_harts))
+			continue;
+		return chip;
+	}
+
+	return NULL;
+}
+
 int sbi_irqchip_process(void)
 {
 	struct sbi_irqchip_hart_data *hd;
 
 	hd = sbi_scratch_thishart_offset_ptr(irqchip_hart_data_off);
+	if (hd && !hd->chip)
+		hd->chip = sbi_irqchip_find_hart_device(current_hartindex());
 	if (!hd || !hd->chip || !hd->chip->process_hwirqs)
 		return SBI_ENODEV;
 
@@ -306,6 +323,8 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 	}
 
 	hd = sbi_scratch_thishart_offset_ptr(irqchip_hart_data_off);
+	if (hd && !hd->chip)
+		hd->chip = sbi_irqchip_find_hart_device(current_hartindex());
 	if (hd && hd->chip && hd->chip->process_hwirqs)
 		csr_set(CSR_MIE, MIP_MEIP);
 
@@ -317,6 +336,8 @@ void sbi_irqchip_exit(struct sbi_scratch *scratch)
 	struct sbi_irqchip_hart_data *hd;
 
 	hd = sbi_scratch_thishart_offset_ptr(irqchip_hart_data_off);
+	if (hd && !hd->chip)
+		hd->chip = sbi_irqchip_find_hart_device(current_hartindex());
 	if (hd && hd->chip && hd->chip->process_hwirqs)
 		csr_clear(CSR_MIE, MIP_MEIP);
 }
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 82efdb71..77743685 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -306,6 +306,8 @@ static inline struct aplic_data *aplic_irqchip_to_data(struct sbi_irqchip_device
 	return container_of(chip, struct aplic_data, irqchip);
 }
 
+static bool aplic_mmode_direct(const struct aplic_data *aplic);
+
 static bool aplic_hwirq_delegated(const struct aplic_data *aplic, u32 hwirq)
 {
 	u32 i;
@@ -441,10 +443,49 @@ static int aplic_hwirq_claim(struct sbi_irqchip_device *chip, u32 *hwirq)
 	return SBI_OK;
 }
 
+static void aplic_set_target(struct aplic_data *aplic, u32 hwirq, u32 idc_index)
+{
+	unsigned long idc;
+
+	if (!aplic->addr || !hwirq || hwirq > aplic->num_source)
+		return;
+	if (aplic->num_idc <= idc_index)
+		return;
+
+	idc = aplic->addr + APLIC_IDC_BASE +
+	      (unsigned long)idc_index * APLIC_IDC_SIZE;
+
+	writel((idc_index << APLIC_TARGET_HART_IDX_SHIFT) |
+	       APLIC_DEFAULT_PRIORITY,
+	       (void *)(aplic->addr + APLIC_TARGET_BASE + (hwirq - 1) * 4));
+
+	/* IDC delivery */
+	writel(APLIC_ENABLE_IDELIVERY, (void *)(idc + APLIC_IDC_IDELIVERY));
+	writel(APLIC_ENABLE_ITHRESHOLD, (void *)(idc + APLIC_IDC_ITHRESHOLD));
+}
+
+static int aplic_hwirq_setup_target_idc_index(struct aplic_data *aplic,
+					      struct sbi_irqchip_device *chip,
+					      u32 hwirq)
+{
+	u32 hartindex;
+	int idc_index;
+
+	if (aplic->hwirq_target_hartindex) {
+		hartindex = aplic->hwirq_target_hartindex[hwirq];
+		if (hartindex != -1U) {
+			idc_index = aplic_hartindex_to_idc_index(aplic, hartindex);
+			if (idc_index >= 0)
+				return idc_index;
+		}
+	}
+
+	return aplic_hwirq_target_idc_index(chip);
+}
+
 static int aplic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq)
 {
 	struct aplic_data *aplic = aplic_irqchip_to_data(chip);
-	unsigned long idc;
 	int idc_index;
 
 	if (!hwirq || hwirq > aplic->num_source)
@@ -454,29 +495,19 @@ static int aplic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq)
 	if (aplic_hwirq_delegated(aplic, hwirq))
 		return SBI_ENOTSUPP;
 
-	idc_index = aplic_hwirq_target_idc_index(chip);
+	idc_index = aplic_hwirq_setup_target_idc_index(aplic, chip, hwirq);
 	if (idc_index < 0)
 		return idc_index;
 
-	idc = aplic->addr + APLIC_IDC_BASE + idc_index * APLIC_IDC_SIZE;
-
 	/* APLIC: sourcecfg/target/enable */
 	writel(APLIC_SOURCECFG_SM_LEVEL_HIGH,
 	       (void *)(aplic->addr + APLIC_SOURCECFG_BASE + (hwirq - 1) * 4));
-
-	writel(((u32)idc_index << APLIC_TARGET_HART_IDX_SHIFT) |
-	       APLIC_DEFAULT_PRIORITY,
-	       (void *)(aplic->addr + APLIC_TARGET_BASE + (hwirq - 1) * 4));
-
+	aplic_set_target(aplic, hwirq, (u32)idc_index);
 	writel(hwirq, (void *)(aplic->addr + APLIC_SETIENUM));
 
 	/* Direct mode for aia=aplic: DM=0 => don't set DM bit */
 	writel(aplic_domaincfg_value(), (void *)(aplic->addr + APLIC_DOMAINCFG));
 
-	/* IDC delivery */
-	writel(APLIC_ENABLE_IDELIVERY, (void *)(idc + APLIC_IDC_IDELIVERY));
-	writel(APLIC_ENABLE_ITHRESHOLD, (void *)(idc + APLIC_IDC_ITHRESHOLD));
-
 	return SBI_OK;
 }
 
@@ -502,6 +533,9 @@ static int aplic_process_hwirqs(struct sbi_irqchip_device *chip)
 		}
 
 		rc = sbi_irqchip_process_hwirq(chip, hwirq);
+		/* Deferred completion paths consume the IRQ without EOI here. */
+		if (rc == SBI_EALREADY)
+			return SBI_OK;
 		if (rc)
 			return rc;
 	}
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
