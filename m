Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07938CA1015
	for <opensbi@archiver.kernel.org>; Thu,  4 Sep 2025 05:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upDXLdsSZ8PAn0F8W6q7ViEBHK83EUybR5IFRLVv7hY=; b=riPC1mP+oSh/wT
	+hHukfOWKkDhrZbXDiGyZ7Br77SdOSCYZFpjcx3CK33XypmqgxqSM+85lLFq8JetczRusvLMT6MSJ
	MBN5LRYLQZ6ZGA1fw/e4+MjKGfT66TpWzjUVbRMjcfIENy04ObEbub9l0kpjrBbudCyhmPqOYuLZT
	GwJQ/4uDFTUQhjTAyZyY7N/uXXs8WhfMSMDl1xk/vW4Vxir1Rv9hH53uVz2oiNqJFlQ3fMB9APLfH
	sNRS6rVibevVd51LznGKUl6/0TCOvlBrEIovC/Dgypb/eckTb99FAbJ+Fi7gipMboSo4lmuzhxSxg
	0gCAW6vvzcDK4htFB39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2SV-00000009Dw5-35IE;
	Thu, 04 Sep 2025 05:24:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2ST-00000009DvM-2EzL
	for opensbi@lists.infradead.org;
	Thu, 04 Sep 2025 05:24:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-24c89867a17so7040135ad.1
        for <opensbi@lists.infradead.org>; Wed, 03 Sep 2025 22:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756963469; x=1757568269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kh0+F6lzyGdk9HtPP6jKJlq1y/YU++Q77Y89c0pNKM=;
        b=IqEu/geiYfvHmN/kjVQwk80RA6GyMxUU3CFxun1PRwpCVH56TbJgL0EcsHMPi9qo5E
         fQHdtRw5g4VCN+f4Ne+Fq/b1bPbLVEGIvyhHbbyjgGq4x+BoDr6AStZlEA+hORUKyEjr
         gEloM2WwCDjim/h8LwZ9JLBY9QLU6xRHqOhI5j6fUbIVCh4TsUaz98r5VwyBRstS7ly+
         RcimPOmiFoBDmLqzKmGyLNeUPmhXm26DTiHTNJi8F0wFhtGXgdBgzNAms1VYw1Ee1ctO
         ZAKP68NZNxy3S/KQDNJH4YQVVELEnrp0sWsa7gpqw/I4h3NTS9cI2TUK8SiEIrC1jNLM
         yCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756963469; x=1757568269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kh0+F6lzyGdk9HtPP6jKJlq1y/YU++Q77Y89c0pNKM=;
        b=YOGIIoTNJsNXUYs9ank1Lw6pQrJWssfINv44RE4zzlkF0U0p/FLwENzdS48I+ZgRB8
         AuUehDTMpihuu3DLGQE9U8povOyu9RUiBNUFuqjZAJ72FB+tKyHaavUpvDiIMCv5vMKF
         9jxFDP+Aea8VQXmqzFgccWxPogtUa4p41Ob4tzW3fGZt9nj1LMX+t4E36ahi3P2zQfKP
         86ztB4WzjCuPUxu13bvFEoptpmpHvUmlv1XW62PrlN+eOby+R/hOQo5DD9Nm/kmrodya
         oNFRkAZEGAs1OYdBRZutVbeXgzifiMhPXU8FWFORYyCquKBk+CZyZYKsZ3wWklgnA0Cs
         kStQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRzauvOWes3rNsEkeaNrAPrnCXd8h/JZP5uPr6AUaCHLa07OAvTaXZAHycD0jzMZBsd7fJIgzx@lists.infradead.org
X-Gm-Message-State: AOJu0YzrthHZ7TuJuOds6mF57+TbN1cClA4gC157A4L6dTnPygDHj4D5
	h5i7hka6tzQWS5CXfMfEn4U+Ibs+YtW+FaOdOxN3abjfVPMyKflQS5j8WS7QnYDR0rg=
X-Gm-Gg: ASbGnctzKcfIfQqSWtwxHHUoUaDurhf04Z2SKq4vXiIBiU+ARwxPg9bZbYQoa3fyhRJ
	DqYfnwLA7SC4AfQgJkXBysuHsOXTBGJI0c409P42wiMT8OeNQL8//Rz1NKRw5H/ijZnl1Z+aK8A
	xh3jaWu03IAyhwFEhCa9jgx7gysT1WvUro9eXwtR8lipn2ncNonGKvnc1k2+DyZA8cDzXTeXQP3
	MqDZ44Fxq0eauIvksEwMf/XIwHrLKuk8Gpaj9OYKPwzOSDAPCvfT1N68tR6IeLLgjXQyTG/tbnx
	6zqascV7T6gPxDRyDMWFHREgYm48XdLT/X4UXhzX0+3aCojKze4+EhDuZsEm7CBOFUVzKeWak08
	JDhCU9T6OTiLD+AjS6AsUHgXau3p1pXd4k8SpBO/vTNGTAYP6V9Op5+EVRlxEKw==
X-Google-Smtp-Source: AGHT+IEAj1hmIk41pNkT698UJx6ry7qkIxq9Jhgv7+ee0XUbIVG1ZxPN7g9yU3sUvb7DU6/3Vie0Kw==
X-Received: by 2002:a17:902:d54a:b0:248:cd42:889e with SMTP id d9443c01a7336-24944af16c7mr247987685ad.48.1756963468607;
        Wed, 03 Sep 2025 22:24:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772447058dbsm14251524b3a.38.2025.09.03.22.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:24:28 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 3/3] lib: utils/ipi: Convert IPI drivers as early drivers
Date: Thu,  4 Sep 2025 10:54:10 +0530
Message-ID: <20250904052410.546818-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904052410.546818-1-apatel@ventanamicro.com>
References: <20250904052410.546818-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_222429_576758_F773DF91 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org, Nick Hu <nick.hu@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

The fdt_ipi_init() is already called from generic_early_init() so
let's convert IPI drivers as early drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Nick Hu <nick.hu@sifive.com>
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
