Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A792606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ggfhi7FR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=APQMTiYl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OgVwQW3TxkAeG1HWTgw4k/6cEtN5L6wWAQjdiKyLVkQ=; b=Ggfhi7FRe46a6bNV7OXvzgluHx
	bL3QNmfWgfRM31o6243Cf3AaW90iqoOSeSZgWftWT8CgKE4AHDkKB7NZnfykP5fk3XA8SsvLHbblE
	M4/WzP4qsY5s7sqsh8rjrLqvgDvqMeSjmm6dk0Ex5sENtnL/wGHtSiiZUqZe885FpVj7XZnsF/TjP
	I0sstnCO8qAopzLkWm4snZM1LA7ARTDhEGw2JoZxqAhWJcWZ8CK+pxlOlhEstYs+56eVxW+6W1Mov
	OlUgr8LubUOcO09a/8IRGHRDu8derFuKdVwitfcmMLXf6bpU0JF5QVdknhGb5iP1RWmpY4s+xCn3y
	2W/6d31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxh-00000005VcV-3SlG;
	Tue, 24 Nov 2026 04:16:57 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxe-00000005VZR-2iqh
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:16:55 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso2679807a12.2
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493814; x=1796098614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U94DD9SBSBThaG6qRaFQ3h4rVSkSPF7wKp1NYM5h4dY=;
        b=APQMTiYl/XY7VgUo7NxAqQH8CUrRUS428/pJZ4cr57Q/PCf55/ZKbqNVLrN+clkOwy
         hiy9lLPsISaC/hMmQTYxOz5cRCQgltrdd/jdttae8f3pGMDLX3HOxlz6PBHe0YSEBN0d
         xAJ9Awjh064O03LTNe5CzcNoKIMoYi8lARTSt6v1Sj1KiuW1yJ8A1iJfm6j3hDnILNyX
         Pg4gFev6YPwO0pQKCR16zkLY6MbleIaM60QCdNdEu9vhM0FwP0DAz9XdcVCHJqoyYHX1
         ZI2mFUO4m/PcnIf0fvzXqCvORMOVemZy0Uje1XvsVrwpq4Za35OZ3aUrJvFmjHNfVwFr
         Dqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493814; x=1796098614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U94DD9SBSBThaG6qRaFQ3h4rVSkSPF7wKp1NYM5h4dY=;
        b=mXrzDyWlU6au+w4LN6X8wJ/sk1/iDawBbcOwaKIbvi9s4RQEVggmWxMeszpftjki4k
         ftKKeAvGXVJEcr0b7teE3tx0f78qERrXGK4hb2pTvB+B4sz+wOhVDgsMbOsemEALceoM
         FcdzJ4j6G9a4uHbmd2XValDAig7qxEyicsPZEk6APDPYsaMokRO8y6op99wIy+d5DSrL
         ITokQu0dS0A6uTihxyuUVlZ5FBFM76nJtUBsD/KDQIu2UlTIciYUMl/qqBQ9rI2fmMIn
         mLUQXpbm1s8CZIakV4erzOFgPtqMjZGZ6XapN3P4oF9zk26FZT1j0hB49tHP3X1bkHWD
         6RnQ==
X-Gm-Message-State: APuU4Z/w3f0ophtTRdhYXDLK3o41WYlODu1wl3D1+oCh0MmzkGZBOeUD
	u2jS4hU/BCVER1AkXB/pf3PgaUA8KJl4bUCiHW9ddWcsvHnHMQWI9j9o0NULwf4WatKjMi1gLDq
	Qs8ZkK4gvu8LoBb6UZioEmOpKvBp3Z/s/rCENNkhbbrAGbQznzpr6L5MWmN13qhviA/UqSr6Kdv
	1/VYUsZSyhbLsHQp7hsl2OhbWzxEiOKyJl8cO+hW69m+WoiT3ee8s=
X-Gm-Gg: AZFdTZf45hislr+h8jo6eKYJexVS40ImzMLenYRF6y4OaTXYLFlruenqx1OArJJsEDX
	Pgt1QJ0IQuEAcY9VNZRnymXt3114fMAbPgoDGOVXqZX3FHXHlrnaChYA8Ji5NCd16L+rJYjQ7NZ
	5uFq/vf9lOLcNKm6vYQ+UirnAboYln2jLc+5OdzDrvN2siFK4FcwYKFc7wfKyU80lhK87lR0iH7
	JByxZVfE+sEOyjj26t7sTGQW7FIipn+DDLf3UomZcL4mW5V05O2+0PFPETGyHE3W7v0CvwjAmcr
	gp8mpajyVWwD1T9nh4kCbVOvVizrLTDSRNISeR53skbVHBmvK0ZigX/rVYltJ/LO2jbtKHbbTKg
	b6aQv9gXgBVR595HtNRz7ARywDFdxRoeJMKEHPlwsJrqnu2EYtH9CSnY/Ps4bNvbowWLCcxP8+x
	THZVzQrH3DALy/iVNPi3qkfiQiatGZboIOaSmRmiJFxz1K3RfV9nYe5DS7DHxgRMZSVuY6TVy2d
	ar3L7XU1cyd87h1Nb74fgqGA0N92jt1L900OPrP0XECXN0ZBWgeGrqrAQRdO245aB9TN3CnKJ3E
	pZWK7TdhVierKTcjxwS700SwnhDe
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr12239307a91.9.1795493813442;
        Mon, 23 Nov 2026 20:16:53 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm21490496a91.12.2026.11.23.20.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:16:52 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v6 6/9] lib: sbi_hart_worlds: Implement WID hart protection backend
Date: Tue, 24 Nov 2026 12:16:28 +0800
Message-Id: <20261124041631.1049169-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
References: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201654_735139_748243A3 
X-CRM114-Status: GOOD (  21.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce a WID-based hart protection backend that switches World ID
configurations across domains.

Access to slwid is gated by mwiddeleg (Sswid), which means slwid cannot
be handled by generic hart_context save/restore. Instead, manage slwid as
domain state with explicit sequencing:

- configure:
  - Validate and program mlwid and mwiddeleg according to domain policy
    and platform constraints (pmlwidlist/mlwidlist).
  - Restore slwid after mwiddeleg is enabled.
- unconfigure:
  - Save slwid prior to clearing mwiddeleg.
  - Reset mwiddeleg to 0 to disable Sswid.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_hart_worlds.h |  24 +++++
 lib/sbi/objects.mk            |   1 +
 lib/sbi/sbi_hart.c            |   5 +
 lib/sbi/sbi_hart_worlds.c     | 174 ++++++++++++++++++++++++++++++++++
 4 files changed, 204 insertions(+)
 create mode 100644 include/sbi/sbi_hart_worlds.h
 create mode 100644 lib/sbi/sbi_hart_worlds.c

diff --git a/include/sbi/sbi_hart_worlds.h b/include/sbi/sbi_hart_worlds.h
new file mode 100644
index 00000000..91b11023
--- /dev/null
+++ b/include/sbi/sbi_hart_worlds.h
@@ -0,0 +1,24 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#ifndef __SBI_HART_WORLDS_H__
+#define __SBI_HART_WORLDS_H__
+
+struct sbi_scratch;
+
+/**
+ * Initialize WID hart protection for current HART
+ *
+ * Registers the WID protection mechanism if Smlwid
+ * extension is present.
+ *
+ * @param scratch pointer to scratch space of current HART
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_worlds_init(struct sbi_scratch *scratch);
+
+#endif /* __SBI_HART_WORLDS_H__ */
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index ae27d0c5..355ae6e9 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -77,6 +77,7 @@ libsbi-objs-y += sbi_fwft.o
 libsbi-objs-y += sbi_hart.o
 libsbi-objs-y += sbi_hart_pmp.o
 libsbi-objs-y += sbi_hart_protection.o
+libsbi-objs-y += sbi_hart_worlds.o
 libsbi-objs-y += sbi_heap.o
 libsbi-objs-y += sbi_math.o
 libsbi-objs-y += sbi_hfence.o
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 8e8f84cd..ae24720e 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hart_pmp.h>
+#include <sbi/sbi_hart_worlds.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_string.h>
@@ -784,6 +785,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 		rc = sbi_hart_pmp_init(scratch);
 		if (rc)
 			return rc;
+
+		rc = sbi_hart_worlds_init(scratch);
+		if (rc)
+			return rc;
 	}
 
 	return sbi_hart_reinit(scratch);
diff --git a/lib/sbi/sbi_hart_worlds.c b/lib/sbi/sbi_hart_worlds.c
new file mode 100644
index 00000000..a09f96d0
--- /dev/null
+++ b/lib/sbi/sbi_hart_worlds.c
@@ -0,0 +1,174 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
+#include <sbi/sbi_hart_worlds.h>
+#include <sbi/sbi_scratch.h>
+
+/**
+ * Initialize the per-hart slwid values of a domain using
+ * the lowest delegated WID as the initial value.
+ *
+ * S-mode OS should choose the desire slwid for it's
+ * U-mode.
+ */
+static int sbi_hart_worlds_state_setup(struct sbi_domain *dom,
+				       struct sbi_domain_state *state,
+				       void *state_ptr)
+{
+	unsigned long widdeleg = dom->widdeleg;
+	unsigned long *slwid = state_ptr;
+	unsigned long init_wid;
+
+	if (!widdeleg)
+		return SBI_OK;
+
+	init_wid = sbi_ffs(widdeleg);
+	sbi_for_each_hartindex(i)
+		slwid[i] = init_wid;
+
+	return SBI_OK;
+}
+
+static struct sbi_domain_state wid_state = {
+	.state_setup = sbi_hart_worlds_state_setup,
+};
+
+static unsigned long *sbi_hart_worlds_slwid_ptr(struct sbi_domain *dom)
+{
+	unsigned long *slwid;
+
+	slwid = sbi_domain_state_ptr(dom, &wid_state);
+	if (!slwid || !sbi_hartindex_valid(current_hartindex()))
+		return NULL;
+
+	return &slwid[current_hartindex()];
+}
+
+static int hart_worlds_validate(struct sbi_scratch *scratch,
+				struct sbi_domain *dom)
+{
+	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
+	unsigned long allowed = -1UL;
+
+	if (hf->has_pmlwidlist)
+		allowed &= hf->pmlwidlist;
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWIDLIST))
+		allowed &= csr_read(CSR_MLWIDLIST);
+
+	if (!(allowed & BIT_ULL(dom->wid))) {
+		sbi_printf("%s: domain%d: WID %u unauthorized for mlwid\n",
+			   __func__, dom->index, dom->wid);
+		return SBI_EINVAL;
+	}
+
+	/*
+	 * mwiddeleg is a M-mode WARL register, so an S-mode OS must rely
+	 * on the "widdeleg" DT property to determine which WIDs it may
+	 * delegate to U-mode via slwid. If pmlwidlist or mlwidlist silently
+	 * filters out any of those WIDs, the S-mode OS's view of the WIDs
+	 * available for delegation would be incorrect. Treat this mismatch
+	 * as a misconfiguration.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG) &&
+	    (dom->widdeleg & ~allowed)) {
+		sbi_printf("%s: domain%d: widdeleg 0x%llx unauthorized for"
+			   " mwiddeleg\n", __func__, dom->index,
+			   (unsigned long long)dom->widdeleg);
+		return SBI_EINVAL;
+	}
+
+	return SBI_OK;
+}
+
+static int sbi_hart_worlds_configure(struct sbi_scratch *scratch,
+				     struct sbi_domain *dom)
+{
+	unsigned long *slwid = NULL;
+	int rc;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
+		return SBI_OK;
+
+	rc = hart_worlds_validate(scratch, dom);
+	if (rc)
+		return rc;
+
+	csr_write(CSR_MLWID, dom->wid);
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG))
+		return SBI_OK;
+
+	/*
+	 * Enable Sswid before restoring slwid. A zero mwiddeleg
+	 * disables access to slwid, so the order here is required.
+	 */
+	csr_write(CSR_MWIDDELEG, dom->widdeleg);
+
+	if (dom->widdeleg) {
+		slwid = sbi_hart_worlds_slwid_ptr(dom);
+		if (!slwid)
+			return SBI_EINVAL;
+		csr_write(CSR_SLWID, *slwid);
+	}
+
+	return SBI_OK;
+}
+
+static void sbi_hart_worlds_unconfigure(struct sbi_scratch *scratch,
+					struct sbi_domain *dom)
+{
+	unsigned long *slwid;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG) ||
+	    !dom->widdeleg)
+		return;
+
+	/*
+	 * Save slwid value before disabling Sswid since the
+	 * CSR value may not retain through the disabled period.
+	 */
+	slwid = sbi_hart_worlds_slwid_ptr(dom);
+	if (!slwid) {
+		sbi_panic("%s: domain%d has no slwid state\n",
+			  __func__, dom->index);
+	}
+	*slwid = csr_read(CSR_SLWID);
+
+	/* Disable Sswid */
+	csr_write(CSR_MWIDDELEG, 0);
+}
+
+static struct sbi_hart_protection wid_protection = {
+	.name		= "wid",
+	.rating		= 100,
+	.type		= SBI_HART_PROTECTION_TYPE_ID,
+	.configure	= sbi_hart_worlds_configure,
+	.unconfigure	= sbi_hart_worlds_unconfigure
+};
+
+int sbi_hart_worlds_init(struct sbi_scratch *scratch)
+{
+	int rc;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
+		return 0;
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG)) {
+		wid_state.state_size = sizeof(unsigned long) * sbi_hart_count();
+		rc = sbi_domain_register_state(&wid_state);
+		if (rc)
+			return rc;
+	}
+
+	return sbi_hart_protection_register(&wid_protection);
+}
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
