Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F6FCCD1AA
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5rcMSJSXX3G8/IDOQEPou8StwUcYJq8Zyf5//IJ04Y=; b=uXzsKmhzTxg2ri
	2fmEDSXvE2A3sPS8X2C3I1BoKX0b8aXEVJqNo+wIeF6NcjhQChOTDOZGrrAZ0Hd+o13l06+d4lbhe
	a0+gqqJa5EWdzl4zEGpPo+EVzFK1Lp0nrI6fn0qixEiirhV7TgwgNS7sKBACS4YxR0nj0pL7CL0Af
	ADrGQAFFGKW4iY2WCIpp/IxHTM/kok57W8NedOEPzokoW7wTNHbDCghEVMoeLVB/c6qHu3yFi3bl0
	ppnqh0jWra0lB2Qtd5JTuDOUnfprpiusMtjYt7ZTBk2TSU4zp7Kt4ERX9MTincUCnm5pJAkPY5ZB+
	0nL02aYWdFsT/8wyouGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM9-0000000C1vq-2GO0;
	Mon, 20 Oct 2025 06:26:57 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM7-0000000C1u7-2YV5
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:26:56 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-781251eec51so3126991b3a.3
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941615; x=1761546415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VPSQX54QGD9Rk2DACnxMb2Y0CfNHWfn55bI1rThBks=;
        b=Onc00C1MypOMD5Al6fZXTV+sbBKVw1Mn1DcN+3OH4wgv/tVhsX/c1QOa8FailcBDU5
         Cr1cWoEK9/m2PRJVFf4XIRdHFDtpGR3459R7scXAx1OvAZDhPURBu+C8gZDhBK9zJEW2
         08CBn/TNl+rSh/G743S7lPb5fvT0LdS5V5eTSNKnGNBeA2Faxu+5Wa/yd6gq9vB1I/QD
         VSOrslezr+92JDYd8E0pNc1zZDwxnXeToksazGkesVM8+eI4a/RlAktYoRluJiqUmtxy
         6fR2vf3eWN2oFjtGKiYpSEXYyi4pbbw/Sy7Kcv9i7Jx4K4RjrNbw3XXolGM6JSR+jeiW
         d1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941615; x=1761546415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VPSQX54QGD9Rk2DACnxMb2Y0CfNHWfn55bI1rThBks=;
        b=a1IuvkiMA9kbqVaug6FYNwGDHGT8/QfR1HrQA5GqoRhRJjHiQfIvsnvw5yXMK3XFrG
         Za2mMO2ewmmOgeCNwLDfLlsG3H5LO3r/5QKUA3gNwFFsEFp64sjnVQ58kvTnZVFaKj7n
         k20AM3n4FkgKM8EcqGOtcwRX6gjDncNYgD+VTG2POsisqRFH9dHVyCke/6RoLQQWzf/+
         nHQCY6wZ3wvMdKQl6fcsxEcs9bYO6myT+OV9Do30lXYvpHSHg4rq5FR3WLmzq8DJrva3
         c8xPJqM3LLy6qGJdUbkPnYe6quCLdgZMm7kDOZMTgQy2OFbg7RlFnM89aGcDxGl3Fhui
         q2xw==
X-Gm-Message-State: AOJu0Yx1I8O8oNv7zX8ffzWyJdPyJ4t/rtsa/1sHVkcasHK+eGBlsFv9
	tQ2KvleGqjogtGUYFmr+GX264HunsFXWx1c9AlJWTfn2iaEYWEtT2fFZR2QAJ1AlI/ZmgfZ17t9
	kwZuv
X-Gm-Gg: ASbGnctlwyXPadOh49zvpIpLYC5Lz8T4LGIMnfTtxbyg+RD/6LcS0I5pkTleHJvYC42
	Da3f5xlm2yqXudfkiN9SQa7D5ZSOktHQ75+j7GHKZfB7P02XR7WAkz3wMVd+A9T5r5mLPck8Ktu
	7LvoG8BYkXdEcgQR7xckgITxeVek/SdO4rQKWCaTRPIsQbraxau3IH8gxoWXN4t4aKHMLRxW4Nl
	c0C+ARNlaAL3IlszbKM6y9FqapxHUintHcYCq4VAmASQFGZNvG/kUWoTC6T23maqg1Dsju0cw8F
	qSgZItC9rzAmyUbIFjIt+X+DsiO7Mlgk4LMumpVHFLFTV+zdBhm3wZdJm2DEyFhwZVkPoqwk0sG
	Py00Xh2W9gIocFZQNornglqfh9otRx7eDdDpjFf2WL87/LzVSQh0iy9InKQL5Z79CsdLw0bJU3h
	t7LAO2ZrTO
X-Google-Smtp-Source: AGHT+IEuzgm6HXbXb1z1sSb+E3KSw7hJgsM9opftZmq8oAQ+EtWT1zSkFiSuUv3V4SNVHZo3REO+9A==
X-Received: by 2002:a05:6a20:72a4:b0:334:99f9:ff57 with SMTP id adf61e73a8af0-334a8622145mr15714694637.47.1760941614708;
        Sun, 19 Oct 2025 23:26:54 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:26:54 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:06 +0800
Subject: [PATCH v7 04/12] lib: utils/cache: Add fdt cmo helpers
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-4-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232655_682259_B4B5F3EF 
X-CRM114-Status: GOOD (  17.80  )
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
