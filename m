Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65150C369AB
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 06:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8edEfdbcGUqZSetFiaGMUACtJhrl0sQ5j4SP7uhQ+SY=; b=AHwBqu2TVbXKLoI3ZSVciJ78DC
	Cddhsu5+pQusd1ciabnXvmbe+M6EN6AzNZ1mwK8RFUiQO7iqjkiASynbZEaLlH42xommgzbaxAka6
	1mmQvH7LPAExrCPeEoB72C5UU/9ReYxTTMl0G/S776La4uQLvlrg0nli7OYMs0BXZrWcf0q2jSqo4
	LOsvH9+K6kXGQZui0wYM6fBVv00QnnbdaJmSZxwQKNoJlCkxBrxC7NDAHPm3myRpnjVpkjZ3Ltmqt
	igrj9CXa4l2+9Wmjf9EMEJiemUmaJHv1De1MYghqMbWfgWuw2D6REP5bRboD8i/4DFGPrFyzQh1y8
	f5peDsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kbB-00000003he0-0BXj;
	Mon, 21 Apr 2025 06:25:45 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kb8-00000003hbs-47Ob
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 06:25:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3255765b3a.1
        for <opensbi@lists.infradead.org>; Sun, 20 Apr 2025 23:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745216742; x=1745821542; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XfeDXAr8ZlzlCHph2DfeFUAZYRa+SgAlBatXUy2bJDU=;
        b=VvTsdtEZJ+FCkf8ne3wuWSfnMd8zeI+P2RSb97H2o+IEE5I6ACl4foJCbgTS5nC9Uw
         5vWoB8p1mwea5ZSv3Z+a0qMgESPWOa7E5LHR+K+IJ/An0vF35DW90ACNddAZNCkuioSZ
         QBVVCJZBg+9BEtwOAArpA81KYMhLRLS81MpmNmzElTiJ+e37RgrLVrsjytIvT3/gJOpV
         1U0S2txMfGI5bRdlTP2os2zAHoFv5riyDbmf7e01wL1J0HIsY4EgNe1auInhhCctZAnb
         cwDoPVKLxS62uKXNjNYIUFdtLw7+YWGRIZW6w73MRV+78LXSBATqu2btxGsyb9LOar1L
         suHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745216742; x=1745821542;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfeDXAr8ZlzlCHph2DfeFUAZYRa+SgAlBatXUy2bJDU=;
        b=uDHBv1VtVoX09fTc/mFQO3pvLmWZjxLr++IXR0dAYM6j/gNY7dJKMQwxcT9jNX++Bw
         FxWueVeM/V73IMMhbqSP0cJzGcadskHDq5hOwLPzd1y52H7zkh1UzLAKOGBOWzFVTSPU
         QBBMEMoWFqg/NA3SdZI2dEEbNEsRJ/Eur79rpIEm80YVyP6x+yit8H1ggLl4VCnkIKeS
         P/WVet7InazPpEny4ib18m9OAkDNKJhtHcvkuF8+nYkA2rdXFASyayiurQzYZh+OSIr0
         Kdzl2X5hOhLDQxtJjFb6dF2Ap85MlAH72nU7Pyp7YkgA9rgvVyrzKTglMiqxLgblq/FJ
         E4zA==
X-Gm-Message-State: AOJu0Yz40kBlSgfvouqX2YdLJem0wOTO5IUzcOn34QAF5fuFGl7Co5bK
	ALBsgbE+xL4OYAYHycSot+MOkFJX7ivdwLxNYsioQRCjrd16Ow4BV9fqR7Ka6/6YlHds2K8APK9
	sPt5pZgXMXE5H1PKKQnmhHNkx1pbeTevyaCmzZhlOhAoO2ibowuDnZFBXe4HHoiOcaWFUmxVrIX
	2xGZxt9MEbyMBvB4F9UwzNFwOlax33OGnBWIxWdGY8aw==
X-Gm-Gg: ASbGncvYeLBpD+e8EWuPp/POVqAoQFDgB2d18/ap+87n/t8GNVLrLUCSXQPyijKWy1a
	tvVmCBGsKx+32g9PztkcpKEd/h4A0dopwyI2Qg0W35E88et9IBAl3wiJiRBj+l4NNPWt9jTQPov
	vvcDpSdOaf0LJNawdLfGZZYSgAElzzFKgfocsfvo5X59S1AM9JcBi/UKH1Icm0kawJp7TJ81aQm
	O+3TbphFo5joPP9d2cYadJtUBeYd7NIa/Mkd6Q2GwAlskwnhTq5lcueoqXLafqGV4Yr9TdNdLC9
	RZGtu8+oQ8XQYQ98RlmiAOikNvkJFLn1mt+fM9wLC5FFxoNnsnoIMeUhzVqoMLL4nA5ECQHVpA=
	=
X-Google-Smtp-Source: AGHT+IFBHjVkZ166yeTZDhVjonH4cML/WgAQaeQKCqkG2R/gWcO8bLMJYQFP5ij5F9TxVZyiuHcM+w==
X-Received: by 2002:a05:6a00:4606:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-73dc14d3124mr13165355b3a.14.1745216741685;
        Sun, 20 Apr 2025 23:25:41 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf3dsm5961043b3a.134.2025.04.20.23.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 23:25:41 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 4/5] lib: utils/cache: Add fdt cmo helpers
Date: Mon, 21 Apr 2025 14:25:07 +0800
Message-Id: <20250421062508.21187-5-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421062508.21187-1-nick.hu@sifive.com>
References: <20250421062508.21187-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_232543_023852_F4F335E1 
X-CRM114-Status: GOOD (  16.28  )
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
Cc: vincent.chen@sifive.com, Nick Hu <nick.hu@sifive.com>
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
 lib/utils/cache/fdt_cmo_helper.c         | 111 +++++++++++++++++++++++
 lib/utils/cache/objects.mk               |   1 +
 3 files changed, 146 insertions(+)
 create mode 100644 include/sbi_utils/cache/fdt_cmo_helper.h
 create mode 100644 lib/utils/cache/fdt_cmo_helper.c

diff --git a/include/sbi_utils/cache/fdt_cmo_helper.h b/include/sbi_utils/cache/fdt_cmo_helper.h
new file mode 100644
index 00000000..3d4e0108
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
+int fdt_cmo_init(const void *fdt, bool cold_boot);
+
+#endif
diff --git a/lib/utils/cache/fdt_cmo_helper.c b/lib/utils/cache/fdt_cmo_helper.c
new file mode 100644
index 00000000..c6c05209
--- /dev/null
+++ b/lib/utils/cache/fdt_cmo_helper.c
@@ -0,0 +1,111 @@
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
+int fdt_cmo_init(const void *fdt, bool cold_boot)
+{
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
