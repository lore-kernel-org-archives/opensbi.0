Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD62DC369D5
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 22:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36RmygjonfSDeK4paNQ/Sp9bsNoOiLpseWpia/ujun0=; b=B7DzIlg6cGKxqr
	YXrMzRGUjZKlNB4eRdMZhYDiIbEOVvDRAiAlWvdLvF/tsn6E2Jsf5ML+IFIENggMq5IVWW5QM0Ma3
	KGIYJlAScuOtRTtSvbz493Cn8fWbN3dtcs4UYrwns27rFLQJm/VAAuI+18X3mPyE+zXO36CG4MlcW
	Of62/lcTdY1VJBfDvSfmiY8yus8MYlFFiui0P2hsrvDZHnQcIRqTOfoOmeJ8/grNa3QJ9m8cR2yYZ
	fvX/ddwOK6UAmtIriWz/DQkkJ8Mt0lqPpxLWvg8NbJ6b4aFigfiid9f+1nOnPLVClA1MCeCVNBGTZ
	DRz3jSU9qbR+G7YvCgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9XLc-00000007lIV-2DJV;
	Mon, 28 Apr 2025 22:53:12 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9XLa-00000007lI7-0W7I
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 22:53:11 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c597760323so595432785a.3
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 15:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745880788; x=1746485588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RcvsEmB6YOGbUJIQKO912bu7ddGzMN73Fpj0HA2KSeE=;
        b=Py9pkhPKM32EcyzL+UFNhvJ6/hQRN15WmU2tUd/tmtX7Hkm3KJ0fPrP7nFacMGGfNR
         3It8k/Q08i2kZE8fSu9EuczTyadcCMG0m3ZNYpVrs3/6szaaevLBOXNR1NPdxuVaXZZg
         Xr+Gbllamud5J6Era9FNNL7ZgAv37acN9XdqJNVateb2udU4d0oKbnMyolU7AD4lndKX
         aKkMEvE2bYj77RQo7zgW1NZfh5OjEpvybTKbJf9kIyghE9gc1rnARiUJdTHKAo2DT608
         bqLXoLC4a84o1LpYjKOAlKWieoENxEWItNGSUXWNdt4DitG/E74Z9vXgvvN9YnVa74OC
         P1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745880788; x=1746485588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcvsEmB6YOGbUJIQKO912bu7ddGzMN73Fpj0HA2KSeE=;
        b=ZQB32rsCeyLWAaXWE2gZUTf8+vw6HGbTbMEvfKI6pZkDFNeHXMkyERcbsXAlwEhp9U
         7KBlP1IyakdPgpUy9ReK/juANpPyD6plr7vU9BWgUwjoD1/t+1iXR98v2TdNOmg++VLS
         NctUGXh8DAR3z9lzHsBCicKLdSI8IT1T/2QNgOSM1cTkfHKKaNLuNC1V42DpIt4dg43Q
         MCthBs8ZUy2gJAMnBuHmtUkNNt8P9PW/ivwzUgXsSHNVReQgsww6nNd0IemrYlVFxK80
         wa1Q/gFkxY5HlmavfjtFm5OeL7kHUm1mV8nM7yJ6BGI4lAw5BNCTqolM40tMe/x6rQIq
         xgYQ==
X-Gm-Message-State: AOJu0Yzv0ctqCPw80pH22+RxByd9GhyVTRgPfJ4YOy6JXX5uTn84N1Ng
	d0XFw/Z0UjLvAosD4vIvHyvzYAstTGSIDQXdGIg6Nijvpz5IW6cMfyo31Q==
X-Gm-Gg: ASbGncs8IqdUpgocwJdfr4ZXQZAgME7iGsig/I98UD9vUCQI9QDUGFGkJpfHojo00F1
	V+82GxkotL+XWEovzJRweeXjI/3yJsvw33mBCbdLWIaqXcDTOzAxWaufJmg967v/LQI1f6XGYCN
	BinraNVWCfrpDB7U9Cl7Q3hiQ1f/uy0XNn+/DDqWJpB2sMyjlkS57qQWbwxNJQ8Ix1HkahsKm+j
	LpuZv6czKLDq+KBlAE3A/KnWeRRZn9ITkk4YFf7cYw3t7cIP6UY3H/kvYgPDM+AQmZLc0bpw5ho
	mdv9huVpSijU4Hr/
X-Google-Smtp-Source: AGHT+IHf+MjOwlRy5ObH2HY8BmfW4XgcXyLmiGPf2F+cUX1HMDayNEUr461Hy4HNgcH2QyRB/2CgIg==
X-Received: by 2002:a05:620a:298e:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7cabe7c5113mr118555485a.58.1745880788179;
        Mon, 28 Apr 2025 15:53:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c958c949ddsm675935685a.8.2025.04.28.15.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:53:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: opensbi@lists.infradead.org
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: [PATCH v2] lib: utils/irqchip: always parse msi information for each aplic device
Date: Tue, 29 Apr 2025 06:52:50 +0800
Message-ID: <20250428225251.60125-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_155310_166306_B4AAD427 
X-CRM114-Status: GOOD (  13.92  )
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
Changed from v1:
1. update comment
2. remove unnecessary header import
---
 lib/utils/fdt/fdt_helper.c | 136 ++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 69 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 8939d90..eeab326 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -602,13 +602,56 @@ int fdt_parse_xlnx_uartlite_node(const void *fdt, int nodeoffset,
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

@@ -635,78 +678,33 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
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
