Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE9F46C77
	for <opensbi@archiver.kernel.org>; Mon,  6 Apr 2026 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NX+P1mBlq8Btk0EIclv5clYfyyKviJD/Fbmvk7zjl0k=; b=0FVfJF7EbcL3Vw
	65rtgU7JbiJkaE9aIFXq37ZeqPAgabQDgvb1rRwpK+KOzgtwoFgN6O/eYkzT5oAdvSqg2OrYgLgRU
	7ZVLZdFKW+GoTD97AQDmXcv64qS4QjryC1drAfER8bkqt+i7zSCo2mzua5NV1BRdfD0v6T+r6Lech
	jGtrcJEdPjXE1zWqm7NNIaFudrd64nagEnnKGBZQokG44BWwBbjk3kqsAMFpYcc84Tr4uvaxZgi8a
	VceGu1VJdUH65avf1PR/FdvDR5cGo1RJDB9p99vBLYKXg3mpGa1Fz1FUBmhh6CaAFPUDrgXfLtYy8
	oqjxUENDAYDdOXbJqTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pfj-00000005SNV-0cdr;
	Mon, 06 Apr 2026 19:31:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pfg-00000005SMD-3QJ5
	for opensbi@lists.infradead.org;
	Mon, 06 Apr 2026 19:31:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4889e045bc6so26026195e9.2
        for <opensbi@lists.infradead.org>; Mon, 06 Apr 2026 12:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775503899; x=1776108699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDWQVTl/A/MGCxIafNVpD20h6pkMCmYX36d2hklzLgQ=;
        b=AlXej9AivXqe4ozAkFxVtGTki/XVGCC8dhLv0+EeCbqMq9JwICb2PhWCqJS77mb7mb
         YYXCetDYf98KeGiHZTVN1Ce5wP7DvSlDTPZoSmuxyK+x1YhGie+LO6pMbItenb5WCTPJ
         9Blv8yxHrZHshlweLBiyyBk11zG6L+TtoRbbd5TRCLjyT16KqTmlrJv3PQFDZ8gw1LYt
         eF4lq2ee/mGv5SfcoHPor60dxDJ5isalGS0hBcLZW4zeJgKonnd4feuBHgvMYCelZaRY
         v7R8rBxwZb4oEeUq8O6zowZXiUuYZDWGXs3CYwPMZ4BDjPeuvGphc5SliYMV40ejXR1D
         K8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503899; x=1776108699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDWQVTl/A/MGCxIafNVpD20h6pkMCmYX36d2hklzLgQ=;
        b=a76UmqGOagEXymR0sQ5Y0NSOwZmpOcpEr5IYclQ9y6IfYCBPJ+1fcHkC8FtzaRV5T2
         PzfwxNgi1t5GfdOYHDzXwQFrFawPDk18tmwBjemu4ZKGkwvPp/sFXgWWuwhepNvSKOAv
         FDeej6hAXGX52eiu2FMgOP6WkpdQ+CcbfenluRsIWeHn7kQ3wT+1ZULRq53Vcc+2UeNd
         XQYY+pE0yFU3LAiYcXWXflSZbJ8HGza7kDZkqsTECODbScXrCqmkLk5Jdzk3uK6aYfqU
         8sJf0XaU4B2i1c867xJXnZKk6MuzjBA1zDKml6Xc1lfmxMJ3hQcgoaXo1pRYz2tggMXC
         n+fg==
X-Forwarded-Encrypted: i=1; AJvYcCVVrxwepB9niqrxWQNAtw+PdZkukqNt6YkyN4hedgleE2trOP9Jq6TPO1KHLEPWw9nMVH8//xCO@lists.infradead.org
X-Gm-Message-State: AOJu0YwOgfq43yVhMNhUfdyHuiQe8MfBbK6YmAmT6SVRVHNz331+X1p8
	bJBH8LfBPq0xpKZ0P0UzmR9/WKuNz/7NR5Zlv+k01a5l31ql66nYw3XLVVZgB0sEJZ4=
X-Gm-Gg: AeBDiesRgMgKIwYUwuYlxnSVRvXAtK3EUmEk/QHSXhngJAfkXwqLxZXIF4B1it2mZBS
	9NZwm6Y0gnCcQ91cvWiSvOrzef3JXFjbU5x2fzR8MOFlPSNoLys1vhl25LmJbEvbtaJb3UgHQEr
	yboBrX93rGYGbml+5HBssDcKiFn/BAUXZSFp9cSpSk1nCugahrCQOnd/lKCA5y67Hx7GSfA2h89
	lCaPYrTfh40QKKOwILEy0iLGG4VGZ/wzro3FSutuBUbRm1eM4M142DOjuHK6h17OYy6kOz0df+a
	Zk0FmligaZFlki3g1Y7F/drlzUWKO39YAeR76hlAQPNAaZO7D2uhIv1xPUNPnpuLV5tLBtHfB5l
	Ay81WcAHSAqllasTlKcTjRo4W2pbn8QbAhuhApSlJYkuETeJbyTI0V4jEDlcIFLTLwehunJJ8M+
	HVbR6wdnu0HbMRVX1X+42f7DkP3NCY1NRE1SQy4N8OtI4ExpnDsMVOEry2WY72PKAWo4VXgbBmX
	xn8hg==
X-Received: by 2002:a05:600c:4593:b0:485:3423:727d with SMTP id 5b1f17b1804b1-488997dec19mr214149005e9.26.1775503898852;
        Mon, 06 Apr 2026 12:31:38 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm511130155e9.7.2026.04.06.12.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:31:38 -0700 (PDT)
From: dave.patel@riscstar.com
To: radim.krcmar@oss.qualcomm.com,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v4 1/3] lib: sbi: Add RISC-V vector context save/restore support
Date: Mon,  6 Apr 2026 20:31:31 +0100
Message-ID: <20260406193133.658066-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406193133.658066-1-dave.patel@riscstar.com>
References: <20260406193133.658066-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_123140_910896_6EF4A706 
X-CRM114-Status: GOOD (  15.90  )
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

From: Dave Patel <dave.patel@riscstar.com>

Eager context switch: Add support for saving and restoring RISC-V vector
extension state in OpenSBI. This introduces a per-hart vector context
structure and helper routines to perform full context save and restore.

The vector context includes vcsr CSRs along with storage for all 32 vector
registers. The register state is saved and restored using byte-wise vector
load/store instructions (vs8r/vl8r).

The implementation follows an eager context switching model where the entire
vector state is saved and restored on every context switch. This provides a
simple and deterministic mechanism without requiring lazy trap-based
management.

Notes:
- The SBI_MAX_VLENB is configured using CONFIG_SBI_MAX_VLENB.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_vector.h |  29 ++++++++
 lib/sbi/Kconfig          |   4 +
 lib/sbi/objects.mk       |   1 +
 lib/sbi/sbi_vector.c     | 154 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 188 insertions(+)
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_vector.c

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
new file mode 100644
index 00000000..13048716
--- /dev/null
+++ b/include/sbi/sbi_vector.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2026 RISCstar Solutions.
+ *
+ * Authors:
+ *   Dave Patel <dave.patel@riscstar.com>
+ */
+
+#ifndef __SBI_VECTOR_H__
+#define __SBI_VECTOR_H__
+
+#include <sbi/sbi_types.h>
+
+#define SBI_MAX_VLENB CONFIG_SBI_MAX_VLENB
+
+struct sbi_vector_context {
+	unsigned long vcsr;
+	unsigned long vstart;
+
+	/* size depends on VLEN */
+	uint8_t vregs[32 * SBI_MAX_VLENB];
+};
+
+void sbi_vector_save(struct sbi_vector_context *dst);
+void sbi_vector_restore(const struct sbi_vector_context *src);
+int sbi_vector_domain_init(void);
+
+#endif //__SBI_VECTOR_H__
+
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index 8479f861..b2432150 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -74,4 +74,8 @@ config SBI_ECALL_VIRQ
 	bool "VIRQ extension"
 	default y

+config SBI_MAX_VLENB
+	int "Vector VLENB size"
+	default 256
+
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 68fc2036..ecb2b54e 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -109,3 +109,4 @@ libsbi-objs-y += sbi_trap_v_ldst.o
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
 libsbi-objs-y += sbi_cppc.o
+libsbi-objs-y += sbi_vector.o
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
new file mode 100644
index 00000000..85134f8b
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2026 RISCstar Solutions.
+ *
+ * Authors:
+ *	 Dave Patel <dave.patel@riscstar.com>
+ */
+
+#include <sbi/sbi_domain.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_vector.h>
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>
+
+#ifdef OPENSBI_CC_SUPPORT_VECTOR
+
+static inline unsigned long vector_vlenb(void)
+{
+	unsigned long vlenb = 0;
+
+	asm volatile (
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"csrr %0, vlenb\n\t"
+		".option pop\n\t"
+		: "=r"(vlenb)
+		:
+		: "memory");
+
+	return vlenb;
+}
+
+void sbi_vector_save(struct sbi_vector_context *dst)
+{
+	if (!dst)
+		return;
+
+#define READ_CSR(dst, csr)				\
+	({						\
+		asm volatile (				\
+			"	.option push\n\t"	\
+			"	.option arch, +v\n\t"	\
+			"	csrr %0, " #csr "\n\t"	\
+			"	.option pop\n\t"	\
+			:	"=r"(dst)		\
+			:				\
+			:	"memory");		\
+	})						\
+
+	/* Step 1: Save CSRs */
+	READ_CSR(dst->vcsr,   vcsr);
+	READ_CSR(dst->vstart, vstart);
+
+#undef READ_CSR
+
+	ulong vlenb = vector_vlenb();
+	uint8_t *base = dst->vregs;
+
+	/* Step 3: Save vector registers */
+#define SAVE_VREG(i)						\
+	({							\
+	asm volatile(						\
+		"	.option push\n\t"			\
+		"	.option arch, +v\n\t"			\
+		"	vs8r.v v" #i ", (%0)\n\t"		\
+		"	.option pop\n\t"			\
+		::	"r"(base + (i) * vlenb)	: "memory");	\
+	})							\
+
+	SAVE_VREG(0);
+	SAVE_VREG(8);
+	SAVE_VREG(16);
+	SAVE_VREG(24);
+
+#undef SAVE_VREG
+}
+
+void sbi_vector_restore(const struct sbi_vector_context *src)
+{
+	if (!src)
+		return;
+
+	const uint8_t *base = src->vregs;
+	ulong vlenb = vector_vlenb();
+
+	/* Step 2: Restore vector registers */
+#define RESTORE_VREG(i)					\
+	({							\
+	asm volatile(						\
+		"	.option push\n\t"			\
+		"	.option arch, +v\n\t"			\
+		"	vl8r.v v" #i ", (%0)\n\t"		\
+		"	.option pop\n\t"			\
+		::	"r"(base + (i) * vlenb) : "memory");	\
+	 })							\
+
+	RESTORE_VREG(0);
+	RESTORE_VREG(8);
+	RESTORE_VREG(16);
+	RESTORE_VREG(24);
+#undef RESTORE_VREG
+
+	/* Step 3: Restore CSR's last */
+#define WRITE_CSR(csr, val)			\
+	({					\
+	asm volatile(				\
+		"	.option push\n\t"	\
+		"	.option arch, +v\n\t"	\
+		"	csrw " #csr ", %0\n\t"	\
+		"	.option pop\n\t"	\
+		:				\
+		:	"r"(val)		\
+		:	"memory");		\
+	 })					\
+
+	/* Restore CSRs first */
+	WRITE_CSR(vcsr,   src->vcsr);
+	WRITE_CSR(vstart, src->vstart);
+#undef WRITE_CSR
+}
+
+int sbi_vector_domain_init(void)
+{
+	csr_set(CSR_MSTATUS, MSTATUS_VS);
+	ulong vlenb = vector_vlenb();
+
+	if (vlenb > SBI_MAX_VLENB) {
+		sbi_printf("[Vector ERR:] vlenb range error\n");
+		return SBI_ERR_BAD_RANGE;
+	}
+
+	csr_clear(CSR_MSTATUS, MSTATUS_VS);
+	return SBI_OK;
+}
+
+#else
+
+void sbi_vector_save(struct sbi_vector_context *dst)
+{
+}
+
+void sbi_vector_restore(const struct sbi_vector_context *src)
+{
+}
+
+int sbi_vector_domain_init(void)
+{
+	return SBI_OK;
+}
+
+#endif /* OPENSBI_CC_SUPPORT_VECTOR */
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
