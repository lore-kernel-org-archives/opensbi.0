Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C26CA100B
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 06:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HP9yzfWfJrGBkkBBjsreHIuCsB5cbBN07Cv6/onMcC4=; b=QtHfwwiL0cqEQX
	hnXSjVzaGbNaasK3s1dJBi1jOpuu1z+em2CkB+cZZUHjt8k3qFavRYg8Uopi+FJnCs49AzqtX7pOY
	ufAZG4TYi1lb0LvgGwe1gG8gJ509xo2J6N0vhCsysg0fjeYmtc4S0lRK7ht7Ur2ivb33zNbuS6HTK
	V2qhXu+vIx4b233bP3Mn1RDDUvWbrDk1/LKG7WjRn46n+TPHCN3qv/q0Zw2A6gDv1OH40wlJ7qdM9
	xLXtgJJYprfZslyVNk+gxTEbUKbuANJXuz0hDi3SNBRHoAhllZ3ukhdJHDb/qztIjuTagYPedjF9N
	PQVn3zJxJMwzQ3oldJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthP4-00000004q0T-1Ek8;
	Wed, 03 Sep 2025 06:55:34 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthMD-00000004oIl-3XlY
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 06:52:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24457f581aeso57579475ad.0
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 23:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756882357; x=1757487157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGpqO404kmej/7gzO8crbFW4ipZBzDRdWqVh+HGfsUM=;
        b=k9/I4vIlN7bAnRiBaOhAihRhru4FIGfBH5rhDiqmhjdyWVqQQy5PtPXTErm+PREtLE
         KIOaoX+wpkgpvi7WpLlhrAT+L6pxrdeSM+jjSqp0N2Dvjdj6rPrm9/loRLn6eQlQs43L
         g+EparX5pC2e9c98tg6cRcnh16WUgFWCo/imNJZKmTsjmFcVaJGz8ClfPxlhF8OBVTjR
         rXy+8NFqj9Wdh66pdUfj3nRseXPXImnuongOOHY3kOE64sojhqb0E30QnBT3EBv4sHxA
         m6oRPbOmUKPSc08O382Bdet+hzNbS1CxkSqsRGQ1VeBw48LgN5ycXM1fK0EfmtseJJ/z
         YEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882357; x=1757487157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGpqO404kmej/7gzO8crbFW4ipZBzDRdWqVh+HGfsUM=;
        b=WOVsL2qehBKdkkqQbaO7A6F7yZ9bymLwgsLgHJPyUnZAwZ81nNfSsJ/4fQhZgReO35
         pcUf2QLFLelrv8Si6X01W5gubLSlWQm74Yxstqt+R7Bc5TWtsPmfbj+lkjxU9k96E8dG
         F/GY0kiR79j6Tus6o4TE0OsNtDFG3SuQn9cg4NtvmZh0xYZT9Vk2uMTpIBqZmnrc3OB6
         5hh8jUgb55IHOf8YrrKGvoHg7aGBZtjPqIDbp+ffVrHD0H6ligk1o2V+lQ4pqprH2r1m
         SZ2w+BlpKHNbluO/sW/gxqXvvfncqd6cOuH07BTmXMpgZm7+30aCao1HmciGT8f/6yHB
         rdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3H0RZWef6CyGUTjCLGkOnHmdK/figIwagRnkXR2zOSREInCHHEA1hn/NaC9yMECY65z2it6gy@lists.infradead.org
X-Gm-Message-State: AOJu0YzSfU6tv5Wi+JMeh02ZGbhStFLCIb70eR8fWSqAjaoHcrd8zKIh
	rHLoin8aoqfeXOAP1m0dlxjVpAWEbveCM4DLmcfnrVJg8/dTSTnofon+AijqkSSpKv0=
X-Gm-Gg: ASbGncuruQN/Z4AhROiehVoFNCereEo1RhR2JGs+fr3l5InNka7DH77eC8/06Eg5goG
	Z2EvXgQB7adNHQ1X0FyaYZlammqIaGuDGBt4Q3v/NDyT6/VfS2unFtmSJvJd2AF9YxyjVTfLLJr
	pFAHqoEqagc7qZRasDnKzQpfAzYuatJHp0Tv5rJyuDG7+XOJE1X3wTPfJ3H/wezfJxuwORl3fOv
	nK7YmubVGXVXitzPY0+Sbs9PhmsN9iwj2TwVyudX2sdaUFbILHarf9VOjnJrpNC5Pov8ES9XZ3D
	/nblVHAPEesU3kS4apZz4u2xjohVSg3xGumrtM86g8TTdPJmQTauTT4FJ2/prUE2qMJAsTH4pwO
	fF6SJu+yAGVlSpnPyQVk6VwB3kr7lh1G9+8qciIF4w6rv/7qx5+u4Bl4H5JAq3jiuEVOCkDHJsa
	8VbjJ05lU=
X-Google-Smtp-Source: AGHT+IGGDKc9HBA9PM3XIjIIjFoB+l0lWUziRSPN9JpBhcmVghm7dvIAsr22WA5b5i6XR4FaQYVceg==
X-Received: by 2002:a17:902:ef4c:b0:246:8b9d:2519 with SMTP id d9443c01a7336-24944a73e9bmr175870365ad.23.1756882356952;
        Tue, 02 Sep 2025 23:52:36 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b905689d1sm25984655ad.64.2025.09.02.23.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 23:52:36 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 3/3] lib: utils/ipi: Convert IPI drivers as early drivers
Date: Wed,  3 Sep 2025 12:22:20 +0530
Message-ID: <20250903065220.456955-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903065220.456955-1-apatel@ventanamicro.com>
References: <20250903065220.456955-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_235237_886539_C5B4F13A 
X-CRM114-Status: GOOD (  15.08  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

The fdt_ipi_init() is already called from generic_early_init() so
let's convert IPI drivers as early drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
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
