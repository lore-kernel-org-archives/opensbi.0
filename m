Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15138CD4F41
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82q2IFOFwnFn7+zIFglF2JMdm/U1MZUql3vjSHv9VhU=; b=RyZuzW1tkZ0L2l
	Erg1zjxTOwvRXg/b91x3KNinar11NriqQhPZdUQASeJTCSluh/hq2jhWQEiMaxUwY/I5DEuIp7tJD
	xmcaYZMA6LmzDAvssKxYfXfX0r0ArVmRdb68ENhKjTvt1y0xt12d8DD5MamREJDytUOQRICKWNljS
	NsKDF0shSqbnpYFkpmE72pqGy9cEnDJs5rEyymhnqTRTvQTN3dlfNTe/5JGVvd5HcKs1hfZtCqigM
	opgFjwpeKp6osd0RWGFMEVe5tIRuK3js52aKqVEVHGiIFzUsQK+woBtlPG11yEm1TFRa/7wd+MnE2
	OvkdoKHLcDxLOAEtgmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0a-00000006m0r-15TL;
	Thu, 14 May 2026 22:58:24 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0X-00000006lyM-3MY2
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:23 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8bb09239328so70622936d6.3
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799500; x=1779404300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qqd2gIPUySJie44BySMftc6VNYYeOIcoSAR7wufd3CM=;
        b=HC7Va3fN0QwemTrmUHtOLlHCvBoJwrZGivk4bWljB2yvXsHbxep6Bj7G5DyL+/+RfF
         GfY7YP8aVB6htcRlO/tPsdR77xa6hiaxndHxfckxOhyhk4nYB9bewMCmL+12LxBHGbIz
         C9Uztl9+Bs4nNQQ6NkU1LAogAltRnOEEEwOWk4/Mn7XV0b6KmhpOqE7wmHVJTSZGb2Vb
         Xy5eFGplvAI5PEqfQT27uzgT9J3/AL8CCECI8G0mQB8gWaHBDZOhA7ay+DhFHAd4zbZY
         nBoSlBWYnhNQA1kOTe/YQanu3Gcsc4JkTGfFWX9jpFZGGCyIvGbLERgcHgHfWPxR3F6S
         rziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799500; x=1779404300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qqd2gIPUySJie44BySMftc6VNYYeOIcoSAR7wufd3CM=;
        b=pDOxZAP0kzUhr9SujSUufUlKnOfTR03OG6I1c0cF5hdFaUWcmKPCPG+Z0NrufUnUrr
         uDIwOyq5awfVt2WUXSqEmtCvKMRznW/zyOmlQ9BQix6mm8391Ex5h/5FRYgGAu9SBIn8
         F0ovhSLlkX7b+RQehi9ToneTzFBdhNwlO8IuCGx4h24/QqCY3IGVmSnUUDL3Sx5jDA28
         0f+aDchKiH+1osOgrH3V5OP5ENNhRpLIM0qIYX41uy+S1eLNCbAB/agcNPn+4VdAzirN
         Y28zWyHa9GH7hTCWFIZ8XqVoetu2zpgV9jIabgqe9slFLEMoXrp3YCM4wCobfK3i2gsv
         JeYA==
X-Gm-Message-State: AOJu0Yy357W7C2IWkLzmYONBlwCLJ/8vIEOCJvuYsr9ksT5aXDX+xJOO
	V9j4wOO9sQoEOvAiSQ4DMzTVNw9j0nn2Z8D+9Sat80XpJoCAV2pHxoG+Jf87vg==
X-Gm-Gg: Acq92OH06cXmAkbT6SzqGQJRLpEP2UzPj6vAlN9REfJHh4DpeOLR4KswvXDnuh+uBUE
	WQC/Q2EtvppVf/sv9GK4OP35VBJ7VpaKZFMTzlkJs4EgARLJdPnTRmz0LWqo7pIcQ5ArqIFjkZq
	dYjz4u23ldVgAyyPFPDWpjpNo/kerbx9bdxPKVQXciRWYUoeRwi4pDknMloD41fhL2K6wHTQEqa
	7bD6rpm2+njPIG2YV1O2gSiFdL5zVfqGPa/4ZClz3otxnT9D5DJGyvFIwo8BJwlD0QLneqC3Kp9
	/VhemebUOGhtjk6hojnyQNCQqydqcsL/6zKvWEedkYKO7ouvCqORyz/1IrSxwBcLFBXtvd1BcX/
	ypMRQiWK2GU7+7ZtM2iU1wnVXHNqBadWV3ndhuGYFsLMBeb6gQAK/t5Tv1VD/7+3Eq5z/h7IGfk
	CB9dVoc2owXKsxYS54TFHtZcx6dsfosIGUvAL/mtM3bIOLScXcel+hVlGupOhWFTccNBDbcjnVV
	20k1HXl7WE=
X-Received: by 2002:a05:6214:319f:b0:8b1:f784:7ecc with SMTP id 6a1803df08f44-8ca0f6f49efmr27967996d6.46.1778799500289;
        Thu, 14 May 2026 15:58:20 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:20 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 04/10] lib: sbi: Add VIRQ ecall extension
Date: Thu, 14 May 2026 18:57:50 -0400
Message-Id: <20260514225756.2255758-5-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155821_861120_D5359823 
X-CRM114-Status: GOOD (  16.51  )
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
 include/sbi/sbi_ecall_interface.h | 26 ++++++++++++++
 lib/sbi/Kconfig                   | 10 ++++++
 lib/sbi/objects.mk                |  3 ++
 lib/sbi/sbi_ecall_virq.c          | 56 +++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 lib/sbi/sbi_ecall_virq.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 9a776f79..37937a0c 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -126,6 +126,32 @@
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
+ *   a1: next pending VIRQ (VIRQ_INVALID if none pending)
+ */
+
+/*
+ * SBI_EXT_VIRQ_COMPLETE
+ * Input:
+ *   a0: VIRQ to complete
+ * Returns:
+ *   a0: SBI error code (0 for success)
+ */
+
+#endif
+
 enum sbi_fwft_feature_t {
 	SBI_FWFT_MISALIGNED_EXC_DELEG		= 0x0,
 	SBI_FWFT_LANDING_PAD			= 0x1,
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index c6cc04bc..cbb74640 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -69,4 +69,14 @@ config SBI_ECALL_SSE
 config SBI_ECALL_MPXY
 	bool "MPXY extension"
 	default y
+
+config SBI_ECALL_VIRQ
+	bool "VIRQ extension"
+	default y
+	help
+	  Enable the OpenSBI VIRQ ecall extension.
+	  This extension allows an S-mode payload to pop a pending
+	  virtual interrupt and complete its deferred host interrupt
+	  handling after the payload has consumed the event.
+
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 184bf173..ea816e92 100644
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
index 00000000..a84a83d7
--- /dev/null
+++ b/lib/sbi/sbi_ecall_virq.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
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
+		u32 virq = (u32)regs->a0;
+
+		sbi_virq_complete_thishart(virq);
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
