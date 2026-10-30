Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E8606A323
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cPi6Hbcu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=mGhPmURy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=boJbQuq4MVpGYd6jWK7MzSU8LcuyxO/xH84NY0+wI64=; b=cPi6HbcuQ/9XKaibXvwBvOGkq6
	tYKc7V1Mqvf9IcLb3lGnJQK42hDCGHc0tyKvWka/29VFUOnnOQL336yyIkFOeaBSA6U7pF0K9vhlK
	Pj5pY+dwV4HyRcNOdtMgnOWMHL0KONyizLcoxj4fJYHl05eBBnvPW20OgOeIlBTz2m8iQ8kK5ITIW
	5VVAfMPqz8HEoHnS0HlwK+iNcck7z4IW0FC2hLzramaUNHulAiA5nNMLzGPwyQQM0XN/pFpSMAQam
	7eP5vDJW8n3vCtkOcy+RmYUrOA9BXJwJNsGwTUUryj1u/o/qmT51Wfng+HEVyPb2+z3E0foRtuncW
	atUKOtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7L-0000000BQnG-0QoF;
	Fri, 30 Oct 2026 10:45:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7G-0000000BQjL-2iip
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e5fb79ce82so3451775ad.0
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357145; x=1793961945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLkNn4rTBP57APnmFlyaFVUqikF6TwwF7eW3utex0C0=;
        b=mGhPmURy+ahF7sjyhehNQqJZ0EQurscL512kBsrlbsyDerMQ9gvBU6l3ItLzd0JxFm
         uwVBQLrRNJ9GPHLXE7WkLKfgBzjstdgDhWXuA28AGnm2vzZgvxsiaT4Q0KV5lYerA4tx
         INpUmr195lBmjYNgG0r/wBEVkSntnJ/IPdI06Wvcrp5QBrUCxpaUShsSbirlVG8BCOWo
         TCKhR1/M4b5mGLN1nd0XSZxmnzZYI0vVqukXpacyarchwErYrWdmwbEZ0PfzbR+GEb0d
         WdcASnCY0tWmpi5iB6R2U4WlkXRtshJiYDqihB5vOXTYwLucMLcDCqcbsohzXMNgFMtw
         Ruug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357145; x=1793961945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLkNn4rTBP57APnmFlyaFVUqikF6TwwF7eW3utex0C0=;
        b=WoJAX00uyEXm+7dtaUz8OzJ1B8qp9wiZvsYQe4M06+tCzMAgZIHWU/vuMP561ZfBoC
         S/GpMXS1PwdbnGMOr0YnAjV9e8QE4WYAPl4/F4qHHir/c+X/mEV1I32VxeqCGW8DDVEi
         ICXxOS5BBV2xmThnSbExOXdwHGUwQHIV0vzXhT32rWsx15uBr3iOTSRjDZYe48AK9/fD
         IeTGgxqRTPBx5x0F4mn+BV0O0Ybb4RBp/Rx3DTMAEpPA2ZlkAPcFIKFUAsdTKzsf37fD
         5qy+JfHxHFR8g9GDX2K8s2hJuDnzyotN27bfrxcKUYMng9Nv4Fx6UhbG+wg5gMme58nB
         5OzQ==
X-Gm-Message-State: AFq9FYKITNmtQiYe1DnDSmkyfxaWTdQAR8NwRgrQavd64g+igGqkbkLF
	BrIZ1zA3QIMj+xVgPnXf1VleF58EYHGOY5SquhTFQvE8lcJzxadh3Kfc3cs3WDPaiQE5lpTCmOt
	v84asCvpHNv8sDVCqUHGDU1oBLJXa2vKUi2dT9sWmcf6HfcCN6ZG+8DH02UKdiKYDmH1UlqH0nH
	ySKg2hWYGJgg6B8PoARRKk55MCRUQt0DLwO7BEh7Xv3doJfBKxmwM=
X-Gm-Gg: AYBFou2FZJ7rHIl4Eve0HbcjcGm8vWRZQ9k9IRsVpzTB0ZEcJzXgITKuBYQ6qasro1b
	MlxuVPKnNq0v62ZyceeO3OsTIO3Va394cG6d+/YPU5bdkb3gDvx54bN3ZaWL/+awRgjIBuckx/w
	E9WPYS80P3RSeCYOPTDIAO1zsD5My0tmMLCsDbbNUcqxpLg4DyyoyeqiCVSOsm/aj3SYNLn89NG
	mmi1LNZQSoEI9EvIqJ0J8ct6NnJ3mY7VxAI4hAB0KFU9vk1z4u/WZD5cZieaoe8N8KN/hzP+GKB
	90zhvxe8BiMgi2skBphsPTojZbAZzJqihBkWWxEMe7+4g8he+tiHJpjwNcORYNYbzc6WuWL/0jF
	ElsyMfhwMsQRqdr+YBl/9XXl9aNSbBfhVeLiJqC+3rs6Tiq7qpCiWWHRXNC+mmGqnc0mROhl1s1
	D/vZpc7rsqa9vrjCyCc+7htzFwRExEjvmpSIu6Ce9KzzG6rSkyeSzCrWskmkhxYVfHzO9vm9T20
	6fgipy0SgrqxcATMOZ+8/KmlXvBT0JbKid7RJHBL89PGKtenBFwhZPUimH4ysNN7bK0YzFsSF+y
	4X1G+J2SJ6jKMKp3jJVU2IEz1xA=
X-Received: by 2002:a17:903:41c9:b0:2e8:2d05:9780 with SMTP id d9443c01a7336-2eb36414e25mr21496045ad.8.1793357144827;
        Fri, 30 Oct 2026 03:45:44 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f542sm5349255ad.15.2026.10.30.03.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:43 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v4 6/9] lib: sbi_hart_worlds: Implement WID hart protection backend
Date: Fri, 30 Oct 2026 18:45:15 +0800
Message-Id: <20261030104518.3297875-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104518.3297875-1-peter.lin@sifive.com>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034546_697800_6645E3AD 
X-CRM114-Status: GOOD (  21.20  )
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
 include/sbi/sbi_hart_worlds.h |  24 ++++
 lib/sbi/objects.mk            |   1 +
 lib/sbi/sbi_hart.c            |   5 +
 lib/sbi/sbi_hart_worlds.c     | 210 ++++++++++++++++++++++++++++++++++
 4 files changed, 240 insertions(+)
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
index 611c97bf..f7408f51 100644
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
@@ -742,6 +743,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
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
index 00000000..6f582bd2
--- /dev/null
+++ b/lib/sbi/sbi_hart_worlds.c
@@ -0,0 +1,210 @@
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
+static int hart_worlds_validate_wid(struct sbi_scratch *scratch,
+				    struct sbi_domain *dom,
+				    unsigned long mlwidlist)
+{
+	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
+
+	if (hf->has_pmlwidlist && !(hf->pmlwidlist & BIT_ULL(dom->wid))) {
+		sbi_printf("%s: domain%d WID %u not permitted by"
+			   " pmlwidlist\n",
+			   __func__, dom->index, dom->wid);
+		return SBI_EINVAL;
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWIDLIST) &&
+	    !(mlwidlist & BIT_ULL(dom->wid))) {
+		sbi_printf("%s: domain%d WID %u not permitted by"
+			   " mlwidlist 0x%lx\n",
+			   __func__, dom->index, dom->wid, mlwidlist);
+		return SBI_EINVAL;
+	}
+
+	return SBI_OK;
+}
+
+/*
+ * Validate that a domain's widdeleg value, parsed from the
+ * "widdeleg" DT property, is permitted on this hart.
+ *
+ * mwiddeleg is a M-mode WARL register, so an S-mode OS must rely
+ * on the "widdeleg" DT property to determine which WIDs it may
+ * delegate to U-mode via slwid. If pmwidlist or mlwidlist silently
+ * filters out any of those WIDs, the S-mode OS's view of the WIDs
+ * available for delegation would be incorrect. Treat this mismatch
+ * as a misconfiguration.
+ */
+static int hart_worlds_validate_widdeleg(struct sbi_scratch *scratch,
+					 struct sbi_domain *dom,
+					 unsigned long mlwidlist)
+{
+	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
+	unsigned long widdeleg = dom->widdeleg;
+
+	if (!widdeleg)
+		return SBI_OK;
+
+	if (hf->has_pmlwidlist && (widdeleg & ~hf->pmlwidlist)) {
+		sbi_printf("%s: domain%d widdeleg 0x%lx has WID(s)"
+			   " outside pmlwidlist 0x%lx\n",
+			   __func__, dom->index, widdeleg,
+			   (unsigned long)hf->pmlwidlist);
+		return SBI_EINVAL;
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWIDLIST) &&
+	    (widdeleg & ~mlwidlist)) {
+		sbi_printf("%s: domain%d widdeleg 0x%lx has WID(s)"
+			   " outside mlwidlist 0x%lx\n",
+			   __func__, dom->index, widdeleg, mlwidlist);
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
+	unsigned long mlwidlist = 0;
+	int rc;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
+		return SBI_OK;
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWIDLIST))
+		mlwidlist = csr_read(CSR_MLWIDLIST);
+
+	rc = hart_worlds_validate_wid(scratch, dom, mlwidlist);
+	if (rc)
+		return rc;
+
+	csr_write(CSR_MLWID, dom->wid);
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG))
+		return SBI_OK;
+
+	rc = hart_worlds_validate_widdeleg(scratch, dom, mlwidlist);
+	if (rc)
+		return rc;
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
