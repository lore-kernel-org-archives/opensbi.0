Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E760FCC6B1D
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTJPbS8VZ4Rb11OKdJy2ByjxY6vbky7Mfup5WuelZrc=; b=1zNePe2W65F7Rc
	OeeLwV7seqzB5CPCLuXhgx9a2vsee58GEWFHyIrV2M2SNhmUrh1f/Fi2BE3d4/JrQMhDrKdnV6M67
	yV9UhkakMHvn8TvEPwSGoz5OqcUkK+8Df30QJlyIYsKLGs9zKUqwJ2rDAUf94UTWKphNvO8Ew2Sh4
	pCZOb5rUu8WrIjBrp15pII9UL4nUOqblxY4mAbaJ+PkppnfiKdFWu8sxhHQJwzeFNHeFEcKqsmOIs
	PgZCmrmFXdSGnAKCLLX5YPW1ai+4XQDyZUJhe8LmkAcgLE3JtinvhHFe7Mq8I0Qfh/z8eSraTHm92
	LgKuV3sXxUKAIlk0WeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCN-0000000FLNF-3a5d;
	Wed, 14 Oct 2026 11:31:07 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCL-0000000FLM4-2d4p
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 11:31:06 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1419d3416ceso1378976c88.0
        for <opensbi@lists.infradead.org>; Wed, 14 Oct 2026 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791977465; x=1792582265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIYJn4pGfm4cDjQoj6P9Xrvv/PVFG6t+Xt41mDUf+E4=;
        b=mSo0zcbioo5iAJfYtTkcEnjHtlCw2seqVuugFRU9YDAdmXgWZzFo2XQx/iCBLL7Bcd
         Ph3MD/7if6nR7SaITAHuD6hLvWbKaJHdxO2G9pKzq7iL4LppK4via0ABoDfdxUAF7bxX
         0/a3ufYPQN9xYsQocaG/RdT0arp0TWmm58xxT4RbegOl4hilxq7cz9VoY8nLR7X8nbNT
         7Js14pMNe8tTSPDEtZQVlJg5i/wNZzOEyp0+X+SclA/BMSwBmIxX6CpVxpQF+DD/3uBx
         /hjUSwsAP6oZMcCNEf+IvThY96dRq+ZhuZX9KBJkBFLOD7SeSCncjVq29kDbRe0Q/3e5
         W6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977465; x=1792582265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIYJn4pGfm4cDjQoj6P9Xrvv/PVFG6t+Xt41mDUf+E4=;
        b=QqKq73yQQqeJMENlEalciYo3qZmVETUvChL2m5CeJfvj2lTVVrZpacRjXmkxzDNfLQ
         gkyC5P3Ils63F0lj7hwItLcwZCJUcngwkr5ivDwXYNaoGhybRhjYCYnnif7XBg2eWx7R
         FaXzMlyhflgtDR2uvfSrylJTfbA8Gh6PlMTAaJe+hWaBaKt9ZX5e8YsGgiFScQv9Qbw2
         dbHON9QbAME1LQLOarwbsdJ0v+bQRVA1bDBxessEp7Y0n19bJDGjj3irolTKM2bUVzB1
         0PIhGVDcfbZ9jICc6Y6qbdXvVoeYo/zXe/6+zZiThViJF1LZBQVNbcqTUB9e6Ub2fayb
         5ZxA==
X-Gm-Message-State: AFq9FYKkaB8F6Q25FD8eF3y8Yc0WvZcavF05cJ96Rxnnm0+KW53Jk6rL
	Ef34wFKCm763SoOKQ+t/yplw9JVkV/5b1iIp7chEfEmUHD3edknVVig6yFSumX713a94KdhOmeW
	9rQNiiqp75t/ci6TujOvFhEvhMdSfIUb81h2nZj9s0+nWFOec2f/qtJ2nL/HNUCjWFKs1v9jf3W
	xf6qzMDQwWPzVxs1Mp/+AasnNEYVPQak1EIUYCvo3BaeO+5yoXohjkm4s=
X-Gm-Gg: AYBFou1ykq63CTQ2vJXZHw6c7juMZBynLyOG6myIHcSJt509miIHQlaCU0z0gwlWq+H
	/krGbsO6BS1DaZYZHtHmqTJig2+OcJ2HV22lfG7YPoX098rMS7F5x33BaSzJ5+4rtUAEmJ5W2yj
	DibVjh8FaYkh9r7dIvhMIdEVG4d2lfv+tm7oPUHfubnFt66oJQrQ1P2ZgeTHXxfMkyhSNd1mjmy
	MRI62fzdBaNFvAbeLilm1pllhKjAbDvhfkwh2v1m6Yo6EYFY14LsdHRx6gIqbruDjtwBXh/Sf77
	tCM2u6jBKjKydbbVumqz/7qjq+VW68fRiESxg+I2JIzzlaqZ4fGjALZLZfRnXZXGdIY8hiqFFtu
	UYlbK2pVJ4KO9tihPhU/9oE2ka0jjHbFIWU4B9Em7abuNhr7Y989Js3LonZse0eYKTfxz1fYQNF
	+bSKSCWlETbPcY7dPB8S6gNVzGagcevByVCeiYGDZt4D7vGwBHwHMB/A3W7KFw7cHUgnyrbr5q1
	axFrsAvbCNT3lZ9EF0Q
X-Received: by 2002:a05:7022:43a3:b0:14f:b5ac:ace4 with SMTP id a92af1059eb24-16a62ea9574mr28114847c88.44.1791977464581;
        Wed, 14 Oct 2026 04:31:04 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm71207996c88.18.2026.10.14.04.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:31:04 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 2/7] lib: utils: Include more headers directly
Date: Wed, 14 Oct 2026 04:30:19 -0700
Message-ID: <20261014113100.2192229-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014113100.2192229-1-samuel.holland@sifive.com>
References: <20261014113100.2192229-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_043105_671576_0E34DADC 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Most drivers include fdt_helper.h, which pulls in sbi_domain.h. This
pulls in several other headers like sbi_bitops.h. Include the required
headers directly from each driver so that they will still compile after
fdt_helper.h stops including sbi_domain.h.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - New patch for v3

 include/sbi_utils/serial/uart8250.h           | 1 +
 lib/utils/cache/fdt_cmo_helper.c              | 1 +
 lib/utils/cache/fdt_sifive_ec.c               | 1 +
 lib/utils/cache/fdt_sifive_pl2.c              | 1 +
 lib/utils/cppc/fdt_cppc_rpmi.c                | 1 +
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c          | 1 +
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c           | 1 +
 lib/utils/i2c/fdt_i2c_spacemit.c              | 1 +
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c    | 1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c           | 1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c             | 1 +
 lib/utils/regmap/fdt_regmap_syscon.c          | 1 +
 lib/utils/reset/fdt_reset_atcwdt200.c         | 1 +
 platform/generic/eswin/eic770x.c              | 9 +++++----
 platform/generic/sifive/sifive_dev_platform.c | 1 +
 15 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/sbi_utils/serial/uart8250.h b/include/sbi_utils/serial/uart8250.h
index 78c0e614..ed13418a 100644
--- a/include/sbi_utils/serial/uart8250.h
+++ b/include/sbi_utils/serial/uart8250.h
@@ -10,6 +10,7 @@
 #ifndef __SERIAL_UART8250_H__
 #define __SERIAL_UART8250_H__
 
+#include <sbi/sbi_bitops.h>
 #include <sbi/sbi_types.h>
 
 #define UART_CAP_UUE	BIT(0)	/* Check UUE capability for XScale PXA UARTs */
diff --git a/lib/utils/cache/fdt_cmo_helper.c b/lib/utils/cache/fdt_cmo_helper.c
index 3ab8abe6..bdc5fe19 100644
--- a/lib/utils/cache/fdt_cmo_helper.c
+++ b/lib/utils/cache/fdt_cmo_helper.c
@@ -6,6 +6,7 @@
 
 #include <libfdt.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi_utils/cache/fdt_cache.h>
 #include <sbi_utils/cache/fdt_cmo_helper.h>
diff --git a/lib/utils/cache/fdt_sifive_ec.c b/lib/utils/cache/fdt_sifive_ec.c
index dda0d10d..3ab863f0 100644
--- a/lib/utils/cache/fdt_sifive_ec.c
+++ b/lib/utils/cache/fdt_sifive_ec.c
@@ -6,6 +6,7 @@
 
 #include <libfdt.h>
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_platform.h>
 #include <sbi_utils/cache/fdt_cache.h>
diff --git a/lib/utils/cache/fdt_sifive_pl2.c b/lib/utils/cache/fdt_sifive_pl2.c
index 8069e96a..3f8a294b 100644
--- a/lib/utils/cache/fdt_sifive_pl2.c
+++ b/lib/utils/cache/fdt_sifive_pl2.c
@@ -6,6 +6,7 @@
 
 #include <libfdt.h>
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_bitops.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi_utils/cache/fdt_cache.h>
diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
index 15c89351..9945286d 100644
--- a/lib/utils/cppc/fdt_cppc_rpmi.c
+++ b/lib/utils/cppc/fdt_cppc_rpmi.c
@@ -10,6 +10,7 @@
 #include <libfdt.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_cppc.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_timer.h>
diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
index 2885a983..267f64fc 100644
--- a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -8,6 +8,7 @@
 #include <libfdt.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
diff --git a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
index 2690a638..911f55b1 100644
--- a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
+++ b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_ipi.h>
+#include <sbi/sbi_list.h>
 #include <sbi_utils/cache/fdt_cmo_helper.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
diff --git a/lib/utils/i2c/fdt_i2c_spacemit.c b/lib/utils/i2c/fdt_i2c_spacemit.c
index 9009b6b6..a8a0d832 100644
--- a/lib/utils/i2c/fdt_i2c_spacemit.c
+++ b/lib/utils/i2c/fdt_i2c_spacemit.c
@@ -8,6 +8,7 @@
  */
 
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_bitops.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_timer.h>
diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index cf975658..0c256bd4 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -11,6 +11,7 @@
 
 #include <libfdt.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_timer.h>
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
index 825ac9b3..e08c080e 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -9,6 +9,7 @@
  */
 
 #include <libfdt.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi_utils/fdt/fdt_helper.h>
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
index 7185f3f3..dd907bbb 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
@@ -8,6 +8,7 @@
  *   Sunil V L <sunilvl@oss.qualcomm.com>
  */
 
+#include <sbi/sbi_domain.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
 
diff --git a/lib/utils/regmap/fdt_regmap_syscon.c b/lib/utils/regmap/fdt_regmap_syscon.c
index 59cd5ee5..b5764312 100644
--- a/lib/utils/regmap/fdt_regmap_syscon.c
+++ b/lib/utils/regmap/fdt_regmap_syscon.c
@@ -11,6 +11,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_byteorder.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi_utils/fdt/fdt_helper.h>
diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
index 5dad8ac9..7cd31cad 100644
--- a/lib/utils/reset/fdt_reset_atcwdt200.c
+++ b/lib/utils/reset/fdt_reset_atcwdt200.c
@@ -9,6 +9,7 @@
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi/sbi_system.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index c71198a8..ca48b39e 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -8,13 +8,14 @@
 #include <platform_override.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_console.h>
-#include <sbi/sbi_system.h>
-#include <sbi/sbi_math.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_hart.h>
-#include <sbi/sbi_hsm.h>
-#include <sbi/sbi_ipi.h>
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/sbi_hart_protection.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi/sbi_math.h>
+#include <sbi/sbi_system.h>
 #include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
 #include <eswin/eic770x.h>
 #include <eswin/hfp.h>
diff --git a/platform/generic/sifive/sifive_dev_platform.c b/platform/generic/sifive/sifive_dev_platform.c
index 579d4651..a8d2889a 100644
--- a/platform/generic/sifive/sifive_dev_platform.c
+++ b/platform/generic/sifive/sifive_dev_platform.c
@@ -5,6 +5,7 @@
  */
 
 #include <platform_override.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_scratch.h>
 
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
