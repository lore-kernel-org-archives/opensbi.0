Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EC4606BF07
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ttst5LuW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ewyWrQ1U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fYHCq0e+qG4Kwd5qokkFynkvnV0PIfhBY7b3yH+qiK0=; b=Ttst5LuWKQO+0dKi+9p4LTIhKe
	bO+++RREDYH3xgFjAsWghUAUOwRpnhi62EFWmLN7mw2uLmssnHECoDqCmcZTaDYBD/4ImKb9sLQ98
	6QQ7U6yLr02jpto4PkZYXlutAJrOIGPnvi2/mw1ZmCffz3nqfaKsOQQI5Ub5pxRyaEz3RYRz/RYrT
	DHAjZ+aFNsLUax+3qlrNlJ+otvwCO/pSPhG3YdtYO+qba4OR28H0BgHDP+3gJ7mUpSjYVhZNNSdLf
	4/ECUGdGzKOkPHYGOQYY8ewUuxuWikJPETUctQAci24+ac6My/4cIx3nj8qJQrm+qYpsAWJAXQQ47
	R0PhWGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiVC-00000003LXn-23zL;
	Tue, 10 Nov 2026 09:50:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiV9-00000003LTx-2qYD
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:50:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ed2bfe3252so6560945ad.3
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304251; x=1794909051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfsDBZU0lQ2zvaM/6828BIx9VCB6f8wwrw8/BHEXTBA=;
        b=ewyWrQ1U4H+LUmvIJC9ZUAouPI5MoWS8G1RhkjCYbsvoAeMoNgRM7jckO7dyb70wRn
         hDxz5HnA0KsFLibZXPMyOh6/cuZHw7ghygppk3/alryIuP/k224g2u/eRcT/6SsnHN5R
         PAShnVA4it87uqJj+BcSSdFDm0wvnPZatc8af2gHsdimRwOI1vFM/kVRI6W1Q/u2JxZ/
         kaZ66hoQUQhaAWWwf2nJ34+PW0NGqnHUMLnY+oXrHLOejQd7IcsPg6mOZsF4wuoaZg+6
         kN1PntnPA+9P+Ht3wZ4RRHAwEEVkOiDv2i2V+JnsEP2AY7UOckZmhxNdDEPcRca0NOBO
         QVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304251; x=1794909051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfsDBZU0lQ2zvaM/6828BIx9VCB6f8wwrw8/BHEXTBA=;
        b=S7v13NQE2BXtcvcqQzYAz4mrjM8sOuKzJwpU3K8pIMU1Nm7w823sjNND4cIIxkcXbo
         LVDKuzo1EtlrjlzB6A49c582koIqKhGVImJqxjk14N5CWtiqYsYcA/Vii5RLqGMqQkBj
         e69XhwDHrnUeptWGNTd9sdG1I6tuJbnnNrqo5HMdKhP0y+bKkfTCSMWnDIW6Xp4zoRvI
         mUoJrsh1ERZHcnGa5EByXbjM/oFcY5CC2A1EISeKdPTxEDNeHALZVhvf6MF+uVXs8Q6H
         xjOFQPvUUeOj31j4JhAGHJ1SUpNO9kLkcIoWQq/0kX1SHqYVeWlp98wnL4nE2uBdmPUL
         hDYA==
X-Gm-Message-State: APuU4Z88BDnZtdJxnphpsWLGvsk3FEXBKctwsXThweGSp8uSam2JlyBl
	+TrnkBVs7p+hOnG0H4QnFo5DGLMQU6n02s5S//coAw/2leT1moLo4xCqrkVgxwXsYkJwu738UAG
	levl+4P/r8GVaufwD1JSXo6DfntuScyLmk4b2Z/YmQi6WdbVp9quXF/OMtnExwgHYpFhA/cLIsy
	pW0bIwA46becSaJpjzTh7gyezui2sAC6MQXDWlSYmmlscJNbgKeCY=
X-Gm-Gg: AYBFou2ZK+p9+PZvgZpxBS7hKM2CkO7vYMOtkOMVewuIZK8FCmgjoCE4QKeY+shRxaf
	fGWAykBtzvs2f48n8fwCq0PjyhXx4X0/g0AXzFs0C64NJiO4J9LYSQo9gxu6dtx9OWuXOQXBIAf
	eWWL3XM9dGig6P0MKBsPuE/si704b4JPoNgRf9cZBHU6fcCt7QItT6py2G6SKwRxt1/0RwTnVPw
	+hAbKrvOsbcNo2ocHMcbSrx+AV53tMBmarerKl2ze8HaoEnrHw8RsZBdWUmtvzhktVu6V+kpQXl
	kEwoTzU5rvTyhd1+roNKyig+SJWG0LDiogCT8/vwzSoMp/ETl9JnF2/nzjwwlddudFe8S34Vd1Q
	lpGsQcx21bs13tLLzA12wAzWft0X/29GRSDBTQ/Vp/ah/SfF/dgpC/fzffVt9KxPqfS5UGkbL4A
	xqlPu1q2nkhLeuieqwkIm4gc0JHb/qMSZ9cgfXUPqBxpVa7IReomHDaHEmKn6d2pvUf1aAdUTgd
	rrTdjSqr00Md/+wLg71sQB5ysdh5xvPQRArxOz3aKmbvjLFkO/jU6yCd19MxGwaEF2Tctx2w8z1
	G+GBo5nd9OuP7xe0KehfJP2WzFs=
X-Received: by 2002:a17:903:4683:b0:2e9:61bf:6587 with SMTP id d9443c01a7336-2edb91a0968mr18950225ad.49.1794304250429;
        Tue, 10 Nov 2026 01:50:50 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6dfb58dsm6681965ad.66.2026.11.10.01.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:50 -0800 (PST)
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
Subject: [PATCH v5 6/9] lib: sbi_hart_worlds: Implement WID hart protection backend
Date: Tue, 10 Nov 2026 17:50:26 +0800
Message-Id: <20261110095029.117504-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110095029.117504-1-peter.lin@sifive.com>
References: <20261110095029.117504-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015051_728584_20D3356F 
X-CRM114-Status: GOOD (  22.26  )
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
---
Changes v4->v5:
- Merge wid and widdeleg validation into hart_worlds_validate() and
  run it before CSR updates, so a failure does not leave mlwid
  holding an invalid world
- Drop RB-tags from Oza and Anup
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
index a721bef4..6c43bd98 100644
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
@@ -769,6 +770,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
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
