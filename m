Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79680CD4851
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47COVgY6GbyyC0L71NGT2rz0tsVYTdIf4vrMUKCl9Ug=; b=iNQtVkkQc5nMRd
	hbWYs2rD/loMuMxQfiR5pUg6K0KuPejt0wcdpVMdrZSl+m4ithsQ3XWY4SHpjs+cD8fOeaRwEgYiz
	50JhjwWfwvPD2KvPGPK4vWmmOLgIn+7rdipcqw1HnE32SzXJfsXIh+nVeebc4ie+VIhb7pNdKGelW
	OgJn35p9Go5i2lzzWBq65qDNXKi96w4nEbHCrju+Xly6FDbKVUyZ1jZzvPkk0BwYKBj0kZpOb87ka
	qq4kmblwl/VR4t9MtZzNsQt1R1fby27b/wyqJBfPGvcKUi63cjjMZGSENcD+sthlZDYMsdummrO6h
	5Th/68Ug3EWet/viosPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3nY-00000001X8e-218g;
	Wed, 13 May 2026 07:14:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3nW-00000001X79-0rbh
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 07:14:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d75312379so4810356f8f.1
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 00:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778656464; x=1779261264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpG1FsVLCDv422fKA6pCPgyzW4YvJ2BwoQTcZVY7s5s=;
        b=xtMDQ91EnE0c7fvEn81ya4GaXe7363Xj1UOVRfE4+z0W9PJaBFLae+ehSWzahS4Tnd
         s9SFHAsn57WuIG6oFnaq3tIdzfhNHEQyvlOLFp+IVXlKdI3L07+XurIM0mr4xNnyesDa
         xlkkkufCLdBhHsNxbYVjIUpjpPmF+g0Z1OeeH+MSGB3YHrD7eZaUDuFdZGpYkBBBEhNN
         VODTfJ1Ff/9yJ7DyZ4PR5P9a63nJRvk5VLJmcpTbobFZuvsDMrOi7gb4CCk2vHf4cAPQ
         ftXh4hrEVfJ+HYKCKbroSSGPBqIkz/V2jWwMGJH585Ke29R/Qg27db0OjbRppo0IfB+z
         jxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656464; x=1779261264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpG1FsVLCDv422fKA6pCPgyzW4YvJ2BwoQTcZVY7s5s=;
        b=nzUSRkmpVb4j89+8yGVR5yseYMw7cd3xXmT0m4uHQ9BxiAzDrfulAtUG/HF5ivPRBD
         CdtANSVzBobvnhcarxz5jDwDaEzTKqmqfgXrsbIkrXgeCbtzuXGMKS8dvmGXuwMUU5ex
         U21XcB/ePqvNZrsZDWAcHv8aJ5jBUsUgQt5oduCb8tcTjuDYMZBfPOe9oDVJ2QgnFV7S
         Lz/2yc2gW31AZBlI6+94Y0UlipYfnaR51Ro5oIiorHvt8DT7KzUKN3BCd6up7Z2G/jdu
         AVxzPJUEnu72rHW6czClth6r4+agl/m3K3u6glJAlnerOBj6HUvIe+m68nzuQ2bRla4i
         i00Q==
X-Forwarded-Encrypted: i=1; AFNElJ/MzU4lL8sJneLWCj7YvBZDq4DslfwFSPsVdNaAXQicMT7HW254+ZHEtbOBvSUS0xP266p8vQjS@lists.infradead.org
X-Gm-Message-State: AOJu0YxzRjiQMnxDpmljIIicqAo4W1/5NGVj0uPLaYOA4p3K6Ik5NWuZ
	kV4iLe/rTXCBB3SbmD9JwV0QR15S4mrAIvA93fzJeNkyuaeYul72tdmz0tlnALzuV6Q=
X-Gm-Gg: Acq92OHIA0mHRO5hKbfb4VUnq6o6jYm/A/ERLezUj4yIPnCP34cbLPb/1NY7TgRNt+L
	ohWO2B7nEY+uepqkt4r/BoGHHoNaLyT9aD1eT3MLtq9gEo9+DdLagRzM/KhHAznQbWcdzOvsLx+
	fycq1Qp50uiMquf23ozVuR7JyFa0nAbZPkdaChQKavng1j55ahS9hMMpS5M7YdZzacn4cnXtoRs
	fHeeaafW0k+ZocPH0clI65rvLOps8H4n4fMlt3UbiW0U9jWOTKlDHz2NKdQszq1uSrbHXpJn6QB
	G45j8tAvkpK3P55ZYnos/goco69tM8Lg3vDU0H/KTzf+/dtMR/KzO5sje0LDcMt8pgTZSCt7LV2
	8VIl+HoVMT5Bzqok+M++f85LrLANM2ZSFAQM/nuQa7htjfWfMEtFlAAHbj9QfycVy2RX0M92kiP
	UYneB+SSmXqloLW9fIpPyH08ApIvNmjmN2oowC+wxakEXgBmDFpiY8uQWqxPdtsym8Vcg=
X-Received: by 2002:a05:600c:4503:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48fc971f11bmr29362425e9.1.1778656464048;
        Wed, 13 May 2026 00:14:24 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e5efe71sm39558345e9.1.2026.05.13.00.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:14:22 -0700 (PDT)
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
Subject: [PATCH v4 1/3] lib: sbi: Add RISC-V vector context save/restore support
Date: Wed, 13 May 2026 08:14:16 +0100
Message-ID: <20260513071418.50957-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513071418.50957-1-dave.patel@riscstar.com>
References: <20260513071418.50957-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_001426_278095_EC2EB2D4 
X-CRM114-Status: GOOD (  15.23  )
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
 include/sbi/sbi_vector.h |  28 ++++++++
 lib/sbi/objects.mk       |   1 +
 lib/sbi/sbi_vector.c     | 136 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)
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
index 00000000..0085aa02
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,136 @@
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
+#define vcsr_read(dst, csr)				\
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
+	vcsr_read(dst->vcsr,   vcsr);
+	vcsr_read(dst->vstart, vstart);
+
+#undef vcsr_read
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
+#define vcsr_write(csr, val)			\
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
+	vcsr_write(vcsr,   src->vcsr);
+	vcsr_write(vstart, src->vstart);
+#undef vcsr_write
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
