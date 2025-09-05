Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A30CA1012
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 03:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5rcMSJSXX3G8/IDOQEPou8StwUcYJq8Zyf5//IJ04Y=; b=xTHmNzEt3CYzN7
	nZHHOlX5W4geBylFf1rHWRrgAaOobgEzNbxVfYu8U/i+8sfOFcpn27q3XBFFJQSDAjfN8P9Cpt80D
	T2FdH6OQaxrbDlUGp70halP1AwOx/8eOo4ke7wtF5SLc8lRFwgqogKp5vvn8Yyp4W3lWNqa6O4dqX
	izNVGB6uv5gVa12LbchpbCDG/sVa7GMb4MB1UTRMUXuWL5krN+9jjOik/yMsRbaBjhGLwEMuT3WNt
	Tkfs+X+Zxwf646ZvwXoEeJk1O2IvGNTkYTuAKQC29FrAcCMIXZlcHmDVaLoL1/88/oFr7AYjattWT
	4VCXmlAaanCg5Z6qPrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN5Y-0000000GRAt-3EuI;
	Fri, 05 Sep 2025 03:26:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0E-0000000FxeA-1Van
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:39 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3280264a6e8so1231710a91.3
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038597; x=1757643397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VPSQX54QGD9Rk2DACnxMb2Y0CfNHWfn55bI1rThBks=;
        b=hZgB0pV7IQgfQ2qW8bDHbGZXnmIqgtpIlO/FK2OEoDTQMyFAanCLjF1+Gn4wscSJ7C
         TqdLpk/zHrDHgHKJneBqCqpy0pbRMOt6ND9S1IyWEk/CuTR9y9v+ZUlSaL+QSlPyRx42
         Arv7OO50vOCwDNk6EAOu5GnU1UWGjoDnKIcWqitd2x3dBjUzAmlEToPmKlYXTs8lFZbM
         tWGspUOgphJ/0TfCFF9kn6ROJUbuMPwOFTHTjonZr+1MGO5iYpno02NfAjbTO+XlksY2
         n/HNPZnwCJq9loqEJE+ghKNDJYRUbjKyNe2CJTwYnyPmuScdY8aWiIoATq8noED2gAxt
         yMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038597; x=1757643397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VPSQX54QGD9Rk2DACnxMb2Y0CfNHWfn55bI1rThBks=;
        b=dUAnnG5HbL9lQIWuq28o8qELFFow+PrgPPr8vprC3uTpNHXOikfgrXxpt+bh+SKXRD
         kaFWqjaKUrzbIsMlvFFcpUCbaE1n+PKT+w0/7tVgF/c6PqzmOR9n91on6dkOnmnH8/FR
         kCWgWNjn/7CGtMTo1IjKGvwS8/FNmM/7fqVyFLXuHo+5dQc4T05vn6J8fHEXUMeSvW+7
         jIOCe2wFPkzDRMRFNjRuxt/wc3UiZSzFyZgH2iyucXpfsethkl/AALt2WZbixugWhZCr
         Ypo6U9bMr2PnbTsAa4bNY4mPFd6pKFLCvJF3bYeVs3w5+afALFgKFV75L7juurpaPqvr
         m9vA==
X-Gm-Message-State: AOJu0Yz1elEeVFtUvZvxEDyFHt09qDy//IyaeEcLB38aP4p6H18F5nNB
	bRmMmznhKgVs455YdcrphofQszkOZ6vIeqFlFl8gm6Uka0lJwrXfV1SXLX5kyI4lCYphbbIJc7C
	rxvUzl0Fj/6kxqmM31UfVaSvpey7Qf4p1Trwb2va+BJNVAcB8YNmpirILZpxV35aLY9c/5jDsoJ
	+EG/pzW+IoRitwrrg7FExxU1Y785tDV4RRIyTNoAqnQcKTToto
X-Gm-Gg: ASbGncseb3mtTODPpvTcgVgbbxA/cxcRxLYcTRMAprRJi7kgagSm9pdSLFSY2q131EQ
	IYSBW16bCca7WP1Kuw7jg8VVVZux98QcYixKgFCq9T3qcYQK4Rz0eBr9+Z+loaTR+A3nAnZqKKv
	+jrsH5LAz8muawwLXRlewK88I3w9MHCcT8en6etJ0HWgP1qQkKFW36My3ff4tHH4nIKzNzuASdI
	cNsZa0YXhLFoWBYvApPncF8s1C5VZCBx/yGCY27ZbEwH86HFLV/owPfaGV4WFztuqbsK8gIWjP5
	bE2D365xgURkL3B3HqJfNrkbIERRj5inlR4pTjE9HJ0NBgyVQvVXUb3Ey5e/QTntvp1zla7q8iN
	mtZ+02eEkIrJOPZFKYco0nU6yQX5+/v8=
X-Google-Smtp-Source: AGHT+IE4IEm6r5gQSqMBxu5nR/JC+Jqz/U5WwBxTD4RF9WyTfG7GJMO3nhCas7H2ErPL1JeX2f0G3w==
X-Received: by 2002:a17:90b:2790:b0:327:8c05:f89a with SMTP id 98e67ed59e1d1-32815412e9bmr28048922a91.4.1757038597177;
        Thu, 04 Sep 2025 19:16:37 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:36 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 05 Sep 2025 10:24:37 +0800
Subject: [PATCH v6 04/11] lib: utils/cache: Add fdt cmo helpers
MIME-Version: 1.0
Message-Id: <20250905-cache-upstream-v6-4-6a6da629c961@sifive.com>
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
To: opensbi@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191638_404278_50D7AAFD 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: Anup Patel <anup@brainfault.org>, Nick Hu <nick.hu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add the helpers to build up the cache hierarchy via FDT and provide some
cmo functions for the user who want to flush the entire cache.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi_utils/cache/fdt_cmo_helper.h |  40 +++++++++++
 lib/utils/cache/fdt_cmo_helper.c         | 112 +++++++++++++++++++++++++++++++
 lib/utils/cache/objects.mk               |   1 +
 platform/generic/platform.c              |   3 +-
 4 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/cache/fdt_cmo_helper.h b/include/sbi_utils/cache/fdt_cmo_helper.h
new file mode 100644
index 0000000000000000000000000000000000000000..a6a28db9ede2722d8261d2e077eeb7710cff0893
--- /dev/null
+++ b/include/sbi_utils/cache/fdt_cmo_helper.h
@@ -0,0 +1,40 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_CMO_HELPER_H__
+#define __FDT_CMO_HELPER_H__
+
+#ifdef CONFIG_FDT_CACHE
+/**
+ * Flush the private first level cache of the current hart
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cmo_private_flc_flush_all(void);
+
+/**
+ * Flush the last level cache of the current hart
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cmo_llc_flush_all(void);
+
+/**
+ * Initialize the cache devices for each hart
+ *
+ * @param fdt devicetree blob
+ * @param cold_boot cold init or warm init
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cmo_init(bool cold_boot);
+
+#else
+
+static inline int fdt_cmo_init(bool cold_boot) { return 0; }
+
+#endif /* CONFIG_FDT_CACHE */
+#endif /* __FDT_CMO_HELPER_H__ */
diff --git a/lib/utils/cache/fdt_cmo_helper.c b/lib/utils/cache/fdt_cmo_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..6d2e853dd735735092c57db2398f97a64de3ab5e
--- /dev/null
+++ b/lib/utils/cache/fdt_cmo_helper.c
@@ -0,0 +1,112 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi_utils/cache/fdt_cache.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+static unsigned long flc_offset;
+
+#define get_hart_flc(_s) \
+	sbi_scratch_read_type(_s, struct cache_device *, flc_offset)
+#define set_hart_flc(_s, _p) \
+	sbi_scratch_write_type(_s, struct cache_device *, flc_offset, _p)
+
+int fdt_cmo_private_flc_flush_all(void)
+{
+	struct cache_device *flc = get_hart_flc(sbi_scratch_thishart_ptr());
+
+	if (!flc || !flc->cpu_private)
+		return SBI_ENODEV;
+
+	return cache_flush_all(flc);
+}
+
+int fdt_cmo_llc_flush_all(void)
+{
+	struct cache_device *llc = get_hart_flc(sbi_scratch_thishart_ptr());
+
+	if (!llc)
+		return SBI_ENODEV;
+
+	while (llc->next)
+		llc = llc->next;
+
+	return cache_flush_all(llc);
+}
+
+static int fdt_cmo_cold_init(const void *fdt)
+{
+	struct sbi_scratch *scratch;
+	struct cache_device *dev;
+	int cpu_offset, cpus_offset, rc;
+	u32 hartid;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return SBI_EINVAL;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+		if (rc)
+			continue;
+
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			continue;
+
+		rc = fdt_next_cache_get(fdt, cpu_offset, &dev);
+		if (rc)
+			return rc;
+
+		set_hart_flc(scratch, dev);
+	}
+
+	return SBI_OK;
+}
+
+static int fdt_cmo_warm_init(void)
+{
+	struct cache_device *cur = get_hart_flc(sbi_scratch_thishart_ptr());
+	int rc;
+
+	while (cur) {
+		if (cur->ops && cur->ops->warm_init) {
+			rc = cur->ops->warm_init(cur);
+			if (rc)
+				return rc;
+		}
+
+		cur = cur->next;
+	}
+
+	return SBI_OK;
+}
+
+int fdt_cmo_init(bool cold_boot)
+{
+	const void *fdt = fdt_get_address();
+	int rc;
+
+	if (cold_boot) {
+		flc_offset = sbi_scratch_alloc_type_offset(struct cache_device *);
+		if (!flc_offset)
+			return SBI_ENOMEM;
+
+		rc = fdt_cmo_cold_init(fdt);
+		if (rc)
+			return rc;
+	}
+
+	rc = fdt_cmo_warm_init();
+	if (rc)
+		return rc;
+
+	return SBI_OK;
+}
diff --git a/lib/utils/cache/objects.mk b/lib/utils/cache/objects.mk
index a343eb8c4bd495a1596845c1fd02420277023430..6829a966784732127d93180b3eb46ed24de5bc7d 100644
--- a/lib/utils/cache/objects.mk
+++ b/lib/utils/cache/objects.mk
@@ -6,6 +6,7 @@
 
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache.o
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache_drivers.carray.o
+libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cmo_helper.o
 
 carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += fdt_sifive_ccache
 libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += cache/fdt_sifive_ccache.o
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 91140958a0f4294428221c91fe2792eb6b1b02d5..e66f99fa8a88d1badd3843305e34486a548bf465 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_tlb.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
@@ -230,7 +231,7 @@ int generic_early_init(bool cold_boot)
 		fdt_driver_init_all(fdt, fdt_early_drivers);
 	}
 
-	return 0;
+	return fdt_cmo_init(cold_boot);
 }
 
 int generic_final_init(bool cold_boot)

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
