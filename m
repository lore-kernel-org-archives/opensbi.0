Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2EFC83F12
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DTqYRJp+o1GO9aFD7SvILbCoJr4HN75LR1NHwCj8JBI=; b=YMhx0MppHQMCQyQlAjanq7gwxf
	ELZ8i7MWAiCv8VzG7ZIV0FYEsHyyP/deg2wkToArH3U6iVxe54MyW+P8gXD8eKiRcMvnwFpAH2qe0
	vc9IafQO1dSdDYCfkNvZjx0wC1oruPiSMQsvhaBacUTD/MZ5fP2Bd73vHCwJ6tgcPFzuQj1HdzHjE
	L/T5nqMQXFN67aN8+q5sH7fihfM25vHRGEIhUVYTItGvU41nMySmA7O0lOUSkTRMSqdiDvhPgCGm2
	fYj7AUjHEGzIKb7H9hc59VWiQklB/zt1QZvlajLldws/eOyfITaa17w/GGz9dyNJL/oPXZZiEebF0
	dNa1OI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3EY-00000004fPT-336c;
	Tue, 08 Jul 2025 07:59:22 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35Y-00000004dL7-1f1g
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:05 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6fad4e6d949so23812466d6.0
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961003; x=1752565803; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d7V+jN3ppAm1HIcJ43KNr/yZn2Yy9sVd74LaNfTdv7o=;
        b=ZHYsXyyqMYYnNQi0Cg63s5WdHK971WaU+b8arEwmDg9P4QTI3G/W5SqjJqYxB4SwVf
         ZBnm5KqdbZQvrX7GFbsgH+2z7PlMP//nl3K5qvSCsLFFaXSF9G5Dr6IJAtXeAY64Xfoo
         KP3ZHMEg3dbOM3YLusc8qT0DsmehB3NNvk5qZwcPKNaT53KHO1c17tjyws6VOTcb110F
         oa73YZwW4TyO3gAJ4046Kjf2H9+ZKLrYxnJtw0ltj9ICvlNX4kQfSlvhqmlVW1mnXhfu
         pM3k5Y1dzDYwr5zyVEJNWXKdbiEYU2hj/YfAEee0qfn6dmFnX4jjUkxnBKB01V37pZ7B
         Ns4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961003; x=1752565803;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7V+jN3ppAm1HIcJ43KNr/yZn2Yy9sVd74LaNfTdv7o=;
        b=fqRM2QdlvyRyI3mp5y1+AeMQM56iHdiH8QDXs0C9bui/uR1Xy/Kny2ChPuqdsTjh3z
         eamAr4M7NZcLwI+epwx1MO6QHwPhzHPARBBVWfcfH3+LQKfuJ/Gde/uAy4lzB5aKSAfo
         641/GNER8BWbpGGhVw1Betev/CUCwvwihrr3g5X2kCsZniIBFMfWfEAFSjZh9RUZIUSC
         T7JC4oX39JMgPiSX0GvjYCE8sopQFbfJOkPYg0vSo9cYSHnNvWfslu9/vmMzRPeeOb7+
         ki9p+iPHbTCFdigd35ane1qazOSkUThveqd/9voE6je3Dt/FPXGoZuHoplwQ8ysgQCQq
         1ehg==
X-Gm-Message-State: AOJu0YyGki57t5eDwqydXm2vWpz4d9WjObbgibX2j53HsgzWJyTWUpy0
	dtkpCdR34HpNidjHOGOsUuWTI+WyEEWOYlM6IziG6+6JsK5cK4zHFzw9Sh/TjeOHYjDsl0HmrWG
	waGIdJhMz2iwkoUwVDLwJH8hWNv9ogIJ8DlA54IGQq3Qqum4nw9H0jtTxEfXAnRuUwGuxYx8Fhm
	B6zbq/TeEF1AOv/+DFCOcwzMGgS3Gp0sFzYE9fTqbsLNnIAQ==
X-Gm-Gg: ASbGncu/2VEHsfhX3JQdZWH0R6ZXfl01ZTObRQVPBR/00YXXqKKDxjZpdo662/2vqYy
	8kztqC++OlclGf2qQZEU3M2SQzJTVxN2CTq/LlQfP5YBoNupO3KcalgC87/fDzCTbZnCNLSE4tO
	h2aJB+AAK5lPCLGhlBeE4oaAD/CpovIxaQrHqMJERflz9PPSl+/LnWv4JaHzO8Tw/jKG1nLRMUW
	w9DAsf53QYGwrGJQgKzB3xDvgVZhYuxprNo26d7vKtTOs1WW5amQ2xu6x9obX2wC1y4w8XTo0Qt
	2MInSwpeRnpBE33Ga+cJJeYEVpMUqAs7dZhJ9V/DeW9fjyQeTFAaE7EWuhfNbue3Wk6rMePjkvK
	qPk1DnhqVfJ1/UrKlRUA=
X-Google-Smtp-Source: AGHT+IHDz2KZ3jurbt3iVEy9ZgNsIrZvdSa9t1oFkZvp0JTFKoGIdzkBPM7GNad5fnGuNuqgzz9o2w==
X-Received: by 2002:a05:6214:5d90:b0:6fb:107:f618 with SMTP id 6a1803df08f44-702c8ce6e7emr179536996d6.40.1751961002904;
        Tue, 08 Jul 2025 00:50:02 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:02 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 04/12] lib: utils/cache: Add fdt cmo helpers
Date: Tue,  8 Jul 2025 15:49:32 +0800
Message-Id: <20250708074940.10904-5-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005004_432875_EADF6686 
X-CRM114-Status: GOOD (  17.12  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add the helpers to build up the cache hierarchy via FDT and provide some
cmo functions for the user who want to flush the entire cache.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi_utils/cache/fdt_cmo_helper.h |  34 +++++++
 lib/utils/cache/fdt_cmo_helper.c         | 112 +++++++++++++++++++++++
 lib/utils/cache/objects.mk               |   1 +
 3 files changed, 147 insertions(+)
 create mode 100644 include/sbi_utils/cache/fdt_cmo_helper.h
 create mode 100644 lib/utils/cache/fdt_cmo_helper.c

diff --git a/include/sbi_utils/cache/fdt_cmo_helper.h b/include/sbi_utils/cache/fdt_cmo_helper.h
new file mode 100644
index 00000000..4275725e
--- /dev/null
+++ b/include/sbi_utils/cache/fdt_cmo_helper.h
@@ -0,0 +1,34 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_CMO_HELPER_H__
+#define __FDT_CMO_HELPER_H__
+
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
+#endif
diff --git a/lib/utils/cache/fdt_cmo_helper.c b/lib/utils/cache/fdt_cmo_helper.c
new file mode 100644
index 00000000..6d2e853d
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
index a343eb8c..6829a966 100644
--- a/lib/utils/cache/objects.mk
+++ b/lib/utils/cache/objects.mk
@@ -6,6 +6,7 @@
 
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache.o
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache_drivers.carray.o
+libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cmo_helper.o
 
 carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += fdt_sifive_ccache
 libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += cache/fdt_sifive_ccache.o
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
