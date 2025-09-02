Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBC5CA1005
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUwZhaTMQQfqw1oaFCn+gIluM/msfLW0IZ6PKUzkvcw=; b=r3hp3tt8MvWJcJ
	VrzJzsTQeXK9gUEn9UoA7/5C8tHx9sf/X26SHDND5CEoghDgbZcE4zRq+aRM0TWVCxQtsCesCyf0C
	kJEcK/dugFPwkmroLYJrEzM6g3cpY00x9N5Ermaj6YHDsoQF+FGGgnZUTuOQwRYMsJ0SmiDFXmObB
	L0dVIh0iJU8YripmDG9d5sWdv794jLZCP6lZD9+dh504QBX3n8lgx2C0V7yeZUz9JQYyRHJJNRoXd
	nqzoAQ5DUHNMrAcS07wzSrOs31x82S8i9c6D1n/sWn63M1Xu7jJNcxGtB5FQgr83omWnUaKbGwQud
	8S4f+Dx+pDmcMBACYYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTXQ-00000000rYo-2CO7;
	Tue, 02 Sep 2025 16:07:16 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPxD-0000000HAZ9-1Ij8
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 12:17:40 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32326e8005bso5290932a91.3
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 05:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756815458; x=1757420258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXMfZH6IX8KrRJrvtw+4neJhMFupcwuWsGuWPUc/+d8=;
        b=JESH1Bko9p7fPoKQ0zw0gf78tZ8Z417tQ5p0tKMqc5bUY4ZZv7SDQm7XNjI7xUQ/s1
         8jz6Kc1O7MtIDMrrGKk0/nQsKwd8GCAB58XFUfXnlgk6/kpYo1ZFBTLNhnElRrRCVfqu
         HLwitgYO4mQk2rIuIwxAezafy2iLcCCDdVpveMn4qvl6DBBkgrycA1nKpaCdcvnbnqOx
         OYREsiNwp0gZWvHdpRjN4VsDC7677cWY3tF61qCJfSN++qoc27CYgk5IYA0iqHC+VqL7
         rFqfzXSgaSURqMqMJflVfeWTKe0HjPy1glU/xGuMembTCfKxti+OKTBWsdE26tUJ779C
         F18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815458; x=1757420258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXMfZH6IX8KrRJrvtw+4neJhMFupcwuWsGuWPUc/+d8=;
        b=YQSBE4wOVVzmACsorihfaZC4tI4hO//cva3m5LLCZIAJcCsldgp7EXpLz7Fk3lmILR
         K2y4E+9X9don3YR0EBzicv0I8/YtgRdn3r4r4xk4OlyJd6SqiXDCu6R9gm7Gl0I8jFYa
         APmnO+U/POKCkk2nxqqrsPkTZ6bb4ldtanT+sAzv99YctcDdLJP0L1kKFPCQNk73hZi5
         tHfZ+WauPXqVBUGqjpq5gsiu2t7QIFXl5o5VxJZwY70PYWN0ZA4fzZCw1REycJ2WTXEb
         eduOO3/vbiBSFgmDdATTvz80JBy06TD9mZEkAcQWtSi0iDwdWSBNwkbN/9Ux7C1Y9WgA
         o72g==
X-Forwarded-Encrypted: i=1; AJvYcCVXgCXkm4kXZB+8HiCX/qp1FEMtYocIC4HRCn2/Slabr6XFHPKOChpUbgRWmv4V6IDRWiF9wf+R@lists.infradead.org
X-Gm-Message-State: AOJu0YzR5gz3jGIBw8eeVTMdaRWQjcvITJYiKyOEK4JHx3Aw4VwyiQJW
	zVBqRHFmpYd0mTbv1UGE3A1icPkjvVjClT563/eZTEM+mRg/J+x1eNtZrMOFAnziUt1C/6QoCcY
	HOOO//ZI=
X-Gm-Gg: ASbGncsfQh6Gz8Gku+ua3YXtVX/xqgY+AbSINOxn6twSLUct65F49Quh63PAP1TLydN
	10XYqFia1OCEX80uqF+NQNh2JZKKWtfZfFh0boJutnky4ftnGDrtQk/cgk8OBBIld+nCe5X68lT
	nOL40O4XGxpNxbC5gog7l9EZB4LMU9qq7NkyzoBcukOMX+QR/E4cvU+QCjS5wdRl8XdbC56dANg
	WfMZamiGCse7+p0iXSvUjk5/XSpPtLIB0jtnibbeL4d35Tj3AjAToDhGGDi0F6Gg6+DtNYBrI9N
	tgh/ozDoalSo4o6LZ1Kn1sYRsTcEapXzy9kg7C5mg535Mbs1iIexMHKnxDHVxdjK7VRl2Pes5gB
	D3Zzno50shK/8EKhGqPXAXCi7ldV2SCIm2aHreHnHJ3N1NEWgMGotQWSYjfk4DHOfxZLh3GyQ
X-Google-Smtp-Source: AGHT+IHBHXiJHMZUmkqArqVpfQ878blo+2Y+RS6zQzCqiSZKYXNjn7oC2//4Q9EpxOJzpvjOPBtwmA==
X-Received: by 2002:a17:90b:2252:b0:327:b42b:f711 with SMTP id 98e67ed59e1d1-328154379d5mr14597149a91.9.1756815458249;
        Tue, 02 Sep 2025 05:17:38 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e713dsm14265834a91.17.2025.09.02.05.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:17:37 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/3] lib: utils/ipi: Convert IPI drivers as early drivers
Date: Tue,  2 Sep 2025 17:47:21 +0530
Message-ID: <20250902121721.401933-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902121721.401933-1-apatel@ventanamicro.com>
References: <20250902121721.401933-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_051739_346629_CBF27266 
X-CRM114-Status: GOOD (  14.87  )
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

The fdt_ipi_init() is already called from generic_early_init() so
let's convert IPI drivers as early drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/ipi/fdt_ipi.h      | 26 --------------------------
 lib/utils/ipi/fdt_ipi.c              | 22 ----------------------
 lib/utils/ipi/fdt_ipi_drivers.carray |  3 ---
 lib/utils/ipi/fdt_ipi_mswi.c         |  2 +-
 lib/utils/ipi/fdt_ipi_plicsw.c       |  2 +-
 lib/utils/ipi/objects.mk             |  7 ++-----
 platform/generic/platform.c          |  5 -----
 7 files changed, 4 insertions(+), 63 deletions(-)
 delete mode 100644 include/sbi_utils/ipi/fdt_ipi.h
 delete mode 100644 lib/utils/ipi/fdt_ipi.c
 delete mode 100644 lib/utils/ipi/fdt_ipi_drivers.carray

diff --git a/include/sbi_utils/ipi/fdt_ipi.h b/include/sbi_utils/ipi/fdt_ipi.h
deleted file mode 100644
index 9b014470..00000000
--- a/include/sbi_utils/ipi/fdt_ipi.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2020 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#ifndef __FDT_IPI_H__
-#define __FDT_IPI_H__
-
-#include <sbi/sbi_types.h>
-#include <sbi_utils/fdt/fdt_driver.h>
-
-#ifdef CONFIG_FDT_IPI
-
-int fdt_ipi_init(void);
-
-#else
-
-static inline int fdt_ipi_init(void) { return 0; }
-
-#endif
-
-#endif
diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
deleted file mode 100644
index 644c9c1c..00000000
--- a/lib/utils/ipi/fdt_ipi.c
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2020 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#include <sbi_utils/ipi/fdt_ipi.h>
-
-/* List of FDT ipi drivers generated at compile time */
-extern const struct fdt_driver *const fdt_ipi_drivers[];
-
-int fdt_ipi_init(void)
-{
-	/*
-	 * On some single-hart system there is no need for IPIs,
-	 * so do not return a failure if no device is found.
-	 */
-	return fdt_driver_init_all(fdt_get_address(), fdt_ipi_drivers);
-}
diff --git a/lib/utils/ipi/fdt_ipi_drivers.carray b/lib/utils/ipi/fdt_ipi_drivers.carray
deleted file mode 100644
index 006b0fd9..00000000
--- a/lib/utils/ipi/fdt_ipi_drivers.carray
+++ /dev/null
@@ -1,3 +0,0 @@
-HEADER: sbi_utils/ipi/fdt_ipi.h
-TYPE: const struct fdt_driver
-NAME: fdt_ipi_drivers
diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
index aa37d0d0..20f6fbcc 100644
--- a/lib/utils/ipi/fdt_ipi_mswi.c
+++ b/lib/utils/ipi/fdt_ipi_mswi.c
@@ -9,8 +9,8 @@
 
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
 
 static int ipi_mswi_cold_init(const void *fdt, int nodeoff,
diff --git a/lib/utils/ipi/fdt_ipi_plicsw.c b/lib/utils/ipi/fdt_ipi_plicsw.c
index be669980..e15a6b76 100644
--- a/lib/utils/ipi/fdt_ipi_plicsw.c
+++ b/lib/utils/ipi/fdt_ipi_plicsw.c
@@ -11,8 +11,8 @@
  */
 
 #include <sbi/riscv_io.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/ipi/andes_plicsw.h>
 
 extern struct plicsw_data plicsw;
diff --git a/lib/utils/ipi/objects.mk b/lib/utils/ipi/objects.mk
index d1c94af2..9ba8affb 100644
--- a/lib/utils/ipi/objects.mk
+++ b/lib/utils/ipi/objects.mk
@@ -10,11 +10,8 @@
 libsbiutils-objs-$(CONFIG_IPI_MSWI) += ipi/aclint_mswi.o
 libsbiutils-objs-$(CONFIG_IPI_PLICSW) += ipi/andes_plicsw.o
 
-libsbiutils-objs-$(CONFIG_FDT_IPI) += ipi/fdt_ipi.o
-libsbiutils-objs-$(CONFIG_FDT_IPI) += ipi/fdt_ipi_drivers.carray.o
-
-carray-fdt_ipi_drivers-$(CONFIG_FDT_IPI_MSWI) += fdt_ipi_mswi
+carray-fdt_early_drivers-$(CONFIG_FDT_IPI_MSWI) += fdt_ipi_mswi
 libsbiutils-objs-$(CONFIG_FDT_IPI_MSWI) += ipi/fdt_ipi_mswi.o
 
-carray-fdt_ipi_drivers-$(CONFIG_FDT_IPI_PLICSW) += fdt_ipi_plicsw
+carray-fdt_early_drivers-$(CONFIG_FDT_IPI_PLICSW) += fdt_ipi_plicsw
 libsbiutils-objs-$(CONFIG_FDT_IPI_PLICSW) += ipi/fdt_ipi_plicsw.o
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 8ba6bc11..91140958 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -22,7 +22,6 @@
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_pmu.h>
-#include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
 #include <sbi_utils/mpxy/fdt_mpxy.h>
@@ -229,10 +228,6 @@ int generic_early_init(bool cold_boot)
 			return rc;
 
 		fdt_driver_init_all(fdt, fdt_early_drivers);
-
-		rc = fdt_ipi_init();
-		if (rc)
-			return rc;
 	}
 
 	return 0;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
