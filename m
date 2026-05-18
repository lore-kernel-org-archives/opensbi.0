Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42512CD4F50
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 05:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G494nBA9rFoYJGrb1laocpCXZjO5XdF5PWvA6XNkqDE=; b=R22vA5+YicfGEt
	MUWakpwuHe1hpZ5/q+/tDFtql1TZXQWp8qy1U7IZ2bhR/zOFk46ztGa4T3VQ0/eqe78TZY7ek2NNk
	nQq+NOXqU7PGp0oF7jz8ahIho6tNL5DcB10eb2YsCRM2LaxYmtQZHYfmz5UwnY91PiE5fDCvjqKXT
	F2Uohi+xY6fvKfermuWitxNYZ3bO3pIY6L0AAihfRiBxN++sF1pxcNYTgTBtdDTEbH5Kc+gKQ6OS8
	SUdcPLVf/zepJD/ezW2JkIUacDIU8IZL80+tSgjHKC4WkcTT8tzVBb8hr7yE2r1r4f2b/a/+qTeyE
	jASEyHyW8AyTJYx176+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqkO-0000000ELFw-2FRi;
	Mon, 18 May 2026 05:42:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqkN-0000000ELFe-0n13
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 05:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=74Qa1ggMTwL85SFk8bJpEhZ7gGkv6J9YFGqmWvqyjt8=; b=WbZd2GyveyFcKRLK2B/AeH1sup
	bp+t8U1BVz9Mo+EzUuSc9UL4ep6ubwQAAEyN8+T1lH2AOOM53LMq+MGEYMJWH0VCfVMnmdqpRHkuD
	T+EsjuV1HueCCgNCg1sLmxdvf5xWRJbbXx5jKPghbqWe6IVNl7Aj8Ig2NiHtjPinr9QjhhicOoDwK
	Y/BAdoAzBFHiJE7GW6fYzJc337clVueu6bguUh6nc0rCvCvw1ZLsGc0GXg9SmR4FmemnNuFBa/ZiA
	JwlXZlTGcWEZSNbofGDRuT8useiivyhH74Ql6ToKiZyXNQX6L17BaPaVxYIWKYCtKzgJGSOfT2Stn
	QWVBdnug==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqkJ-00000009wla-3Ea0
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 05:42:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so9365625e9.3
        for <opensbi@lists.infradead.org>; Sun, 17 May 2026 22:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779082950; x=1779687750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74Qa1ggMTwL85SFk8bJpEhZ7gGkv6J9YFGqmWvqyjt8=;
        b=d78sd8nG+go7tTmfG8kCuGecQDPt6mUoMQL5EhJQa8KGWx/DSMe2hcUpIFMeJhmC1w
         RFBq0qRKs7dMnE3JtkHhLqLJWP6U6H7ZHGKUp17A57gI16lQDXdkdnK5yDDq6LbqT5dq
         zeOMq6NSu5ZK2/CQBfPf76IdXvrZHdEbMTGt1ponAobA/wLDSlCPwoUw0fkyJR8wesBk
         561oESwE6JUQDK2rrGUtCyiyGobFwF34m+G5Myk8z9LcoQ0KemCiRDphs3XLm1a0QyYt
         cMiSc+uwjIQoOC7IQ+7MmnXEwg74uSL5NGRzgsLWzFliCcFuhAyaIr/HlRo7UCerSefx
         cWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082950; x=1779687750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=74Qa1ggMTwL85SFk8bJpEhZ7gGkv6J9YFGqmWvqyjt8=;
        b=JHlgLjbUrJLrdE/EO6ga7fdFrXgsFqELhb39Gh8cnIrHso6rhoGT+cqFmeZgKQ2dBN
         IhwPbXPRph7chCrDT3Xv6DqkXoN4QVBaDfSlauJLmoq/rsEdPC8wtRHIEdnzGHJ/IYo8
         7Z91GiLhBSaqr+C2E+TYvrO1sFK8Z+uUeKdajjLyG/V5Ch+lPys2xKs/3olkHoBGH5ym
         Ev5NMkuQlMEIvl++F03VdLftQs3W8IjXfwLl8gNxjEl215cS9eWvgmyPc4BDEACY27yX
         pA4SjFRNrkiuAHhsRsQIqaNEkm9/P8P+WuEXUCC7bA4mjAUajQIkHkpdq+bKV1tRJr1n
         X+cQ==
X-Forwarded-Encrypted: i=1; AFNElJ9TAQlxaisY9w7BLjwBDDPHH3Enya22sYWDq+YDlYodWiNt29HkpqV56LFMAk+sxfGdW+GzYKwD@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj0sWPy6cL+qtCs7rkpDLf0lIXpIZGvi9G/OJsQZkkeXwPL4Jp
	CjBBtNeUTvMGbEMnUMoeB8l6YkjsLcvHE0Ed0C1HeOu0nDjuuzeb8ftJS86BfR0jDms=
X-Gm-Gg: Acq92OHWLhgQHTWuTtJ3XzlS9FTyuM1RUJdG9NBuPXym80R7D7Ffiawf1HCRDogbvTF
	ddydoM0m5I3qfVxpFgZC0i5S/GgxmXVV6zb2OOv4zJoKd8LVJbUlAHqUWTNxEAicCRezNjbh89N
	O8FfglxYJxaB9G+CM4CC9S+ccCQQyamGzSf/Ev+Rp2AWMZJtHZgk0CyebviGUvOd6dgTSYDrTCv
	+g7AP4O16helTdDujSP5yVlx/sFsgytcEn9fu5M67xXrI3y6fHnir475GjRJyxmYyTfwALoHiwm
	TkBPdRRpsYH3apXrJ/zZGug3jW7da70UMEC9+fOKLOPvpsEYaML7cUX2J2OQv72abMEmZuBVlB+
	AhPore1o9vqKq7ROSzcCIFZ/MndfOPBnPDUjkG7IvpJhZmREF1irZVPqly9Uwcr3zm5EIRiQSFX
	JM6atOx4qSbGD/VJtE1OqJmo7jhV93mwPzeouEiQWh3nJSOvryatiI/bqJAjLE1rW+lg==
X-Received: by 2002:a05:600c:848c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48fe60e51c6mr197457975e9.7.1779082950398;
        Sun, 17 May 2026 22:42:30 -0700 (PDT)
Received: from Dev-EliteBook.lan (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6faeasm73948715e9.26.2026.05.17.22.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:42:29 -0700 (PDT)
From: dave.patel@riscstar.com
To: Anup Patel <anup.patel@oss.qualcomm.com>,
	Anup Patel <anuppate@qti.qualcomm.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v7 1/3] lib: sbi: Add RISC-V vector context save/restore support
Date: Mon, 18 May 2026 06:42:17 +0100
Message-ID: <20260518054219.58708-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518054219.58708-1-dave.patel@riscstar.com>
References: <20260518054219.58708-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_064232_179095_CCBC45EC 
X-CRM114-Status: GOOD (  14.86  )
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

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_vector.h |  28 ++++++++++
 lib/sbi/objects.mk       |   1 +
 lib/sbi/sbi_vector.c     | 118 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_vector.c

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
new file mode 100644
index 00000000..d92fc03d
--- /dev/null
+++ b/include/sbi/sbi_vector.h
@@ -0,0 +1,28 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
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
+struct sbi_vector_context {
+	unsigned long vcsr;
+	unsigned long vstart;
+
+	/* size depends on VLEN */
+	uint8_t vregs[];
+};
+
+void sbi_vector_save(struct sbi_vector_context *dst);
+void sbi_vector_restore(const struct sbi_vector_context *src);
+size_t sbi_vector_context_size(void);
+
+#endif //__SBI_VECTOR_H__
+
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 97cc4521..ddb2e7ac 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -109,3 +109,4 @@ libsbi-objs-y += sbi_trap_v_ldst.o
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
 libsbi-objs-y += sbi_cppc.o
+libsbi-objs-y += sbi_vector.o
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
new file mode 100644
index 00000000..e4a1f515
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,118 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
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
+size_t sbi_vector_context_size(void)
+{
+	return sizeof(struct sbi_vector_context) + (32 * csr_read(CSR_VLENB));
+}
+
+void sbi_vector_save(struct sbi_vector_context *dst)
+{
+	unsigned long mstatus_orig;
+
+	if (!dst)
+		return;
+
+	/* Step 1. Save original mstatus and Enable VS */
+	mstatus_orig = csr_read_set(CSR_MSTATUS, MSTATUS_VS);
+
+	/* Step 2: Save CSRs */
+	dst->vcsr = csr_read(vcsr);
+	dst->vstart = csr_read(vstart);
+
+	ulong vlenb = csr_read(CSR_VLENB);
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
+
+	/* Step 4. Restore original mstatus LAST */
+	csr_write(CSR_MSTATUS, mstatus_orig);
+}
+
+void sbi_vector_restore(const struct sbi_vector_context *src)
+{
+	unsigned long mstatus_orig;
+
+	if (!src)
+		return;
+
+	/* Step 1. Save original mstatus and Enable VS */
+	mstatus_orig = csr_read_set(CSR_MSTATUS, MSTATUS_VS);
+
+	const uint8_t *base = src->vregs;
+	ulong vlenb = csr_read(CSR_VLENB);
+
+	/* Step 2: Restore vector registers */
+#define RESTORE_VREG(i)						\
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
+	/* Restore CSRs first */
+	csr_write(vcsr,   src->vcsr);
+	csr_write(vstart, src->vstart);
+
+	/* Step 4. Restore original mstatus LAST */
+	csr_write(CSR_MSTATUS, mstatus_orig);
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
+size_t sbi_vector_context_size(void)
+{
+     return 0;
+}
+#endif /* OPENSBI_CC_SUPPORT_VECTOR */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
