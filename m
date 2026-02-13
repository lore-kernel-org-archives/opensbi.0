Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441A3EF99CD
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtFcIZzvOwk+xVvc52k3FivgnIBbRCgo6MpBU5wEjMw=; b=UlU4TbTXtrUJRr
	u7EdHVeHcz/7G4deBGCwKbSw9KNsez4zlR009j5BJ1Kc1AmchTmDT8qU0RNKlcsCyIaGkDPlpT4ah
	lhfxGcAUTWkwFTo5weKQMZw0r4nPzepu2H+vdsl3W4xLqohYxFawoMG061vy4ZTt9i+rNEe6FXC1O
	u7X+NqFxffWiraFH2CJHytLXqHriwAxkJO2TPO5tdyGlbEhSf/LgadS30mNNE2hup+aVbTUvmDUHn
	QJeFOGmBdAJcPVP5hC2SEGcCzcFUy91RwBOJ8omMNL0RDYxXxi8LZpZl7sY7bDh946tIPVFDsNBqu
	g0ZMzu+CFHmqRzYlY8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyTa-00000003pE6-43F9;
	Fri, 13 Feb 2026 19:05:14 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyTY-00000003pDA-3mCG
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 19:05:14 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-896fa834290so15108016d6.1
        for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 11:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771009511; x=1771614311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3UYZ95kq1Y3MqfoWuC80k+tQQfPbg/fuHAikl2vGkQ=;
        b=HUowjUfNajkDXqW8bCxd2e/LLo4Qn4akha3G35DCMt86Ze33EW7lknQK4lg7rcTwQm
         HUeksm5mT+m2Ce4aXAysVVg2mcpre4j4mBaCcK1NGhIJQ9TCLHfdhOdSCmpKW31ATT4T
         g+IpBPKmbKTM4wM+R35rEW8r7GACov2O8U5isurllpduInE1kgkNpYvcDEgbDcbzcIym
         4nSI41jVt5ngemaX92o6yb01DJHAUR8VPncNAjcO91R0FfQkooJ8nKHM4z/7OfaYJ9ww
         qUjtVBCS5aUULx8WZke+qsvNCG4aSRo3T/LDohNxQdf6nXF8ywYG+UmJ0Dg30LP+qLr4
         voxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771009511; x=1771614311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3UYZ95kq1Y3MqfoWuC80k+tQQfPbg/fuHAikl2vGkQ=;
        b=gkEvgKyH6PvYbqHCjYyeSn9nkrMnU4xHss1aYLO4dAquLxSNZzfkKh5bY/cAn7U62e
         7AUrXsbFDkb1aP5BjjWcwqBlOPVqrnkDlp8UwZfKIC1agDXdqMTeTEfuXqIeb1DgVRd/
         YFr8rR9ycSaQGoXqJJ8o6tcJDXLmbdDySWVB7TwrygAi5h1qNB/blazECmi2GZvhWKyb
         3wkTGHxDjEi6i9aT1kWXGmIJ2wc3SS1WgRSLqr7/k/eG5bOpCNt4sLtAmVewvDgKUJBG
         FqpQu7qROs9x78Ziii20pO/HR9czlFZuotdzc9PBloFm7xHCVwr/L8+71u02Cze+o6f/
         svWw==
X-Gm-Message-State: AOJu0YyWEbLWn+0Uqt80WDSgvG96rjqGXWUQuY+1ncdUXEeq0OESncJN
	Z85WyzeIhbWTgGgeXgUyAGC2/+TWRh1a0fsManZRRieQx4vQndmd4kRBguotVA==
X-Gm-Gg: AZuq6aKvsQTuCIUFRbieXS3rLNlc7D+yqbe2nfEBENUTW4yMNMrycHQrAknaVGmHray
	XIJcyWe/sErieluq8Rp5VYjxRx+SYTPS9nH/Ldvgvvy7ig/Qmi32SsKTpyEUTTGOmcLOQvDxgyI
	chxZp8msMrwtk+7ECqNDACo/4uQQNjIcrHwVFgji8rlYgZxpOZ9SXEkCfqelgza2/RzHdNt+Ywa
	OR3AuiTQVkPlyRWen4w+iAid0W28TqJq8p2ERdSNhg1aZj5a6Epz2InWyHWXBNN/Qf8C5AyOswd
	UIrMYxw8OyzUPtYzHuu+Zwa+GvdMSMstTgQM01k/oOoV3tiGKAbfz4q8yGH8c46xO1GtzXlR/hC
	kpM6NjchE1tzkCIpQ4Elm02r4A68unH0pJXlvGbvFzwh/invWd46oqL27GVoJd3+pbYcEZyJlcg
	QpbCuS95xIE6mXE7WE9LwnnQtZOrwhbRFPI9y2LmvAgZr8SjntQ51GUbJ/PPGjzDgIM53coCPWT
	WaY7O8Dp8A=
X-Received: by 2002:a05:6214:21eb:b0:896:f42f:bf15 with SMTP id 6a1803df08f44-8973f293d30mr18944086d6.10.1771009511360;
        Fri, 13 Feb 2026 11:05:11 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8b1bfsm70420096d6.28.2026.02.13.11.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:05:11 -0800 (PST)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH RFC 3/3] lib: sbi: Add VIRQ ecall extension
Date: Fri, 13 Feb 2026 14:04:59 -0500
Message-Id: <20260213190459.2540597-4-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260213190459.2540597-1-raymondmaoca@gmail.com>
References: <20260213190459.2540597-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_110512_955371_332FA42F 
X-CRM114-Status: GOOD (  15.04  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Add vendor SBI extension ecall for VIRQ.
This allows S-mode payload to pop/complete the next pending VIRQ has
couried into the current domain.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_ecall_interface.h | 18 ++++++++++
 lib/sbi/Kconfig                   |  5 +++
 lib/sbi/objects.mk                |  3 ++
 lib/sbi/sbi_ecall_virq.c          | 57 +++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 lib/sbi/sbi_ecall_virq.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 76624e3f..9cb9a7eb 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -126,6 +126,24 @@
 #define SBI_EXT_FWFT_SET		0x0
 #define SBI_EXT_FWFT_GET		0x1
 
+#ifdef CONFIG_SBI_ECALL_VIRQ
+
+/* Vendor extension base range is defined by the SBI spec. Choose a private ID. */
+#define SBI_EXT_VIRQ			0x0900524d
+
+/* Function IDs for SBI_EXT_VIRQ */
+#define SBI_EXT_VIRQ_POP		0
+#define SBI_EXT_VIRQ_COMPLETE		1
+
+/*
+ * SBI_EXT_VIRQ_POP
+ * Returns:
+ *   a0: SBI error code (0 for success)
+ *   a1: next pending hwirq (0 if none pending)
+ */
+
+#endif
+
 enum sbi_fwft_feature_t {
 	SBI_FWFT_MISALIGNED_EXC_DELEG		= 0x0,
 	SBI_FWFT_LANDING_PAD			= 0x1,
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index c6cc04bc..8479f861 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -69,4 +69,9 @@ config SBI_ECALL_SSE
 config SBI_ECALL_MPXY
 	bool "MPXY extension"
 	default y
+
+config SBI_ECALL_VIRQ
+	bool "VIRQ extension"
+	default y
+
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07d13229..18e590ab 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -64,6 +64,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_MPXY) += ecall_mpxy
 libsbi-objs-$(CONFIG_SBI_ECALL_MPXY) += sbi_ecall_mpxy.o
 
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VIRQ) += ecall_virq
+libsbi-objs-$(CONFIG_SBI_ECALL_VIRQ) += sbi_ecall_virq.o
+
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
diff --git a/lib/sbi/sbi_ecall_virq.c b/lib/sbi/sbi_ecall_virq.c
new file mode 100644
index 00000000..b192598e
--- /dev/null
+++ b/lib/sbi/sbi_ecall_virq.c
@@ -0,0 +1,57 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 RISCstar Solutions.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_virq.h>
+
+static int sbi_ecall_virq_handler(unsigned long extid,
+				  unsigned long funcid,
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out)
+{
+	(void)extid;
+
+	sbi_printf("[ECALL VIRQ] VIRQ ecall handler, funcid: %ld\n", funcid);
+
+	switch (funcid) {
+	case SBI_EXT_VIRQ_POP:
+		out->value = (unsigned long)sbi_virq_pop_thishart();
+		return SBI_OK;
+	case SBI_EXT_VIRQ_COMPLETE:
+		u32 hwirq = (u32)regs->a0;
+
+		sbi_virq_complete_thishart(hwirq);
+		regs->a0 = 0;
+		return SBI_OK;
+	default:
+		return SBI_ENOTSUPP;
+	}
+}
+
+struct sbi_ecall_extension ecall_virq;
+
+static int sbi_ecall_virq_register_extensions(void)
+{
+	int ret;
+
+	ret = sbi_ecall_register_extension(&ecall_virq);
+	sbi_printf("[ECALL VIRQ] register VIRQ ecall extensions, ret=%d\n", ret);
+	return ret;
+}
+
+struct sbi_ecall_extension ecall_virq = {
+	.name        = "virq",
+	.extid_start = SBI_EXT_VIRQ,
+	.extid_end   = SBI_EXT_VIRQ,
+	.register_extensions    = sbi_ecall_virq_register_extensions,
+	.handle      = sbi_ecall_virq_handler,
+};
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
