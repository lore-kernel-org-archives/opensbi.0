Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A47C3DA6D
	for <opensbi@archiver.kernel.org>; Fri, 23 May 2025 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YoJiZsV1ks/Rgva7mDyPg5hOCcJWnmBLlemXNFalpMI=; b=ga96oB0EsghXpc
	FuManSjIkw9IFB/0Tpg361m1mCty0p/xhyEQUhHD/FXvtljykg8XcX42snt2qINjkThlwam66tWSR
	qsnuxXB1xJnMzFfHeFFrMUrCKtWXu1jJnKyDrw65WSN2BcASC46QZMQPvLpVsJ2wzpof/xENiZRrd
	PQrn+hLnzemXlFvGBlMyZXFnvrB9tm+hBJUPyfmFpvH+VWo6Fdz0A8iv+bKDghjyFuqZ5uV7KuOoF
	ncsFn4epArj5EQUQ4dHLfcD/Ysek8TwH1rTWIva4bpXLzzeFLw31iRLny87jkG3CQ2QJtu9pN41/K
	DAUuEGuOMgBf80rOEdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOAz-00000003N29-1gpP;
	Fri, 23 May 2025 08:54:49 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOAw-00000003N1F-1OqX
	for opensbi@lists.infradead.org;
	Fri, 23 May 2025 08:54:47 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4033c89f2aaso5691148b6e.0
        for <opensbi@lists.infradead.org>; Fri, 23 May 2025 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747990485; x=1748595285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6qMmAGDVHJuHLfWFsEpsk4GwAiKimOZq39ZRdsPLR4=;
        b=YNwYzWV+D2dKh3CsAOYbe+SEXiqMFeTgLFJA+3ANmuYvMPNW/mSOiU2uh86MCuyZpf
         1kLDhYnpFZLpHPJgWtf2UfrXx+ShprYUaoI83VAqr4AKF8uQWWzcUN4ZsMR40XOekbf1
         wk85r2KmAIyavNBMdLYUiUBAvJXnwM0Ohp7mpgqxRN92l/dW77u9TV1OVmo99YceXwJn
         ehj3kAEjNSm0NksCTQy2mGcZAC9uvxUeF9UEwN30+7DW0P1rrHXWaZmRLQwebppZslOP
         1Q7sHj1AgzjQmlCBcKitVKdoRGofeJ6XAyqLxXvPtq/SdOxpuprdCp3+mJpNF9S2XSVt
         HT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747990485; x=1748595285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6qMmAGDVHJuHLfWFsEpsk4GwAiKimOZq39ZRdsPLR4=;
        b=jUvAGBVC0Ia9GOMCZerJgnawyVzLIBoEI0ZV7xUgJlRQA0a0Lp+P6a8GM0fxz5c8zq
         t0qaJsPtViTBSkCcyERxuDT150/ow+GI0p+UVcI+xjnRfkSeoHeYxW5dTW0I6shqQrgm
         Y9pTQL1dOBWryyyRWfASXha95HKnj5Q7WHvoTSVgPgV0lmuZWNIO+jAkg1mau49PVBze
         h6kNrJs3TdkF7x+oqUZ2O8JfGQ3aQ1eKxMLujKB/6ey7enQsXOoaD0Kb+yir+W9VgNr9
         phuKsOLspXcAoLgafceGZLJOePEHn9aYlx8k1iqur6R5ok5yXmwnlD5x+CWvj9b3yS1E
         qqCw==
X-Gm-Message-State: AOJu0YwenRG9cvHaFwiMrPanqDqyHkspcjOwP4qRClOAsI16JMdjI1EZ
	lvX3ffp91qPOlsfj/Z2MYZHkgVZuNO+0iGexvamWpWHWG3F8a/gsKgsFNBHyHxWC
X-Gm-Gg: ASbGncvl5kFcK5ckSXKaFRa6MLWZBfn8u8dkBnfVh7aVDynY32ghKDigoh8Yg0E0vQp
	VaANfrhfUzDzkCundcxQg5p64TdbV+uajnnsFUIsokm/tD7iA70d9hRlewUGHMXFSWXe3G3Xbz0
	Kw+uYc2iVPs1IYO7dVFwQjD46KRUTtARbM0A9kVxL2M8DdXdPulZja5vHqmwjRmMDz6hsyesUhn
	TPXVfcEqdQv2wOALVzbcm4FHpqDtFG62auXCk9vnqrt7E0uSLXdPcLvsb+3kKDW3AotomOuyfgI
	cYAGt5w5Zx16sB8fr6YvHbYDshk=
X-Google-Smtp-Source: AGHT+IE8Gcf8VzIsbujt+AgE+4PS5sHo2moEEW0MZ+sUcJtJkoUK9ytEU8gVSb3WeI67NUTRvx23OQ==
X-Received: by 2002:a05:622a:90f:b0:494:a2b4:c450 with SMTP id d75a77b69052e-494ae42dca3mr468170561cf.36.1747990474062;
        Fri, 23 May 2025 01:54:34 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494ae3f89a9sm111815351cf.20.2025.05.23.01.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:54:33 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: opensbi@lists.infradead.org
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: [PATCH v3] lib: utils/irqchip: always parse msi information for each aplic device
Date: Fri, 23 May 2025 16:53:48 +0800
Message-ID: <20250523085348.1690368-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_015446_370656_00A74DE5 
X-CRM114-Status: GOOD (  14.45  )
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

OpenSBI only parses MSI information of the first next level subdomain
for now, which makes the root domain misconfigured in some case:
1. the msi is not enabled on the first subdomain of the root domain,
   but other subdomains enable MSI.
2. the root domain is set as direct mode, but its subdomains enable MSI.

So it is needed to parse all child of the root domain, Otherwise, the
some non-root domains are broken. As the specification says, it is
safe to parse the MSI information of all its subdomain and write the
msiaddrcfg register of the non root domain as they are read only.

Parse the aplic MSI information recursively for all aplic device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
Changed from v2:
1. add missed logic when "msi-parent" is invalid.
2. setting targets_mmode to true when find M-mode msi parent.

Changed from v1:
1. update comment
2. remove unnecessary header import
---
 lib/utils/fdt/fdt_helper.c | 139 +++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 69 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index b2d91fd..66d8c2f 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -607,13 +607,58 @@ int fdt_parse_xlnx_uartlite_node(const void *fdt, int nodeoffset,
 	return fdt_parse_uart_node_common(fdt, nodeoffset, uart, 0, 0);
 }

+static int fdt_aplic_find_imsic_node(const void *fdt, int nodeoff, struct imsic_data *imsic, bool mmode)
+{
+	const fdt32_t *val;
+	int i, len, noff, rc;
+
+	val = fdt_getprop(fdt, nodeoff, "msi-parent", &len);
+	if (val && len >= sizeof(fdt32_t)) {
+		noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+		if (noff < 0)
+			return noff;
+
+		rc = fdt_parse_imsic_node(fdt, noff, imsic);
+		if (rc)
+			return rc;
+
+		rc = imsic_data_check(imsic);
+		if (rc)
+			return rc;
+
+		if (imsic->targets_mmode == mmode) {
+			return 0;
+		}
+	} else {
+		return SBI_ENODEV;
+	}
+
+	val = fdt_getprop(fdt, nodeoff, "riscv,children", &len);
+	if (!val || len < sizeof(fdt32_t))
+		return SBI_ENODEV;
+
+	len /= sizeof(fdt32_t);
+
+	for (i = 0; i < len; i++) {
+		noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(val[i]));
+		if (noff < 0)
+			return noff;
+
+		rc = fdt_aplic_find_imsic_node(fdt, noff, imsic, mmode);
+		if (!rc)
+			break;
+	}
+
+	return rc;
+}
+
 int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
 {
 	bool child_found;
 	const fdt32_t *val;
 	const fdt32_t *del;
 	struct imsic_data imsic = { 0 };
-	int i, j, d, dcnt, len, noff, rc;
+	int i, j, d, dcnt, len, rc;
 	uint64_t reg_addr, reg_size;
 	struct aplic_delegate_data *deleg;

@@ -640,78 +685,34 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
 			}
 		}
 		aplic->num_idc = len / 2;
-		goto aplic_msi_parent_done;
 	}

-	val = fdt_getprop(fdt, nodeoff, "msi-parent", &len);
-	if (val && len >= sizeof(fdt32_t)) {
-		noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
-		if (noff < 0)
-			return noff;
-
-		rc = fdt_parse_imsic_node(fdt, noff, &imsic);
-		if (rc)
-			return rc;
-
-		rc = imsic_data_check(&imsic);
-		if (rc)
-			return rc;
-
-		aplic->targets_mmode = imsic.targets_mmode;
-
-		if (imsic.targets_mmode) {
-			aplic->has_msicfg_mmode = true;
-			aplic->msicfg_mmode.lhxs = imsic.guest_index_bits;
-			aplic->msicfg_mmode.lhxw = imsic.hart_index_bits;
-			aplic->msicfg_mmode.hhxw = imsic.group_index_bits;
-			aplic->msicfg_mmode.hhxs = imsic.group_index_shift;
-			if (aplic->msicfg_mmode.hhxs <
-					(2 * IMSIC_MMIO_PAGE_SHIFT))
-				return SBI_EINVAL;
-			aplic->msicfg_mmode.hhxs -= 24;
-			aplic->msicfg_mmode.base_addr = imsic.regs[0].addr;
-		} else {
-			goto aplic_msi_parent_done;
-		}
-
-		val = fdt_getprop(fdt, nodeoff, "riscv,children", &len);
-		if (!val || len < sizeof(fdt32_t))
-			goto aplic_msi_parent_done;
-
-		noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
-		if (noff < 0)
-			return noff;
-
-		val = fdt_getprop(fdt, noff, "msi-parent", &len);
-		if (!val || len < sizeof(fdt32_t))
-			goto aplic_msi_parent_done;
-
-		noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
-		if (noff < 0)
-			return noff;
-
-		rc = fdt_parse_imsic_node(fdt, noff, &imsic);
-		if (rc)
-			return rc;
-
-		rc = imsic_data_check(&imsic);
-		if (rc)
-			return rc;
+	rc = fdt_aplic_find_imsic_node(fdt, nodeoff, &imsic, true);
+	if (!rc) {
+		aplic->targets_mmode = true;
+		aplic->has_msicfg_mmode = true;
+		aplic->msicfg_mmode.lhxs = imsic.guest_index_bits;
+		aplic->msicfg_mmode.lhxw = imsic.hart_index_bits;
+		aplic->msicfg_mmode.hhxw = imsic.group_index_bits;
+		aplic->msicfg_mmode.hhxs = imsic.group_index_shift;
+		if (aplic->msicfg_mmode.hhxs < (2 * IMSIC_MMIO_PAGE_SHIFT))
+			return SBI_EINVAL;
+		aplic->msicfg_mmode.hhxs -= 24;
+		aplic->msicfg_mmode.base_addr = imsic.regs[0].addr;
+	}

-		if (!imsic.targets_mmode) {
-			aplic->has_msicfg_smode = true;
-			aplic->msicfg_smode.lhxs = imsic.guest_index_bits;
-			aplic->msicfg_smode.lhxw = imsic.hart_index_bits;
-			aplic->msicfg_smode.hhxw = imsic.group_index_bits;
-			aplic->msicfg_smode.hhxs = imsic.group_index_shift;
-			if (aplic->msicfg_smode.hhxs <
-					(2 * IMSIC_MMIO_PAGE_SHIFT))
-				return SBI_EINVAL;
-			aplic->msicfg_smode.hhxs -= 24;
-			aplic->msicfg_smode.base_addr = imsic.regs[0].addr;
-		}
+	rc = fdt_aplic_find_imsic_node(fdt, nodeoff, &imsic, false);
+	if (!rc) {
+		aplic->has_msicfg_smode = true;
+		aplic->msicfg_smode.lhxs = imsic.guest_index_bits;
+		aplic->msicfg_smode.lhxw = imsic.hart_index_bits;
+		aplic->msicfg_smode.hhxw = imsic.group_index_bits;
+		aplic->msicfg_smode.hhxs = imsic.group_index_shift;
+		if (aplic->msicfg_smode.hhxs < (2 * IMSIC_MMIO_PAGE_SHIFT))
+			return SBI_EINVAL;
+		aplic->msicfg_smode.hhxs -= 24;
+		aplic->msicfg_smode.base_addr = imsic.regs[0].addr;
 	}
-aplic_msi_parent_done:

 	for (d = 0; d < APLIC_MAX_DELEGATE; d++) {
 		deleg = &aplic->delegate[d];
--
2.49.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
