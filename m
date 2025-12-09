Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DE3D3B7EA
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRR7mk90hakZHCbmlEmZX0wSxVQdo94hsfVRuEdj0Jg=; b=0mQi6OmechzN7P
	WwgPjGSviB0nceig0sD46c13pmbJ9bd7+3KkBszMBQ88AuXYUZ4whBJUG2Uzc4zSuBhj9o8CACpCl
	aBGtidKph2PuP8nDflp/k4y3ANRVXUgV0ae0IQmBvIjEEhc/zfWsQ/1IW5/wa7+N1mMNdQ7+vfEOp
	tjMKGjepPmcdXhbcki/6qGWR8SYLAzzKDjtVGhXV67a5yPt67peJpV+y4xXFB5RhIxUzL8UnEVN5B
	j7ZiSx2kSweRK0O+HNcDV2KEoXaL9elE7O0PChDOSrhJMGwEgxRsd6kMKPRhsdH7hn/kodyU2jgW7
	7hNe+1PjhxVa6iQy1jEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy9H-0000000ELaY-1wFr;
	Tue, 09 Dec 2025 13:53:03 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy9F-0000000ELZn-0cHR
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 13:53:02 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so5985321b3a.0
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 05:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765288380; x=1765893180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfWsfNnWr87I5Rp6jZ7+baov1SLUFH2KvoUSQXXRZUs=;
        b=Wu+gFNSwcQikl2JQK5M2wd5y9U4HTCwYgQ7sIQ3UhGelfjdUXhXGMz91vgpRTx5dDZ
         CbBNQXF57vOHZL/9QHl5lV/GajIWtP7KhaZ7MoprZgLC3Sri/Vn4uqmxRxx+KjlqYDbZ
         4uKlWrixzdZitpZP4u6IqwRi4S+uoILu9HscZDByME8f4Xbm37u+t6EjLsOOrF79fGe3
         HnM4ngaiRgM9iQ7iHIh5+lRHx6ehS8xqWFYO2F9t4iuOZ+s4FvvvGJUdaEx68565Qjid
         hoIjaVg8jG/AL+HrPtkfckmYPpUANt9Tadkm1bDXJ4KbZKpi8QvrayefV2Htzr8a2Zfn
         GVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288380; x=1765893180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HfWsfNnWr87I5Rp6jZ7+baov1SLUFH2KvoUSQXXRZUs=;
        b=XL+SYvFJhwz6WhCM0F0DgnhF5qU0jB7dCqA2wLvFpwTcVmYJYn75i0hwgyjlwOxv69
         mQwfWETj6VT6kcG50zuJW3iR39jmMLYbW1HlnypSzBaFIcTU7EWyqZmX+FuGB0Amg2U/
         40g0TJ8naIe0GExE1cRToABwFyFTvckJA260x88ugh7aO+tlol2SoTAqv8gd6eoBx6Gk
         oquyhGD2TbHUqbsNPdGz3koQaMMpV7GUYjFKQYwprPtZmIyoI6KsVOBuKuthViXJXI2w
         Zzjh8SfRj5n64xEoolvQ8oCDu6zLyLMNMUqYh+dYJ+Dzkq9OUOGysPl5H/WAbxydRl/7
         B8rg==
X-Forwarded-Encrypted: i=1; AJvYcCXas+vySkdoVyqh4Kwo1rCXDujpjlSnTGRr0rXaPYuVYThqPCz9Xvn/QDlfMKtm8ipiaorvT5A3@lists.infradead.org
X-Gm-Message-State: AOJu0YwVlGcc7wVeeluhsjzXII5WfYKEhEZQ5726mvumWwtx1+eiDFhX
	7qW0Oe892rw0Y+WI+UexFcxUUvfEBqb0rioqJ4M2V4O/DVnLxxCQcdV44vCCa8ZPI+A=
X-Gm-Gg: ASbGncsd0P1qZj2fA8SE7bCW6H9qXj/uPB0Sf9YJFG9Zok6v1Qhiq2sp8mo5dXgmT4G
	2VbkMP+5dKjFeVDHEh0sDI/k5cgHqVnSCS2EIPKID9AWDcNxlQpOLFM8PyilSohMv58uuPKyHnR
	hwcTksZklLzoVQZ3NxDsGzQmFFiAC6vCMweN1GPu/Eo8zrk8+Sq7S/48l9wfcOFFH02C8fsHslg
	/iUb8UzcrSQ+rQchdkqOYmTvMSJKGBavYz52zMiXtWWd1q2eQaR2vhpCCmduiHTvrg43H2VM4l5
	07Qx6KfCsEaXpgqXGhD9kbhKPT466ZBWWaKVWeBnTvnF+XagQkbZY8wdpkq7d7Z/eAAMC3zUDsQ
	tnM3VopqMM4Z2mFdCxK0QOa7umEJw5gxKXkMDuesAxrOgn8MXJQWFICwO4s+IqIRM2wNF4x/m+p
	JAuEtusOVAyoWqI215lp5u0Wav4I00hOhBkypRVD5YaIR2Nxo0
X-Google-Smtp-Source: AGHT+IHLloKwmZUcqZsnEnRpkH5F/0H+avh2r6J+S95ShOGmN/8Phr+E30wwPKFWOSwlaynhmdar/Q==
X-Received: by 2002:a05:6a20:6a13:b0:35e:7605:56a4 with SMTP id adf61e73a8af0-36617f035f1mr10546083637.51.1765288380224;
        Tue, 09 Dec 2025 05:53:00 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf681738a34sm15023827a12.4.2025.12.09.05.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:52:56 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/5] lib: sbi: Introduce hart protection abstraction
Date: Tue,  9 Dec 2025 19:22:32 +0530
Message-ID: <20251209135235.423391-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209135235.423391-1-apatel@ventanamicro.com>
References: <20251209135235.423391-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_055301_191984_4224824B 
X-CRM114-Status: GOOD (  20.40  )
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
 include/sbi/sbi_hart_protection.h | 100 ++++++++++++++++++++++++++++++
 lib/sbi/objects.mk                |   1 +
 lib/sbi/sbi_hart_protection.c     |  96 ++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c                |   5 ++
 4 files changed, 202 insertions(+)
 create mode 100644 include/sbi/sbi_hart_protection.h
 create mode 100644 lib/sbi/sbi_hart_protection.c

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
new file mode 100644
index 00000000..d65f32ca
--- /dev/null
+++ b/include/sbi/sbi_hart_protection.h
@@ -0,0 +1,100 @@
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
+ * @param hprot pointer to hart protection mechanism
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_protection_register(struct sbi_hart_protection *hprot);
+
+/**
+ * Unregister a hart protection mechanism
+ *
+ * @param hprot pointer to hart protection mechanism
+ */
+void sbi_hart_protection_unregister(struct sbi_hart_protection *hprot);
+
+/**
+ * Configure protection for current HART
+ *
+ * @param scratch pointer to scratch space of current HART
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_protection_configure(struct sbi_scratch *scratch);
+
+/**
+ * Unconfigure protection for current HART
+ *
+ * @param scratch pointer to scratch space of current HART
+ */
+void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch);
+
+/**
+ * Create temporary mapping to access address range on current HART
+ *
+ * @param base base address of the temporary mapping
+ * @param size size of the temporary mapping
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_protection_map_range(unsigned long base, unsigned long size);
+
+/**
+ * Destroy temporary mapping to access address range on current HART
+ *
+ * @param base base address of the temporary mapping
+ * @param size size of the temporary mapping
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
index 00000000..306f5afb
--- /dev/null
+++ b/lib/sbi/sbi_hart_protection.c
@@ -0,0 +1,96 @@
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
+void sbi_hart_protection_unregister(struct sbi_hart_protection *hprot)
+{
+	if (!hprot)
+		return;
+
+	sbi_list_del(&hprot->head);
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
