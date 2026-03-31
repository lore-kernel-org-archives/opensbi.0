Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB2FF60CE
	for <opensbi@archiver.kernel.org>; Tue, 31 Mar 2026 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9n4S7LQev/KcAWCdIvJyvGkvuu9pNqsvw1EEToPpKw=; b=bSc+ObcGMJmA63
	+yseFSY9NC4iwoCRh9apU+2EFZq/aGWKygbPFTR7dF1IfwxaJZalDYwDfvLSYxkzdhgT6LUzTM/t5
	nlBJ8IjTfFUD60jiyBCJSI0wKs0qRlDZrey7uUr+DFq5W/SHQ1IR74Wl9MKEDhT6CTGlPwEL40zoP
	gYjglOjxs8liv621dRYn7lxuX0UVwlO3zxddJusC0DPBoSAJG4IeKy+N6BqVnXr5Z+usgKY692t7N
	DRxIu8IUZ/ut/EaHpmza6JHsgrZlUCCA8siktFNhoVHAKc/VdTJzsRKrqhJfhhL+5mV8sYqscFkB0
	walLMSE9xPXwKJ1mq8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7S82-0000000CKYV-3Mg0;
	Tue, 31 Mar 2026 05:59:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7S80-0000000CKWr-16zd
	for opensbi@lists.infradead.org;
	Tue, 31 Mar 2026 05:59:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so1154846f8f.3
        for <opensbi@lists.infradead.org>; Mon, 30 Mar 2026 22:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774936742; x=1775541542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oV/+SFqNHRDbS032oc8PArHc55nn3YqRcSFQEJAuZxs=;
        b=c1dSeiL/qwseK6alICPFzMiilgvGRKJLZsCNl8FZsas1zEyMwOaqbCuT8tjmY+bNFT
         vwrow12tLdDi6NRQD43nwwQK1ODDXABXnPaa9BJBHvsvI664O9j4kuAkBApPaGNJtnz5
         0wMffdYyQe52TuVSeq+xGowxctkkbioK2OAGy/gglu/2B+L68mBd1GaXtTvrrxc36xIj
         EgtoZcgadXIkJo3jMiN53LhiI+HTJrKqZuIPSCtdnMhjmq2jR2h+uHZqTnJW8eDEIyGB
         XeETENzM4VQ49zQgCn0c85/h4XckwhlXnSxsQuHgY6KYmuEqkAI/FK6o8jA16YbmrVoS
         y4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936742; x=1775541542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oV/+SFqNHRDbS032oc8PArHc55nn3YqRcSFQEJAuZxs=;
        b=WArSRcQ2iGKQ08GzTCleVNY8+gXqzpmvOwGyejNP9xPzPlCgIyOOp5ZXLjSBKC/x8m
         rWeT+umWoknSIBlglGFBus/miMXvy4leSE3z91sYCc+4NG5BK8vStfbylEE28Ul17T/m
         fZM3124ePE3/ezEIHqiTrPzI5SlMJ7cCibbfNhlu8jpPi251YLWfSXxGvBoc+R+2UNrc
         1S/vfYEXp6ZPb6afcjjV1WiwSLOgl6RIjVC8cn8NaDVtdgl+rjjcy8rAsUPB4GmaRmYd
         kZFV/lFbWBRI66UMLaXr8T1aNNo4MugPLNm2/pmV7hX3byUhqX46qAeE4RMfY4GGZqpE
         ehUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcUGZGlEQiNphMoeGghSB0hPYEhGE+tqqqog44zAYSEVF9qfAzQIFnIhZlvJb0hoOAA4o7tks3@lists.infradead.org
X-Gm-Message-State: AOJu0YxR7lDrsup1YGijgZ5L6o2MahfjeLGqTIhjW3oc8n9SPJwJuL/V
	ohMWj3O35g/R4b1XQInZuv8/28eRph/FQ7jwJM+Q7YuaaxpbpvZyFg+f/C3SWgaT9fI=
X-Gm-Gg: ATEYQzwZmpG0f7Ox/js/MAm/1i8zt0dWwYw72rVPmFOCWui7ORic9rF91YonfOLXDdR
	hY38psX4Eem/zeaTg8kKK0uJimXK3W4u0hwdE6hzk6VAAbUZ+g38qqzAcIi0q53TT9YR3/MYI6i
	7F5wuXe2mcMKN8X6q5kLCW9E5Wo5oqyGUgnsJ1QEDPI+AmKjIa0uN61xiFeDL3eHMiO9gTQevQb
	FIXQrjTAticzmUsFuuMcwKTIjFzvrzGw7jHgLyFxTFMc6AYorFE3jCaYm6dYduBsqKNNKuVcyJL
	U92crYVQp88HQCXaEP6Ka9+qVdh2GopSEV0kjUgbDQOII/U3efA2E4RSf5IyWqKWCPDHdNy8ps/
	nrhXzhGZ98Mbx/ozI/PBakXv0NFyge+3AoUfaOe9OngsyihVMLZ3/NdQTwrdD77joNK+83MIqAG
	ZsRXbWLISe5lWT/efvLBxMcbcyqRjohRU0YJkbmjBFzi/0F34KYFRXxMjRcP1ofWvScMc=
X-Received: by 2002:a05:6000:290e:b0:439:c661:3245 with SMTP id ffacd0b85a97d-43b9ea49d3bmr24248030f8f.34.1774936742289;
        Mon, 30 Mar 2026 22:59:02 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm35915544f8f.0.2026.03.30.22.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:59:01 -0700 (PDT)
From: dave.patel@riscstar.com
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v3 1/3] lib: sbi: Add RISC-V vector context save/restore support
Date: Tue, 31 Mar 2026 06:58:55 +0100
Message-ID: <20260331055858.305207-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331055858.305207-1-dave.patel@riscstar.com>
References: <20260331055858.305207-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_225904_331767_2BBB278B 
X-CRM114-Status: GOOD (  16.79  )
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

The vector context includes vl, vtype, vcsr CSRs along with storage for all
32 vector registers. The register state is saved and restored using byte-wise
vector load/store instructions (vse8.v/vle8.v), making the implementation
independent of current SEW/LMUL configuration.

The implementation follows an eager context switching model where the entire
vector state is saved and restored on every context switch. This provides a
simple and deterministic mechanism without requiring lazy trap-based
management.

Notes:
- The SBI_MAX_VLENB is configured using CONFIG_SBI_MAX_VLENB.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_vector.h |  30 ++++++
 lib/sbi/Kconfig          |   4 +
 lib/sbi/objects.mk       |   1 +
 lib/sbi/sbi_vector.c     | 215 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 250 insertions(+)
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_vector.c

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
new file mode 100644
index 00000000..4ecfaa0b
--- /dev/null
+++ b/include/sbi/sbi_vector.h
@@ -0,0 +1,30 @@
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
+	unsigned long vl;
+	unsigned long vtype;
+	unsigned long vcsr;
+	unsigned long vstart;
+
+	/* size depends on VLEN */
+	uint8_t vregs[32 * SBI_MAX_VLENB];
+};
+
+void sbi_vector_save(struct sbi_vector_context *dst);
+void sbi_vector_restore(const struct sbi_vector_context *src);
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
index ea816e92..5c0caf39 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -106,3 +106,4 @@ libsbi-objs-y += sbi_trap_v_ldst.o
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
 libsbi-objs-y += sbi_cppc.o
+libsbi-objs-y += sbi_vector.o
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
new file mode 100644
index 00000000..497d7f94
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,215 @@
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
+
+#ifdef OPENSBI_CC_SUPPORT_VECTOR
+
+static inline void vsetvl(ulong vl, ulong vtype)
+{
+    ulong tmp;
+
+    asm volatile(
+	".option push\n\t"
+	".option arch, +v\n\t"
+	"vsetvl %0, %1, %2\n\t"
+	".option pop\n\t"
+	: "=r"(tmp)
+	: "r"(vl), "r"(vtype)
+	: "memory");
+}
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
+#define READ_CSR(dst, csr) (				\
+	do {						\
+		asm volatile(				\
+			"	.option push\n\t"	\
+			"	.option arch, +v\n\t"	\
+			"	csrr %0, " #csr "\n\t"	\
+			"	.option pop\n\t"	\
+			:	"=r"(dst)		\
+			:				\
+			:	"memory");		\
+	} while (0))
+
+	/* Step 1: Save CSRs */
+	READ_CSR(dst->vtype,  vtype);
+	READ_CSR(dst->vl,     vl);
+	READ_CSR(dst->vcsr,   vcsr);
+	READ_CSR(dst->vstart, vstart);
+
+#undef READ_CSR
+
+	/*
+	 * Step 2: Set a known vector configuration before accessing registers.
+	 * This ensures the hardware is in a consistent state for save.
+	 */
+	vsetvl(dst->vl, dst->vtype);
+
+	ulong vlenb = vector_vlenb();
+	uint8_t *base = dst->vregs;
+
+	/* Step 3: Save vector registers */
+#define SAVE_VREG(i) (						\
+	asm volatile(						\
+		"	.option push\n\t"			\
+		"	.option arch, +v\n\t"			\
+		"	vse8.v v" #i ", (%0)\n\t"		\
+		"	.option pop\n\t"			\
+		::	"r"(base + (i) * vlenb)	: "memory"))
+
+	SAVE_VREG(0);
+	SAVE_VREG(1);
+	SAVE_VREG(2);
+	SAVE_VREG(3);
+	SAVE_VREG(4);
+	SAVE_VREG(5);
+	SAVE_VREG(6);
+	SAVE_VREG(7);
+	SAVE_VREG(8);
+	SAVE_VREG(9);
+	SAVE_VREG(10);
+	SAVE_VREG(11);
+	SAVE_VREG(12);
+	SAVE_VREG(13);
+	SAVE_VREG(14);
+	SAVE_VREG(15);
+	SAVE_VREG(16);
+	SAVE_VREG(17);
+	SAVE_VREG(18);
+	SAVE_VREG(19);
+	SAVE_VREG(20);
+	SAVE_VREG(21);
+	SAVE_VREG(22);
+	SAVE_VREG(23);
+	SAVE_VREG(24);
+	SAVE_VREG(25);
+	SAVE_VREG(26);
+	SAVE_VREG(27);
+	SAVE_VREG(28);
+	SAVE_VREG(29);
+	SAVE_VREG(30);
+	SAVE_VREG(31);
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
+	/*
+	 * Step 1: Set a known vector configuration BEFORE touching registers.
+	 * This avoids clobbering the restored CSRs later.
+	 */
+	vsetvl(src->vl, src->vtype);
+
+	/* Step 2: Restore vector registers */
+#define RESTORE_VREG(i) (					\
+	asm volatile(						\
+		"	.option push\n\t"			\
+		"	.option arch, +v\n\t"			\
+		"	vle8.v v" #i ", (%0)\n\t"		\
+		"	.option pop\n\t"			\
+		::	"r"(base + (i) * vlenb) : "memory"))
+
+	RESTORE_VREG(0);
+	RESTORE_VREG(1);
+	RESTORE_VREG(2);
+	RESTORE_VREG(3);
+	RESTORE_VREG(4);
+	RESTORE_VREG(5);
+	RESTORE_VREG(6);
+	RESTORE_VREG(7);
+	RESTORE_VREG(8);
+	RESTORE_VREG(9);
+	RESTORE_VREG(10);
+	RESTORE_VREG(11);
+	RESTORE_VREG(12);
+	RESTORE_VREG(13);
+	RESTORE_VREG(14);
+	RESTORE_VREG(15);
+	RESTORE_VREG(16);
+	RESTORE_VREG(17);
+	RESTORE_VREG(18);
+	RESTORE_VREG(19);
+	RESTORE_VREG(20);
+	RESTORE_VREG(21);
+	RESTORE_VREG(22);
+	RESTORE_VREG(23);
+	RESTORE_VREG(24);
+	RESTORE_VREG(25);
+	RESTORE_VREG(26);
+	RESTORE_VREG(27);
+	RESTORE_VREG(28);
+	RESTORE_VREG(29);
+	RESTORE_VREG(30);
+	RESTORE_VREG(31);
+#undef RESTORE_VREG
+
+	/* Step 3: Restore CSR's last */
+#define WRITE_CSR(csr, val) (			\
+	asm volatile(				\
+		"	.option push\n\t"	\
+		"	.option arch, +v\n\t"	\
+		"	csrw " #csr ", %0\n\t"	\
+		"	.option pop\n\t"	\
+		:				\
+		:	"r"(val)		\
+		:	"memory"))
+
+	/* Restore CSRs first */
+	WRITE_CSR(vtype,  src->vtype);
+	WRITE_CSR(vl,     src->vl);
+	WRITE_CSR(vcsr,   src->vcsr);
+	WRITE_CSR(vstart, src->vstart);
+#undef WRITE_CSR
+}
+
+#else
+
+void sbi_vector_save(struct sbi_vector_context *dst)
+{
+	return;
+}
+
+void sbi_vector_restore(const struct sbi_vector_context *src)
+{
+	return;
+}
+
+#endif /* OPENSBI_CC_SUPPORT_VECTOR */
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
