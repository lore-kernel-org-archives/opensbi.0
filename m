Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF53A1098788
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSdZ2Nk9AV52+HLpvEtQ0HtrZ8m88OnRwqQdv21V3qQ=; b=h/PNrbUwBHvVtG
	vDHoTIqxzkceUuK6VKxZgsMne90ghW/nNFDzJ3qW/JmshUgvGEAKp2coTdm5ZYUdrWQsbAN69vgpz
	+geZU2fKpRhELjHRzo4e0VT00P+ElkNCl1m1RFJsPleyfHxwOWo3/yG4Vfvx76CMuvff9LKUnAGgJ
	AH6aMIvvEGUtcGlUA4kXR5w2xodmFwcENrunv5qA4vTHiZ3xu+tQuoWfSv+VK4hE8Z9ft55WIful/
	g4VEB/UGWtg7/7cq8lknxR26eFV8zAHm/Xmtf6780I43dB2AkXDmj/N1UUGuAQvvjh3cE7MACsYJO
	IPTXCCFPwNRzN7N5MBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3alc-0000000CvqI-133m;
	Fri, 20 Mar 2026 14:24:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3alZ-0000000CvoT-3azG
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 14:23:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so14781025e9.1
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774016636; x=1774621436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Oacnl03g+N4S9BJS7fsauQ0bdr58pc0cuAZ1gVCFiY=;
        b=2/qmAm8kNCRNF+n4Ztx2l+oD+WnqtVuM65V0BZdJ3zSSwoxKYWnXUbhNdRWMnZJlYD
         SsEum8LGvAUo+RFoWCVfrf3TbRcUWnnk+7BTdsimggAm4dhM6Mk3OI76HyMIdhkN+Zfh
         UCpTVPFbvZ0hywbeLa8guv+IHvceHIKfWNmbD3uLY3VZfkT/z0GoT1XY9enhD15DMI+N
         yNFDtwfc83ljpAQ4+szejhMld2qxdLSL/K8V7xK4CZOdknvY8vsAP/8SLBNwT3DeyL+6
         kKQEtI0jfMr1aGwao0aujHNg+uGQ5lTW1lsZ9WoHaJUfJLa0m6uFOJPwSb0c/0dmXVPL
         Nt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774016636; x=1774621436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Oacnl03g+N4S9BJS7fsauQ0bdr58pc0cuAZ1gVCFiY=;
        b=RwJlG7/VtFny0YOitXotwtftVaVyl694MzLaGBM0OSR/etHAW1fVhEFt/DjZ0zPpH1
         yOvt7+AaJk1SI7XzSRW5TNOuvMwhmcdvDc9ik9wU2vr1r4lcrgQRFOlmL9lDnwWe3jrW
         +GYhCtIpZS+E37Ns0bxZl0QXR0/JW5G2zS/Vv1cU1bnRqBGMseILPsZZLwVBgEH/2fpU
         Qc2qC2I26YVIBySdMs1TlFNYSiNnLerdCoAMjbvs0hiD2ML0XYw1X3ScIfx5kzau2RwM
         5uEN4cC3gfTjJXjS0HkeYNVoZP7mSv7R17Zuy922nCG347zJ6teL4WShLNRSywJqSEkB
         WM6Q==
X-Gm-Message-State: AOJu0YwY3xit216xP3r/cpANESerpoT/dHk1XXMuVP2wno2+Etscc2yy
	F3O3U7HXqu0wSEmEud2XYv3hfJbRK3Rv8GbxTEdskHnpQVKOcB/19o7FxZUmh8HSZGjcrAaVo+W
	WeWfJYsk=
X-Gm-Gg: ATEYQzyg5RO21X3865BuYLL51n9x75GfmEJHfmONUMREPudIegqDwdM5NMRiKjdlN1E
	CAI7NnxRrbVSEmMNpN7CKJiXpZFDNnRyCDVUlpa8gkEuhmCY69n7GpUFIZoBnVepLuhmsl5t2Ze
	2xKKKJnghipfUvQLQ2XtxWyC/tBcm4pQJpstuvz/+SGeGUckJJLiZnaqesg10kRLElvMRzN+lE4
	3rsB5KWrTkBf7Rcsxi6ICrS49P58OjL7sdWm9mWYaB5JrB4X4RktSCG2kk4Day9i/ZiAlY5tdw6
	3NhwJWn6Pi+zGLitLIvBbEEdRvT7EM4oa+gnJtS3qbILH2pCERHoLYovxK6BeWwFvhe/3Zpv+ih
	BuFYf45m7StZ+XzV72MLaHrMLuYGtPep5mdgglnFhORyTigvifGj1kMnadLmgrWqabLfzw7Y4YE
	O+Ed5vwAzim2YJDE2feTi2BhzQ/WHuznCMrGVFvwQ81xxLKY8LYIkJENJ7kBHCWYdhZgQ=
X-Received: by 2002:a05:600c:3483:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-487012ce938mr31843735e9.5.1774016635624;
        Fri, 20 Mar 2026 07:23:55 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d923fsm108445265e9.1.2026.03.20.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:23:55 -0700 (PDT)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 2/4] lib: sbi: Add RISC-V vector context save/restore support (eager switching)
Date: Fri, 20 Mar 2026 14:23:47 +0000
Message-ID: <20260320142349.72980-3-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320142349.72980-1-dave.patel@riscstar.com>
References: <20260320142349.72980-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_072357_922760_02157A28 
X-CRM114-Status: GOOD (  15.31  )
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

A per-hart pointer is used to track the current vector context owner.

Notes:
- The maximum supported VLEN is capped via SBI_MAX_VLENB.
- The implementation assumes the vector unit is enabled when invoked.
- vstart CSR is not currently saved/restored and is expected to be zero
across context switch boundaries.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_vector.h |  30 +++++++++
 lib/sbi/objects.mk       |   1 +
 lib/sbi/sbi_vector.c     | 136 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_vector.c

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
new file mode 100644
index 00000000..6be477c0
--- /dev/null
+++ b/include/sbi/sbi_vector.h
@@ -0,0 +1,30 @@
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
+#define SBI_MAX_VLENB 256
+
+struct sbi_vector_context {
+    unsigned long vl;
+    unsigned long vtype;
+    unsigned long vcsr;
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
index 00000000..37239ce2
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,136 @@
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
+/* Per-hart vector owner */
+static inline struct sbi_vector_context **vec_owner_ptr(void)
+{
+    struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+    return &scratch->vec_ctx;
+}
+
+/* Get current vector context */
+struct sbi_vector_context *sbi_current_vector_context(void)
+{
+    return *vec_owner_ptr();
+}
+
+static inline unsigned long vector_vlenb(void)
+{
+    unsigned long vlenb;
+    asm volatile ("csrr %0, vlenb" : "=r"(vlenb));
+    return vlenb;
+}
+
+
+void sbi_vector_save(struct sbi_vector_context *dst)
+{
+    if (!dst)
+        return;
+
+    uint8_t *base = dst->vregs;
+    unsigned long vlenb = vector_vlenb();
+
+    asm volatile("csrr %0, vtype" : "=r"(dst->vtype));
+    asm volatile("csrr %0, vl" : "=r"(dst->vl));
+    asm volatile("csrr %0, vcsr" : "=r"(dst->vcsr));
+
+#define SAVE_VREG(num) \
+    asm volatile("vse8.v v" #num ", (%0)" :: "r"(base + num * vlenb) : "memory")
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
+    asm volatile("csrw vtype, %0" :: "r"(src->vtype));
+    asm volatile("csrw vl, %0" :: "r"(src->vl));
+    asm volatile("csrw vcsr, %0" :: "r"(src->vcsr));
+
+#define RESTORE_VREG(num) \
+    asm volatile("vle8.v v" #num ", (%0)" :: "r"(base + num * vlenb) : "memory")
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
+
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
