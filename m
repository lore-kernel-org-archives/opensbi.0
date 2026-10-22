Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5066606A31A
	for <opensbi@archiver.kernel.org>; Thu, 22 Oct 2026 02:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=elG3YKdH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=gWZ7v/UK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4jhHa0hCOltnePG91HmTI5ujdXJma7HLUhuk+0kH9s=; b=elG3YKdHkAE1yh
	9faZ34CvDfmfhqNyeXdq5zhvHydawwweyWFoMbEnKcsM0Oep61Wkp3P4cGhwNIELxupiJRLZognu3
	FTtlJQqW11BuiqcyYTOpkHMWcdO3GbkJGsfZu4hevn/7kD79bEROZPPqvh8BrC/865FzI9F5oMQCv
	wsaYqe8NvXBbP95xnwX+n8E0HzmDwsFf5BMdERjKmDICdVE6cXcSAWJxZZMC4OaS6hkzuYCFHsy32
	3W3g9pJcjUnOJlzuoXrTLBQCpVIjzjbvOozDJ35PK3W0vZN1MwdiyPZ63NbAj76Xmr9GexPQDOIhU
	uUzWigKpmuERpVsJWlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVa-0000000DCMV-3nWI;
	Thu, 22 Oct 2026 02:26:22 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVW-0000000DCIt-0eHF
	for opensbi@lists.infradead.org;
	Thu, 22 Oct 2026 02:26:19 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36681e85e87so2862564eec.1
        for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 19:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792635977; x=1793240777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myKmyLAVFVYOCuOkjJGsX3DypgzjkjYQlH6U/moPXRs=;
        b=gWZ7v/UKrNGkE2pUxkCTPoYfioobAUT0p/LOs3Owuiwdq9aUQdNt8cr7IjQAbbG7YC
         51gO09h7f3z2zoeeaI3HwWF9pk/C5Hku7YIZ6Djj7XAsYzGa5r9d2g1iC8W1y6xKVXAN
         6+680LqX4P0XCp7PRX7STx7/jfI+GR1hqSQE7Bl4AKOBhX/B3mdsDc3uxVGbvEb5ZnWC
         ukd+lxEkBdO/J4d/pzulC85CeR0FT0OkWC50LtmsyKzQysOnNEzG8pxeXYYd/FtKpRaT
         hjTNOFUQTSJpOg5wHdLWZG/C3fkaukgZYpKkgD7LjAEceHmhcOo1MOFMU+ElacXDqd9G
         zRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635977; x=1793240777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=myKmyLAVFVYOCuOkjJGsX3DypgzjkjYQlH6U/moPXRs=;
        b=RLBHrDOSQl5Ga3bSgEZ5qGbiyl5K0NlJQVTaSBRngzUv7AotruP3NZ0k0P34Wn9Ri3
         GmYscf/mxA8TQeW7/eJ6QraIcOM09LYGumsBoALnv3WwbvmbXHT0UoJ7zZmr1+U2H8qV
         aGlSs6SCU53Tcjr61ckz9DYyVxvnFHxiFN4aiU1OkOaUmiq9ShpB27bAP4pslSEpYNVp
         pZ7mc92/sKsZPk6ihnNe6ATuHnx1GRz8C2oNQahLrb/w62lijev86aoXrBrTslY2pawC
         A26mYEtZ1k5VR1h6Rdbis9IIQH3dh/rNHUgvrwaWvaiLMnXPuXGVHSIKFs7PEjj4XwCJ
         smpA==
X-Gm-Message-State: AFq9FYIvbxx7cJJnXJiVcsjPg96g5Fbf2hcZr7DBrTnDBCPjaNyAVPna
	refXZKorKmKeR+5v/oeNgVD4nTxternPNYczaWslkFQWa3VD1wCuIRJYIeuQidBce8goqY4P6pv
	4WJ+Z+isKviZVXD5Cs4OC5407gpAW8XGlmsJG7IgbNIlBfkDgcAtJ8o2D7fcKq7ZMYKboW003dx
	kgJOjL0eS0Kw4q1BcxXNke4qsa7VH0CPM6zSJIKt3GEfjKYU4IkK0=
X-Gm-Gg: AYBFou0V9Y6CxNwGwbJA6ZXB6u1mIIxE3a6bMSn++1Z9EHa48h0oNvd1xW8Ts2x6B3v
	rNq7kPqbODJr8tLgTh0DpUMOJ2gppPh8gt/mU/N0TDUvfF/q47Y6Ljpf/GQmSKRJ0WTVUuTGhIg
	JtdfubUaLZ3K/XtN2+xnhgeX3d6LMIFMKifhCwMA2ucsjFZ4+ZdgyOCzK02WW8r0PY1aebR+UsZ
	M8df7emjQrwLPQRW3FH4h3cqV+R6iLKVTo7n97M00kPh3Y/wnQPHKHmxzudJKd0ODD4AcaA8T+O
	X6zvlBqHIyjvGVJHovZ8NPJXN7s6r9g50z/1Uoy3zNSZ5DPof9RXS4+vvsmavVDSnhdLQAjhjo1
	MUVygjnixb3ftbQTG2SBpB/HyyviiyeFJzqHEiqYoIbkJ467BvOfNJRFkx34lwEcCwGAsn/avtQ
	v+84VsCNcDYXMYeah90vtNh998+V/Mn/ov/NWQFCRKgn1vuCpDXfVDdpH+Yrr9a3/lC2J/BpLvk
	7BGRba3RnKDIkw+2P47atL7jeCbYB2PYm/q+3Z+fl6w2kOur9/qBrllxduwKhB+SA2l8DU=
X-Received: by 2002:a05:7300:d0a:b0:361:7ab9:479d with SMTP id 5a478bee46e88-3674e8400femr7421351eec.27.1792635977240;
        Wed, 21 Oct 2026 19:26:17 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm13047659eec.25.2026.10.21.19.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:26:16 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	ganboing@gmail.com,
	anup.patel@oss.qualcomm.com,
	Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Max Hsu <max.hsu@sifive.com>
Subject: [PATCH v2 3/5] lib: utils: Add SiFive feature-configuration driver
Date: Wed, 21 Oct 2026 19:26:07 -0700
Message-ID: <20261022022609.1974514-4-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022022609.1974514-1-leo.liang@sifive.com>
References: <20261022022609.1974514-1-leo.liang@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_192618_695467_05FF723F 
X-CRM114-Status: GOOD (  21.12  )
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

Add the SiFive driver, which maps core identity (marchid and mimpid)
onto the feature-configuration CSR values that core needs and caches
them via sbi_hart_feature_config_set().

marchid and mimpid are read per hart rather than once, since a
heterogeneous or AMP system can mix cores. Cores not in the table are
left untouched.

A platform that licenses a SiFive core but needs different values does
not have to modify this table or write its own driver: it can override
individual values with its own sbi_hart_feature_config_set() call from
its feature_config_init operation, after delegating to the generic
probe for the vendor defaults.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Assisted-by: LLM
---
 .../sbi_utils/feature/sifive_feature_config.h |  32 ++++++
 lib/utils/feature/Kconfig                     |  17 +++
 lib/utils/feature/objects.mk                  |   3 +
 lib/utils/feature/sifive_feature_config.c     | 101 ++++++++++++++++++
 4 files changed, 153 insertions(+)
 create mode 100644 include/sbi_utils/feature/sifive_feature_config.h
 create mode 100644 lib/utils/feature/sifive_feature_config.c

diff --git a/include/sbi_utils/feature/sifive_feature_config.h b/include/sbi_utils/feature/sifive_feature_config.h
new file mode 100644
index 00000000..8e36b967
--- /dev/null
+++ b/include/sbi_utils/feature/sifive_feature_config.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * sifive_feature_config.h - SiFive per-hart feature-configuration CSRs.
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#ifndef __SIFIVE_FEATURE_CONFIG_H__
+#define __SIFIVE_FEATURE_CONFIG_H__
+
+#include <sbi_utils/feature/feature_config.h>
+
+#define SIFIVE_MVENDORID			0x489
+
+/*
+ * SiFive per-hart machine-mode feature-configuration CSRs.
+ */
+
+#define SIFIVE_CSR_BPM				0x7c0
+#define SIFIVE_CSR_FEATURE_CONFIG		0x7c1
+#define SIFIVE_CSR_LSU_CONFIG			0x7c2
+#define SIFIVE_CSR_HWPF_CONFIG			0x7c3
+#define SIFIVE_CSR_HWPF2_CONFIG			0x7c4
+#define SIFIVE_CSR_VEC_CONFIG			0x7c5
+#define SIFIVE_CSR_IMSIC_CONFIG			0x7c6
+#define SIFIVE_CSR_TUNING			0x7c7
+#define SIFIVE_CSR_INT_POWER_DIAL		0x7c8
+#define SIFIVE_CSR_VEC_POWER_DIAL		0x7c9
+
+extern const struct feature_config_driver sifive_feature_config_driver;
+
+#endif /* __SIFIVE_FEATURE_CONFIG_H__ */
diff --git a/lib/utils/feature/Kconfig b/lib/utils/feature/Kconfig
index f6760564..acf5f1cd 100644
--- a/lib/utils/feature/Kconfig
+++ b/lib/utils/feature/Kconfig
@@ -2,4 +2,21 @@
 
 menu "Feature Configuration Support"
 
+config FEATURE_CONFIG_SIFIVE
+	bool "SiFive feature-configuration CSRs"
+	depends on FEATURE_CONFIG
+	default n
+	help
+	  Program the SiFive per-hart feature-configuration CSRs in the
+	  machine-mode custom CSR range starting at 0x7c0.
+
+	  Selected at runtime by mvendorid, then by core identity
+	  (marchid and mimpid), so one firmware covers every integration
+	  of a given core. Harts not in the table are left untouched.
+
+	  A platform needing different values can override them with its
+	  own sbi_hart_feature_config_set() call from its
+	  feature_config_init operation, after delegating to the generic
+	  probe for the vendor defaults.
+
 endmenu
diff --git a/lib/utils/feature/objects.mk b/lib/utils/feature/objects.mk
index 4ed7a97b..90c9dcee 100644
--- a/lib/utils/feature/objects.mk
+++ b/lib/utils/feature/objects.mk
@@ -6,3 +6,6 @@
 
 libsbiutils-objs-$(CONFIG_FEATURE_CONFIG) += feature/feature_config.o
 libsbiutils-objs-$(CONFIG_FEATURE_CONFIG) += feature/feature_config_drivers.carray.o
+
+carray-feature_config_drivers-$(CONFIG_FEATURE_CONFIG_SIFIVE) += sifive_feature_config_driver
+libsbiutils-objs-$(CONFIG_FEATURE_CONFIG_SIFIVE) += feature/sifive_feature_config.o
diff --git a/lib/utils/feature/sifive_feature_config.c b/lib/utils/feature/sifive_feature_config.c
new file mode 100644
index 00000000..aa2abb41
--- /dev/null
+++ b/lib/utils/feature/sifive_feature_config.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * sifive_feature_config.c - SiFive per-hart feature-configuration CSRs.
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ * Maps hardware identity (marchid + mimpid) onto the custom CSR writes
+ * a core needs and caches them once matched. Actual writes, platform
+ * overrides, and resume replay live in sbi_hart_feature_config.c.
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_hart_feature_config.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_types.h>
+#include <sbi_utils/feature/sifive_feature_config.h>
+
+/**
+ * Feature-configuration entry for one core identity, matched by
+ * marchid and mimpid. First match wins.
+ */
+#define DEFINE_CSRS(...) \
+	((const struct feature_config_csr[]) { __VA_ARGS__, { 0 } })
+
+struct sifive_feature_entry {
+	const unsigned long marchid;
+	const unsigned long mimpid;
+	const struct feature_config_csr *csrs;
+};
+
+/*
+ * marchids for these entries are 64 bit, so these entries only
+ * make sense on rv64 harts; skip them entirely on rv32 rather than
+ * truncating the marchid literals.
+ */
+#if __riscv_xlen == 64
+static const struct sifive_feature_entry sifive_feature_entries[] = {
+	{
+		.marchid	= 0x8000000000000008,
+		.mimpid		= 0x6220425,
+		.csrs		= DEFINE_CSRS(
+			{ .csr_num = SIFIVE_CSR_FEATURE_CONFIG, .value = 0x4000 },
+			{ .csr_num = SIFIVE_CSR_LSU_CONFIG, .value = 0x80 },
+			{ .csr_num = SIFIVE_CSR_HWPF_CONFIG, .value = 0x5c1be649 },
+			{ .csr_num = SIFIVE_CSR_HWPF2_CONFIG, .value = 0x929f }
+		),
+	},
+	{
+		.marchid	= 0x8000000000000007,
+		.mimpid		= 0x20181004,
+		.csrs		= DEFINE_CSRS(
+			{ .csr_num = SIFIVE_CSR_FEATURE_CONFIG, .value = 0x0 }
+		),
+	},
+};
+#else
+static const struct sifive_feature_entry sifive_feature_entries[0];
+#endif
+
+
+/**
+ * Match the current hart's core identity and cache its CSR writes.
+ * marchid/mimpid are read per hart since an AMP system can mix cores.
+ */
+static int sifive_feature_config_init(void)
+{
+	unsigned long marchid = csr_read(CSR_MARCHID);
+	unsigned long mimpid = csr_read(CSR_MIMPID);
+	int rc;
+
+	for (unsigned int i = 0; i < array_size(sifive_feature_entries); i++) {
+		const struct sifive_feature_entry *e =
+			&sifive_feature_entries[i];
+
+		if (e->marchid != marchid || e->mimpid != mimpid)
+			continue;
+
+		for (const struct feature_config_csr *iter = e->csrs;
+						      iter->csr_num != 0; iter++) {
+			rc = sbi_hart_feature_config_set(current_hartindex(), iter->csr_num,
+							 iter->value, false);
+			if (rc)
+				return rc;
+		}
+
+		return 0;
+	}
+
+	sbi_dprintf("hart%lu: sifive-feature-config: no entry for marchid 0x%lx mimpid 0x%lx\n",
+		     current_hartindex(), marchid, mimpid);
+
+	return 0;
+}
+
+const struct feature_config_driver sifive_feature_config_driver = {
+	.name		= "sifive-feature-config",
+	.mvendorid	= SIFIVE_MVENDORID,
+	.init		= sifive_feature_config_init,
+};
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
