Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9152606A31D
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W+PXL03J;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=gzA7rlEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=583D3k+vmMFqklnXckBtSycGouVY9WATuBIXTLZUt8M=; b=W+PXL03JFo/I0cqlp1WILzh3k/
	lvQwZCK9w05whE/sGPGhUvm1tURTgP9mtZ2DhHyCuEB0AnGCMZuiMuj/P45+AisC/xqDW+2lGUcIT
	qSMiqnU+TQUu/s/WTrqm9Z8xhsmuAKR1c6GvJyJpuyr+86uvxvw9SAboEUquKfA8302g3gREUbASL
	R1uAAp2rtCF1aaP7flR9jAnHKm3GasY7NXvnESaDz7ss2gbiwQxZV9b7Mlb0+kmB0rc90LHo5fdJm
	XgP0iKN3vTuMEYh3+B35ALlvl081EhvHuVD0G0pPyDKymc2iYmTDjyt+xkKnwFpKexOe9wTj1WSCB
	JRXflmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcf7-000000042cR-2WB5;
	Tue, 27 Oct 2026 08:36:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcf5-000000042aN-1Lnd
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:36:04 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so1834199a91.3
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090162; x=1793694962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEO02B88mMl+n2gtNGYZlyOpssRUX1FAj58oKDE6q/I=;
        b=gzA7rlEMbWvho+uy5lwnpSzLFQ63h/iNBJWZk6dx5dDjKMuCGUnTiby74TyHXb6TxK
         KLV0b/Ra7CYm07rludApSR4RkRuzXdK2I6ognwbWUf1pWWUAi/oTJ1bRgOpl44OibZQF
         NwCHEPBNihbazn0U2PDDQ9+ejmE/slFHSfBTocgwMT6DSshXreAaUmxOMuccW4g321kV
         hu/7ZTzUXI0HYBReG8hd1covTdFGky/KlsNaaeKpU5q1ABaPQ5rfwZeQJAOsV7AxZt/z
         iEx7tz+Fe+iWqIoqfA3bvKlNWgnXbyzI7IAe4lCXKcH15Bm1dobIt08rvCrqtyiXt7YP
         bFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090162; x=1793694962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEO02B88mMl+n2gtNGYZlyOpssRUX1FAj58oKDE6q/I=;
        b=sPwJXoL7Tb4MZ1AS8I0/xL7OYvzpwF72nuVpe6gc60aUOY3gOo+nN66ce6L+vjKFaM
         teVEJdVzWyh2wjHeHXiQ0KdEFFVDVndvDouB6DFNv28ZwJ7yYDS7lX9Oivk9r2ljLC3h
         YsiOKbQ46GiSxBrUFLwVL97k5akdwqauDTG7o3WFTTimNI8EU8LIfbMK/271g1Rnwsa7
         5LLZiTMRQ6PCXuJVkqx96pGlBPC/eJ4ofVBNpqpMFVw6HwV/O11PZebCklbNpLuTHRDd
         G/6GFPxrjlr09yDtUbsnj/jq5iq2p21t0bf0P+gHEvTXck+FnCShbFXhLZoeOVwbAjhL
         OBaA==
X-Gm-Message-State: AFq9FYKESLM3zQOqV4+s2GrIQ8z6LEc2ooMwl2uDKu+1bfr31aAPSQZI
	Yda1qAvg/v77Nnz4rFPiq3aI6R1dxvf5IDYkpwg3ry0ZZCGf40aN9xteFnSHiAumf0P5FKK4Ktz
	BgicFOdQrr54oAEsjxrzUjh8MxrpXHk3baX7/r/uQpl1KybkrmcRkcgL6RbqhkV7LFivoGYCgA9
	J7eUeRLXcY5YgWqjwuElCI9ZJICV5OiWv9bRHN+xs1/FZbGVNvhmE=
X-Gm-Gg: AYBFou20L3wt2a4gfWIMvRpfMurWAwVH/XHQ85WtmBoOf/bLd327I33wEN7/e47m2MN
	Cj85mosLXd6Vw2C68HRv7jyU0B7YPAvP3I5pDtEbTDDt67ESd7gNc7uGOtY74dwrgkZe64aljfd
	G+FlDjITRHZubD1/c9q8tEywnZnHvq7UnPBlKQp6R7/2iHjyGY6xQKIOlg5buN+fYcjJ4l7MhJ5
	rS8nmWYqsPPOtYDyvvJmtKKlJux/XKB9ZW+rzTP1nrarB/e/C1rZNKBVT3GjPT8ySzKJ6+ZisRj
	ODfO2g+FbhTkRUfXW/1rSAs5byOMi33bs5Taf+7Weiau8DuKPKu/6d7LUDUNASTFtbq9CwsXmrB
	JsFF5gwODPK0r5XfveqjKSlvyjsdUAtQ7xuC7yU3YykSQnald3+KgjR/XWlNmAsdyonILbGLG0O
	Qt6QrvKA5HjIWFUxruxI+cdXplxUn/cqKo+dHLtkHqafOCMmAJf+5BLA68izdY225HjXQ7705kS
	XaFmIY55VFR73M1aT5n3M9nq+RmrjD/9BklN+rZgTCe/8q3rCXJLw==
X-Received: by 2002:a17:90b:5805:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3adeabde7a7mr7503814a91.25.1793090161985;
        Tue, 27 Oct 2026 01:36:01 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406153fesm2755381a91.5.2026.10.27.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:36:01 -0700 (PDT)
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
Subject: [PATCH v3 6/9] lib: sbi_hart_worlds: Implement WID hart protection backend
Date: Tue, 27 Oct 2026 16:35:06 +0800
Message-Id: <20261027083509.1076577-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083509.1076577-1-peter.lin@sifive.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013603_377084_86D5B49D 
X-CRM114-Status: GOOD (  22.33  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
---
Change v2->v3:
- Add hart_worlds_validate_wid() to check domain wid against pmlwidlist
  and mlwidlist masks.
- Add hart_worlds_validate_widdeleg() to check domain widdeleg against
  pmlwidlist and mlwidlist masks.
- Drop M-mode WID fallback (mwid/pmwid) for mlwid; program dom->wid directly.
- Adapt to upstream domain state API rename (sbi_domain_data ->
  sbi_domain_state).
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
index f05d9b5d..6aa6edd5 100644
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
@@ -762,6 +763,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
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
