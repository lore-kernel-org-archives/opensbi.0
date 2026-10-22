Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15FC606A31A
	for <opensbi@archiver.kernel.org>; Thu, 22 Oct 2026 02:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j6RCdohx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=LkmnMoAu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWCRwCom9EOosIlAO2C3zNQTgKKlM3yAfIARf3Y53z8=; b=j6RCdohxbP4DU6
	zjvrA4KxexH6+lxlfitB77YxG+2IVe5IAlvLN+Zao3VdmgBivPEdXFSRSBuAUUAaD+xiiVwVxqZCp
	mJwiezXXAx1iLxwbFy1WlqTDW6llngND01EJGdoOn1QIjzZJRCDg7ux/9KBc1lxR+tObvA5JPHJv4
	6DvM7WXrBM+7AIbaJCTpojbpB6rJ8cl5Ish6b7PPLrM8KK0THT2nv7Fs6Lt9A2tTm6EbXNKS1p8bW
	oA3PTFbv1ZtaxX0OzeaJCL7B/H70JPb2/c6RSQMWw6nV0/aamCFIULq4JdA+H0hq2wVEuMVtNpLj9
	k/1OX8wIhODTrOO1wTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVX-0000000DCJz-3IeB;
	Thu, 22 Oct 2026 02:26:19 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVV-0000000DCIM-1CNj
	for opensbi@lists.infradead.org;
	Thu, 22 Oct 2026 02:26:18 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-35f036b17easo257505eec.1
        for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 19:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792635976; x=1793240776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKoUYtvbw6qGy8utTHIUShyPXSTaQp0ItEZab96VOsg=;
        b=LkmnMoAueJXUdxptWE7v3YjcZ9B48RzjocVY5dNBTDm0O2TJleYBItqRoMwn5OsggP
         IZLiwxSXiRN7fnQQ3HsnOQbCLlVYIZawNY0qd6qaKakg5r3hLWYF9/dr3lSu9d84xdBU
         rBU03yjxkzQtX143R3NKLOtrqJhiSjRh5qiC0mfpQoZ+grPaKr6rZuJHUuwPiJLcsAHn
         84De+i8273dLoShjVsTZCTLGty/BDxowf/CITmg+xt7d1ZoMs+eCNV0/3X05oySs6at4
         18IDMBqYgBn5AulMP0H9ZLX+0pXdNn+XeiWqfULTbH8U/HPknkTvRoCdDcK0meNFG/Ys
         xZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635976; x=1793240776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hKoUYtvbw6qGy8utTHIUShyPXSTaQp0ItEZab96VOsg=;
        b=ptYbZMRdYFZ1m47VPtrOKpBoCbpsopD7Qb8uVHRRSJztGSMmxhVkBH7CMd++P/j97p
         Db9v6qvfVJDjSHXTO7mrqvo7hVhQFwdiQza47jSSGfGc4wgIx96J7xTBE6DC26k7Ymvu
         +PvlOUOZHGIveovP8zczMOHEMtX0fssPXohdTb+rlIrdnVoRxnWYQOOoOcxboxqV13Dh
         N2CRYuSkXPhAKURjBOg48q0zrrwkK2nHybO1MQSSXbYocDPsr+DGUjjsSBrK0WEawXtk
         FOhhJ/AEIR1qQIMsrV8rjX/R+aDtCeuZXcy0ox9RwwCC4GSKjFT2ZBtElt70HdagecLM
         yKoQ==
X-Gm-Message-State: AFq9FYLFibSvoR0DuGGAIujhPmCl+6eZ+xfYnaAzr6AWLfeoYoCu+LBE
	IZ6/QXIm+yF2jsBtxa5PwB4ubKm484FCoAbLGdcDXTyfZOONMCLNb0JKJ3ztzhp3bVL0LhD5y5t
	8e//LCAWB4HW+u2lp7B4iZY0OB5dEpHty7ceTd3vSzSWv9CMpPLidzAkAxVRHed8Mzg/mi0ZaTf
	c0es3o+Bj4jM3qgHYT4lOWUpli8fnRNRtbBPw0Ncwjtu+71XtuatA=
X-Gm-Gg: AYBFou29T0zyufVSML0GXP0KrybQAa6vyTVOtzbM4ywct6080BXbI9xj2LPw2sl/DUc
	erfDyGV7DJSn8zDjBBm46DPqSGKEgVijCJ1lQPh6YpbBZk6qPovLnnrXc8mzwqfPsaSXIvT1NqO
	UQr3mCwZe5AOQLfakgx9v2ja+6MQ9Mg2GSZORyANXvChw5PS+04y5dBt41Sde/j4wMnx31BGLln
	3bQ1ssskUz9G/PtsRgFCdgjCj2viAAeZtKM4DuIBTgcnxTQzhrEZzS1w6L/oHs1fw3rcLckh6Om
	BT67txFaN7NdJUKfmOchvKk91masl9pfz2fknVUGSia24fPYRjcyfkLeJuISLt59ibVSHeaUjN2
	Ba0T2CclfybUD1P9ofNTrALgvEv59V5fAxxXRcgi8H1wfNPxvWm390fcPXYK+UMm9uu2MWkbEvs
	2MjsPQd4+GE0M4kJCKoAD9itUs9oHMP9jjABK4FwOa+65kSWjUcQHBxpjGlbq2YS5FWdQFKGBFe
	vS0UrpIUomD7L/vtOOzpp6s1yxuZVkoP+aZbW3r4WCFdov7ifImyLzynxStxVbO+f6tipE=
X-Received: by 2002:a05:693c:894c:20b0:351:52ec:60ee with SMTP id 5a478bee46e88-3674f81fb30mr5469007eec.28.1792635976091;
        Wed, 21 Oct 2026 19:26:16 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm13047659eec.25.2026.10.21.19.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:26:15 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	ganboing@gmail.com,
	anup.patel@oss.qualcomm.com,
	Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Max Hsu <max.hsu@sifive.com>
Subject: [PATCH v2 2/5] lib: utils: Add vendor feature-configuration driver support
Date: Wed, 21 Oct 2026 19:26:06 -0700
Message-ID: <20261022022609.1974514-3-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022022609.1974514-1-leo.liang@sifive.com>
References: <20261022022609.1974514-1-leo.liang@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_192617_393016_F138C2E5 
X-CRM114-Status: GOOD (  19.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the vendor half of the feature-configuration mechanism: the driver
interface, the carray that registers drivers, and feature_config_probe(),
which matches the current hart's mvendorid against a registered driver
and calls its init() callback.

A driver declares the mvendorid it supports and a init() callback
that caches the CSR values that hart needs. Returning nonzero is a
hard failure; an unrecognised hart is left untouched, which is not
an error.

Keeping the driver interface here rather than in lib/sbi lets
libsbi.a stay self-contained: it depends only on the
feature_config_init platform operation, not on vendor-specific code.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Assisted-by: LLM
---
 include/sbi_utils/feature/feature_config.h    | 71 +++++++++++++++++++
 lib/utils/Kconfig                             |  2 +
 lib/utils/feature/Kconfig                     |  5 ++
 lib/utils/feature/feature_config.c            | 36 ++++++++++
 .../feature/feature_config_drivers.carray     |  3 +
 lib/utils/feature/objects.mk                  |  8 +++
 6 files changed, 125 insertions(+)
 create mode 100644 include/sbi_utils/feature/feature_config.h
 create mode 100644 lib/utils/feature/Kconfig
 create mode 100644 lib/utils/feature/feature_config.c
 create mode 100644 lib/utils/feature/feature_config_drivers.carray
 create mode 100644 lib/utils/feature/objects.mk

diff --git a/include/sbi_utils/feature/feature_config.h b/include/sbi_utils/feature/feature_config.h
new file mode 100644
index 00000000..b57873dd
--- /dev/null
+++ b/include/sbi_utils/feature/feature_config.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * feature_config.h - Vendor feature-configuration drivers.
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#ifndef __FEATURE_CONFIG_H__
+#define __FEATURE_CONFIG_H__
+
+#include <sbi/sbi_types.h>
+
+/**
+ * A single feature-configuration CSR programming request
+ */
+struct feature_config_csr {
+	unsigned long csr_num;
+	unsigned long value;
+};
+
+/**
+ * Vendor feature-configuration driver
+ *
+ * Registered through the feature_config_drivers carray, so adding a
+ * vendor never requires touching common code.
+ */
+struct feature_config_driver {
+	const char *name;
+	/** mvendorid of the harts this driver applies to */
+	unsigned long mvendorid;
+	/**
+	 * Match the current hart's identity and cache its CSR write
+	 * via sbi_hart_feature_config_set().
+	 * No match is not an error: the hart is left untouched.
+	 *
+	 * @return 0 on success or a negative error code on failure
+	 */
+	int (*init)(void);
+};
+
+extern const struct feature_config_driver *const feature_config_drivers[];
+
+/**
+ * Match and cache the current hart's feature-configuration values
+ *
+ * Matches the hart's mvendorid against the registered drivers and
+ * calls the matching driver's init().
+ *
+ * Meant to be wired up as a platform's feature_config_init operation,
+ * called on every hart so a heterogeneous or AMP system picks the
+ * right driver per hart.
+ *
+ * No matching vendor is not an error: the hart is left at its reset
+ * configuration.
+ *
+ * @return 0 on success or a negative error code on failure
+ */
+#ifdef CONFIG_FEATURE_CONFIG
+
+int feature_config_probe(void);
+
+#else
+
+static inline int feature_config_probe(void)
+{
+	return 0;
+}
+
+#endif
+
+#endif /* __FEATURE_CONFIG_H__ */
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 5a5b3b1e..0c1d157e 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -8,6 +8,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/cppc/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/fdt/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/feature/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/gpio/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/hsm/Kconfig"
diff --git a/lib/utils/feature/Kconfig b/lib/utils/feature/Kconfig
new file mode 100644
index 00000000..f6760564
--- /dev/null
+++ b/lib/utils/feature/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "Feature Configuration Support"
+
+endmenu
diff --git a/lib/utils/feature/feature_config.c b/lib/utils/feature/feature_config.c
new file mode 100644
index 00000000..11be2bbf
--- /dev/null
+++ b/lib/utils/feature/feature_config.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * feature_config.c - Vendor feature-configuration drivers.
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ * Matches the current hart's mvendorid against the registered vendor
+ * drivers and hands off to the matching driver's init().
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi_utils/feature/feature_config.h>
+
+int feature_config_probe(void)
+{
+	unsigned long mvendorid = csr_read(CSR_MVENDORID);
+
+	for (int i = 0; feature_config_drivers[i]; i++) {
+		const struct feature_config_driver *drv =
+						feature_config_drivers[i];
+
+		if (drv->mvendorid != mvendorid)
+			continue;
+
+		return drv->init();
+	}
+
+	/* Unknown vendor: leave the hart at its reset configuration */
+	sbi_dprintf("hart%lu: no driver registered for mvendorid 0x%lx\n",
+		     current_hartindex(), mvendorid);
+
+	return 0;
+}
diff --git a/lib/utils/feature/feature_config_drivers.carray b/lib/utils/feature/feature_config_drivers.carray
new file mode 100644
index 00000000..5f3c219e
--- /dev/null
+++ b/lib/utils/feature/feature_config_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/feature/feature_config.h
+TYPE: const struct feature_config_driver
+NAME: feature_config_drivers
diff --git a/lib/utils/feature/objects.mk b/lib/utils/feature/objects.mk
new file mode 100644
index 00000000..4ed7a97b
--- /dev/null
+++ b/lib/utils/feature/objects.mk
@@ -0,0 +1,8 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2026 SiFive Inc.
+#
+
+libsbiutils-objs-$(CONFIG_FEATURE_CONFIG) += feature/feature_config.o
+libsbiutils-objs-$(CONFIG_FEATURE_CONFIG) += feature/feature_config_drivers.carray.o
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
