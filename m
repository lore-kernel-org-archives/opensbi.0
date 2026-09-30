Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82944C9830E
	for <opensbi@archiver.kernel.org>; Wed, 30 Sep 2026 05:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH8QYsxeBnTyHZf6hzAkyzPI/Ax92Q3iU70dNCQtqxs=; b=waEdezPpSI/DoE
	c9d0Chv3Q9y+0UdDS2IEHF8zWwI2tm5gZVqDAGh2c8u/tEAslbEg/h/X7Vcrxt2ZjVnuveXPDpInV
	tWbOsAEldSRn7vSAgGOxAO5E0or1bt2pwPs/U/uvIxSc+nPJs6z58YceD4IdEyfu5Q8N6IeyQ0g/l
	a6bNyPZSt6YdGi4UKMCMzSm2QB98aUl8SLeYaoEmBmEljNBfPmaZyccBDY8epCgkFiAHJBXJ25V6u
	qA0O8hTYQWaFIw8W++z4XIrgxgQQ+cAT34zZgQM6NTuU37YwasvQIEnjcPVMzfoC1bYwjx1Li2RGq
	YCg2VuXf39fD/CLgJpOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5J-000000054FR-2gkf;
	Wed, 30 Sep 2026 05:42:29 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5E-000000054EC-3uWy
	for opensbi@lists.infradead.org;
	Wed, 30 Sep 2026 05:42:27 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-342773d94a7so3070224eec.0
        for <opensbi@lists.infradead.org>; Tue, 29 Sep 2026 22:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790746944; x=1791351744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYeXj7yiGeIKxl0m/uxTK4ArBEaAPiKQq2+pmQFsXjE=;
        b=cHoJBUcl4BXHlTKg4MF5qlUWDneYFAT2TM3QQwOvsI1K+9BJMjvwygETEyzTZe/C8l
         JsHaDMDF5DO0mPBYHwYA5NcPOFQdO0v/WnhRL752qCMYDRAGzbc544IqsnLUdCQGePfm
         IDFN+uXX4jT3XmcXjl0RyI5CUmK1kELi3v5ajsop1l0DWYHDqNT/UwM3IlhmIGhp0MQC
         r0dl/fg4YhYPqz/8JdvqEOFRFedfa/KtUPXfWe2G6EggqcrlNDHlh+H8f5++9xawNyr2
         KxYTpKVDyYvfvYTqQlDUYgfR7MWc8faDtPnY93lYzvXk2riZSPwZoE4PYSlb2qfcynTf
         0XCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746944; x=1791351744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYeXj7yiGeIKxl0m/uxTK4ArBEaAPiKQq2+pmQFsXjE=;
        b=KikgWTdmlpOLMEV8ZYKJ0dbLjKqIjRDRk/ReTziSHfhn1v0uygpTw2ciOR839Uihfr
         Ktrq2uA/wU4RNyRCeVD91oTJzX4XHaQ/e2RN7VjF81DBRjP/0jAJh02xKRzzhMbGegF+
         hACMWPV7AJfVK5c+K1U11AFgB3gD1jnS6bIpUpg+tRIJaLEu4vh/bojL3hry0h0J3FKY
         m4ZDsrOF1FooCW3Sbn+of1NxDerL/OPTn37sbkodUy4DsVzWQfwN2kDwwxh+FeSv4WUL
         khDyglgaFks8OtnfF34dvj9n9rZyn/vo68ZQDUWNp1QaQs75C+4ZFulvuk+3RZakyabD
         j/fw==
X-Gm-Message-State: AFq9FYLMF82KPA1nGBrO7ImR8vFpGFmHH1danIwR1iLSWzXYdb6qwIqU
	yoFpI985JyUwJCAoSe4FyJCqo/oy++791bq4C2km2Go3AnabLcdvrjGR6/nhL3UIE9byC8Tn/v1
	ALMsQ9MuiMziK/jCchXIlbL2o2ZEdn9LBgK6dq0asIzNt7z6Y2pdlvbo0t58/+kJw5R1zFBOLdF
	XEvsIoNdq0Fo6Pp8r9T++aP/wAVaOMGbEku+HRA7WPeFH0XbqkYcc=
X-Gm-Gg: AYBFou0eWZTbTlFjU0IwNBEOhsexm4jf6Sz0K02bNXR5jrxTLIdl3TPPU4VyYSITxgc
	azG4xDbCGtezPb5cPqOHz4YVJk6nA8m4dq5rjmwkP4C6haUTRwN/s2gXAnUBpOwtGHc8PoM/3ZD
	uSCkG0dkuOGBR4kbDR1f37+kAZUW6iE3HEMYkyRqXF/fEmebu3QRUBa/MVNMRWqf+RYYKRuMF6N
	SucilrdMJcTktuLfhItYSIc07+idSIWMkQ4pJKj0gxXFA1nMf4CzoY7Qe9GmGmHKmDB1b+5JcqR
	b2OGiEnamgFNLaWJCbAx7uEXkt02JrWM38G7Ue00JUDOkLAgJ08b1yLLg6QWID5c0vW12Lk6lQF
	xM4eN5sKDqv8JDYubrM9pfZ1xgg8rhEo/AT50IJjeRZzsSquUIfK6tsdr8egykKG843D4ryyvor
	1MPBA7/mTgrxrWyj0Zu2qDRGmB6x8RbnMbETn7QGVTNWMpP5KzDnPqnNxVTW2w1nbsWRnryVvXV
	ZwUMhmuMp21LA==
X-Received: by 2002:a05:7301:46a6:b0:33e:4097:1ef6 with SMTP id 5a478bee46e88-34cdbed5ad6mr637056eec.15.1790746943605;
        Tue, 29 Sep 2026 22:42:23 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a60283sm910797eec.6.2026.09.29.22.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:42:23 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	leo.liang@sifive.com
Subject: [PATCH 3/5] lib: utils: Add SiFive feature-configuration driver
Date: Tue, 29 Sep 2026 22:42:08 -0700
Message-ID: <20260930054210.3498806-4-leo.liang@sifive.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930054210.3498806-1-leo.liang@sifive.com>
References: <20260930054210.3498806-1-leo.liang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_224226_070075_632DC2BF 
X-CRM114-Status: GOOD (  21.26  )
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
