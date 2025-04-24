Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB88C369D9
	for <opensbi@archiver.kernel.org>; Thu, 24 Apr 2025 03:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DTqYRJp+o1GO9aFD7SvILbCoJr4HN75LR1NHwCj8JBI=; b=KrhtSVVbY+uDBr3whP4oLK/L8l
	b72u6zpmaP9Fu/kYVSRO4dk6VMjn+ea99WvGmQxNFPq9M9gITTCorDOE8UxYAWQ+wx4Zc+S0FoQ72
	O28sN+txnXbGrjs8GYkq6R4k/tzPKhHzDByMTF4l7DyzWAhEko+YVlZ6AJlqnOOs3MCEJKeFUPgWs
	xtBG8wm+MFG2hpTeGTQEtfXXQXjSz2/oj5wNAJC45oAKJUPXE6MsTwMoukmQL4aiU9hXd/KnLWeBD
	t8Dv6K56iLyFXhYRg9fjM0z8XgBsAzjUA3xXusdTZSWRV6iElA1HP1NalmAProtOTJajQGXEqswiy
	SgeOAwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRs-0000000CkhH-2TF5;
	Thu, 24 Apr 2025 03:40:28 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRp-0000000CkeE-31NT
	for opensbi@lists.infradead.org;
	Thu, 24 Apr 2025 03:40:27 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-224171d6826so7773005ad.3
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 20:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745466025; x=1746070825; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d7V+jN3ppAm1HIcJ43KNr/yZn2Yy9sVd74LaNfTdv7o=;
        b=EHNr6oh0HrJGr3dcePZWX8Botatf4+5l4qBCiVidEVhMD0uNAH9GCPCikG3RY0+AJD
         ZVrrWC1UKD6Zi/AWrcT6hePbVqN1xUZF1erQm8llubFw9JaBxz82OAHKTQ+I3HriMovJ
         cMwYqz8uX/BRJnGuLHrdvLA4rI03grzkz1rRXAeHZWDP/SXFUox+TYJkiYHiqUq0URVM
         fUbMaEvoWWwNuLmbM7Kg1if/8IcowZSruVWZItHonqAwZSwOcg1OKumHio4pJm621fMd
         3iK9T79GiZTjK2Oyy7KBIegV9R6wL2OWMCp5LCoiNzBihBqHLsjRF6gTLHjR54D7w1ZQ
         B/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745466025; x=1746070825;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7V+jN3ppAm1HIcJ43KNr/yZn2Yy9sVd74LaNfTdv7o=;
        b=FRFDs5/po+GBZUwtdc9lUWUFZlf0Rl8c1ERs7hOS1vXh/5MiYZVZgGgTnEyzQzRtq9
         OAw++u4BtQ0zqqzm61XQUGWGfCED1zjciweXECmQhvEuOi75biPXpig24sxoaP0WmIF3
         8/fAn2lNMC7zDI43VdH/9KFn5tqNiH5IwT+OlKXbjVBgFTVUHDVLROn9pI43s51YNWzs
         +PbSxctRNLd0h2M86+0v9ltlsI10aA3+HM4uLywBzjXk8SPqzoPitq+bUT208pLevMey
         o9v9tqjLmOFdHPMcElbzeSR+vJKhyjBlgXcrAis4IQIuZdRHh6fw5nP7PcHXGmBr9Jfp
         2bpg==
X-Gm-Message-State: AOJu0YyTe5L7zkYyvONk4Hp2NZnBq2gZXJleMDGg0y/4U9+wqvET0yIR
	QBwVDvyRRO/12s17DilvIGSDFQlYKn83v1nkokgaDo+FtvdgMhqaIVXHeXvI+VGsSuv19RHhRyF
	0wEPdCxT+JNE2kBZNBUt75nJDRGGP2AWbGWNOR3L3InhtfnPszGqqxGpQ3zqz1Fue3rCdG+hYPs
	eN9m9LMlOleuRP6uGp/HOtojxKNW5xAMiAHANBci8Z+g==
X-Gm-Gg: ASbGncsG+xxJGx8qFXwFc+sXgsjkrOWjcNXOBZ84MCh+2hCgGgp7qvTAvQiAwF6GTdV
	C7LEypp1emP+mJVsiBGF0+rV/qwBIvH+0X7pLJG04ojBeZQoldmel9goHU1shd7i6asTMewOzrw
	RSALrI9GUdbs5XLE4TFCe/tWpxoca0ano6jgCU78I+hg5zPC6EPDsHfsFgAmNG0qs8sxnQen+Mh
	Bd0edHBIkYm5qzsecjRnR8knGwjfy99LNITQpUF3G3tVzG2aPo1iN6dXzC6PsJ7SCJCRZQcqGyv
	GAV/GTD6qiu+cwbTpDOPu8ySwwUWji5lzn6+qq/LEHt8Nu8HSNEGSyhnzfVFPsiRA9V7xYc2vw=
	=
X-Google-Smtp-Source: AGHT+IEhx9Qg92JgKIYXhj72+wrK7tNoi9LnK3kVPA0Dli4jGYa6oQjmW/FpzS8cEQLy0FqLzGHN5A==
X-Received: by 2002:a17:902:e94f:b0:21f:71b4:d2aa with SMTP id d9443c01a7336-22db3ba2b2cmr15647485ad.5.1745466024447;
        Wed, 23 Apr 2025 20:40:24 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd5f2sm2632025ad.66.2025.04.23.20.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 20:40:24 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v2 4/5] lib: utils/cache: Add fdt cmo helpers
Date: Thu, 24 Apr 2025 11:40:02 +0800
Message-Id: <20250424034003.28522-5-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250424034003.28522-1-nick.hu@sifive.com>
References: <20250424034003.28522-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_204025_762979_495AC71D 
X-CRM114-Status: GOOD (  16.14  )
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
