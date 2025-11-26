Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF73D10F58
	for <opensbi@archiver.kernel.org>; Wed, 26 Nov 2025 14:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=km2tNNmcuQcpaEB+xbtoB7XWogOh8ie1S5+lYzH/I+g=; b=JENtZLB2ckO5B6
	VeElwD7nSwcAY1gi3xb8PoTiHLRDN/lsJZc3LMlqXhWEE3ZAbAM6g1nS+biKUZNzPZpOoj9UhtZd/
	1mUf9nFCvLyHFb+dbJkCSi2RxQ8SYsrp4QXf03RrBkRFXyZbb8cmEricqS7HKIfhDrSpjcRxY4vAE
	HtNuvrq55ZiYfNika3sd1dTfwCpwJYkzrDZ9KOnbHNVgflE4g57Bh/kQfsHomyIq02ZY8FqCfU5zH
	+rSki4jzwKylZiRmGu6b3tqRRIK5Mb1DCJch+xC4SPdKnH1+kwR8yuLWa/4QEXc3W7Eky/gpnsa7y
	GdQ/JjFYsIaUCzCGbyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMN-0000000F5lO-1Xmf;
	Wed, 26 Nov 2025 14:19:07 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMI-0000000F5jx-3iiQ
	for opensbi@lists.infradead.org;
	Wed, 26 Nov 2025 14:19:04 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-ba2450aba80so4043713a12.1
        for <opensbi@lists.infradead.org>; Wed, 26 Nov 2025 06:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764166742; x=1764771542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCIhFmo1Yt/E6pdoxe65RKxR/Og//pE2b9aDgQKjMxs=;
        b=BwqHdFyNec5ZoKm7q/ylp4GFw9l15XlfBFvG5crj1ZfyUX3xyAPXPdDk8EXYYSRUsE
         vX1qsRdy/ZWCDTWevpUcKkoDUp6YJdibXOFOr1EwaL6P1kaCz2Izy3J0Ert7dmPDrwWX
         L5S7D6ireA6ZmTTGAlTcn1OiMuJInF6xwKfKBqZagAQi9ls5f2i83ATibhzOh9brM/4i
         MVlIs2Sq+CLRSfV+02AyMnsMC+ojBTJR++uS2oaISM3AYfVtqPiKLn7araVoxilPyJkS
         QpQZf0ooI7EAOC4nxQfS7ufSWUaNeeq9u3iAiaSEWap6H+abuijWbX9yZ2yjSLoi+rXd
         rIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166742; x=1764771542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FCIhFmo1Yt/E6pdoxe65RKxR/Og//pE2b9aDgQKjMxs=;
        b=fY2poB1bwFQ8KfTTLG5uYrs6T1f8LlQPEV/sOMgcBiwA6rbxajp5hhbwN7YIu+cIJp
         yTFFzUQcStEZakBB1KdtK7nmlQKzgQ5n7Zv6btGuYEGIhOZ3szi8E3d/MHL5surIKNED
         Dr/wNxttAvvnaMaBhVSsnbFffOriHfiGiMU+bodUJ6TLa0ZjggEdLJOjJsEKIeFoP601
         SdjfEf7XUMueSmxPha2KP26ELQQPwtpJ+j57sGZqNX5/Kxriojx9UToCDCeWOadhm8wp
         CT4Sol+x3s5GSBpTPYRN0OFztdq/6PhgV2vt7Z9u3QaIcoqt5nisgfMysRM46hoZ95uO
         xhZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUWwxWIioON5NWalJ66+sOlfhMlKtzacS5jA+l85G49VKdCBvvTFxCELtgtDIg9IjVPrshTEYJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yym3WmascTHfVE0CUgBNOCszh+QHkTEkg74WFpCgyMkaJQZEkb6
	buE8BkHFkq3833TF18h9Vn6GF4ebA1I37QVvRyfhk6+HEBq7yb2acsClAsrOKBUnklCpeo3nuvA
	0FTJ6d+FNW2os
X-Gm-Gg: ASbGncvwumeGaM97Qm0Tpy4XJMREAUx10nj0AlTvnU1g52cB24vYNB3nnl4JX04PBpv
	TEVvL5ffUgagyE67pcz5BQXEZAQOqyRDX4ntrRmwOmS6hz945xDAY3ewX0WhwjTlS/eB5mLydX9
	84nwVdU/BNITyy7UND7bOxWUYvJeVsVhjBgKmJwGpBwPdDzJGMnqxC6ilOCF0fsix5icPNKYIck
	9yWTELNt2hi6EeD4RI1BqffsfBiiWmtglepbk+4bvriZ4GZ+UCfpAix+p7QpbnWIdXNim1/QYXK
	YPt01yTUE8dcFQ9uoG5Gf0NboBz+NOsHGABoL+doKkEYqh22R/TvKUg76U2u/4k0gg6bKXgushv
	PmQNO2q8IEFh+ecyxBUvMYEZH/usV8xWi72obe08y6J3QTAIiLxMkEGuJO3G0RJM/W75TDg1s2i
	+ZNRgDnZAEg4IzFiJTnlblG0MbsoZap3fZEXBHvQ8KK9tBzqnpU80sZEZZ9GYC
X-Google-Smtp-Source: AGHT+IHP83Vxu83Lm/0gn80BMLM9i3pgaKYrWG8V6lV5QF83WXLssYxpigRu4HFrchoVVUkGRfEmUw==
X-Received: by 2002:a05:7300:dc8d:b0:2a9:44f9:b074 with SMTP id 5a478bee46e88-2a944f9b0f2mr3914949eec.5.1764166741815;
        Wed, 26 Nov 2025 06:19:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm103679339eec.2.2025.11.26.06.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:19:01 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/5] lib: sbi: Introduce hart protection abstraction
Date: Wed, 26 Nov 2025 19:48:41 +0530
Message-ID: <20251126141845.248697-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126141845.248697-1-apatel@ventanamicro.com>
References: <20251126141845.248697-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_061902_941942_B49ED5D1 
X-CRM114-Status: GOOD (  19.92  )
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

Currently, PMP and ePMP are the only hart protection mechanisms
available in OpenSBI but new protection mechanisms (such as Smmpt)
will be added in the near future.

To allow multiple hart protection mechanisms, introduce hart
protection abstraction and related APIs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hart_protection.h |  88 ++++++++++++++++++++++++
 lib/sbi/objects.mk                |   1 +
 lib/sbi/sbi_hart_protection.c     | 110 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c                |   5 ++
 4 files changed, 204 insertions(+)
 create mode 100644 include/sbi/sbi_hart_protection.h
 create mode 100644 lib/sbi/sbi_hart_protection.c

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
new file mode 100644
index 00000000..c9e452db
--- /dev/null
+++ b/include/sbi/sbi_hart_protection.h
@@ -0,0 +1,88 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __SBI_HART_PROTECTION_H__
+#define __SBI_HART_PROTECTION_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
+
+struct sbi_scratch;
+
+/** Representation of hart protection mechanism */
+struct sbi_hart_protection {
+	/** List head */
+	struct sbi_dlist head;
+
+	/** Name of the hart protection mechanism */
+	char name[32];
+
+	/** Ratings of the hart protection mechanism (higher is better) */
+	unsigned long rating;
+
+	/** Configure protection for current HART (Mandatory) */
+	int (*configure)(struct sbi_scratch *scratch);
+
+	/** Unconfigure protection for current HART (Mandatory) */
+	void (*unconfigure)(struct sbi_scratch *scratch);
+
+	/** Create temporary mapping to access address range on current HART (Optional) */
+	int (*map_range)(struct sbi_scratch *scratch,
+			 unsigned long base, unsigned long size);
+
+	/** Destroy temporary mapping on current HART (Optional) */
+	int (*unmap_range)(struct sbi_scratch *scratch,
+			   unsigned long base, unsigned long size);
+};
+
+/**
+ * Get the best hart protection mechanism
+ *
+ * @return pointer to best hart protection mechanism
+ */
+struct sbi_hart_protection *sbi_hart_protection_best(void);
+
+/**
+ * Register a hart protection mechanism
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_protection_register(struct sbi_hart_protection *hprot);
+
+/**
+ * Unregister a hart protection mechanism
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_protection_unregister(struct sbi_hart_protection *hprot);
+
+/**
+ * Configure protection for current HART
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_protection_configure(struct sbi_scratch *scratch);
+
+/**
+ * Unconfigure protection for current HART
+ */
+void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch);
+
+/**
+ * Create temporary mapping to access address range on current HART
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_protection_map_range(unsigned long base, unsigned long size);
+
+/**
+ * Destroy temporary mapping to access address range on current HART
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size);
+
+#endif /* __SBI_HART_PROTECTION_H__ */
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 8abe1e8e..51588cd1 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -75,6 +75,7 @@ libsbi-objs-y += sbi_emulate_csr.o
 libsbi-objs-y += sbi_fifo.o
 libsbi-objs-y += sbi_fwft.o
 libsbi-objs-y += sbi_hart.o
+libsbi-objs-y += sbi_hart_protection.o
 libsbi-objs-y += sbi_heap.o
 libsbi-objs-y += sbi_math.o
 libsbi-objs-y += sbi_hfence.o
diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
new file mode 100644
index 00000000..831072ad
--- /dev/null
+++ b/lib/sbi/sbi_hart_protection.c
@@ -0,0 +1,110 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart_protection.h>
+#include <sbi/sbi_scratch.h>
+
+static SBI_LIST_HEAD(hart_protection_list);
+
+struct sbi_hart_protection *sbi_hart_protection_best(void)
+{
+	if (sbi_list_empty(&hart_protection_list))
+		return NULL;
+
+	return sbi_list_first_entry(&hart_protection_list, struct sbi_hart_protection, head);
+}
+
+int sbi_hart_protection_register(struct sbi_hart_protection *hprot)
+{
+	struct sbi_hart_protection *pos = NULL;
+	bool found_pos = false;
+
+	if (!hprot)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
+		if (hprot->rating > pos->rating) {
+			found_pos = true;
+			break;
+		}
+	}
+
+	if (found_pos)
+		sbi_list_add_tail(&hprot->head, &pos->head);
+	else
+		sbi_list_add_tail(&hprot->head, &hart_protection_list);
+
+	return 0;
+}
+
+int sbi_hart_protection_unregister(struct sbi_hart_protection *hprot)
+{
+	struct sbi_hart_protection *pos = NULL;
+	bool found_pos = false;
+
+	if (!hprot)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
+		if (hprot == pos) {
+			found_pos = true;
+			break;
+		}
+	}
+
+	if (!found_pos)
+		return SBI_ENOENT;
+
+	sbi_list_del(&hprot->head);
+	return 0;
+}
+
+int sbi_hart_protection_configure(struct sbi_scratch *scratch)
+{
+	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+
+	if (!hprot)
+		return SBI_EINVAL;
+	if (!hprot->configure)
+		return SBI_ENOSYS;
+
+	return hprot->configure(scratch);
+}
+
+void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch)
+{
+	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+
+	if (!hprot || !hprot->unconfigure)
+		return;
+
+	hprot->unconfigure(scratch);
+}
+
+int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
+{
+	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+
+	if (!hprot)
+		return SBI_EINVAL;
+	if (!hprot->map_range)
+		return 0;
+
+	return hprot->map_range(sbi_scratch_thishart_ptr(), base, size);
+}
+
+int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
+{
+	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+
+	if (!hprot)
+		return SBI_EINVAL;
+	if (!hprot->unmap_range)
+		return 0;
+
+	return hprot->unmap_range(sbi_scratch_thishart_ptr(), base, size);
+}
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 663b486b..b161d1c1 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -18,6 +18,7 @@
 #include <sbi/sbi_fwft.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_hart_protection.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_ipi.h>
@@ -74,6 +75,7 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	const struct sbi_hsm_device *hdev;
 	const struct sbi_ipi_device *idev;
 	const struct sbi_timer_device *tdev;
+	const struct sbi_hart_protection *hprot;
 	const struct sbi_console_device *cdev;
 	const struct sbi_system_reset_device *srdev;
 	const struct sbi_system_suspend_device *susp_dev;
@@ -90,6 +92,9 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	sbi_printf("Platform Features           : %s\n", str);
 	sbi_printf("Platform HART Count         : %u\n",
 		   sbi_platform_hart_count(plat));
+	hprot = sbi_hart_protection_best();
+	sbi_printf("Platform HART Protection    : %s\n",
+		   (hprot) ? hprot->name : "---");
 	idev = sbi_ipi_get_device();
 	sbi_printf("Platform IPI Device         : %s\n",
 		   (idev) ? idev->name : "---");
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
