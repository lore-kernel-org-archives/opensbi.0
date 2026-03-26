Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB8610A1E84
	for <opensbi@archiver.kernel.org>; Thu, 26 Mar 2026 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JH0bygWS5Ozl+S9unqN6zwXXSvG5ltksWtDK6FQfvp0=; b=p3S3/veQp0zkxT
	WQ1EHWPgIL+SKJHhxfc3wJxjuz2X/M2yC66O2xYH5MvWJDF4EHxi345bB3fq67gM5STIB3BiRoKpe
	7UVY8nPVpsMB0EKvfgugeFRIPjjkCfB5cK0bZsrJmKW+HViVuqbLIod5/3U+ze+KteIeNhX5e0WJE
	QhESy0g2XYT3ygpxNKXkiOyPAwi169ttXRrGxKFnOVkwzVM/03hweY1ITXGuAofZ5S6cLavQyscm6
	UzgVLR6ZAIfiDSjonk9yfWvRHhcuNRpETwYjdbFkdE7u/k+dPtdoCR1+g0Drjq4QNn2mJeHz2NJxT
	RcGa52yYJZqMcdFyulhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jJx-00000005O21-1Ynj;
	Thu, 26 Mar 2026 11:56:17 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jJq-00000005Nzi-3hUK
	for opensbi@lists.infradead.org;
	Thu, 26 Mar 2026 11:56:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43b87970468so845586f8f.3
        for <opensbi@lists.infradead.org>; Thu, 26 Mar 2026 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774526169; x=1775130969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTia2gaspIkVn1xUnbC0Gk/iOJecqJvZko+OkOjjbHA=;
        b=epwrgRyL5OcnIJFZ471xjNz7tL7bw/u2hThjUM1uKUmotrKH4liT7LfXlu2dR21q3T
         jv5JC4rywzRJ39bfgLQBfXs5LnIe/4Y47+V2UpLHMKoLn6p4Yuzu+GzLLKMq58fFxmyC
         o+BrJdIGBMcRAOJSRkypfEr/OhUaXoVi3Xjcl/w5tvFoAw42SPGFK07yCZSXdaHTtYpi
         WY5d3SA3GeEa/LH5oNwnzE/vJ5PJT0/NMAqAXgrJ3RCPxqbnd2fWcG3J5mHCzYnt3WAk
         93khGufUX7aB0LnEEYfgsgM7zHN2JaQBJHMlrcv65C7T+GjhrNZSaUe46wPaT3tm9f/H
         0OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526169; x=1775130969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hTia2gaspIkVn1xUnbC0Gk/iOJecqJvZko+OkOjjbHA=;
        b=ZuFjSTdROvwN4/EvPINPt6JZdM+umDPpG/qLwPme4aXUM8x3weZKMf+2kPKdMo+mOG
         Dhx8VXsZhxEyFyC5PF3Mxrtz0CdapElXOnlq2Gsy5RfsqWgPbGH/CrIby1kiOyPHBRzC
         oKnxQrBzyK9MDKC0zyJv1vS+QAkfEIj9Wu2pX/SMF/EhbI8TsthnoPeV4XU/NMtnnmq0
         3+NrIHBy4tMvbRormCrotf7YwDN26WDXfnCvgbHBCOLrfIL9jBgE5TdlA1635c2UWEYu
         Qf5F8dKbe9AMRpr1/o89TFt/ZFT8zXvtWTiQ5u3QK7xIPzkrwFM6KJOPalj064ftAjjf
         jjiw==
X-Forwarded-Encrypted: i=1; AJvYcCVWF9DSTDiJ2l8adodmBDt9Y9HumniHURWkSsXbwx8LYMG1KPrw9oIISWvg2ogKfMXHICxU1HJq@lists.infradead.org
X-Gm-Message-State: AOJu0YwO7XUv52SA3rYeQByc6Y4+qsx8ulN5n7Tc8bwTjpqXrCHw8T7a
	v2zAWeqXJ2AOrOuik4XOB30f2zvfXxoHaqWSzWv1Z3M5aE/aevprxkI7YfbesyoLLSQ=
X-Gm-Gg: ATEYQzyegCXcxelB5ZEoS73H58H8PCJ8LZjTZ2nAYgYimLVCUsJ4jTYB329v4+7twIx
	B+R8agtY4RWEqJ9Y4dvKEmc8Hzmp0eXv94hoQ/qRMQ7K9BmzuV/LhFkeV8mwKBuejpk3asLfFSr
	Md72HQkPcCZbSXMTfnEAlUNwr44sA+nUStVOOQMlq44ta/oH2gKIBQhSh3Pdy9VHoVmLBY5mpKG
	LdFGvg2XWCpl2b2Q9cn10fn1gN/dnhDLKpcjRQmqNdmLC18SFFXyIuFUvFASusBJkwFj7Zl7x45
	cU5uWoAgQyN8JTLS20KCW84G0ksUt9w8vLqsAoPrBH2d38FlNtMzbu6H1lprPEoB4E/izoa239B
	B8PD6Km0tq3CUM+2AbvpFBl4Ryr6392J8EBSo0hDpkJmdFCDtq4jIvtqZkewZckwMMDJbc3eVsb
	QQwAr6XkB58kOTwxUPqfk3wZBj+IhJGf30SM27ng8u/qZK87tK
X-Received: by 2002:a05:6000:2484:b0:43b:433f:48a9 with SMTP id ffacd0b85a97d-43b88a3cf15mr11253480f8f.15.1774526168830;
        Thu, 26 Mar 2026 04:56:08 -0700 (PDT)
Received: from localhost.localdomain ([78.41.211.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8932438f8f.10.2026.03.26.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:56:08 -0700 (PDT)
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
Subject: [PATCH v2 1/3] lib: sbi: Add RISC-V vector context save/restore support (eager switching)
Date: Thu, 26 Mar 2026 11:55:15 +0000
Message-ID: <20260326115517.2156-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326115517.2156-1-dave.patel@riscstar.com>
References: <20260326115517.2156-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_045610_956954_CDD00E72 
X-CRM114-Status: GOOD (  15.56  )
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

Add support for saving and restoring RISC-V vector extension state in OpenSBI.
This introduces a per-hart vector context structure and helper routines to
perform full context save and restore.

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
 include/sbi/sbi_vector.h |  35 ++++++++++
 lib/sbi/objects.mk       |   7 ++
 lib/sbi/sbi_vector.c     | 146 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 188 insertions(+)
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_vector.c

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
new file mode 100644
index 00000000..ae151406
--- /dev/null
+++ b/include/sbi/sbi_vector.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2026 RISCstar Solutions.
+ *
+ * Authors:
+ *     Dave Patel <dave.patel@riscstar.com>
+ */
+
+#ifndef __SBI_VECTOR_H__
+#define __SBI_VECTOR_H__
+
+#include <sbi/sbi_types.h>
+
+#ifdef CONFIG_SBI_MAX_VLENB
+#define SBI_MAX_VLENB CONFIG_SBI_MAX_VLENB
+#else
+#define SBI_MAX_VLENB 256
+#endif
+
+struct sbi_vector_context {
+    unsigned long vl;
+    unsigned long vtype;
+    unsigned long vcsr;
+    unsigned long vstart;
+
+    /* size depends on VLEN */
+    uint8_t vregs[32 * SBI_MAX_VLENB];
+};
+
+struct sbi_vector_context *sbi_current_vector_context(void);
+void sbi_vector_save(struct sbi_vector_context *dst);
+void sbi_vector_restore(const struct sbi_vector_context *src);
+
+#endif //__SBI_VECTOR_H__
+
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index ea816e92..9fd378d0 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -106,3 +106,10 @@ libsbi-objs-y += sbi_trap_v_ldst.o
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
 libsbi-objs-y += sbi_cppc.o
+
+RISCV_EXTS := $(patsubst rv32%,%,$(patsubst rv64%,%,$(PLATFORM_RISCV_ISA)))
+$(info RESULT = $(findstring v,$(RISCV_EXTS)))
+
+ifneq ($(findstring v,$(RISCV_EXTS)),)
+libsbi-objs-y += sbi_vector.o
+endif
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
new file mode 100644
index 00000000..e14b658c
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,146 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2026 RISCstar Solutions.
+ *
+ * Authors:
+ *     Dave Patel <dave.patel@riscstar.com>
+ */
+
+#include <sbi/sbi_domain.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_vector.h>
+
+static inline unsigned long vector_vlenb(void)
+{
+    unsigned long vlenb;
+    asm volatile ("csrr %0, vlenb" : "=r"(vlenb));
+    return vlenb;
+}
+
+void sbi_vector_save(struct sbi_vector_context *dst)
+{
+    if (!dst)
+        return;
+
+    uint8_t *base = dst->vregs;
+    unsigned long vlenb;
+
+    /* Save CSRs */
+    asm volatile("csrr %0, vtype"  : "=r"(dst->vtype));
+    asm volatile("csrr %0, vl"     : "=r"(dst->vl));
+    asm volatile("csrr %0, vcsr"   : "=r"(dst->vcsr));
+    asm volatile("csrr %0, vstart" : "=r"(dst->vstart));
+
+    /*
+     * Set a known vector configuration before accessing registers.
+     * This ensures the hardware is in a consistent state for save.
+     */
+    {
+        unsigned long tmp;
+        asm volatile("vsetvl %0, %1, %2"
+                     : "=r"(tmp)
+                     : "r"(dst->vl), "r"(dst->vtype));
+    }
+
+    vlenb = vector_vlenb();
+
+#define SAVE_VREG(i) \
+    asm volatile("vse8.v v" #i ", (%0)" :: "r"(base + (i) * vlenb) : "memory")
+
+    SAVE_VREG(0);
+    SAVE_VREG(1);
+    SAVE_VREG(2);
+    SAVE_VREG(3);
+    SAVE_VREG(4);
+    SAVE_VREG(5);
+    SAVE_VREG(6);
+    SAVE_VREG(7);
+    SAVE_VREG(8);
+    SAVE_VREG(9);
+    SAVE_VREG(10);
+    SAVE_VREG(11);
+    SAVE_VREG(12);
+    SAVE_VREG(13);
+    SAVE_VREG(14);
+    SAVE_VREG(15);
+    SAVE_VREG(16);
+    SAVE_VREG(17);
+    SAVE_VREG(18);
+    SAVE_VREG(19);
+    SAVE_VREG(20);
+    SAVE_VREG(21);
+    SAVE_VREG(22);
+    SAVE_VREG(23);
+    SAVE_VREG(24);
+    SAVE_VREG(25);
+    SAVE_VREG(26);
+    SAVE_VREG(27);
+    SAVE_VREG(28);
+    SAVE_VREG(29);
+    SAVE_VREG(30);
+    SAVE_VREG(31);
+
+#undef SAVE_VREG
+}
+
+void sbi_vector_restore(const struct sbi_vector_context *src)
+{
+    if (!src)
+        return;
+
+    const uint8_t *base = src->vregs;
+    unsigned long vlenb = vector_vlenb();
+
+    /* Restore CSRs first */
+    asm volatile("csrw vtype, %0"  :: "r"(src->vtype));
+    asm volatile("csrw vl, %0"     :: "r"(src->vl));
+    asm volatile("csrw vcsr, %0"   :: "r"(src->vcsr));
+    asm volatile("csrw vstart, %0" :: "r"(src->vstart));
+
+    /* Re-establish vector state */
+    {
+        unsigned long tmp;
+        asm volatile("vsetvl %0, %1, %2"
+                     : "=r"(tmp)
+                     : "r"(src->vl), "r"(src->vtype));
+    }
+
+#define RESTORE_VREG(i) \
+    asm volatile("vle8.v v" #i ", (%0)" :: "r"(base + (i) * vlenb) : "memory")
+
+    RESTORE_VREG(0);
+    RESTORE_VREG(1);
+    RESTORE_VREG(2);
+    RESTORE_VREG(3);
+    RESTORE_VREG(4);
+    RESTORE_VREG(5);
+    RESTORE_VREG(6);
+    RESTORE_VREG(7);
+    RESTORE_VREG(8);
+    RESTORE_VREG(9);
+    RESTORE_VREG(10);
+    RESTORE_VREG(11);
+    RESTORE_VREG(12);
+    RESTORE_VREG(13);
+    RESTORE_VREG(14);
+    RESTORE_VREG(15);
+    RESTORE_VREG(16);
+    RESTORE_VREG(17);
+    RESTORE_VREG(18);
+    RESTORE_VREG(19);
+    RESTORE_VREG(20);
+    RESTORE_VREG(21);
+    RESTORE_VREG(22);
+    RESTORE_VREG(23);
+    RESTORE_VREG(24);
+    RESTORE_VREG(25);
+    RESTORE_VREG(26);
+    RESTORE_VREG(27);
+    RESTORE_VREG(28);
+    RESTORE_VREG(29);
+    RESTORE_VREG(30);
+    RESTORE_VREG(31);
+
+#undef RESTORE_VREG
+}
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
