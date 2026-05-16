Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06267CD4F47
	for <opensbi@archiver.kernel.org>; Sat, 16 May 2026 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdeHzVz3/hJJJ3m3BNH0FzLqV159ifrHlLbBrxKa8Uk=; b=Ym6Y1OZ/nTUK+G
	oszGV46zog5H1FTQyu/SWOTYV4Q4HCJ0F0diC0DKG3+hLwQMHq9sKb9La3hlGp9Ycs2AxSkFVlwaw
	KOvYHuKAqVTL2zCt0StcfyfoPXGbjigf0e4r9tkvgFW0ohxIqlPOYZuE/WyltGs6evc2Y6eJawxcn
	9rcsFcCrYCyMf9zQoSUMpNB9XSpeGPU/5nuCTPL5Pt22ByLj1KP3EUlekWVXLTy4AsFlhOQlEJQ+d
	5qmAmEgQo6i8QhkiIGG+ltDVoqZbEfY7LLAZ5tCcmq8WaXXYf39//lv28aBBweovihqR+miqwxQhO
	YhXJkgAPwTpJDs7S3pww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBw6-0000000AXkx-2sCZ;
	Sat, 16 May 2026 10:07:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBw4-0000000AXjn-0rE1
	for opensbi@lists.infradead.org;
	Sat, 16 May 2026 10:07:57 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so1092125f8f.0
        for <opensbi@lists.infradead.org>; Sat, 16 May 2026 03:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778926074; x=1779530874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFz1Ef7eawodJZ6XIkZHFs9nftDoVYM5uWfnBaI4o3s=;
        b=FHY1g1Ks3b9NB3INAk7Sqy7LvnZYvAC8N6lH8ZJNtDU/vzErOyPpWAd6XhviRwmuj7
         DAfpRoUowEp8n0yO0E3nFTcG+SoZindLMQAsSmJzXr7QXShOYOEQmPbOhAPof/5GrZKb
         M0da89485q2FEKZgkpKxICmIliDWIfYy8ANBCX0Xz214ZIwlvTFr+xXu9hi7qMVCxvEt
         BUMargxLTBt7Dg4Yvor8vCcZ0tCH5KzhCVl3VkvXndTrBve6t/Jo9LZ7SywFAHZaQnzi
         jvyDw5qoTtZvB+NnkM5yX93fmqmIHuks1C94bm8rt1IeJPnaOqpTJMX38XUe32/a62FT
         AJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778926074; x=1779530874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFz1Ef7eawodJZ6XIkZHFs9nftDoVYM5uWfnBaI4o3s=;
        b=cpTC/0t+4MUuUnGPQPKfDMF9bRS5S1HyG/MliqD3cAOKVGzglKPXI7pkSlVNXGD+AX
         gWNaeBvmQZFQaCHYhIEsRSCMbPjU21F4ANSr3vy4mdL7ckUPinetRu/pATxqKbU3vTm0
         U/7M3oWq/DsfyvSguSJZsulRxxuR0RD92Lkpc5jzLyOCXlj3i4CwV4oNdyLohblwUgby
         loHRurgLTbnaNhgvT5abBUfzOibYZWDnwPB61v8r/1ClttjLIBqhkHawCGLEYq7CXyg7
         qoclskJpAi09UbrTPqeh09J7/bIWnzNBRGCa0ASYXCUgc+M9HlQ4kC/QN2ciRPXC/em0
         HJ2g==
X-Forwarded-Encrypted: i=1; AFNElJ9KuUxBJuCSQuTfy8mbsOEzm9VdGcgwEC1d32dEo4wT/Cy90xW+QsNyZmU2DGN7qYNb561xNdxS@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ2T++pOp1+oZhjMTs3sgn+i3086kNaHkh0HnqFhHVYX6zd7NX
	mg8AiDnMmWw6apP+N2y8B+dyiaxNu+IwEwjixuo6XZU+JyA3v3UPGGutT3te28tyhBubB4wtwUo
	/ByXM
X-Gm-Gg: Acq92OE8ESd/IetycVK4KAIdHkNgi25VOKC2BhSRn9NYPVTnaBV5h9D0hRoGH9EpMF+
	cU2CUODq+Yy2AuHbZGBzM17aAhGMOtqxxpIevSU5yn8WrUN75XXMOlB3/MBbF0paMyiRqaqwUly
	Y5elzplyAf5KOr76VfDV9NXxvP9jcCziVC2OvJbOyg6repk8Aqc/eELlRvMIujb46BJZ6nOV24p
	xev22K9u1XeSq4aSP6WBbijkOm1kg+H1/NYRKfm2lLIm14HkxjArTsjz0eoWMeyh+3HmbIOQBBQ
	lw5eI9qCbE8wOA3GsA3w+l8SFppjAlZLsCbYaxFSOt0sIXhhf6i1zNxU9j2H1C6GoRqgPzOpq9p
	ka+uxgCeDH+yKybHxetf09Vwf6kYAkSJY2sV71i1VH118gEgtltIeYXHusVG+VvtZVNy+jLXDRO
	H7RPOfQ2L4yVNth6TJ6AfULbgY19DrXgDh8qTnqiYVN111X2X/aV2IZe2JjyNa1+GIIZ4=
X-Received: by 2002:a05:6000:250a:b0:45d:4c30:81a6 with SMTP id ffacd0b85a97d-45e5b747c16mr10712014f8f.5.1778926074102;
        Sat, 16 May 2026 03:07:54 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9adc2209sm19167114f8f.0.2026.05.16.03.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:07:53 -0700 (PDT)
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
Subject: [PATCH v5 1/3] lib: sbi: Add RISC-V vector context save/restore support
Date: Sat, 16 May 2026 11:07:44 +0100
Message-ID: <20260516100746.13502-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516100746.13502-1-dave.patel@riscstar.com>
References: <20260516100746.13502-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_030756_521604_10266DD7 
X-CRM114-Status: GOOD (  15.01  )
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
