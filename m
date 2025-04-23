Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2584C369CB
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DDuvUQlgQnN2Tck2Qrf482kqCN5+5kNX2f9ETt2yQr0=; b=tNxAq0LN120vPS
	nMtEC2ej8FhE4uFcd7KJzKIKh3i5Pd4TaqEzeBfyljNPNUunVHJIX4WMbbx48axJzyEc+LPCRFOev
	TbM6uEJkVf2/2A90xESstNQTAUL3LxZLMSy1IzX7tF15v/s3nJ/5oRSosaMWTblUy0fkvIhpn1Zhn
	2mlredaON8CwSz6xqBt3GvqMffzNw4Kfs4OOBNFxWzKq/0Vvvr6HeCZvmnOKPhszdFPvlSoiZk1gj
	ZvFk63ue1Ak4ZsG6g6ZMrWG+CKCBitIcdhAHiFN11zichSarq5vr4Rk9goIBgYfDPGdToYQ3X7Q48
	X0BGCErIIvAt9wqt1MQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7W2S-00000009rrh-2oLl;
	Wed, 23 Apr 2025 09:05:04 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VAe-00000009dvQ-0mip
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 08:09:29 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c5c815f8efso560371885a.2
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745395766; x=1746000566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsLsCx2DMDeXKNT57jQE0phvSIj3H6RCgZAeI/Zl0cE=;
        b=d8DZ5Ro+t7/g9RBGbhu+5E+t2OXHj/EH/ZI0eKuAhPD0sB59iTzNAkC7ojpgBVqEzo
         CjsWCkXq3VRPBTe1gOr44mL6IGizRYAiU0uoDAjdkOM077ky5vQNAvcv5NaS7WEcvbV1
         l2p9clDCGuOEMeO//pUGvaY/QVebVMom5TMzGs+GFDm63M/ZXE5ezHdEQ7OFLb1DHJh9
         d4MWHbZ1CmlGqU2BxoW+JRkj1/VqjVp2fS9gBam/wU3VwlDPscUpb5JVSLMLPZsjNjoa
         /RVvs1CFgrrFq5ffFsqh2apRrU4zDaTrxTLmhjcmqK5P6t9dUoHoSnER04eHwmL90R3E
         GlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395766; x=1746000566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsLsCx2DMDeXKNT57jQE0phvSIj3H6RCgZAeI/Zl0cE=;
        b=Dc6J1tqPoREH4HgZMynO79nltpLpOmWatJ4xY7cVg3sK3sS4hWlsJ5T1uIhrChff8j
         2o9Yp4Y7ALOpOEGTeLlcJYdVgqGEaV6H8rfNge3VG6Jhf7xI5ShY7X5MDldDT7xKwDfk
         t3f53XR19Ht3zw9DnXQOvd5sDY4RMgqQvrU9pbOcPUynsBW4pxh4Q8YU4mb4VY8YcJjk
         7H6o4kbptl3h3nAnwQvpes9OSea+K1EhETAZDqzTiOuDNt/6XNP1Y9edeDQnOFcBN7OG
         Ls/7rf9rEkFgMqoQUoGcAFBv30k4laNBEv31GNu8iCPMiBjyRA//H/3q+15ohOw6mcHW
         h56g==
X-Gm-Message-State: AOJu0YxFCpfHLpE9VobGneHRnthoWzMO+AxJxlgwI6IAAQQ9yb6mI2Sz
	Q6/0AFRpfYTLPuhee7aEnjIC07b6rqRqyiZkbRcv0e9W5DgaH5hNvjMdoA==
X-Gm-Gg: ASbGncufWpfN6sTH046kmXDxCdq5t+AwhDJVySRAlPM3YSiR26aBHM0b88cXCBSA+7m
	quMMK5NxXF7qQ2pMgcJV7AWDpIvbNCMmByzEKYxeEUEKqUOggXCeVdkOF+s/+CHlFvp+UG5Rkcr
	2zFMF/8CTK9ZRDZKYD0mLBw1EUNc0ldy6Lovn2fwvL4piZAZXgJ7Opkf6nVWFDm+D3k6lxVqaEY
	ri8gUB0QsQhocDJZscauId1qPLWT8SPI80M4+Kna7Wv/mLGNm9koIsSlxy0IiB53YI7fePQRdXA
	xDrbCde8hKcTOKxQ
X-Google-Smtp-Source: AGHT+IFLo9WDjpCaJ0rotNB1GuAgUgqqXHWBlM8SxGbjduUlL9cFn3glm1zrw7QWvH3jOrDKJ3Xc1A==
X-Received: by 2002:a05:620a:260e:b0:7c5:4348:183e with SMTP id af79cd13be357-7c927f80540mr2774060585a.20.1745395766123;
        Wed, 23 Apr 2025 01:09:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c9280de4adsm630685785a.114.2025.04.23.01.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:09:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: opensbi@lists.infradead.org
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: [PATCH] lib: utils/irqchip: always parse msi information for each aplic device
Date: Wed, 23 Apr 2025 16:09:14 +0800
Message-ID: <20250423080915.1101707-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_010928_234159_115684CB 
X-CRM114-Status: GOOD (  14.48  )
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

For a root domain, it may keep direct delivery mode as its subdomains
use msi to delivery interrupt. The currect parsing logic may lost this
information and break the system if the domain is not set as MSI mode
or the MSI domain is not a direct children of the root domain.

For a non-root domain, it is safe to parse the MSI information of all
its domain and write the msiaddrcfg register. The bus should ignore the
write on this readonly address.

Parse the aplic MSI information recursively for all aplic device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 lib/utils/fdt/fdt_helper.c | 138 ++++++++++++++++++-------------------
 1 file changed, 69 insertions(+), 69 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 8939d90..0150725 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -6,6 +6,8 @@
  * Copyright (C) 2020 Bin Meng <bmeng.cn@gmail.com>
  */
 
+#include "sbi/sbi_error.h"
+#include "sbi/sbi_types.h"
 #include <libfdt.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_console.h>
@@ -602,13 +604,56 @@ int fdt_parse_xlnx_uartlite_node(const void *fdt, int nodeoffset,
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
 
@@ -635,78 +680,33 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
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
