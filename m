Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BECFCD343F
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 05:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdeHzVz3/hJJJ3m3BNH0FzLqV159ifrHlLbBrxKa8Uk=; b=bPtvKv3Quc+TTy
	CjZyWlsQZduQ1HpjZV5X7S/Hs/sRuC7oLxvO4KdBDUso4EPmyoXKopp7Y5yBK4m7ZUB1nY0xAqN8R
	unyC6hwV9IVruAKGMYcXCrLw7r7zBrIQoar1kA5ZNyB+QwAieboTf8iU1PumgNf8ywEq9AXAOlyoH
	haQ2zLGGk/Nk19onTRVjSkz57UqEgqQ0UYKVEm9oYRJFnp1wZ072HNcEVaFv3T1fRRgQAx6KIUCmq
	4yAMry5tRJA1RjyNNiM4Ys1P0GkYfK2zX3q4RtmpPy4Jlg4CD0GRm6O45nJidp8Jm6eQGBDYevf5T
	r5V37Wq9KOPNDzrPNGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlJR-00000007Qp5-3spg;
	Fri, 15 May 2026 05:42:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlJP-00000007Qn4-0Gq1
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 05:42:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso7369431f8f.0
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 22:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778823733; x=1779428533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFz1Ef7eawodJZ6XIkZHFs9nftDoVYM5uWfnBaI4o3s=;
        b=yfQmF/8IAgmmE5xE1PhXXpJuKn1p8YG7rvBTXuPkYfBbBrET/FjrI+EpNzB0AIycsK
         jsYv9YhoDB8UMfJtMxfDqLK8vwo+vnkaZn70bQt8ob9WoOjK7ibeDtLS+Wxw3sb3xxRo
         30978Tp8v0QnjZFDN0DM24iN3HtLCWW4P2yAgqcaLi7u33+EZ5ZYtCUOW/v31By/YH99
         +cQHOM/n2/1nOF16o98WnyxskTJVy1rv+fsSpRD5YbU92WizxxZlA9jg/KrR4HT/GeAP
         nG591WQoOEPmT1lMlJAVAIFCCGLt+X+rhyCdeoWceJdInV9yDP3PQQMoD5/73JUhOkWl
         HzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823733; x=1779428533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFz1Ef7eawodJZ6XIkZHFs9nftDoVYM5uWfnBaI4o3s=;
        b=q9kb5vEH5vf/dZxuoOYvOdiOEdxo6fkzyr4RNtG3KPUpUFIqeZ6G6sjLoMoJXhP7x2
         AdD9PuqtX4a/1P0YtYihv55TU0vjTxg+Dg7n7i89iknq7E5yKSSn5mKxxMy0Dm12Bpgu
         VyzQzhAsCwiUpAFAlHXUfGcd6wD0kxp0GZrh6ahxDuTu6hx9t8IGGCoCrd7/3d9ix0dA
         6aQLytR9hksFOa9IEty1K+Vwb9lvYt4onK/PLVQNi0boYe9lvLCFFM7rTRuN4bCoSAau
         PHGha3w23UR4Gu5X00GmFbMrjdn3iwz7lRnhWo5iEtS6QqEZV60aeoV15YoXiPXJSiGG
         GJHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IfqFkAUPOF6tAUyRtzrFkof+sibFMaz2aHbN1vNlMZkhk5tx3G4Tb4QYS/BiBpjkUgz95gFDc@lists.infradead.org
X-Gm-Message-State: AOJu0YzMma+Be1/TLrGa2qW7rb6VfOyx+9Isgej7BPtn8iBM6gHa6+dj
	C2YvP4Fml+1uTrI328XmDBRZ7QVtaipZDTvnywU+FzpOnBmGUno7Hgc1KW4C9wxr3HA=
X-Gm-Gg: Acq92OF5eWWmoFDL6cP0uGrxsiUueC7I4LR/sC7CnHE44iOhWNk8e/x/2DlZ9eDGOWu
	MQYRreJixux+4CqlmkxbBhRDWFjMi5wJ9Nf/ZksU3ckviSBlmbI/gZ9A3D6BGRIyCiooFPrJQz+
	LrpS9SZf50ntopT4mdL0Yu1/HLG497Vtrzv8dYEA9V90JCaM5bqqNmNpdQm4HdePX3Z+y5Nuxin
	o1fypVm2lEYk5p8xgE5Lgb4Xumq9JmD2xFo8HoZ5Dc8An1x8W1Gdk4uJY+a+Y1gSG3cdblYb7uR
	UZgOYjsxoJ60vX4SaXzEGUn0RQzQBNdcLpnvziM5ejvthjw9mu7osYJqTWbhEfYVmNYIxFzhouK
	aYEzadIIT5iGCHZ7Zx2F48ZA0Vu9Yd/Lrae57FAfcS2hcFKnQGrJtu28lpa6aX8oturT6mEcArQ
	tspMML46HFusjjVZ19LpLK0FYgur1e9FAxtOV9NchvPpAIqqWfZbBys2ZEHRd80vAz+7A=
X-Received: by 2002:a05:6000:612:b0:454:af3:33a0 with SMTP id ffacd0b85a97d-45e5c36bbf6mr3097952f8f.17.1778823733137;
        Thu, 14 May 2026 22:42:13 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm11456536f8f.37.2026.05.14.22.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:12 -0700 (PDT)
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
Subject: [PATCH v5 1/4] lib: sbi: Add RISC-V vector context save/restore support
Date: Fri, 15 May 2026 06:42:05 +0100
Message-ID: <20260515054208.151045-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515054208.151045-1-dave.patel@riscstar.com>
References: <20260515054208.151045-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_224215_130078_E102ACED 
X-CRM114-Status: GOOD (  14.63  )
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
 lib/sbi/sbi_vector.c     | 109 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_vector.c

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
new file mode 100644
index 00000000..bbd857c3
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
+unsigned long vector_vlenb(void);
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
index 00000000..1d2ac944
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,109 @@
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
+unsigned long vector_vlenb(void)
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
+	/* Step 1: Save CSRs */
+	dst->vcsr = csr_read(vcsr);
+	dst->vstart = csr_read(vstart);
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
+	/* Restore CSRs first */
+	csr_write(vcsr,   src->vcsr);
+	csr_write(vstart, src->vstart);
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
+#endif /* OPENSBI_CC_SUPPORT_VECTOR */
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
