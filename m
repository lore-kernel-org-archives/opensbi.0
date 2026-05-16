Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A046CD4F4A
	for <opensbi@archiver.kernel.org>; Sat, 16 May 2026 22:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0hnl2zxZIMYjfGE5tRevRWjDe3gVd4jVJg23wB0zDQ=; b=aB4w/TjRaz7mi6
	vZuPouzCRN03Rcb8RuLnfJWcm+8LR/zaOuCvNh0nkYOgO2uOQjM9xdlTNyapx9pQcuntwauamjpar
	MgBICDZO0YgdBtdQR+sbf0IphF5fFRUin9IqePesQCLFJ0co9v+iQuj8vdAQQqpJQ033IBPSWGKSL
	ZAlci1DhuGqO9A0AVNGfqAXRpvNClmOwCU3N1lPX5Be5rV80VhQoAHf9zRuylMZG5IGt1liwrQQdE
	5fZDcBdR18Vjw0bB137lBlQCEcxelAXJB7PohOeDZpobe5BBpxR+vHWuBYAAgzrcc9hfGKrObM+vJ
	0j1O+orhwUNkqCW8SdZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wONOL-0000000BcQb-28w6;
	Sat, 16 May 2026 22:21:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wONOI-0000000BcOn-1r5t
	for opensbi@lists.infradead.org;
	Sat, 16 May 2026 22:21:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48909558b3aso10504585e9.0
        for <opensbi@lists.infradead.org>; Sat, 16 May 2026 15:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778970108; x=1779574908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1RR5CsGywTcpCxXoGp2luq8IzcV5T/imSmJmE/ac80=;
        b=CtcRX6003e1IcoNp5MLc9n44C0wlMFzC8tbkPpbkiA3cNfbMZKmVZPLkJkpo7LOkEo
         VeFGNlma7e8f1G/wnBsuI2wJYEAV3KFSr5jeCpTL74/OZvmxP61IIHAxH+jGbIAeK5PZ
         R8uQ9UJB5PC5x6Igf+RS4eN0VwdobTsOcgwBvk0QB1EdkK2zfm1UYXY69ngOS26xM1Bs
         okOK28FeQLBtdalJu5sCL0xbt/HZGWvkzcjXeyD7WvIpTqB/Fco7pBZQlkiT+drsaFCm
         v1IncPixnnXf9FF2oZDMVqdwO/2OtYTrMqgsbG3W4+JrpWdNI6HP1kGVKiyJ38Oz9I1v
         Oscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970108; x=1779574908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j1RR5CsGywTcpCxXoGp2luq8IzcV5T/imSmJmE/ac80=;
        b=DrdawabRlv65dksR0o4tCYu9SbkdaMSAznGMKv92kpSFwEe/kHoZZ2A3VmpUaDL6o2
         Ng1FGdwGpNlkXW+I1tzEr846VpNZ6wF3MLtoT3LOBuJD7CRWexoA08DzAVNcd6kQhq2J
         zHgyLkC1A8rx9XCzDh2h7dEfXQ25s8/IOar0CThI7dBQIEAUPiYaxncmuAp+0XnpAtgY
         T0jvdfG2fjIThf+yxk/Lfmbxouv4OyWDmy66TC/t5RjF65yiibn3AJXxRzImQrHHPae7
         K+O+lL265HDFUdQJdRN5IZtEkoPu9fTZs+MONnHlo/U2Oi883QUEKcD8OVL0TfG18bj4
         E6TA==
X-Forwarded-Encrypted: i=1; AFNElJ8DYlvnZUE56JtNvDSMmeCCRIA9RQBcvkz3YP8ctmtC4Ja0rsHPYqGJlNAEmDo2WTCL6+VzNITG@lists.infradead.org
X-Gm-Message-State: AOJu0YypWXWMb+sMUcFDn7nq1Eq5jICPKTMWxD+4v2gTLlBR2pf06D4z
	hYMVMSGVWm2bnEvDDpML9gb+dGdHM1p4tOWTBTjIoeTHjBzdVrs3kyk/mEnEptg5MYs=
X-Gm-Gg: Acq92OHMMnRoRu1bpI7GapqHGvzd4/4JCGCWSRS/L6unzMnX3nphHInnT6bJY9NVNcL
	zJzQqxAuD0FO8okqTdQR5Zkvb7Y/fmPiI8DCgO5jyciZWgZ4VjKATGfPahgw003b4Vv9CYfBXeT
	FG0O49Mq28hslIb8IZwePbYJszJmhP7DO4VsLSK9KPFuZ1wmgHf0tWWY8KL/TpJ+ccnUvsxEPV1
	xbiuNVfJsjPGO9iB/OohQ4uGANrGGt0eKXKc95r/8agT/JKy0OoScFU+Ga59xzyRtDrYnpZO1PM
	hx/APX4q8bNnxKhYo2NtNLy8K9fm5DydBhJBeu/nw6uBm6qOlZ4YuH4/ZPi7g0UeMMmflA+7gtB
	xUROfx4j/BiP51kge6J1XSTP9ROMTnTv59BvCsAYzV0uswTyFHUsBxzaP5i+7BRoaHRXXSjl3Ja
	FYU/Kdc5PjdOLvifhvRUKwgFLMZlR5/naeUh4XBFib++9ufq0LonbUKg0xKVtgLQeZBW+sOHVnL
	Yu5
X-Received: by 2002:a05:600c:3e1b:b0:48d:46a:6e5b with SMTP id 5b1f17b1804b1-48fe60de6b2mr125816845e9.7.1778970108477;
        Sat, 16 May 2026 15:21:48 -0700 (PDT)
Received: from Dev-EliteBook.lan (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm43694305e9.17.2026.05.16.15.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:21:47 -0700 (PDT)
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
Subject: [PATCH v6 1/3] lib: sbi: Add RISC-V vector context save/restore support
Date: Sat, 16 May 2026 23:21:41 +0100
Message-ID: <20260516222143.23619-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516222143.23619-1-dave.patel@riscstar.com>
References: <20260516222143.23619-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_152150_507397_0EF8009F 
X-CRM114-Status: GOOD (  15.40  )
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
 lib/sbi/sbi_vector.c     | 138 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)
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
index 00000000..c596ec7a
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,138 @@
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
+static inline void set_vs(void)
+{
+	csr_set(CSR_MSTATUS, MSTATUS_VS);
+}
+
+void sbi_vector_save(struct sbi_vector_context *dst)
+{
+	if (!dst)
+		return;
+
+	unsigned long mstatus_orig;
+	/* Step 1. Save original mstatus */
+	asm volatile("csrr %0, mstatus" : "=r"(mstatus_orig));
+
+	/* Step 2. Enable VS */
+	set_vs();
+
+	/* Step 3: Save CSRs */
+	dst->vcsr = csr_read(vcsr);
+	dst->vstart = csr_read(vstart);
+
+	ulong vlenb = vector_vlenb();
+	uint8_t *base = dst->vregs;
+
+	/* Step 4: Save vector registers */
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
+	/* Step 5. Restore original mstatus LAST */
+	asm volatile("csrw mstatus, %0" :: "r"(mstatus_orig));
+}
+
+void sbi_vector_restore(const struct sbi_vector_context *src)
+{
+	if (!src)
+		return;
+
+	unsigned long mstatus_orig;
+	/* Step 1. Save original mstatus */
+	asm volatile("csrr %0, mstatus" : "=r"(mstatus_orig));
+
+	/* Step 2. Enable VS */
+	set_vs();
+
+	const uint8_t *base = src->vregs;
+	ulong vlenb = vector_vlenb();
+
+	/* Step 3: Restore vector registers */
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
+	/* Step 4: Restore CSR's last */
+	/* Restore CSRs first */
+	csr_write(vcsr,   src->vcsr);
+	csr_write(vstart, src->vstart);
+
+	/* Step 5. Restore original mstatus LAST */
+	asm volatile("csrw mstatus, %0" :: "r"(mstatus_orig));
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
+unsigned long vector_vlenb(void)
+{
+	return 0;
+}
+#endif /* OPENSBI_CC_SUPPORT_VECTOR */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
