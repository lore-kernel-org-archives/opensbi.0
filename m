Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19D810F285E
	for <opensbi@archiver.kernel.org>; Fri, 27 Mar 2026 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9n4S7LQev/KcAWCdIvJyvGkvuu9pNqsvw1EEToPpKw=; b=obvd2eyeG7El2t
	1ipZic7bqQsUNz6CN2ngMiRSd94EmyKlv6hMwtdTvNMO4LiHEQv0520n+oJi1H5XODUz6dAhfrbRw
	KWv4lBSvzBpOg0FzJNPCCBI6tpsxNXewC8pgFgjhv2baFU/xgEQi+sJU1QMMP79Eiu5NsJA1rVYCO
	mdNJob7NnyzPktAU8F0EBq3WZyNg+BYfgY9Sa6abCErCOhmcI/o3Dbu1zc3PJbhNb87GBgPJMtxoL
	o0STTLys22OzimvXqR0B5ARbyTs1jamyGHIizmxNX8FgIMMKMJ03pJJXsILiBORRQxWRAfPwF6Jzs
	3qr3Vl5OoM2JnIikBtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6An6-00000007qTb-0aBi;
	Fri, 27 Mar 2026 17:16:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6An3-00000007qS5-3s76
	for opensbi@lists.infradead.org;
	Fri, 27 Mar 2026 17:16:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48541edecf9so29486415e9.1
        for <opensbi@lists.infradead.org>; Fri, 27 Mar 2026 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774631768; x=1775236568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oV/+SFqNHRDbS032oc8PArHc55nn3YqRcSFQEJAuZxs=;
        b=q9H9l/6UaVLpHAGBlLI664r1XJHZ2L9JxCDfNcJiWj/6UP9ojikR7Shr/w4YgE50wW
         bwvOYAQteDGvdCtK51d3WwW3fA5IQda/07C7txCu7sftRCleUX62sbxt+Bx3G+tBE2NT
         sX50MtArRFDETrOPs1yOzUn0x1PxFnBzktCr1/sRgCkFny/EWkGTHYJRBjs+pohn5yMS
         6I8EpnQIj0/SZ5/hBbIE8f7Ylcaup6N4qFVZA2zR4AVB7sk5quJ+8c8Gi5sctRl1j6Au
         uTGYhaQGzwvziDCtQcmvBurntwS4ITrCJZPQ1Y/ZBnw7ZKGMN7Qb/r2nCNfc+ivfPHwG
         3psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631768; x=1775236568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oV/+SFqNHRDbS032oc8PArHc55nn3YqRcSFQEJAuZxs=;
        b=pUA8DSs9IH6M+6koJ/GdB7ir0rKFM//roEB28q9GD3y6OMaicGLV9L6MkaaDsw/rmZ
         mBgW4Kpvglu4YsgYisqQifIeoX0Db0Ukp4aWo0HEex85NEH63QFzQzNIzKInkCusdJ+6
         R3RWs1vNLC2rLgsfK+VEFeoZvqNgtCpsrFrHmSchhizD+seL8rnzUL2hywsZe77CrrXq
         RBhCFWmTdqwJ3b8KULl/Zp3bWDB2qM/4EYpmxo7dCKo3foJV/xTeAe/3k6A5Wp4wmECG
         80X7DnZl+izbefyrGu1Qn/kkP+Zwrqq2JgWAvUqBablMQsg8aC1zihs46+4D6mTtMcNp
         3XsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiHT44tCwV3UPJfe81isLiYxaIyxbLO7ZsQBgZFug2L5Ddpv6ZJ4H/m08j/Cc5JJi5aQttze0x@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx+6UbVa9nCCar9JFgg0GDxylxT/d2jtZOM6X4wHoyeqsZiCuc
	QJfcpuLBDaAacZSqHLZlB/QI6QAvMOeuJs4bCMYhVA6dqhdTdJ4d0tED3sT5VMjsFPE=
X-Gm-Gg: ATEYQzzOxUy21cEQ6/oK0uEyHCDyMAzS/971CRLvvqQsJPtkXnRaeG5gufYV2blpIGo
	zqI44NlQ0ZjUm6/kpVgWbesr4pF8eiHS8gzUTbTcpuHvYcMHh9he/Petpj6HTPpYaUFnaBg3HL0
	ZXuH1SvHf5sYN52XR9Mkix3uZpO5952ORNx8FbEScyRa8o6YH+B++YLQdlJaxsgtqGU3pEanRrM
	VKiHkIm1LPPY9tLtR4DSPJEeXQhuG+KsCKUXQmK+k4c4n0Tupms20bAPTjUGFEtu+2Iy09gF4VR
	EEwonjxYSWjelZSkMt2dM7xawhsQMw2O6S+H2EqKBmhqSPuc7b6NXJP1i/4XoSiiWOLVkohkiId
	H8F2l12jUHnDWggEP9aImqunQrr06pGO1uFqt2i294bsN04iUfJpgDS9HYVCLZmDgaYe3D3eq7u
	jowsrijuCKRlUIAbcc7juAEb0UJb13N4xEbQ9fNm6nsD1H9MyQ97TM9f5Hpei6g+36mvk=
X-Received: by 2002:a05:6000:250d:b0:439:bf55:f5ec with SMTP id ffacd0b85a97d-43b9ea77b12mr5597694f8f.50.1774631767942;
        Fri, 27 Mar 2026 10:16:07 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e3f9sm17150785f8f.7.2026.03.27.10.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:16:06 -0700 (PDT)
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
Date: Fri, 27 Mar 2026 17:15:59 +0000
Message-ID: <20260327171601.169103-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327171601.169103-1-dave.patel@riscstar.com>
References: <20260327171601.169103-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_101610_004156_BFF92D01 
X-CRM114-Status: GOOD (  16.23  )
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
