Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D21ECA0EDC
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UNOnFhAKoW/PVPVAUPkKLuMXu6mCpzE37PCqV6Ooi1A=; b=TCuxL/iA3VLdAj
	JWDEDl5BW4p7VgIQW0RtS13l0BMhvseTUu6HmXTb3UB7U1LfVfYPgXFwmfCp+Jk8gnCAC9DKT1zcJ
	Bi+MP6sDRPAlYg7YarkcuHKksO5YYcXJ60mRU9IVk1tMZxxmD2uRGFvQVKq7/TY0AlK05LuavVzkP
	USp7DYygWZoaY+JiAkdqNg02MJhrzCkbYkIcxOnCvxXw0VdjQcOLgfArGoYY9n+X70rl7ZSIFKEAP
	8wlaxwySwbL8Y7j6pPZgWz3uGlI/HEqDy4tL114JqQXKAzi20dAZNx8FCxuQCi/HzrEfJUPz8X4mS
	GvhseV6EE11/19QQ3cLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZvU-0000000HRfc-3cwJ;
	Thu, 14 Aug 2025 15:31:36 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVNt-0000000Gceh-0zNd
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 10:40:39 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 57EAeQt2073588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 18:40:26 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 14 Aug 2025
 18:40:26 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH] platform: generic: andes: add QiLai SoC
Date: Thu, 14 Aug 2025 18:40:24 +0800
Message-ID: <20250814104024.3374698-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 57EAeQt2073588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_034037_794660_A12B0F3B 
X-CRM114-Status: GOOD (  14.86  )
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

Extend generic platform to support Andes QiLai SoC

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 platform/generic/Kconfig                   |  7 +++
 platform/generic/andes/objects.mk          |  2 +
 platform/generic/andes/qilai.c             | 66 ++++++++++++++++++++++
 platform/generic/configs/defconfig         |  1 +
 platform/generic/include/andes/andes_pma.h |  1 +
 platform/generic/include/andes/qilai.h     | 18 ++++++
 6 files changed, 95 insertions(+)
 create mode 100644 platform/generic/andes/qilai.c
 create mode 100644 platform/generic/include/andes/qilai.h

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index a24d6ab2fe46..e1d6be563aa7 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -36,6 +36,13 @@ config PLATFORM_ANDES_AE350
 	select ANDES_PMA
 	default n
 
+config PLATFORM_ANDES_QILAI
+	bool "Andes QiLai support"
+	select ANDES_PMU
+	select ANDES_PMA
+	select ANDES_SBI
+	default n
+
 config PLATFORM_RENESAS_RZFIVE
 	bool "Renesas RZ/Five support"
 	select ANDES_PMA
diff --git a/platform/generic/andes/objects.mk b/platform/generic/andes/objects.mk
index 15e618529c44..132e20f2f16f 100644
--- a/platform/generic/andes/objects.mk
+++ b/platform/generic/andes/objects.mk
@@ -3,7 +3,9 @@
 #
 
 carray-platform_override_modules-$(CONFIG_PLATFORM_ANDES_AE350) += andes_ae350
+carray-platform_override_modules-$(CONFIG_PLATFORM_ANDES_QILAI) += andes_qilai
 platform-objs-$(CONFIG_PLATFORM_ANDES_AE350) += andes/ae350.o andes/sleep.o
+platform-objs-$(CONFIG_PLATFORM_ANDES_QILAI) += andes/qilai.o
 
 platform-objs-$(CONFIG_ANDES_PMA) += andes/andes_pma.o
 platform-objs-$(CONFIG_ANDES_SBI) += andes/andes_sbi.o
diff --git a/platform/generic/andes/qilai.c b/platform/generic/andes/qilai.c
new file mode 100644
index 000000000000..a73ba993215e
--- /dev/null
+++ b/platform/generic/andes/qilai.c
@@ -0,0 +1,66 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Andes Technology Corporation
+ *
+ */
+
+#include <andes/andes_pma.h>
+#include <andes/andes_pmu.h>
+#include <andes/andes_sbi.h>
+#include <andes/qilai.h>
+#include <platform_override.h>
+#include <sbi/sbi_domain.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+static int andes_qilai_final_init(bool cold_boot)
+{
+
+	int rc;
+
+	/*
+	 * Set the memory attribute for 3 PCIE endpoint regions,
+	 * and they are all non-idempotent and non-bufferable.
+	 */
+	rc = andes_sbi_set_pma(PCIE0_BASE, PCIE0_SIZE,
+			       ANDES_PMACFG_ETYP_NAPOT |
+			       ANDES_PMACFG_MTYP_DEV_NOBUF);
+	if (rc)
+		return rc;
+
+	rc = andes_sbi_set_pma(PCIE1_BASE, PCIE1_SIZE,
+			       ANDES_PMACFG_ETYP_NAPOT |
+			       ANDES_PMACFG_MTYP_DEV_NOBUF);
+	if (rc)
+		return rc;
+
+	rc = andes_sbi_set_pma(PCIE2_BASE, PCIE2_SIZE,
+			       ANDES_PMACFG_ETYP_NAPOT |
+			       ANDES_PMACFG_MTYP_DEV_NOBUF);
+	if (rc)
+		return rc;
+
+	return generic_final_init(cold_boot);
+}
+
+static int andes_qilai_platform_init(const void *fdt, int nodeoff,
+				     const struct fdt_match *match)
+{
+	generic_platform_ops.final_init	     = andes_qilai_final_init;
+	generic_platform_ops.extensions_init = andes_pmu_extensions_init;
+	generic_platform_ops.pmu_init	     = andes_pmu_init;
+	generic_platform_ops.vendor_ext_provider =
+		andes_sbi_vendor_ext_provider;
+	return 0;
+}
+
+static const struct fdt_match andes_qilai_match[] = {
+	{ .compatible = "andestech,qilai" },
+	{},
+};
+
+const struct fdt_driver andes_qilai = {
+	.match_table = andes_qilai_match,
+	.init	     = andes_qilai_platform_init,
+};
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index c7a6531e04bc..fc09edef8238 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,5 +1,6 @@
 CONFIG_PLATFORM_ALLWINNER_D1=y
 CONFIG_PLATFORM_ANDES_AE350=y
+CONFIG_PLATFORM_ANDES_QILAI=y
 CONFIG_PLATFORM_RENESAS_RZFIVE=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
diff --git a/platform/generic/include/andes/andes_pma.h b/platform/generic/include/andes/andes_pma.h
index be6149640c04..5b0ed0acfda8 100644
--- a/platform/generic/include/andes/andes_pma.h
+++ b/platform/generic/include/andes/andes_pma.h
@@ -19,6 +19,7 @@
 #define ANDES_PMACFG_ETYP_NAPOT			(3 << ANDES_PMACFG_ETYP_OFFSET)
 
 #define ANDES_PMACFG_MTYP_OFFSET		2
+#define ANDES_PMACFG_MTYP_DEV_NOBUF		(0 << ANDES_PMACFG_MTYP_OFFSET)
 /* Memory, Non-cacheable, Bufferable */
 #define ANDES_PMACFG_MTYP_MEM_NON_CACHE_BUF	(3 << ANDES_PMACFG_MTYP_OFFSET)
 
diff --git a/platform/generic/include/andes/qilai.h b/platform/generic/include/andes/qilai.h
new file mode 100644
index 000000000000..dfb0477fcb66
--- /dev/null
+++ b/platform/generic/include/andes/qilai.h
@@ -0,0 +1,18 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Andes Technology Corporation
+ *
+ */
+
+#ifndef __QILAI_H__
+#define __QILAI_H__
+
+#define PCIE0_BASE 0x1000000000
+#define PCIE0_SIZE 0x800000000
+#define PCIE1_BASE 0x1800000000
+#define PCIE1_SIZE 0x800000000
+#define PCIE2_BASE 0x2000000000
+#define PCIE2_SIZE 0x2000000000
+
+#endif
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
