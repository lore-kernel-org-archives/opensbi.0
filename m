Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AD8FD5F87
	for <opensbi@archiver.kernel.org>; Wed,  8 Apr 2026 07:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=os1q14frXl0OpunAERs7ypaRzq2vg0OKWh2OV/Zr7us=; b=OhQeNtUpzjlNOZ
	EWu6TPHxDEIYQND52fkb3+K++oS84g3Q749AORvRAIt/HsrP6b7Rb2KsbqVcHWGFgM5bwXYd/LtqN
	bYfOeOQqTQJd3wXmFiw4cSzFuXeHC/vRZzsNihiCTFtwNHIP9VtPTiz0H7gsbPCOCUPQpn8OlFhIX
	oDqrAs+eBwkAC0VzcmU9QU0FPEcM4ki5fgOHWyUJTPkPP7z8HE+qWqmNNYQ9Yg6sf7Cqn4EB5lJZC
	YTWwgM9ympoOPTNxmw2eQUdSeCX/EJ07s7G+6uvD+CeUbUOsnh/PD/4IeoMrPch6uyQmjJ70lFuD1
	wgUtE7QuQkKTfNCbbC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANFR-00000008PnG-1W9u;
	Wed, 08 Apr 2026 07:22:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANFP-00000008Pls-1KTv
	for opensbi@lists.infradead.org;
	Wed, 08 Apr 2026 07:22:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so3465192f8f.2
        for <opensbi@lists.infradead.org>; Wed, 08 Apr 2026 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775632965; x=1776237765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK9rfztKkhPGJpFGgQFavtgEmuz7EN7UhKwEArnlm9E=;
        b=Z7/eVcEo0rZ9mp6BhRkLW4YMALpgah9dTSmXxSzv4K2KAZzf5Ft26YN7MDT9DPxPDI
         pj+5p92G2whDuehTPMzX+DG78gnYMij+iJrRtFUeDsEqBxaLcvUsuCE0UIUrHBwqbrOv
         nj7/XRFbJFoH1MkNiWfoO0YlrPnFYN0wBiC8J69AVBMI/wJKz5D5KRCrr+3Fpm1gve//
         MJC2Eu7Nm1gmzykoDPNFWLHqjD0jbLlr9mWEBf9/jhG4m9vEZnsAzGyiK+AX4gxbZMQf
         Cgy4ZGLqMYx3iHJrmloF3kp0ZPCAOKFARUoCRhFNnZFkxokPaeBNTdYA8lqrZ4v7Nsak
         9MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775632965; x=1776237765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nK9rfztKkhPGJpFGgQFavtgEmuz7EN7UhKwEArnlm9E=;
        b=AlxkQUHKX6RlagF/oUwDNt+iQgqyB3JZFw5beMqYEKGIRyKRy7BwhLQI4JIbNS/Tuv
         0CEEnEl3B6lln7pT0ixEPTxhJ5/SbBmqSet0mMMu4RA7XMFinFJ6YFlUwyeRqNum7xLi
         D0U3fTe8K8fkEAPqNxcWB5wB8e4dyiIJIEmqHTpyVgNyKiKD0BhjeZvdDQQlZXhDe/8Z
         sEvBpiJ81Lb4LKKmZuw+mlwbwnBpMsd/leUPau6a8ChGN35dS1VP8pT/9vjtv7JlYvfr
         lG7KI4w91LECcrKaYsTvRJFjvrh2RAXAHSrYhz3ON3+rjuiPuSiJIbgrvgfQJ3df++sg
         72wA==
X-Forwarded-Encrypted: i=1; AJvYcCUDx+xCg2MhZE1WFyOBuf6EKh81IXTmELhHOzrO2OeoF2+gSQASfKBikb19Q/kuYt1gXimLCFl1@lists.infradead.org
X-Gm-Message-State: AOJu0YxBFLy7H7BH+TK1EIiK8lzczh5wf8JG9jEWf++EGGE1N2er68Ww
	Rg1/lLcr1PQHCQyudu1pD0f5twSm0yR6NAnaUGOaxh+YdKBVz8IiY4xganSy0TlqwcU=
X-Gm-Gg: AeBDietv0+zDqKnQHkt41Iw8X/O0oMRybH2f7Ek7VOKzLPap74PA8ZclkuJPXA+0XsV
	FRrzFiTzkBw1lvqE1G7Dz3kpDNvhbJTUaBKjrGCXfSpl07k63j4vC0z9sp+oVa5ohqaBZHvUgoF
	mxD+qZ3UNWZmXVCuNewIyLsOk7J/M6g7O4wZ8N08CsGO2pslcNEKpJSPoTz3/jq6Prx/651lH57
	iAM2yVzTl1TOrx50UMjjOPZQQIoJBLW2+hRtSG/ABSxaqMW6qzHz10qXjr1F9K9BLmyWad9lYee
	LCjsaztqWS6OxjTbafYXiTWCTZ+/kF9DLs07G3p+n8VfaBJ1ucre6bouY+R3NWybGc/eqxScg+o
	yvMZHBswhDCoLt7UM3tiScLM2/xhEjDPa6Sd8w2WgMhZn5uFnUSNvCJq3/88DdXcIJ0Gg/Jnpyv
	zMMNzeZoDxfgxgdLsxdHtO3kNS4h6+mFgfDL4cRZUaYedkjeGIqXENBpEWKk/XP5UeZNk=
X-Received: by 2002:a05:6000:2582:b0:43c:fde6:212e with SMTP id ffacd0b85a97d-43d292d33bfmr28411135f8f.24.1775632965500;
        Wed, 08 Apr 2026 00:22:45 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5419sm66188083f8f.11.2026.04.08.00.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:22:45 -0700 (PDT)
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
	opensbi@lists.infradead.org,
	radim.krcmar@oss.qualcomm.com
Subject: [PATCH 1/3] lib: sbi: Add RISC-V vector context save/restore support
Date: Wed,  8 Apr 2026 08:21:21 +0100
Message-ID: <20260408072123.7543-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408072123.7543-1-dave.patel@riscstar.com>
References: <20260408072123.7543-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_002247_387674_AB8FD2FC 
X-CRM114-Status: GOOD (  16.14  )
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
 include/sbi/sbi_vector.h |  30 ++++++++
 lib/sbi/Kconfig          |   4 +
 lib/sbi/objects.mk       |   1 +
 lib/sbi/sbi_vector.c     | 155 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 190 insertions(+)
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_vector.c

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
new file mode 100644
index 00000000..3b63b02c
--- /dev/null
+++ b/include/sbi/sbi_vector.h
@@ -0,0 +1,30 @@
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
index 00000000..29434e2e
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,155 @@
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
